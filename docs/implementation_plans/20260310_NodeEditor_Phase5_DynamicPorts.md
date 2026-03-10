# Iron Rig 노드 에디터 통합 계획 (수정본)

이 계획은 `ironRig` API를 노드 에디터 GUI에 통합하여 사용자가 시각적으로 컨트롤 리그를 구축할 수 있도록 하는 상세 설계를 담고 있습니다.

## 핵심 개념 및 원칙

### 1. API 중심 통합
`metahumanSkel_build.py`는 단지 API 사용 예시일 뿐입니다. UI는 `ironRig` API와 직접 연동되어야 하며, 노드의 상태와 연결이 실시간으로 API 객체에 반영되어야 합니다.

### 2. Houdini 스타일 Display Flag 메커니즘
노드별로 'Display Flag'를 도입하여 특정 시점까지의 빌드 결과를 시각화합니다.
- 사용자가 특정 모듈 노드의 Display Flag를 활성화하면, 최하위 부모인 `GlobalMasterNode`부터 해당 노드까지의 경로에 있는 모든 모듈만 빌드됩니다.
- 이는 복잡한 리그를 단계별로 디버깅하고 구축하는 데 핵심적인 역할을 합니다.

### 3. 역방향 연결 (Bottom-up "Tree" Growth)
리그 구성의 시각적 흐름을 "나무가 자라나는 방향"으로 설정합니다.
- **연결 방식**: 자식 노드의 `Output` 포트를 부모 노드의 `Input` 포트에 연결합니다.
- **의미**: "이 자식 모듈을 부모 모듈에 attach 한다"는 로직을 UI로 표현합니다.
- **시각적 구조**: `GlobalMasterNode`가 가장 아래(뿌리)에 위치하고, 위쪽으로 Spine, Neck, Head 등이 가지처럼 뻗어나가는 구조가 됩니다.

## 주요 변경 사항

### 1. 새로운 노드 유형 및 기능
- **GlobalMasterNode**: 리그의 뿌리 역할을 합니다.
- **ModuleNode 확장**: 
    - **Houdini 스타일 Display Flag**: 노드의 **오른쪽**에 위치하며, 클릭하여 빌드 상태를 제어하는 **토글(Toggle)** 버튼 방식으로 구현합니다. (Houdini의 파란색 Display Flag와 유사)
    - 속성 에디터(Joint Picker 등) 통합.
- **SpaceSwitchNode & CustomScriptNode**: API 기능을 노드화하여 복잡한 리깅 프로세스를 시각화합니다.

### 2. Node Connection Logic (Inverted)
- `nodeEditor.py`의 연결 로직을 수정하여 자식(Source) -> 부모(Target) 방향으로 연결을 처리합니다.
- 연결 시 내부적으로 `childModule.attachTo(parentModule)` API가 호출되도록 설계합니다.

### 3. Incremental Build System
- Display Flag가 변경되거나 노드 속성이 수정될 때마다 트리 구조를 따라 빌드 체인을 계산합니다.
- `GlobalMasterNode`부터 Display된 노드까지 순차적으로 `preBuild()`, `build()`, `attachTo()` 등을 실행합니다.

### 5. 속성 에디터 및 조인트 피커 통합
- **속성 에디터 (UI)**: 선택된 노드의 상세 정보(Side, Joints, Controller Style 등)를 편집할 수 있는 패널을 구현합니다.
- **동적 포트 관리**: 사용자의 요청에 따라 Spine 등에서 **입력 포트 개수를 실시간으로 설정**할 수 있는 기능을 추가하여 리그 구성의 유연성을 높입니다.
- **조인트 피커 (Maya)**: 마야 뷰포트에서 선택한 조인트를 노드 속성에 즉시 할당하는 기능을 통합합니다.

## 검증 계획

### 자동화 테스트
- 선택된 Display Flag 노드에 따라 빌드 체인이 올바르게 계산되는지 검증하는 테스트 케이스 작성.
- 자식 -> 부모 연결 시 `attachTo` 호출 순서 및 인자값 검증.

### 수동 검증
- **Display Flag 테스트**: 여러 모듈을 연결한 후, 중간 노드의 Display Flag를 켰을 때 마야 씬에서 해당 단계까지만 생성되는지 확인.
- **Tree Growth 확인**: `GlobalMaster`에서 위쪽으로 확장되는 노드 구조가 직관적인지 확인.
- **속성 연동**: 노드 속성 변경 시 즉각적으로 빌드 결과에 반영되는지 확인.
