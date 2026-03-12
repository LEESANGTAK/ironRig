# ironRig GUI 대규모 개선

API(사용자 작성)는 변경하지 않고, GUI(AI 작성)만 수정합니다.

---

## 1단계: 핵심 구조 개선

### 1-1. 포트 방향 반전 (Top-Down 계층 구조)

**현재**: 자식 Output(하단) → 부모 Input(상단)  
**변경**: 부모 Output(하단) → 자식 Input(상단)

#### 영향 파일
- [MODIFY] [moduleNode.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/moduleNode.py) — Input(상단 1개) / Output(하단 여러 개) 반전
- [MODIFY] [nodeEditor.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/nodeEditor.py) — `completeConnection()`, `getBuildChain()`, `buildRig()` 방향 반전

---

### 1-2. Property Editor에 모듈별 고유 속성 반영

#### 모듈별 고유 속성

| 모듈 | 고유 속성 | 타입 | 기본값 |
|---|---|---|---|
| **Neck** | `numberOfControllers` | int (min 2) | 3 |
| **TwoBoneLimb** | `ikRootController`, `nonroll`, `detectInbetweenJoints` | bool | F, T, F |
| **ThreeBoneLimb** | `ikRootController` | bool | False |
| **Finger** | `curlStartIndex` | int | 1 |
| **Simple** | `simpleType` (FK/SINGLE), `controllerShape` | enum | FK, CIRCLE |
| **Module (공통)** | `globalController`, `mirrorTranslate` | bool | False |

#### CustomScript 노드 속성 시스템

API의 `@`심볼 참조 패턴을 UI로 지원:

```python
# API 예시 (metahumanSkel_build.py)
preCS.addAttribute('skelPath', Attribute.TYPE.STRING, "D:\\path\\to\\skel.mb")
preCS.code = 'cmds.file(@skelPath, reference=True)'
# → _processCode()가 @skelPath를 실제 값으로 치환
```

Property Editor에 CustomScript 전용 UI:
- **코드 에디터** (멀티라인 텍스트)
- **속성 리스트** (+/- 버튼으로 동적 추가/삭제)
- 각 속성: `name` (str), `type` (NUMBER/STRING 드롭다운), `value` (입력 필드)

#### 영향 파일
- [MODIFY] [propertyEditor.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/propertyEditor.py)
- [MODIFY] [moduleNode.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/moduleNode.py)
- [MODIFY] [nodeEditor.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/nodeEditor.py)

---

### 1-3. Guide 모드 Flag UI

노드 **왼쪽**에 Guide Flag 추가 (Display Flag와 대칭).

#### Guide Flag 활성화 시 동작
1. **상위 모듈들을 Display Flag와 동일한 방식으로 순차 빌드** (getBuildChain 재활용)
2. **해당 모듈만 `preBuild()`까지 실행** → Maya에서 Orient Plane 로케이터 표시
3. 사용자가 로케이터를 수동 조절 가능

#### Guide 해제 시 저장 데이터

| 모듈 | 저장 항목 |
|---|---|
| **일반 모듈** | `midLocatorPosition: [x,y,z]`, `midLocatorAxisAttributes: [negX, negZ, swapYZ]` |
| **Foot** | 위 항목 + `pivotLocatorsPosition: [[x,y,z], ...]` (in, out, heel, tip — **4개 피봇 로케이터**) |

#### 영향 파일
- [MODIFY] [moduleNode.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/moduleNode.py) — `drawGuideFlag()`, `guideFlagChanged` 시그널
- [MODIFY] [nodeEditor.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/nodeEditor.py) — Guide 빌드 로직, 해제 시 데이터 저장

---

### 1-4. Save/Load 시스템

#### 저장 방식: `.ir` (GUI) + `.json` (API) 분리

- **Save 시**: `.ir` 파일 (GUI 노드/커넥션/프로퍼티) + API의 `Scene.saveToFile()`로 `.json` 파일 별도 저장
- **`.ir` 파일**은 `.json` 파일 경로를 참조
- API의 `.json`에는 이미 **컨트롤러 CV 위치, 색상** 등이 포함되어 있으므로 수작업 조절한 컨트롤러 모양도 자동 복원됨

```json
// .ir 파일 구조
{
  "apiDataFile": "./scene_name.json",  // 같은 폴더의 API json 참조
  "gui": {
    "nodes": [...],
    "connections": [...]
  }
}
```

#### Load 워크플로우
1. `.ir` 파일 로드 → GUI 노드/커넥션 복원
2. 참조된 `.json` 경로에서 API `Scene.buildFromFile()` 호출
3. 새 씬 열기 → PreCustomScript 실행 → GlobalRoot/모듈 빌드 → 컨트롤러 모양 복원

#### GlobalRoot 노드 상단 Input 포트
- GlobalRoot 상단에 **Input 포트** 추가 → PreCustomScript 노드 연결 가능
- 빌드 체인: PreCustomScript → GlobalRoot → Modules

> [!NOTE]
> GlobalMaster 노드의 GUI 표시 이름을 **`GlobalRoot`**로 변경 확정.

#### 영향 파일
- [MODIFY] [nodeEditor.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/nodeEditor.py) — `saveScene()`, `loadScene()`
- [MODIFY] [moduleNode.py](file:///d:/tools/maya/modules/ironRig/scripts/ironRig/gui/moduleNode.py) — GlobalRoot Input 포트

---

## 2단계: UI/UX 고도화 (별도 진행)

### 2-1. Master 컨테이너 UI

- **GlobalRoot는 전용 노드 유지** (컨테이너 아님)
- FingersMaster, EyesMaster만 Module을 감싸는 그룹 박스 UI
- 빌드 순서: 내부 모듈 빌드 → `addModules()` → `master.build()` → `attachTo()`

---

## 구현 순서

| 순서 | 항목 | 단계 |
|---|---|---|
| 1 | 포트 방향 반전 | 1단계 |
| 2 | Property Editor + CustomScript 속성 | 1단계 |
| 3 | Guide 모드 Flag | 1단계 |
| 4 | Save/Load (.ir↔.json 분리) | 1단계 |
| 5 | Master 그룹 컨테이너 | 2단계 |

---

## 검증 계획 (Maya 내 수동 테스트)

1. **포트 방향**: GlobalRoot(상단) → Spine → Neck(하단) Top-Down 배치 확인
2. **Property Editor**: Neck `numberOfControllers` 변경 후 빌드 검증
3. **CustomScript**: `@skelPath` 치환 동작 확인
4. **Guide 모드**: Orient Plane 조절 → 해제 → 데이터 저장 → Foot 피봇 4개 저장 확인
5. **Save/Load**: `.ir` + `.json` 저장 → Load → 새 씬 + 리그 빌드 + **컨트롤러 CV 모양 복원** 확인
