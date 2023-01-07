//Maya ASCII 2020 scene
//Name: ARKit_controller.ma
//Last modified: Wed, Dec 28, 2022 02:00:39 PM
//Codeset: 949
requires maya "2020";
requires "stereoCamera" "10.0";
requires "mtoa" "4.1.1";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "202011110415-b1e20b88e2";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 19043)\n";
fileInfo "UUID" "81594C1E-4A25-7202-53E7-CBA876F76532";
createNode transform -n "facial_module";
	rename -uid "8EB147CA-4F6C-1225-8800-A0BF08BCD245";
	addAttr -ci true -sn "onFace" -ln "onFace" -min 0 -max 1 -at "bool";
	setAttr -k on ".onFace" yes;
createNode transform -n "facial_out_grp" -p "facial_module";
	rename -uid "7AE5879C-457D-6220-9046-8396AE785E00";
createNode transform -n "facial_attrs_out" -p "facial_out_grp";
	rename -uid "299EA54A-4A7A-BEA8-E7D1-21B98F86F3EE";
	addAttr -ci true -k true -sn "browInnerUp" -ln "browInnerUp" -max 1 -at "double";
	addAttr -ci true -k true -sn "browDownLeft" -ln "browDownLeft" -nn "Brow Down Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "browDownRight" -ln "browDownRight" -nn "Brow Down Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "browOuterUpLeft" -ln "browOuterUpLeft" -nn "Brow Outer Up Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "browOuterUpRight" -ln "browOuterUpRight" -nn "Brow Outer Up Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookUpLeft" -ln "eyeLookUpLeft" -nn "Eye Look Up Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookUpRight" -ln "eyeLookUpRight" -nn "Eye Look Up Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookDownLeft" -ln "eyeLookDownLeft" -nn "Eye Look Down Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookDownRight" -ln "eyeLookDownRight" -nn "Eye Look Down Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookInLeft" -ln "eyeLookInLeft" -nn "eyeLookInLeft" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookInRight" -ln "eyeLookInRight" -nn "eyeLookInRight" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookOutLeft" -ln "eyeLookOutLeft" -nn "eyeLookOutLeft" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeLookOutRight" -ln "eyeLookOutRight" -nn "eyeLookOutRight" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeBlinkLeft" -ln "eyeBlinkLeft" -nn "Eye Blink Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeBlinkRight" -ln "eyeBlinkRight" -nn "Eye Blink Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeSquintLeft" -ln "eyeSquintLeft" -nn "Eye Squint Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeSquintRight" -ln "eyeSquintRight" -nn "Eye Squint Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeWideLeft" -ln "eyeWideLeft" -nn "Eye Wide Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "eyeWideRight" -ln "eyeWideRight" -nn "Eye Wide Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "cheekPuff" -ln "cheekPuff" -nn "cheekPuff" -max 1 
		-at "double";
	addAttr -ci true -k true -sn "cheekSquintLeft" -ln "cheekSquintLeft" -nn "Cheek Squint Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "cheekSquintRight" -ln "cheekSquintRight" -nn "Cheek Squint Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "noseSneerLeft" -ln "noseSneerLeft" -nn "Nose Sneer Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "noseSneerRight" -ln "noseSneerRight" -nn "Nose Sneer Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "jawOpen" -ln "jawOpen" -nn "Jaw Open" -max 1 -at "double";
	addAttr -ci true -k true -sn "jawForward" -ln "jawForward" -nn "Jaw Forward" -max 
		1 -at "double";
	addAttr -ci true -k true -sn "jawLeft" -ln "jawLeft" -nn "Jaw Left" -max 1 -at "double";
	addAttr -ci true -k true -sn "jawRight" -ln "jawRight" -nn "Jaw Right" -max 1 -at "double";
	addAttr -ci true -k true -sn "mouthFunnel" -ln "mouthFunnel" -nn "mouthFunnel" -max 
		1 -at "double";
	addAttr -ci true -k true -sn "mouthPucker" -ln "mouthPucker" -nn "mouthPucker" -max 
		1 -at "double";
	addAttr -ci true -k true -sn "mouthLeft" -ln "mouthLeft" -nn "Mouth Left" -max 1 
		-at "double";
	addAttr -ci true -k true -sn "mouthRight" -ln "mouthRight" -nn "Mouth Right" -max 
		1 -at "double";
	addAttr -ci true -k true -sn "mouthRollUpper" -ln "mouthRollUpper" -nn "Mouth Roll Upper" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthRollLower" -ln "mouthRollLower" -nn "Mouth Roll Lower" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthShrugUpper" -ln "mouthShrugUpper" -nn "mouthShrugUpper" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthShrugLower" -ln "mouthShrugLower" -nn "mouthShrugLower" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthClose" -ln "mouthClose" -nn "Mouth Close" -at "double";
	addAttr -ci true -k true -sn "mouthSmileLeft" -ln "mouthSmileLeft" -nn "Mouth Smile Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthSmileRight" -ln "mouthSmileRight" -nn "Mouth Smile Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthFrownLeft" -ln "mouthFrownLeft" -nn "Mouth Frown Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthFrownRight" -ln "mouthFrownRight" -nn "Mouth Frown Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthDimpleLeft" -ln "mouthDimpleLeft" -nn "Mouth Dimple Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthDimpleRight" -ln "mouthDimpleRight" -nn "Mouth Dimple Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthUpperUpLeft" -ln "mouthUpperUpLeft" -nn "Mouth Upper Up Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthUpperUpRight" -ln "mouthUpperUpRight" -nn "Mouth Upper Up Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthLowerDownLeft" -ln "mouthLowerDownLeft" -nn "Mouth Lower Down Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthLowerDownRight" -ln "mouthLowerDownRight" -nn "Mouth Lower Down Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthPressLeft" -ln "mouthPressLeft" -nn "Mouth Press Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthPressRight" -ln "mouthPressRight" -nn "Mouth Press Right" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthStretchLeft" -ln "mouthStretchLeft" -nn "Mouth Stretch Left" 
		-max 1 -at "double";
	addAttr -ci true -k true -sn "mouthStretchRight" -ln "mouthStretchRight" -nn "Mouth Stretch Right" 
		-max 1 -at "double";
	setAttr -l on -k off ".v";
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".ty";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr -k on ".browInnerUp";
	setAttr -k on ".browDownLeft";
	setAttr -k on ".browDownRight";
	setAttr -k on ".browOuterUpLeft";
	setAttr -k on ".browOuterUpRight";
	setAttr -k on ".eyeBlinkLeft";
	setAttr -k on ".eyeBlinkRight";
	setAttr -k on ".eyeSquintLeft";
	setAttr -k on ".eyeSquintRight";
	setAttr -k on ".eyeWideLeft";
	setAttr -k on ".eyeWideRight";
	setAttr -k on ".cheekPuff";
	setAttr -k on ".cheekSquintLeft";
	setAttr -k on ".cheekSquintRight";
	setAttr -k on ".noseSneerLeft";
	setAttr -k on ".noseSneerRight";
	setAttr -k on ".jawOpen";
	setAttr -k on ".jawForward";
	setAttr -k on ".jawLeft";
	setAttr -k on ".jawRight";
	setAttr -k on ".mouthFunnel";
	setAttr -k on ".mouthPucker";
	setAttr -k on ".mouthLeft";
	setAttr -k on ".mouthRight";
	setAttr -k on ".mouthRollUpper";
	setAttr -k on ".mouthRollLower";
	setAttr -k on ".mouthShrugUpper";
	setAttr -k on ".mouthShrugLower";
	setAttr -k on ".mouthClose";
	setAttr -k on ".mouthSmileLeft";
	setAttr -k on ".mouthSmileRight";
	setAttr -k on ".mouthFrownLeft";
	setAttr -k on ".mouthFrownRight";
	setAttr -k on ".mouthDimpleLeft";
	setAttr -k on ".mouthDimpleRight";
	setAttr -k on ".mouthUpperUpLeft";
	setAttr -k on ".mouthUpperUpRight";
	setAttr -k on ".mouthLowerDownLeft";
	setAttr -k on ".mouthLowerDownRight";
	setAttr -k on ".mouthPressLeft";
	setAttr -k on ".mouthPressRight";
	setAttr -k on ".mouthStretchLeft";
	setAttr -k on ".mouthStretchRight";
createNode transform -n "facial_global_ctrl_zero" -p "facial_module";
	rename -uid "16330C46-4F84-25E2-E869-2689C36C4AC3";
	setAttr ".t" -type "double3" 0 32.501514705482904 0 ;
	setAttr ".s" -type "double3" 2.8742368939162302 2.8742368939162302 2.8742368939162302 ;
createNode transform -n "facial_global_ctrl" -p "facial_global_ctrl_zero";
	rename -uid "11FFFFBB-4F25-2DEF-5B6A-61857559A5BE";
	addAttr -ci true -k true -sn "cheekPuff" -ln "cheekPuff" -min 0 -max 1 -at "double";
createNode nurbsCurve -n "facial_global_ctrlShape" -p "facial_global_ctrl";
	rename -uid "5D49D5BA-4F09-AD85-E506-D29FEB8952A8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".ovrgbf" yes;
	setAttr ".ovrgb" -type "float3" 1 1 0 ;
	setAttr ".tw" yes;
	setAttr -s 11 ".cp[0:10]" -type "double3" 4.3270151205856795 4.2811794914275074 
		2.1602795119818657e-15 3.7470049490937163e-16 6.0734878389675453 3.0659715438935911e-15 
		-4.3270151205856795 4.2811794914275074 2.1602795119818657e-15 -3.6030764841005327 
		-0.045835629158170944 -2.6254474792673721e-17 -3.9598032219403203 -3.8353862279747064 
		-1.9990919048151016e-15 1.1633800224011431e-15 -8.3090416506275044 -3.7919190866197749e-15 
		3.9598032219403203 -3.8353862279747046 -1.999091904815102e-15 3.6030764841005327 
		-0.04583562915817211 -2.6254474792674292e-17 0 0 0 0 0 0 0 0 0;
createNode transform -n "GRP_faceGUI" -p "facial_global_ctrl";
	rename -uid "2A427A38-46B6-0F9D-5D38-B9ACCF2B0292";
	setAttr ".t" -type "double3" 0 -11.307876109404003 0 ;
	setAttr ".r" -type "double3" 0 2.2357801588946569e-05 0 ;
	setAttr ".s" -type "double3" 0.34791843432135178 0.34791843432135178 0.34791843432135178 ;
createNode transform -n "CTRL_faceGUI" -p "GRP_faceGUI";
	rename -uid "9481B53C-416E-1573-6C09-5F83C045D768";
	setAttr ".rp" -type "double3" 0.0047737956047058105 -2.9738430976867676 0 ;
	setAttr ".sp" -type "double3" 0.0095475912094116211 -5.9476861953735352 0 ;
	setAttr ".spt" -type "double3" -0.0047737956047058105 2.9738430976867676 0 ;
createNode transform -n "FRM_faceGUI" -p "CTRL_faceGUI";
	rename -uid "D6E2E685-4231-1D9A-06A0-21AAA1F055D9";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
createNode transform -n "GRP_browGUI" -p "FRM_faceGUI";
	rename -uid "3A1D6680-4563-4076-CF77-6481E3D47B45";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 41.21728094803111 0 ;
createNode transform -n "FRM_C_browInnerUp" -p "GRP_browGUI";
	rename -uid "86466F3F-40CD-3E04-F036-F0B85F9A72BA";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 0.97495085701989714 0 ;
	setAttr ".s" -type "double3" 1 4 1 ;
createNode mesh -n "FRM_C_browInnerUpShape" -p "FRM_C_browInnerUp";
	rename -uid "F6653E27-49E7-3553-EE36-0D9C8BCA6717";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_browInnerUp" -p "FRM_C_browInnerUp";
	rename -uid "B7950DC2-49E7-7469-238B-D485A259A103";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_browInnerUpShape" -p "CTRL_C_browInnerUp";
	rename -uid "07B5DEF4-4DE9-A7A0-555E-5384A67DA0A8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_brow_raiseOut" -p "GRP_browGUI";
	rename -uid "46FAF493-46D0-7D73-5DE0-B090CE793452";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 5.7275377063496204 0.35908072585934148 0 ;
	setAttr ".r" -type "double3" 0 0 -18.540939411248647 ;
	setAttr ".s" -type "double3" 1 4 1 ;
createNode mesh -n "FRM_L_brow_raiseOutShape" -p "FRM_L_brow_raiseOut";
	rename -uid "E2557019-4A2A-AD55-2740-F3965F73E8A1";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_brow_raiseOut" -p "FRM_L_brow_raiseOut";
	rename -uid "42DFC5CF-4244-9B2A-5D78-3EA09D0E0908";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_brow_raiseOutShape" -p "CTRL_L_brow_raiseOut";
	rename -uid "B5D8C0EF-4546-863E-317B-C3AF0CEB690E";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_brow_raiseOut" -p "GRP_browGUI";
	rename -uid "87608FBC-4284-FC5E-951D-EDA380D9410F";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -5.6924687089464268 0.36223263439247544 0 ;
	setAttr ".r" -type "double3" 0 0 18.538 ;
	setAttr ".s" -type "double3" 1 4 1 ;
createNode mesh -n "FRM_R_brow_raiseOutShape" -p "FRM_R_brow_raiseOut";
	rename -uid "8F5200DD-4229-59DE-EB1C-C4921D147E8A";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_brow_raiseOut" -p "FRM_R_brow_raiseOut";
	rename -uid "0D8657EB-49D9-4370-5836-25B595C8EBA9";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_brow_raiseOutShape" -p "CTRL_R_brow_raiseOut";
	rename -uid "3C418341-4EE7-35FC-B444-53BDE3A49A9F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_brow_down" -p "GRP_browGUI";
	rename -uid "A92B9A45-496A-1973-E83A-B5AAD02C8A31";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 6.7732511653029501 -1.1201195789622829 1.9278651156007128e-06 ;
	setAttr ".r" -type "double3" 0 0 105.00000000000001 ;
	setAttr ".s" -type "double3" 1 3.9999999999999996 1 ;
createNode mesh -n "FRM_L_brow_downShape" -p "FRM_L_brow_down";
	rename -uid "20A2023C-45EA-8292-44CE-FBB2EC29A6B0";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_brow_down" -p "FRM_L_brow_down";
	rename -uid "56F18DF6-4BA9-E060-C64A-33AF3D1DC522";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_brow_downShape" -p "CTRL_L_brow_down";
	rename -uid "F286078D-468E-5782-C562-FF92836BF957";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_brow_down" -p "GRP_browGUI";
	rename -uid "4188F06A-40D4-6FFC-9E66-4A9A211C5422";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -7.5065134466862338 -0.88324199585434149 -2.2244597487700602e-06 ;
	setAttr ".r" -type "double3" 0 0 -105.0000000000003 ;
	setAttr ".s" -type "double3" 1 4 1 ;
createNode mesh -n "FRM_R_brow_downShape" -p "FRM_R_brow_down";
	rename -uid "DE132328-4595-5E9C-E180-139C5EE301E2";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_brow_down" -p "FRM_R_brow_down";
	rename -uid "B573B1EF-408F-E22C-CB29-539F37F02D3B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_brow_downShape" -p "CTRL_R_brow_down";
	rename -uid "F8A8457D-4FE0-7E41-DAEC-FB9D81B24527";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "GRP_eyeGUI" -p "FRM_faceGUI";
	rename -uid "CB020E45-416F-85EA-808D-9CA7ECA30BCD";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 32.606893209058327 0 ;
createNode transform -n "FRM_L_eye_squintInner" -p "GRP_eyeGUI";
	rename -uid "5B0BE1A8-445C-1447-DB9E-3DA2ECEC18A2";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 6.0164323009261942 3.6259072571629822 -2.9266631398986621e-07 ;
	setAttr ".r" -type "double3" 0 0 90.000000000000028 ;
	setAttr ".s" -type "double3" 0.5 2 0.2 ;
createNode mesh -n "FRM_L_eye_squintInnerShape" -p "FRM_L_eye_squintInner";
	rename -uid "31DDB0CA-4C14-686D-6D63-419BC38921A0";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0.22475924 0.0038046911 0 0.22475924 -0.0086416071 
		-2.4651903e-32 -0.22489919 0.0038046911 0 -0.22489919 -0.0086416071 -2.4651903e-32;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_eye_squintInner" -p "FRM_L_eye_squintInner";
	rename -uid "418D2CFA-4F58-2781-D04B-F2B395EF332D";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_eye_squintInnerShape" -p "CTRL_L_eye_squintInner";
	rename -uid "E37F27AD-467D-4AE0-A3D2-1EBA6D6A5449";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.21812159 0.017717984 -0.27172145 
		0.18554534 0.033701625 -0.27172145 0.13480657 0.04638632 -0.27172145 0.070872001 
		0.054530375 -0.27172145 3.2061118e-09 0.057336621 -0.27172145 -0.070871986 0.054530375 
		-0.27172145 -0.13480654 0.04638629 -0.27172145 -0.18554528 0.033701617 -0.27172145 
		-0.2181215 0.017717978 -0.27172145 -0.22934648 -1.5023968e-08 -0.27172145 -0.2181215 
		-0.017718013 -0.27172145 -0.18554527 -0.033701643 -0.27172145 -0.1348065 -0.046386328 
		-0.27172145 -0.070871972 -0.05453039 -0.27172145 -3.6289454e-09 -0.057336647 -0.27172145 
		0.070871934 -0.05453039 -0.27172145 0.13480647 -0.046386324 -0.27172145 0.18554515 
		-0.03370164 -0.27172145 0.2181215 -0.017718008 -0.27172145 0.22934645 -1.5023968e-08 
		-0.27172145 3.2061118e-09 -1.5023968e-08 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_eye_squintInner" -p "GRP_eyeGUI";
	rename -uid "BED92B0C-44A8-3063-A283-7389D74089B3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -6.0596124350509015 3.6259072571629858 2.7437466936549597e-07 ;
	setAttr ".r" -type "double3" 0 0 -90 ;
	setAttr ".s" -type "double3" 0.5 2 0.2 ;
createNode mesh -n "FRM_R_eye_squintInnerShape" -p "FRM_R_eye_squintInner";
	rename -uid "B76B7D2E-4B38-7551-31F6-EFB8A6545399";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0.22475924 0.0038046911 0 0.22475924 -0.0086416071 
		-2.4651903e-32 -0.22489919 0.0038046911 0 -0.22489919 -0.0086416071 -2.4651903e-32;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_eye_squintInner" -p "FRM_R_eye_squintInner";
	rename -uid "28429819-4650-8034-7151-2385F9814EE3";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_eye_squintInnerShape" -p "CTRL_R_eye_squintInner";
	rename -uid "3427C8CF-48CC-4569-5599-CB8DB57DC44A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.21812159 0.017717984 -0.27172145 
		0.18554534 0.033701625 -0.27172145 0.13480657 0.04638632 -0.27172145 0.070872001 
		0.054530375 -0.27172145 3.2061118e-09 0.057336621 -0.27172145 -0.070871986 0.054530375 
		-0.27172145 -0.13480654 0.04638629 -0.27172145 -0.18554528 0.033701617 -0.27172145 
		-0.2181215 0.017717978 -0.27172145 -0.22934648 -1.5023968e-08 -0.27172145 -0.2181215 
		-0.017718013 -0.27172145 -0.18554527 -0.033701643 -0.27172145 -0.1348065 -0.046386328 
		-0.27172145 -0.070871972 -0.05453039 -0.27172145 -3.6289454e-09 -0.057336647 -0.27172145 
		0.070871934 -0.05453039 -0.27172145 0.13480647 -0.046386324 -0.27172145 0.18554515 
		-0.03370164 -0.27172145 0.2181215 -0.017718008 -0.27172145 0.22934645 -1.5023968e-08 
		-0.27172145 3.2061118e-09 -1.5023968e-08 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_eye_cheekRaise" -p "GRP_eyeGUI";
	rename -uid "1623AEB7-477F-357E-45A3-1E967EA32D40";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 10.777680766877431 2.7802718526860599 6.9508249572592942e-07 ;
	setAttr ".s" -type "double3" 0.6 2.4 0.6 ;
createNode mesh -n "FRM_L_eye_cheekRaiseShape" -p "FRM_L_eye_cheekRaise";
	rename -uid "89535627-44A0-DFAB-645D-66A0B5092ADB";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0.22475924 0.0038046911 0 0.22475924 -0.0086416071 
		-2.4651903e-32 -0.22489919 0.0038046911 0 -0.22489919 -0.0086416071 -2.4651903e-32;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_eye_cheekRaise" -p "FRM_L_eye_cheekRaise";
	rename -uid "43FC3517-443C-3910-0235-4FB731DB77BB";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_eye_cheekRaiseShape" -p "CTRL_L_eye_cheekRaise";
	rename -uid "964638B0-4861-771E-3DD5-2783A2AAE6D0";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.21812159 0.017717984 -0.27172145 
		0.18554534 0.033701625 -0.27172145 0.13480657 0.04638632 -0.27172145 0.070872001 
		0.054530375 -0.27172145 3.2061118e-09 0.057336621 -0.27172145 -0.070871986 0.054530375 
		-0.27172145 -0.13480654 0.04638629 -0.27172145 -0.18554528 0.033701617 -0.27172145 
		-0.2181215 0.017717978 -0.27172145 -0.22934648 -1.5023968e-08 -0.27172145 -0.2181215 
		-0.017718013 -0.27172145 -0.18554527 -0.033701643 -0.27172145 -0.1348065 -0.046386328 
		-0.27172145 -0.070871972 -0.05453039 -0.27172145 -3.6289454e-09 -0.057336647 -0.27172145 
		0.070871934 -0.05453039 -0.27172145 0.13480647 -0.046386324 -0.27172145 0.18554515 
		-0.03370164 -0.27172145 0.2181215 -0.017718008 -0.27172145 0.22934645 -1.5023968e-08 
		-0.27172145 3.2061118e-09 -1.5023968e-08 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_eye_cheekRaise" -p "GRP_eyeGUI";
	rename -uid "5C3F4C20-4110-B70E-396D-6B9A263AEBD3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -10.547121409519889 2.7735366620763706 -6.0362427260409732e-07 ;
	setAttr ".s" -type "double3" 0.6 2.4 0.6 ;
createNode mesh -n "FRM_R_eye_cheekRaiseShape" -p "FRM_R_eye_cheekRaise";
	rename -uid "0350F51E-42A7-13BA-8BB8-3F96EAED3BA1";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0.22475924 0.0038046911 0 0.22475924 -0.0086416071 
		-2.4651903e-32 -0.22489919 0.0038046911 0 -0.22489919 -0.0086416071 -2.4651903e-32;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_eye_cheekRaise" -p "FRM_R_eye_cheekRaise";
	rename -uid "FB86FBD0-44F5-B73F-FD23-6CA61B7843C7";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_eye_cheekRaiseShape" -p "CTRL_R_eye_cheekRaise";
	rename -uid "C3C5F770-4180-B403-72D1-C3AF0F442E9C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.21812159 0.017717984 -0.27172145 
		0.18554534 0.033701625 -0.27172145 0.13480657 0.04638632 -0.27172145 0.070872001 
		0.054530375 -0.27172145 3.2061118e-09 0.057336621 -0.27172145 -0.070871986 0.054530375 
		-0.27172145 -0.13480654 0.04638629 -0.27172145 -0.18554528 0.033701617 -0.27172145 
		-0.2181215 0.017717978 -0.27172145 -0.22934648 -1.5023968e-08 -0.27172145 -0.2181215 
		-0.017718013 -0.27172145 -0.18554527 -0.033701643 -0.27172145 -0.1348065 -0.046386328 
		-0.27172145 -0.070871972 -0.05453039 -0.27172145 -3.6289454e-09 -0.057336647 -0.27172145 
		0.070871934 -0.05453039 -0.27172145 0.13480647 -0.046386324 -0.27172145 0.18554515 
		-0.03370164 -0.27172145 0.2181215 -0.017718008 -0.27172145 0.22934645 -1.5023968e-08 
		-0.27172145 3.2061118e-09 -1.5023968e-08 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_eye_blink" -p "GRP_eyeGUI";
	rename -uid "8DAC1C65-40B9-E3C5-A8E9-CFB4468F71B2";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 6.0555290902286014 4.7163733893193394 -1.7763572629167241e-15 ;
	setAttr ".r" -type "double3" 0 0 90 ;
	setAttr ".s" -type "double3" 0.47340407648909094 1.8936163059563627 0.4734040764890905 ;
createNode mesh -n "FRM_L_eye_blinkShape" -p "FRM_L_eye_blink";
	rename -uid "A131A676-4D91-CB68-13A0-8E8F29DF9FC4";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -1.4872501 1.9852335e-23 0.045614019 
		-1.4872501 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_eye_blink" -p "FRM_L_eye_blink";
	rename -uid "175B57E4-4FE9-DCD6-F97A-7B97E8F07469";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 -1 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_eye_blinkShape" -p "CTRL_L_eye_blink";
	rename -uid "C67205FE-4B71-6450-8F3D-858C07AD84C8";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_eye_blink" -p "GRP_eyeGUI";
	rename -uid "0B5958A3-4098-16CD-A3FD-D8B9AC7E188B";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -6.0555290423774411 4.7163733893193394 -1.7763576864331977e-15 ;
	setAttr ".r" -type "double3" 0 0 -90.000000000000014 ;
	setAttr ".s" -type "double3" 0.47340407648909094 1.8936163059563627 0.4734040764890905 ;
createNode mesh -n "FRM_R_eye_blinkShape" -p "FRM_R_eye_blink";
	rename -uid "E2D3F17E-4048-AA32-EC01-63B741F7F825";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -1.4872501 1.9852335e-23 0.045614019 
		-1.4872501 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_eye_blink" -p "FRM_R_eye_blink";
	rename -uid "17012D90-4FA3-B2E8-E8BC-28A08B30C2A0";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 -1 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_eye_blinkShape" -p "CTRL_R_eye_blink";
	rename -uid "0F582D6A-4604-8AC6-C283-5199DCA1169A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_cheekPuff" -p "FRM_faceGUI";
	rename -uid "D07A2475-4B90-5782-7EFF-FA902CF8E363";
	setAttr ".ovdt" 2;
	setAttr ".t" -type "double3" 0 28.618247897181806 3.4231905864489217e-07 ;
	setAttr ".r" -type "double3" 0 -4.4600626668428026e-05 0 ;
	setAttr ".s" -type "double3" 0.47340407648909089 1.8936163059563627 0.47340407648909044 ;
createNode mesh -n "FRM_C_cheekPuffShape" -p "FRM_C_cheekPuff";
	rename -uid "FA3F430E-491C-172F-7857-37884EA80921";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -0.49192312 1.9852335e-23 0.045614019 
		-0.49192312 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_cheekPuff" -p "FRM_C_cheekPuff";
	rename -uid "DA7BF85E-4306-1FD9-BD44-A1BC11C7DA26";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_cheekPuffShape" -p "CTRL_C_cheekPuff";
	rename -uid "E3752309-45DD-9CA2-2B05-BFBE87357CB3";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "GRP_noseGUI" -p "FRM_faceGUI";
	rename -uid "704EC612-4839-8715-5425-6D993C938779";
createNode transform -n "FRM_L_nose_sneer" -p "GRP_noseGUI";
	rename -uid "E6C475E9-46E9-853F-69BF-47854A591C9E";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 2.9929267906495274 32.239067921975021 -4.2351647362715017e-22 ;
	setAttr ".r" -type "double3" 0 0 30.000000000000011 ;
	setAttr ".s" -type "double3" 0.49999999999999989 1.9999999999999996 0.19999999999999993 ;
createNode mesh -n "FRM_L_nose_sneerShape" -p "FRM_L_nose_sneer";
	rename -uid "B4DCF79A-4E4F-FF50-2398-0E9DB12B0DB2";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0.22475924 0.0038046911 0 0.22475924 -0.0086416071 
		-2.4651903e-32 -0.22489919 0.0038046911 0 -0.22489919 -0.0086416071 -2.4651903e-32;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_nose_sneer" -p "FRM_L_nose_sneer";
	rename -uid "A7B998C1-486A-FA55-4D3E-5590C04C3E8F";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_nose_sneerShape" -p "CTRL_L_nose_sneer";
	rename -uid "C307F5CE-4760-049A-AD0A-D78C36B64E88";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.21812159 0.017717984 -0.27172145 
		0.18554534 0.033701625 -0.27172145 0.13480657 0.04638632 -0.27172145 0.070872001 
		0.054530375 -0.27172145 3.2061118e-09 0.057336621 -0.27172145 -0.070871986 0.054530375 
		-0.27172145 -0.13480654 0.04638629 -0.27172145 -0.18554528 0.033701617 -0.27172145 
		-0.2181215 0.017717978 -0.27172145 -0.22934648 -1.5023968e-08 -0.27172145 -0.2181215 
		-0.017718013 -0.27172145 -0.18554527 -0.033701643 -0.27172145 -0.1348065 -0.046386328 
		-0.27172145 -0.070871972 -0.05453039 -0.27172145 -3.6289454e-09 -0.057336647 -0.27172145 
		0.070871934 -0.05453039 -0.27172145 0.13480647 -0.046386324 -0.27172145 0.18554515 
		-0.03370164 -0.27172145 0.2181215 -0.017718008 -0.27172145 0.22934645 -1.5023968e-08 
		-0.27172145 3.2061118e-09 -1.5023968e-08 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_nose_sneer" -p "GRP_noseGUI";
	rename -uid "13DC0549-464B-2F0C-36BE-50B93A08A6E5";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -2.9892313841196603 32.239067921975014 0 ;
	setAttr ".r" -type "double3" 0 0 -30.000000000000011 ;
	setAttr ".s" -type "double3" 0.49999999999999989 1.9999999999999996 0.19999999999999993 ;
createNode mesh -n "FRM_R_nose_sneerShape" -p "FRM_R_nose_sneer";
	rename -uid "5EEE1FE3-48AC-7AB0-DC9D-08B97869B17C";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0.22475924 0.0038046911 0 0.22475924 -0.0086416071 
		-2.4651903e-32 -0.22489919 0.0038046911 0 -0.22489919 -0.0086416071 -2.4651903e-32;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_nose_sneer" -p "FRM_R_nose_sneer";
	rename -uid "2E8C5E05-41A1-F925-B552-05B84D0EFD08";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_nose_sneerShape" -p "CTRL_R_nose_sneer";
	rename -uid "98FF7BEA-41CD-C081-9750-EA90F93F0792";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.21812159 0.017717984 -0.27172145 
		0.18554534 0.033701625 -0.27172145 0.13480657 0.04638632 -0.27172145 0.070872001 
		0.054530375 -0.27172145 3.2061118e-09 0.057336621 -0.27172145 -0.070871986 0.054530375 
		-0.27172145 -0.13480654 0.04638629 -0.27172145 -0.18554528 0.033701617 -0.27172145 
		-0.2181215 0.017717978 -0.27172145 -0.22934648 -1.5023968e-08 -0.27172145 -0.2181215 
		-0.017718013 -0.27172145 -0.18554527 -0.033701643 -0.27172145 -0.1348065 -0.046386328 
		-0.27172145 -0.070871972 -0.05453039 -0.27172145 -3.6289454e-09 -0.057336647 -0.27172145 
		0.070871934 -0.05453039 -0.27172145 0.13480647 -0.046386324 -0.27172145 0.18554515 
		-0.03370164 -0.27172145 0.2181215 -0.017718008 -0.27172145 0.22934645 -1.5023968e-08 
		-0.27172145 3.2061118e-09 -1.5023968e-08 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "GRP_mouthGUI" -p "FRM_faceGUI";
	rename -uid "B20A266E-4A3D-D9CE-4640-B4899BB8C9C5";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 21.386354253247433 0 ;
createNode transform -n "FRM_C_mouth" -p "GRP_mouthGUI";
	rename -uid "E109E900-466C-A497-91F6-1FA37578ECA7";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0 -0.69948147733030119 0 ;
	setAttr ".s" -type "double3" 1.2685659655006087 1.2685659655006087 1.2685659655006087 ;
	setAttr ".rp" -type "double3" 0 0 1.2312604861375777e-07 ;
	setAttr ".sp" -type "double3" 0 0 7.4505805969238281e-08 ;
	setAttr ".spt" -type "double3" 0 0 4.8620242644519478e-08 ;
createNode mesh -n "FRM_C_mouthShape" -p "FRM_C_mouth";
	rename -uid "957F0388-4708-4EEA-88CD-F08C6E83DAB1";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 40 ".uvst[0].uvsp[0:39]" -type "float2" 0.11111111 0.11111111
		 0.8888889 0.11111111 0.33333334 0.33333334 0.66666669 0.33333334 0.11111111 0.8888889
		 0.33333334 0.66666669 0.66666669 0.66666669 0.8888889 0.8888889 0.33333334 0.49593908
		 0.11111112 0.4905245 0.33333334 0.50404751 0.11111112 0.50944412 0.49594951 0.33333337
		 0.49054879 0.11111112 0.5033685 0.33333337 0.50785977 0.11111112 0.4962343 0.66666669
		 0.49121332 0.8888889 0.5041216 0.66666669 0.50961697 0.88888884 0.66666669 0.50361526
		 0.8888889 0.50843549 0.66666669 0.49577171 0.8888889 0.49013391 0 0 1 0 1 1 0 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 32 ".vt[0:31]"  -1.027199268 -0.024850845 2.9482701e-08 1.027199268 -0.024850845 2.9482701e-08
		 -0.98218983 0.020784378 1.1952891e-07 0.98218942 0.020784378 1.1952891e-07 -1.027199268 1.026691437 2.9482701e-08
		 -0.98218983 0.97708511 6.5501183e-08 0.98218942 0.97708511 6.5501183e-08 1.027199268 1.026691437 2.9482701e-08
		 -0.98218983 -0.023807526 9.3173249e-08 -1.027199268 -0.023735046 2.9482701e-08 -0.98218983 0.023731232 9.1859008e-08
		 -1.027199268 0.023910522 2.9482701e-08 -0.025663441 0.020784378 1.1952891e-07 -0.025476456 -0.024852753 2.9482701e-08
		 0.020619005 0.020784378 1.1952891e-07 0.020807549 -0.024850845 2.9482701e-08 -0.022192139 0.97708511 6.5501183e-08
		 -0.022361374 1.026691437 2.9482701e-08 0.024288623 0.97708511 6.5501183e-08 0.024271917 1.026691437 2.9482701e-08
		 0.98218942 0.021194458 9.1929081e-08 1.027199268 0.021205902 2.9482701e-08 0.98218942 -0.024791718 9.3200384e-08
		 1.027199268 -0.024848938 2.9482701e-08 -0.025663441 0.16303062 1.1952891e-07 0.020619005 0.16303062 1.1952891e-07
		 -0.82433277 -0.023807526 9.3173249e-08 -0.82433277 0.023731232 9.1859008e-08 0.82359266 -0.024791718 9.3200384e-08
		 0.82359266 0.021194458 9.1929081e-08 -0.022192139 0.82323074 6.5501183e-08 0.024288623 0.82323074 6.5501183e-08;
	setAttr -s 48 ".ed[0:47]"  0 13 0 0 2 1 1 3 1 0 9 0 2 12 0 2 8 0 3 22 0
		 1 23 0 4 5 1 5 16 0 6 7 1 4 17 0 8 10 0 9 11 0 8 9 1 10 5 0 11 4 0 10 11 1 12 14 0
		 13 15 0 12 13 1 14 3 0 15 1 0 14 15 1 16 18 0 17 19 0 16 17 1 18 6 0 19 7 0 18 19 1
		 20 6 0 21 7 0 20 21 1 22 20 0 23 21 0 22 23 1 12 24 0 14 25 0 24 25 0 8 26 0 10 27 0
		 26 27 0 22 28 0 20 29 0 28 29 0 16 30 0 18 31 0 30 31 0;
	setAttr -s 16 -ch 64 ".fc[0:15]" -type "polyFaces" 
		f 4 22 2 -22 23
		mu 0 4 15 1 3 14
		f 4 1 5 14 -4
		mu 0 4 0 2 8 9
		f 4 32 31 -11 -31
		mu 0 4 20 21 7 6
		f 4 9 26 -12 8
		mu 0 4 5 16 17 4
		f 4 -15 12 17 -14
		mu 0 4 9 8 10 11
		f 4 -18 15 -9 -17
		mu 0 4 11 10 5 4
		f 4 0 -21 -5 -2
		mu 0 4 0 13 12 2
		f 4 19 -24 -19 20
		mu 0 4 13 15 14 12
		f 4 24 29 -26 -27
		mu 0 4 16 18 19 17
		f 4 27 10 -29 -30
		mu 0 4 18 6 7 19
		f 4 35 34 -33 -34
		mu 0 4 22 23 21 20
		f 4 -3 7 -36 -7
		mu 0 4 3 1 23 22
		f 4 18 37 -39 -37
		mu 0 4 24 25 26 27
		f 4 -13 39 41 -41
		mu 0 4 28 29 30 31
		f 4 33 43 -45 -43
		mu 0 4 32 33 34 35
		f 4 -25 45 47 -47
		mu 0 4 36 37 38 39;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_mouth" -p "FRM_C_mouth";
	rename -uid "42F2F5E0-46B4-09E3-1A01-449489CAEE39";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".rp" -type "double3" 0 3.5527136788005009e-15 0 ;
	setAttr ".sp" -type "double3" 0 3.5527136788005009e-15 0 ;
	setAttr ".mntl" -type "double3" -1 0 0 ;
	setAttr ".mxtl" -type "double3" 1 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_mouthShape" -p "CTRL_C_mouth";
	rename -uid "3024C66C-4C94-ED1F-B8BB-30B09BDA5927";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0.063578382 -0.27172145 
		0 0.12093327 -0.27172145 0 0.16645037 -0.27172145 0 0.19567412 -0.27172145 0 0.20574394 
		-0.27172145 0 0.19567412 -0.27172145 0 0.16645034 -0.27172145 0 0.12093323 -0.27172145 
		0 0.06357836 -0.27172145 0 1.8273725e-16 -0.27172145 0 -0.06357836 -0.27172145 0 
		-0.12093323 -0.27172145 0 -0.16645029 -0.27172145 0 -0.19567406 -0.27172145 0 -0.20574388 
		-0.27172145 0 -0.19567406 -0.27172145 0 -0.16645028 -0.27172145 0 -0.12093322 -0.27172145 
		0 -0.063578345 -0.27172145 0 1.8273725e-16 -0.27172145 0 1.8273725e-16 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_upperLipRaise" -p "GRP_mouthGUI";
	rename -uid "597E5A6C-461F-75AA-C6D6-68A488DA4D3D";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1.1351824056290039 2.4171039185495218 0 ;
	setAttr ".r" -type "double3" 0 0 -23 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_upperLipRaiseShape" -p "FRM_L_mouth_upperLipRaise";
	rename -uid "3CE35CA9-46AA-0CBA-193E-AD8E5E368EA8";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_upperLipRaise" -p "FRM_L_mouth_upperLipRaise";
	rename -uid "7D02F76A-4FFE-6C50-CEB4-6EA741EF8E41";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_upperLipRaiseShape" -p "CTRL_L_mouth_upperLipRaise";
	rename -uid "AA60B0E6-4049-C47E-21BE-9B9A27EF4C65";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_upperLipRaise" -p "GRP_mouthGUI";
	rename -uid "C880E1D8-48E0-8E63-B1E6-D1A2C5A23A8C";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -1.106288932756931 2.4171039185495218 0 ;
	setAttr ".r" -type "double3" 0 0 23 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_upperLipRaiseShape" -p "FRM_R_mouth_upperLipRaise";
	rename -uid "159FAF40-45D3-B080-E1CF-69ACDACFC98C";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_upperLipRaise" -p "FRM_R_mouth_upperLipRaise";
	rename -uid "780237C0-4578-188A-DBAD-22A7DD2AA545";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_upperLipRaiseShape" -p "CTRL_R_mouth_upperLipRaise";
	rename -uid "813CDFD0-4583-A275-03A6-178F9CA14B78";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_sharpCornerPull" -p "GRP_mouthGUI";
	rename -uid "5ED13C0A-4289-0C40-2C8D-B1B65791F3BB";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 2.6958282553923447 1.7824426191326594 0 ;
	setAttr ".r" -type "double3" 0 0 -16 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_sharpCornerPullShape" -p "FRM_L_mouth_sharpCornerPull";
	rename -uid "1FFA2867-4B40-5B6E-ED4F-D083A9C967E6";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_sharpCornerPull" -p "FRM_L_mouth_sharpCornerPull";
	rename -uid "10449CF2-4A76-88DB-B1E1-C1BFB8BB479C";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_sharpCornerPullShape" -p "CTRL_L_mouth_sharpCornerPull";
	rename -uid "F2BA709D-4B09-866A-BD89-C48322C37179";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_sharpCornerPull" -p "GRP_mouthGUI";
	rename -uid "535480A6-4947-6810-7356-0EA3CF3645B9";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -2.6751592691187609 1.7824426191326594 0 ;
	setAttr ".r" -type "double3" 0 0 16 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_sharpCornerPullShape" -p "FRM_R_mouth_sharpCornerPull";
	rename -uid "EE0FFFC1-426C-A51C-8090-13818301FABF";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_sharpCornerPull" -p "FRM_R_mouth_sharpCornerPull";
	rename -uid "557427D6-4403-E532-AFF4-329294C4C03E";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_sharpCornerPullShape" -p "CTRL_R_mouth_sharpCornerPull";
	rename -uid "291D614A-420C-02E0-F3F5-4ABB8229D10A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_cornerPull" -p "GRP_mouthGUI";
	rename -uid "063F1313-4C05-E177-D2FD-1BB4DAEAE5A9";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 4.2202237852006981 1.0698755066677172 0 ;
	setAttr ".r" -type "double3" 0 0 -41 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_cornerPullShape" -p "FRM_L_mouth_cornerPull";
	rename -uid "FBF78D25-4660-ED21-BDAE-238865930278";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_cornerPull" -p "FRM_L_mouth_cornerPull";
	rename -uid "A2270F20-4784-A109-1A74-E1ADD9B673DA";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_cornerPullShape" -p "CTRL_L_mouth_cornerPull";
	rename -uid "CDFF01D2-4F9B-48C4-51C5-0C89E9FED29A";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_cornerPull" -p "GRP_mouthGUI";
	rename -uid "0747B3F3-4529-4E9B-72B1-92AF0E671E2C";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -4.2028225122535616 1.0698755066677172 0 ;
	setAttr ".r" -type "double3" 0 0 41 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_cornerPullShape" -p "FRM_R_mouth_cornerPull";
	rename -uid "0FD06B31-4D13-763D-653F-449FD4AC227F";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_cornerPull" -p "FRM_R_mouth_cornerPull";
	rename -uid "B67EEFC1-4E6E-CADC-E475-AC83CF48A0A4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_cornerPullShape" -p "CTRL_R_mouth_cornerPull";
	rename -uid "8A13235D-425F-A826-1504-E8840C0F6034";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_dimple" -p "GRP_mouthGUI";
	rename -uid "A7D8F563-454A-CC9E-2EC0-CE89A5A36A82";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 5.1576805118489206 0.23075525801544217 0 ;
	setAttr ".r" -type "double3" 0 0 -81 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_dimpleShape" -p "FRM_L_mouth_dimple";
	rename -uid "3880B702-47B8-D9BE-6F21-2C9252C19072";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_dimple" -p "FRM_L_mouth_dimple";
	rename -uid "B2B77CFF-4CCB-032F-8B5D-29BC060C7641";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_dimpleShape" -p "CTRL_L_mouth_dimple";
	rename -uid "9DF0DF13-4A0E-2673-F6C4-1FA0A9C75C6B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_dimple" -p "GRP_mouthGUI";
	rename -uid "9B6E7461-433D-046F-F8B0-0BBB5457AF3E";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -5.1318059207896063 0.23075525801544217 0 ;
	setAttr ".r" -type "double3" 0 0 81 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_dimpleShape" -p "FRM_R_mouth_dimple";
	rename -uid "4D4DF268-43D3-51F6-8AC1-F0BF5D479FBD";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_dimple" -p "FRM_R_mouth_dimple";
	rename -uid "08578BA5-4357-5D4C-88EB-D0B54AF31930";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_dimpleShape" -p "CTRL_R_mouth_dimple";
	rename -uid "8873BB96-4BBE-C5D5-2F5F-1D8463ED3F63";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_cornerDepress" -p "GRP_mouthGUI";
	rename -uid "227F3A82-4D4F-7DC8-8CE9-048CFB68B923";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 4.2299658110781735 -0.63940261600335191 0 ;
	setAttr ".r" -type "double3" 0 0 -141 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_cornerDepressShape" -p "FRM_L_mouth_cornerDepress";
	rename -uid "72DB2C89-403C-5D05-4E5C-BEA142AE685B";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_cornerDepress" -p "FRM_L_mouth_cornerDepress";
	rename -uid "4011DBA3-473F-509B-F56A-3DAFD82868DB";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_cornerDepressShape" -p "CTRL_L_mouth_cornerDepress";
	rename -uid "B01595B8-498C-8342-BDD3-FFA8EF339CA4";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_cornerDepress" -p "GRP_mouthGUI";
	rename -uid "8C1A1F0D-42E3-1D97-5E41-7793F89A1CEE";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -4.1931442863416022 -0.63940261600335191 0 ;
	setAttr ".r" -type "double3" 0 0 141 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_cornerDepressShape" -p "FRM_R_mouth_cornerDepress";
	rename -uid "9C4AB60A-4AEC-4429-D4CA-0A86ED0FBD75";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_cornerDepress" -p "FRM_R_mouth_cornerDepress";
	rename -uid "90AA30A8-482D-1067-19C6-A7B8510AF8E3";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_cornerDepressShape" -p "CTRL_R_mouth_cornerDepress";
	rename -uid "60A22132-4054-B932-36A4-4A954056567C";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_stretch" -p "GRP_mouthGUI";
	rename -uid "1C1C3FFE-495B-A522-1065-DB8786602DE9";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 2.6332164300601257 -1.5555207030862803 0 ;
	setAttr ".r" -type "double3" 0 0 -121.26263717525809 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_stretchShape" -p "FRM_L_mouth_stretch";
	rename -uid "4120DA9B-44E4-3214-DD08-5383FEC0F131";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_stretch" -p "FRM_L_mouth_stretch";
	rename -uid "120B8733-4A51-D73A-81F5-ACAA9EE2E9EA";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_stretchShape" -p "CTRL_L_mouth_stretch";
	rename -uid "169A1288-448E-149D-82D6-D59A93FC80EB";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_stretch" -p "GRP_mouthGUI";
	rename -uid "F20D273E-47A4-69A7-2337-F3BE8B7129E8";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -2.5910840552861085 -1.5555207030862803 0 ;
	setAttr ".r" -type "double3" 0 0 121.26300000000002 ;
	setAttr ".s" -type "double3" 1.0000000000000002 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_stretchShape" -p "FRM_R_mouth_stretch";
	rename -uid "CDD753F5-4A6A-41EA-8002-849AB64392BD";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_stretch" -p "FRM_R_mouth_stretch";
	rename -uid "5E148007-4937-7ABC-D3F8-CBAB46602FEE";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_stretchShape" -p "CTRL_R_mouth_stretch";
	rename -uid "179471E2-41F6-045B-6E54-FBB77EEA806F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_R_mouth_lowerLipDepress" -p "GRP_mouthGUI";
	rename -uid "CBFBB2EE-4471-265F-6E41-97BF745250BA";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -1.2302064566390878 -2.416261780222122 0 ;
	setAttr ".r" -type "double3" 0 0 171.27700000000002 ;
	setAttr ".s" -type "double3" 1.0000000000000004 4.0000000000000009 1 ;
createNode mesh -n "FRM_R_mouth_lowerLipDepressShape" -p "FRM_R_mouth_lowerLipDepress";
	rename -uid "73226E92-4FC4-7D6A-D796-789EA245CE38";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_R_mouth_lowerLipDepress" -p "FRM_R_mouth_lowerLipDepress";
	rename -uid "A1A00094-44C5-731B-5333-A1813FE2C092";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_R_mouth_lowerLipDepressShape" -p "CTRL_R_mouth_lowerLipDepress";
	rename -uid "ED0AF47F-4B71-0055-6E84-CEA74A790E93";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_L_mouth_lowerLipDepress" -p "GRP_mouthGUI";
	rename -uid "0F2F5D29-4BE8-0393-07D0-1ABC34D367B6";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 1.2592253182574396 -2.416261780222122 0 ;
	setAttr ".r" -type "double3" 0 0 -171.27741479138808 ;
	setAttr ".s" -type "double3" 1.0000000000000004 4.0000000000000009 1 ;
createNode mesh -n "FRM_L_mouth_lowerLipDepressShape" -p "FRM_L_mouth_lowerLipDepress";
	rename -uid "EAC742A1-45F5-74BB-303E-E8BB3FF5BDF6";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_L_mouth_lowerLipDepress" -p "FRM_L_mouth_lowerLipDepress";
	rename -uid "D52EF7EC-4F66-D725-B9E9-4984674B6916";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_L_mouth_lowerLipDepressShape" -p "CTRL_L_mouth_lowerLipDepress";
	rename -uid "E90ACEDC-4FC2-2548-3C9F-AA8C2CE7F946";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 
		0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 
		-0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145 
		0 0 -0.27172145 0 0 -0.27172145 0 0 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_mouthShrugRollUpper" -p "GRP_mouthGUI";
	rename -uid "53A3562D-45E2-4C8B-AB7A-EF8687F4A4CB";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.004773795605411457 4.4711165410415248 -1.8083454087473733e-06 ;
	setAttr ".s" -type "double3" 0.47340407648909089 1.8936163059563627 0.47340407648909044 ;
createNode mesh -n "FRM_C_mouthShrugRollUpperShape" -p "FRM_C_mouthShrugRollUpper";
	rename -uid "CC4FFFB4-418F-9F48-6FB0-90B34AF58237";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -1.4872501 1.9852335e-23 0.045614019 
		-1.4872501 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_mouthShrugRollUpper" -p "FRM_C_mouthShrugRollUpper";
	rename -uid "63A76179-4B99-1D48-44EF-909F72FBBA6F";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 -1 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_mouthShrugRollUpperShape" -p "CTRL_mouthShrugRollUpper";
	rename -uid "9566847E-4396-7824-4F0D-88BE49CAF671";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_mouthShrugRollLower" -p "GRP_mouthGUI";
	rename -uid "11D9F6A4-40D0-1EBF-CBCD-5F84371BE7B3";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 0.0047737956048359955 -4.5720686491460647 -3.3362413557549278e-07 ;
	setAttr ".r" -type "double3" 2.2357801588946569e-05 -2.2357801588946566e-05 0 ;
	setAttr ".s" -type "double3" 0.47340407648909089 1.8936163059563624 0.47340407648909039 ;
createNode mesh -n "FRM_C_mouthShrugRollLowerShape" -p "FRM_C_mouthShrugRollLower";
	rename -uid "3007E18F-40BA-7374-4255-4FAF5D6D57CE";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -1.4872501 1.9852335e-23 0.045614019 
		-1.4872501 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_mouthShrugRollLower" -p "FRM_C_mouthShrugRollLower";
	rename -uid "4B9C93F7-4129-4D67-C2A9-4EB71D62180B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 -1 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_mouthShrugRollLowerShape" -p "CTRL_mouthShrugRollLower";
	rename -uid "A9204EA7-4064-7E3C-8000-DC8372AF580B";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_mouthFunnel" -p "GRP_mouthGUI";
	rename -uid "59D8B29B-432F-5B3C-EC71-C581F6866D92";
	setAttr ".ovdt" 2;
	setAttr ".t" -type "double3" 6.5764190763773014 7.2318936439343728 7.1422697268180109e-06 ;
	setAttr ".r" -type "double3" 0 -4.4600626668428026e-05 0 ;
	setAttr ".s" -type "double3" 0.47340407648909089 1.8936163059563627 0.47340407648909044 ;
createNode mesh -n "FRM_C_mouthFunnelShape" -p "FRM_C_mouthFunnel";
	rename -uid "D87FA1B9-4C41-02D7-9A2B-A19F79E712E0";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -0.49192312 1.9852335e-23 0.045614019 
		-0.49192312 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_mouthFunnel" -p "FRM_C_mouthFunnel";
	rename -uid "60D3001F-4993-2550-B1A5-9498FFF7517B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_mouthFunnelShape" -p "CTRL_C_mouthFunnel";
	rename -uid "52F812B1-4D1D-6985-1E48-4FAA0EC21EE2";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_mouthPucker" -p "GRP_mouthGUI";
	rename -uid "BEEC3E5D-4972-E1CD-B343-FC99BBD1224E";
	setAttr ".ovdt" 2;
	setAttr ".t" -type "double3" -6.8224841704233059 7.2318936439343728 -2.4143250602433248e-06 ;
	setAttr ".r" -type "double3" 0 -4.4600626668428026e-05 0 ;
	setAttr ".s" -type "double3" 0.47340407648909089 1.8936163059563627 0.47340407648909044 ;
createNode mesh -n "FRM_C_mouthPuckerShape" -p "FRM_C_mouthPucker";
	rename -uid "6CC074AD-4F0D-8DDB-CD72-F096AFE0CAC2";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  -0.045614004 -0.49520174 
		-6.6174449e-24 0.045614019 -0.49520174 0 -0.045614004 -0.47624382 0 0.045614019 -0.47624382 
		0 -0.045614004 -0.49824601 1.9852335e-23 0.045614019 -0.49824601 -1.9852335e-23 0.25839868 
		-0.49520174 1.323489e-23 0.25839868 -0.49824601 0 -0.21672785 -0.49520174 1.9852335e-23 
		-0.21672775 -0.49824601 -1.323489e-23 -0.045614004 -0.49192312 1.9852335e-23 0.045614019 
		-0.49192312 -1.9852335e-23;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_mouthPucker" -p "FRM_C_mouthPucker";
	rename -uid "73317E99-4E1C-6193-EDC4-E08C7001C24F";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".rp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".sp" -type "double3" 0 5.5596961880368333e-17 0 ;
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_mouthPuckerShape" -p "CTRL_C_mouthPucker";
	rename -uid "378BFE7A-4D21-F6F1-3876-6AA9FDB4FF95";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.22951424 0.0219675 -0.27172139 
		0.19523646 0.038785964 -0.27172139 0.14184743 0.052132636 -0.27172139 0.074573636 
		0.060701817 -0.27172139 -4.1918593e-08 0.063655347 -0.27172139 -0.074573755 0.060701817 
		-0.27172139 -0.14184746 0.052132636 -0.27172139 -0.19523643 0.038785964 -0.27172139 
		-0.22951402 0.0219675 -0.27172139 -0.24132535 0.003323555 -0.27172139 -0.22951402 
		-0.015319556 -0.27172139 -0.19523621 -0.032138616 -0.27172139 -0.14184736 -0.045485497 
		-0.27172139 -0.074573591 -0.054055214 -0.27172139 -4.9110671e-08 -0.057008028 -0.27172139 
		0.074573621 -0.054055214 -0.27172139 0.1418473 -0.045485497 -0.27172139 0.19523613 
		-0.032138616 -0.27172139 0.22951408 -0.015319526 -0.27172139 0.2413253 0.003323555 
		-0.27172139 -0.00060000771 0.003323555 -0.27172139;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "GRP_jawGUI" -p "FRM_faceGUI";
	rename -uid "38346070-4491-1290-D93F-829A61BE8ACE";
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -2.1316282072803006e-14 8.1949045929391175 4.1359030627651384e-25 ;
createNode transform -n "FRM_C_jaw" -p "GRP_jawGUI";
	rename -uid "F69AB539-423F-D898-3499-34BE8429B572";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -4.4408920985011143e-16 5.5605941617745991 3.8466966042865387e-23 ;
	setAttr ".r" -type "double3" 0 0 180 ;
	setAttr ".s" -type "double3" 2 4 2 ;
	setAttr ".rp" -type "double3" 0 0 9.5257838950146834e-08 ;
	setAttr ".sp" -type "double3" 0 0 9.5257838950146834e-08 ;
createNode mesh -n "FRM_C_jawShape" -p "FRM_C_jaw";
	rename -uid "D8B499AB-4873-08F7-917E-1DAB352DE10D";
	setAttr -k off ".v";
	setAttr ".iog[0].og[0].gcl" -type "componentList" 1 "f[0:3]";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0.11111111 0.11111111
		 0.8888889 0.11111111 0.33333334 0.33333334 0.66666669 0.33333334 0.11111111 0.8888889
		 0.33333334 0.66666669 0.66666669 0.66666669 0.8888889 0.8888889 0.33333334 0.49593908
		 0.11111112 0.4905245 0.5033685 0.33333337 0.50785977 0.11111112 0.4962343 0.66666669
		 0.49121332 0.8888889 0.66666669 0.50361526 0.8888889 0.50843549;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 8 ".pt[0:7]" -type "float3"  4.0433607 3.0182908 0 -4.0521278 
		3.0182908 0 4.0242157 2.9722435 0 -4.0253248 2.9722435 0 4.0433607 -2.001955 0 4.0242157 
		-1.9579189 0 -4.0253248 -1.9579189 0 -4.0521278 -2.001955 0;
	setAttr -s 8 ".vt[0:7]"  -5.047237873 -3.035536289 3.7694491e-08 5.047237873 -3.035536289 3.7694491e-08
		 -4.98969221 -2.97211313 1.5282119e-07 4.98969173 -2.97211313 1.5282119e-07 -5.047237873 3.035536289 3.7694491e-08
		 -4.98969221 2.97211313 8.3745171e-08 4.98969173 2.97211313 8.3745171e-08 5.047237873 3.035536289 3.7694491e-08;
	setAttr -s 12 ".ed[0:11]"  0 2 0 1 3 0 0 4 0 2 5 0 4 5 0 5 6 0 6 7 0
		 4 7 0 2 3 0 0 1 0 3 6 0 1 7 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 9 1 -9 -1
		mu 0 4 11 1 3 10
		f 4 0 3 -5 -3
		mu 0 4 0 2 8 9
		f 4 -2 11 -7 -11
		mu 0 4 14 15 7 6
		f 4 5 6 -8 4
		mu 0 4 5 12 13 4;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_jaw" -p "FRM_C_jaw";
	rename -uid "CB3D3D84-49FC-C979-E6A4-4FAE3D5152D4";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" -1 0 0 ;
	setAttr ".mxtl" -type "double3" 1 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_jawShape" -p "CTRL_C_jaw";
	rename -uid "A6BC34D1-4D45-B715-29D2-32A9E55EFA8D";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  -0.024241194 0.017855665 
		-0.27301943 -0.020620719 0.033963501 -0.27301943 -0.014981806 0.046746772 -0.27301943 
		-0.007876426 0.054954011 -0.27301943 -1.510989e-09 0.05778208 -0.27301943 0.0078764111 
		0.054954011 -0.27301943 0.014981806 0.046746723 -0.27301943 0.020620674 0.03396349 
		-0.27301943 0.024241135 0.017855639 -0.27301943 0.025488719 -7.2229582e-09 -0.27301943 
		0.024241135 -0.017855665 -0.27301943 0.020620659 -0.033963501 -0.27301943 0.014981806 
		-0.046746753 -0.27301943 0.0078764111 -0.054954018 -0.27301943 -7.5136608e-10 -0.057782061 
		-0.27301943 -0.0078764036 -0.054954018 -0.27301943 -0.014981791 -0.046746749 -0.27301943 
		-0.020620689 -0.033963505 -0.27301943 -0.024241209 -0.017855663 -0.27301943 -0.02548869 
		-7.2229582e-09 -0.27301943 -1.510989e-09 -7.2229582e-09 -0.27301943;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_jaw_fwdBack" -p "GRP_jawGUI";
	rename -uid "CA19F9FA-4568-5BC4-0AFD-E0B1AD30FFE5";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" 3.4243356299760079 2.824199601350232 -1.1539503439008868e-13 ;
	setAttr ".s" -type "double3" 2 2 2 ;
createNode mesh -n "FRM_C_jaw_fwdBackShape" -p "FRM_C_jaw_fwdBack";
	rename -uid "2BD7385C-4B5C-F25E-2041-9090967EBA8E";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".pv" -type "double2" 0.5 1 ;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 20 ".uvst[0].uvsp[0:19]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 12 ".pt[0:11]" -type "float3"  0.027625604 -0.49543357 8.3794766e-17 
		-0.028361952 -0.49543357 8.3794772e-17 0.027625604 -0.49533036 -4.994558e-23 -0.028361952 
		-0.49533036 -4.994558e-23 0.027625604 -0.49809828 8.4577907e-17 -0.028361952 -0.49809828 
		8.4577914e-17 -0.10787356 -0.49543357 8.3791901e-17 -0.10787353 -0.49809828 8.4575049e-17 
		0.11782452 -0.49543357 8.3791907e-17 0.11782454 -0.49809828 8.4575035e-17 0.027625604 
		-0.54308897 8.4577775e-17 -0.028361952 -0.54308897 8.4577782e-17;
	setAttr -s 12 ".vt[0:11]"  -0.03660202 0.50738716 -1.1102229e-16 0.037577629 0.50738716 -1.110223e-16
		 -0.03660202 1.47947121 6.6174449e-23 0.037577629 1.47947121 6.6174449e-23 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16 0.22688675 0.50738716 -1.1101849e-16 0.22688675 0.49047852 -1.1205611e-16
		 -0.22653103 0.50738716 -1.110185e-16 -0.22653103 0.49047852 -1.1205609e-16 -0.03660202 0.49047852 -1.1205989e-16
		 0.037577629 0.49047852 -1.120599e-16;
	setAttr -s 16 ".ed[0:15]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0 4 10 0 5 11 0 10 11 0;
	setAttr -s 5 -ch 20 ".fc[0:4]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15
		f 4 -7 13 15 -15
		mu 0 4 16 17 18 19;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_jaw_fwdBack" -p "FRM_C_jaw_fwdBack";
	rename -uid "D9EA41E1-4CA5-4DED-9249-50BCF3B23264";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -k off ".tx";
	setAttr -k off ".tz";
	setAttr -k off ".rx";
	setAttr -k off ".ry";
	setAttr -k off ".rz";
	setAttr -k off ".sx";
	setAttr -k off ".sy";
	setAttr -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_jaw_fwdBackShape" -p "CTRL_C_jaw_fwdBack";
	rename -uid "448B84CB-4AC0-59DD-B83E-E4A57A53187F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  -0.14062816 0.017886013 -0.27368659 
		-0.11962546 0.034020782 -0.27368659 -0.08691299 0.046824872 -0.27368659 -0.045692854 
		0.055045694 -0.27368659 -1.0280274e-08 0.057879239 -0.27368659 0.045692831 0.055045694 
		-0.27368659 0.08691296 0.046824872 -0.27368659 0.1196254 0.034020782 -0.27368659 
		0.14062808 0.017886013 -0.27368659 0.14786512 0 -0.27368659 0.14062808 -0.017885268 
		-0.27368659 0.11962542 -0.034020573 -0.27368659 0.086912945 -0.046824872 -0.27368659 
		0.045692839 -0.05504626 -0.27368659 -5.8735559e-09 -0.057879031 -0.27368659 -0.045692831 
		-0.05504626 -0.27368659 -0.08691293 -0.046824872 -0.27368659 -0.1196254 -0.034020573 
		-0.27368659 -0.14062802 -0.017885268 -0.27368659 -0.1478651 0 -0.27368659 -1.0280274e-08 
		0 -0.27368659;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "FRM_C_mouthClose" -p "GRP_jawGUI";
	rename -uid "37379387-41AE-6842-E2E7-32B02A250AE2";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".t" -type "double3" -3.0473260792220334 2.4751092358929521 2.2819437591156158e-16 ;
	setAttr ".s" -type "double3" 0.64980149821936295 2.5992059928774518 0.64980149821936295 ;
createNode mesh -n "FRM_C_mouthCloseShape" -p "FRM_C_mouthClose";
	rename -uid "92B89A4D-408D-2158-313C-D990D61C4FB4";
	setAttr -k off ".v";
	setAttr ".ovdt" 2;
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 16 ".uvst[0].uvsp[0:15]" -type "float2" 0 0 1 0 0 1 1 1 0
		 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1 0 0 1 0 1 1 0 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 10 ".pt[0:9]" -type "float3"  -0.016920272 0.0038046911 
		0 0.016920272 0.0038046911 0 -0.01692027 0 0 0.01692027 0 0 -0.016920272 -0.0038046911 
		0 0.016920272 -0.0038046911 0 0 0.0038046911 0 0 -0.0038046911 0 0 0.0038046911 0 
		0 -0.0038046911 0;
	setAttr -s 10 ".vt[0:9]"  -0.019681722 0.0044974685 -1.1102229e-16
		 0.020657778 0.0044974685 -1.110223e-16 -0.019681722 0.99946904 6.6174449e-23 0.020657778 0.99946904 6.6174449e-23
		 -0.019681722 -0.004801427 -1.1205989e-16 0.020657778 -0.004801427 -1.120599e-16 0.22688696 0.0044974685 -1.1101849e-16
		 0.22688696 -0.004801427 -1.1205611e-16 -0.22653061 0.0044974685 -1.110185e-16 -0.22653061 -0.004801427 -1.1205609e-16;
	setAttr -s 13 ".ed[0:12]"  0 1 1 0 2 0 1 3 0 2 3 0 0 4 0 1 5 0 4 5 0
		 1 6 0 5 7 0 6 7 0 0 8 0 4 9 0 8 9 0;
	setAttr -s 4 -ch 16 ".fc[0:3]" -type "polyFaces" 
		f 4 0 2 -4 -2
		mu 0 4 0 1 3 2
		f 4 -1 4 6 -6
		mu 0 4 4 5 6 7
		f 4 5 8 -10 -8
		mu 0 4 8 9 10 11
		f 4 -5 10 12 -12
		mu 0 4 12 13 14 15;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dn" yes;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -n "CTRL_C_mouthClose" -p "FRM_C_mouthClose";
	rename -uid "16957685-4212-7352-5EDC-1BB1EDCB6E5B";
	setAttr -l on -k off ".v";
	setAttr ".ove" yes;
	setAttr -l on -k off ".tx";
	setAttr -l on -k off ".tz";
	setAttr -l on -k off ".rx";
	setAttr -l on -k off ".ry";
	setAttr -l on -k off ".rz";
	setAttr -l on -k off ".sx";
	setAttr -l on -k off ".sy";
	setAttr -l on -k off ".sz";
	setAttr ".mntl" -type "double3" 0 0 0 ;
	setAttr ".mxtl" -type "double3" 0 1 0 ;
	setAttr ".mtxe" yes;
	setAttr ".mtye" yes;
	setAttr ".mtze" yes;
	setAttr ".xtxe" yes;
	setAttr ".xtye" yes;
	setAttr ".xtze" yes;
	setAttr ".mnrl" -type "double3" 0 0 0 ;
	setAttr ".mxrl" -type "double3" 0 0 0 ;
	setAttr ".mrxe" yes;
	setAttr ".mrye" yes;
	setAttr ".mrze" yes;
	setAttr ".xrxe" yes;
	setAttr ".xrye" yes;
	setAttr ".xrze" yes;
createNode mesh -n "CTRL_C_mouthCloseShape" -p "CTRL_C_mouthClose";
	rename -uid "34365AD4-4BD0-6E49-5FD9-428BD3C3407F";
	setAttr -k off ".v";
	setAttr ".ove" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".csh" no;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 21 ".uvst[0].uvsp[0:20]" -type "float2" 0.64860266 0.79546607
		 0.62640899 0.75190848 0.59184152 0.71734101 0.54828393 0.69514734 0.5 0.68749994
		 0.45171607 0.69514734 0.40815851 0.71734107 0.37359107 0.75190854 0.3513974 0.79546607
		 0.34374997 0.84375 0.3513974 0.89203393 0.37359107 0.93559146 0.40815854 0.97015893
		 0.4517161 0.9923526 0.5 1 0.54828387 0.9923526 0.59184146 0.97015893 0.62640893 0.93559146
		 0.6486026 0.89203393 0.65625 0.84375 0.5 0.83749998;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".sdt" 0;
	setAttr ".ugsdt" no;
	setAttr -s 21 ".pt[0:20]" -type "float3"  0.093120486 0.0075641647 
		-0.27172145 0.079213008 0.014387897 -0.27172145 0.057551622 0.019803245 -0.27172145 
		0.030256683 0.023280112 -0.27172145 1.0637092e-08 0.024478156 -0.27172145 -0.030256659 
		0.023280112 -0.27172145 -0.057551585 0.019803241 -0.27172145 -0.079212964 0.014387892 
		-0.27172145 -0.093120426 0.0075641628 -0.27172145 -0.097912595 -3.9889114e-09 -0.27172145 
		-0.093120426 -0.007564167 -0.27172145 -0.079212941 -0.014387903 -0.27172145 -0.057551578 
		-0.019803245 -0.27172145 -0.030256659 -0.023280112 -0.27172145 7.7190725e-09 -0.024478152 
		-0.27172145 0.030256659 -0.023280112 -0.27172145 0.057551574 -0.019803245 -0.27172145 
		0.079212941 -0.0143879 -0.27172145 0.093120426 -0.0075641656 -0.27172145 0.097912595 
		-3.9889114e-09 -0.27172145 1.0637092e-08 -3.9889114e-09 -0.27172145;
	setAttr -s 21 ".vt[0:20]"  0.26089889 0.021192795 0.27432513 0.22193384 0.040311091 0.27432513
		 0.16124436 0.055483457 0.27432513 0.084771171 0.065224707 0.27432513 0 0.068581313 0.27432513
		 -0.084771171 0.065224707 0.27432513 -0.16124433 0.055483446 0.27432513 -0.22193377 0.040311079 0.27432513
		 -0.26089877 0.021192787 0.27432513 -0.27432519 6.0912416e-17 0.27432513 -0.26089877 -0.021192787 0.27432513
		 -0.22193375 -0.040311076 0.27432513 -0.1612443 -0.055483431 0.27432513 -0.084771149 -0.065224685 0.27432513
		 -8.175526e-09 -0.068581291 0.27432513 0.084771119 -0.065224685 0.27432513 0.16124426 -0.055483427 0.27432513
		 0.22193369 -0.040311072 0.27432513 0.26089871 -0.021192782 0.27432513 0.27432513 6.0912416e-17 0.27432513
		 0 6.0912416e-17 0.27432513;
	setAttr -s 40 ".ed[0:39]"  0 1 0 1 2 0 2 3 0 3 4 0 4 5 0 5 6 0 6 7 0
		 7 8 0 8 9 0 9 10 0 10 11 0 11 12 0 12 13 0 13 14 0 14 15 0 15 16 0 16 17 0 17 18 0
		 18 19 0 19 0 0 0 20 1 1 20 1 2 20 1 3 20 1 4 20 1 5 20 1 6 20 1 7 20 1 8 20 1 9 20 1
		 10 20 1 11 20 1 12 20 1 13 20 1 14 20 1 15 20 1 16 20 1 17 20 1 18 20 1 19 20 1;
	setAttr -s 20 -ch 60 ".fc[0:19]" -type "polyFaces" 
		f 3 0 21 -21
		mu 0 3 18 17 20
		f 3 1 22 -22
		mu 0 3 17 16 20
		f 3 2 23 -23
		mu 0 3 16 15 20
		f 3 3 24 -24
		mu 0 3 15 14 20
		f 3 4 25 -25
		mu 0 3 14 13 20
		f 3 5 26 -26
		mu 0 3 13 12 20
		f 3 6 27 -27
		mu 0 3 12 11 20
		f 3 7 28 -28
		mu 0 3 11 10 20
		f 3 8 29 -29
		mu 0 3 10 9 20
		f 3 9 30 -30
		mu 0 3 9 8 20
		f 3 10 31 -31
		mu 0 3 8 7 20
		f 3 11 32 -32
		mu 0 3 7 6 20
		f 3 12 33 -33
		mu 0 3 6 5 20
		f 3 13 34 -34
		mu 0 3 5 4 20
		f 3 14 35 -35
		mu 0 3 4 3 20
		f 3 15 36 -36
		mu 0 3 3 2 20
		f 3 16 37 -37
		mu 0 3 2 1 20
		f 3 17 38 -38
		mu 0 3 1 0 20
		f 3 18 39 -39
		mu 0 3 0 19 20
		f 3 19 20 -40
		mu 0 3 19 18 20;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode transform -s -n "persp";
	rename -uid "CB1DFCC8-4EF1-B1B0-367D-BD9DDDA3D8BB";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 15.178906114417183 37.811040249510384 141.32921407707744 ;
	setAttr ".r" -type "double3" -9.3383527296026809 3.4000000000000239 0 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "B4E0E46C-45C6-8C2C-3564-FEAF2DCE71DE";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 144.55613247046779;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "9799E8E3-4BD9-1181-2FD6-789771DAD53D";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "D3C09F32-4081-1F2F-CEF9-DA8235101182";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "E1CE3802-4494-8A53-D6FE-FF951A737A71";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "F09BAA3C-4445-19F1-9EC3-118E22CB4BCA";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "2B216BE7-4F08-1C78-B0CD-71B39CB8B2F8";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 0 0 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "385B02A7-4401-CF82-8EDC-69905836AB9E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode clamp -n "ARKit_controller_1_clamp5";
	rename -uid "DD8AF235-44E6-95F3-E1A3-2396B9E716C9";
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode clamp -n "ARKit_controller_1_clamp6";
	rename -uid "912BB35C-477D-6192-901D-BCA839DA0BB3";
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode remapValue -n "ARKit_controller_1_upEyelid_L_in_ctrl_zeroToNegOne_remap";
	rename -uid "3E8EFE90-4B60-9141-B20A-78946A2073D8";
	setAttr ".imx" -1;
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "upEyelid_R_in_ctrl_zeroToNegOne_remap";
	rename -uid "428B208E-463C-CD25-E543-93807CC12C86";
	setAttr ".imx" -1;
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "remapValue36";
	rename -uid "F6A88AB2-4047-039B-9BC8-A4AE783DC8FC";
	setAttr ".imx" -1;
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode clamp -n "clamp24";
	rename -uid "55555B86-4093-4193-6EB6-CC8146DA7F25";
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode clamp -n "ARKit_controller_1_mouth_ctrl_zeroToOne_clamp";
	rename -uid "F9ECED7F-4DE8-1C54-718E-DDA6F06F529F";
	setAttr ".mx" -type "float3" 1 0 0 ;
createNode remapValue -n "ARKit_controller_1_mouth_ctrl_zeroToNegOne_remap";
	rename -uid "22AB333E-406B-4016-9C16-519716D33369";
	setAttr ".imn" -1;
	setAttr ".imx" 0;
	setAttr ".omn" 1;
	setAttr ".omx" 0;
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode clamp -n "clamp26";
	rename -uid "70889037-44C5-995E-46DC-8A89C4098529";
	setAttr ".mx" -type "float3" 1 1 0 ;
createNode addDoubleLinear -n "addDoubleLinear1";
	rename -uid "B3EA9058-4604-E942-7A8F-7592015A0145";
createNode clamp -n "clamp23";
	rename -uid "01889E6B-43C6-1622-5E83-8185938FAB79";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode addDoubleLinear -n "addDoubleLinear2";
	rename -uid "21140E07-4E8B-2BD1-0164-7DB2907F8E21";
createNode clamp -n "clamp22";
	rename -uid "EE845C98-442C-B728-2F9F-E988B11FD10C";
	setAttr ".mx" -type "float3" 1 1 1 ;
createNode multDoubleLinear -n "multDoubleLinear1";
	rename -uid "99FA1D41-4C09-6E8C-0BAA-D6A2EC57A171";
createNode remapValue -n "remapValue30";
	rename -uid "8F3E4E75-4B70-14B5-3F12-3FA997C79178";
	setAttr ".imx" -1;
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode remapValue -n "remapValue32";
	rename -uid "49150F5D-46B8-5D20-A9EE-349B0B8F1DEA";
	setAttr ".imx" -1;
	setAttr -s 2 ".vl[0:1]"  0 0 1 1 1 1;
	setAttr -s 2 ".cl";
	setAttr ".cl[0].clp" 0;
	setAttr ".cl[0].clc" -type "float3" 0 0 0 ;
	setAttr ".cl[0].cli" 1;
	setAttr ".cl[1].clp" 1;
	setAttr ".cl[1].clc" -type "float3" 1 1 1 ;
	setAttr ".cl[1].cli" 1;
createNode transformGeometry -n "transformGeometry25";
	rename -uid "DD140C0F-4378-BAA3-031E-BBA69B2E483A";
	setAttr ".txf" -type "matrix" 1 0 0 0 0 -4.4408920985006262e-16 1 0 0 -1 -4.4408920985006262e-16 0
		 0 0 0 1;
createNode makeNurbCircle -n "makeNurbCircle1";
	rename -uid "A006AF6B-4D08-C66A-6089-74B96082E3CD";
	setAttr ".nr" -type "double3" 0 1 0 ;
createNode materialInfo -n "pasted__materialInfo3";
	rename -uid "9C908271-4A87-C5F6-77A2-EA9CA026A345";
createNode shadingEngine -n "pasted__GUI2D_black_shaderSG1";
	rename -uid "EB9AEEE9-4AE0-5F2E-CF93-F9BA8CF37830";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_black_shader1";
	rename -uid "7261482C-4CC3-A624-F711-1F92CD4DEA76";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0 0 ;
createNode materialInfo -n "pasted__materialInfo4";
	rename -uid "ABD3E369-4545-F1FB-C1B0-519FE4CB08B1";
createNode shadingEngine -n "pasted__GUI2D_yellow_shaderSG1";
	rename -uid "A78DD22D-48AE-FABD-C474-E68AA0D1FF5B";
	setAttr ".ihi" 0;
	setAttr -s 9 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_yellow_shader1";
	rename -uid "244BD5D5-4F24-C0CA-7B86-B7B3B4A771D0";
	setAttr ".dc" 1;
	setAttr ".c" -type "float3" 1 1 0 ;
createNode materialInfo -n "pasted__materialInfo5";
	rename -uid "4A3936F6-46C4-B47E-1EF6-66AD219DECD4";
createNode shadingEngine -n "pasted__GUI2D_black_shaderSG2";
	rename -uid "14CB8CD1-4E5C-2F1A-4C07-F6972C71995E";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_black_shader2";
	rename -uid "91643938-4459-85E1-DBB0-C3832940BC74";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0 0 ;
createNode materialInfo -n "pasted__materialInfo6";
	rename -uid "A58260C5-4256-A3C8-3517-35848AAB05E3";
createNode shadingEngine -n "pasted__GUI2D_yellow_shaderSG2";
	rename -uid "FBA2B9B7-4B23-096E-F6EF-E5B17D653D31";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_yellow_shader2";
	rename -uid "6B96DFFA-44D2-A86D-D484-F6BC5CAFEFBF";
	setAttr ".dc" 1;
	setAttr ".c" -type "float3" 1 1 0 ;
createNode materialInfo -n "pasted__materialInfo7";
	rename -uid "C8009733-47A8-9167-DEDC-C5864BBC0108";
createNode shadingEngine -n "pasted__GUI2D_black_shaderSG3";
	rename -uid "2178D6E1-4F2B-32E5-BFFB-A4A7CF0699A2";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_black_shader3";
	rename -uid "B10FB618-4794-622B-E8F1-7CB189BC1C6C";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0 0 ;
createNode materialInfo -n "pasted__materialInfo8";
	rename -uid "57151764-4541-3C3F-F3CB-63A44A3DEFE6";
createNode shadingEngine -n "pasted__GUI2D_yellow_shaderSG3";
	rename -uid "EF73A65E-4577-B48E-81A1-C0AD845A414F";
	setAttr ".ihi" 0;
	setAttr -s 7 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_yellow_shader3";
	rename -uid "F0FA88E7-4B2D-A9DF-9CDC-E2AEF484B035";
	setAttr ".dc" 1;
	setAttr ".c" -type "float3" 1 1 0 ;
createNode materialInfo -n "pasted__materialInfo1";
	rename -uid "C784CF01-481F-78DB-0508-7E801C0C919F";
createNode shadingEngine -n "pasted__GUI2D_black_shaderSG";
	rename -uid "C50B0B25-4A5D-2701-1F02-EA9115573B41";
	setAttr ".ihi" 0;
	setAttr -s 17 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_black_shader";
	rename -uid "A87225C8-4AF3-07C4-2F3E-078AA502BB7A";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0 0 ;
createNode materialInfo -n "pasted__materialInfo2";
	rename -uid "51BC6E1E-4D76-1721-19FD-E4AD5971D23F";
createNode shadingEngine -n "pasted__GUI2D_yellow_shaderSG";
	rename -uid "DD4FF180-4C8D-76BD-C4C2-819F2B5AF39B";
	setAttr ".ihi" 0;
	setAttr -s 17 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_yellow_shader";
	rename -uid "DE81C18A-43B8-E500-F7D5-2393695073FA";
	setAttr ".dc" 1;
	setAttr ".c" -type "float3" 1 1 0 ;
createNode groupId -n "pasted__groupId31";
	rename -uid "347750E7-480C-4435-14AA-8E8CBF743C58";
	setAttr ".ihi" 0;
createNode materialInfo -n "pasted__materialInfo9";
	rename -uid "A93B6C44-490C-64E3-300D-B0A3F008AE79";
createNode shadingEngine -n "pasted__GUI2D_black_shaderSG4";
	rename -uid "92FE08A5-4D0A-6C15-A422-CCA232734493";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_black_shader4";
	rename -uid "B7F5134B-43DC-B65D-3E38-E59133A1D525";
	setAttr ".dc" 0;
	setAttr ".c" -type "float3" 0 0 0 ;
createNode materialInfo -n "pasted__materialInfo10";
	rename -uid "909286A6-4A04-EC98-85D4-AE9B8CD750BF";
createNode shadingEngine -n "pasted__GUI2D_orange_shaderSG";
	rename -uid "153CB569-4324-9453-E10F-7197C81CB696";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode lambert -n "pasted__GUI2D_orange_shader";
	rename -uid "0F1A96D2-4ECC-920C-296D-868B1DDE6EA8";
	setAttr ".dc" 1;
	setAttr ".c" -type "float3" 1 0.58333331 0 ;
createNode lightLinker -s -n "lightLinker1";
	rename -uid "811E9D34-46CE-0A13-C513-A09DCE23D278";
	setAttr -s 13 ".lnk";
	setAttr -s 12 ".slnk";
createNode displayLayerManager -n "layerManager";
	rename -uid "C4FDE402-4CCB-C03C-2A85-D9B60228C61F";
createNode displayLayer -n "defaultLayer";
	rename -uid "CBAD5465-4A25-7A55-CA52-DC81DE42FF21";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "BC0D6387-4B95-6756-B08E-CB8022B3CB6C";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "7A7FB631-425D-6312-8EC9-2782C3FCF241";
	setAttr ".g" yes;
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "682F57FB-4297-4A5E-9449-C3B0016C4E52";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "1496FC94-423E-11CC-ED86-25813D75D343";
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "1CE913F9-45A3-8D1B-0009-E8AEF86C5B7B";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 150 -ast 0 -aet 500 ";
	setAttr ".st" 6;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av ".unw";
	setAttr -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".ihi";
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr -av ".tq";
	setAttr ".tmrm" 1;
	setAttr ".tmr" 8129;
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -av ".mbe";
	setAttr -av -k on ".mbsof";
	setAttr ".msaa" yes;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 12 ".st";
	setAttr -cb on ".an";
	setAttr -cb on ".pt";
select -ne :renderGlobalsList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
select -ne :defaultShaderList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 15 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 15 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :initialParticleSE;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".mwc";
	setAttr -cb on ".an";
	setAttr -cb on ".il";
	setAttr -cb on ".vo";
	setAttr -cb on ".eo";
	setAttr -cb on ".fo";
	setAttr -cb on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultRenderGlobals;
	addAttr -ci true -h true -sn "dss" -ln "defaultSurfaceShader" -dt "string";
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".macc";
	setAttr -k on ".macd";
	setAttr -k on ".macq";
	setAttr -k on ".mcfr";
	setAttr -cb on ".ifg";
	setAttr -k on ".clip";
	setAttr -k on ".edm";
	setAttr -k on ".edl";
	setAttr ".ren" -type "string" "arnold";
	setAttr -av -k on ".esr";
	setAttr -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av ".outf";
	setAttr -av ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".an";
	setAttr -k on ".ar";
	setAttr -k on ".fs";
	setAttr -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -k on ".me";
	setAttr -k on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep";
	setAttr -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -k on ".umfn";
	setAttr -k on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -k on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -k on ".comp";
	setAttr -k on ".cth";
	setAttr -k on ".soll";
	setAttr -cb on ".sosl";
	setAttr -k on ".rd";
	setAttr -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -k on ".mm";
	setAttr -k on ".npu";
	setAttr -k on ".itf";
	setAttr -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -k on ".uf";
	setAttr -k on ".oi";
	setAttr -k on ".rut";
	setAttr -k on ".mot";
	setAttr -av -cb on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -k on ".mbso";
	setAttr -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -k on ".pfb";
	setAttr -k on ".pram" -type "string" "";
	setAttr -k on ".poam";
	setAttr -k on ".prlm";
	setAttr -k on ".polm";
	setAttr -cb on ".prm";
	setAttr -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -k on ".ubc";
	setAttr -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -k on ".udbx";
	setAttr -k on ".smc";
	setAttr -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -k on ".tlwd";
	setAttr -k on ".tlht";
	setAttr -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -k on ".ope";
	setAttr -k on ".oppf";
	setAttr -av -k on ".rcp";
	setAttr -av -k on ".icp";
	setAttr -av -k on ".ocp";
	setAttr -cb on ".hbl";
	setAttr ".dss" -type "string" "lambert1";
select -ne :defaultResolution;
	setAttr -av -k on ".cch";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av -k on ".w";
	setAttr -av -k on ".h";
	setAttr -av -k on ".pa" 1;
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar";
	setAttr -av -k on ".ldar";
	setAttr -av -cb on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -cb on ".isu";
	setAttr -av -cb on ".pdu";
select -ne :defaultColorMgtGlobals;
	setAttr ".cfp" -type "string" "<MAYA_RESOURCES>/OCIO-configs/Maya-legacy/config.ocio";
	setAttr ".ovt" no;
	setAttr ".povt" no;
select -ne :hardwareRenderGlobals;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -k off ".fbfm";
	setAttr -k off -cb on ".ehql";
	setAttr -k off -cb on ".eams";
	setAttr -k off -cb on ".eeaa";
	setAttr -k off -cb on ".engm";
	setAttr -k off -cb on ".mes";
	setAttr -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -k off -cb on ".mbs";
	setAttr -k off -cb on ".trm";
	setAttr -k off -cb on ".tshc";
	setAttr -k off ".enpt";
	setAttr -k off -cb on ".clmt";
	setAttr -k off -cb on ".tcov";
	setAttr -k off -cb on ".lith";
	setAttr -k off -cb on ".sobc";
	setAttr -k off -cb on ".cuth";
	setAttr -k off -cb on ".hgcd";
	setAttr -k off -cb on ".hgci";
	setAttr -k off -cb on ".mgcs";
	setAttr -k off -cb on ".twa";
	setAttr -k off -cb on ".twz";
	setAttr -k on ".hwcc";
	setAttr -k on ".hwdp";
	setAttr -k on ".hwql";
	setAttr -k on ".hwfr";
	setAttr -k on ".soll";
	setAttr -k on ".sosl";
	setAttr -k on ".bswa";
	setAttr -k on ".shml";
	setAttr -k on ".hwel";
connectAttr "CTRL_C_browInnerUp.ty" "facial_attrs_out.browInnerUp";
connectAttr "CTRL_L_brow_down.ty" "facial_attrs_out.browDownLeft";
connectAttr "CTRL_R_brow_down.ty" "facial_attrs_out.browDownRight";
connectAttr "CTRL_L_brow_raiseOut.ty" "facial_attrs_out.browOuterUpLeft";
connectAttr "CTRL_R_brow_raiseOut.ty" "facial_attrs_out.browOuterUpRight";
connectAttr "ARKit_controller_1_clamp5.opr" "facial_attrs_out.eyeBlinkLeft";
connectAttr "ARKit_controller_1_clamp6.opr" "facial_attrs_out.eyeBlinkRight";
connectAttr "CTRL_L_eye_squintInner.ty" "facial_attrs_out.eyeSquintLeft";
connectAttr "CTRL_R_eye_squintInner.ty" "facial_attrs_out.eyeSquintRight";
connectAttr "ARKit_controller_1_upEyelid_L_in_ctrl_zeroToNegOne_remap.ov" "facial_attrs_out.eyeWideLeft"
		;
connectAttr "upEyelid_R_in_ctrl_zeroToNegOne_remap.ov" "facial_attrs_out.eyeWideRight"
		;
connectAttr "CTRL_C_cheekPuff.ty" "facial_attrs_out.cheekPuff";
connectAttr "CTRL_L_eye_cheekRaise.ty" "facial_attrs_out.cheekSquintLeft";
connectAttr "CTRL_R_eye_cheekRaise.ty" "facial_attrs_out.cheekSquintRight";
connectAttr "CTRL_L_nose_sneer.ty" "facial_attrs_out.noseSneerLeft";
connectAttr "CTRL_R_nose_sneer.ty" "facial_attrs_out.noseSneerRight";
connectAttr "CTRL_C_jaw.ty" "facial_attrs_out.jawOpen";
connectAttr "CTRL_C_jaw_fwdBack.ty" "facial_attrs_out.jawForward";
connectAttr "remapValue36.ov" "facial_attrs_out.jawLeft";
connectAttr "clamp24.opr" "facial_attrs_out.jawRight";
connectAttr "CTRL_C_mouthFunnel.ty" "facial_attrs_out.mouthFunnel";
connectAttr "CTRL_C_mouthPucker.ty" "facial_attrs_out.mouthPucker";
connectAttr "ARKit_controller_1_mouth_ctrl_zeroToOne_clamp.opr" "facial_attrs_out.mouthLeft"
		;
connectAttr "ARKit_controller_1_mouth_ctrl_zeroToNegOne_remap.ov" "facial_attrs_out.mouthRight"
		;
connectAttr "clamp26.opg" "facial_attrs_out.mouthShrugUpper";
connectAttr "clamp26.opr" "facial_attrs_out.mouthShrugLower";
connectAttr "CTRL_L_mouth_cornerPull.ty" "facial_attrs_out.mouthSmileLeft";
connectAttr "CTRL_R_mouth_cornerPull.ty" "facial_attrs_out.mouthSmileRight";
connectAttr "CTRL_L_mouth_cornerDepress.ty" "facial_attrs_out.mouthFrownLeft";
connectAttr "CTRL_R_mouth_cornerDepress.ty" "facial_attrs_out.mouthFrownRight";
connectAttr "CTRL_L_mouth_dimple.ty" "facial_attrs_out.mouthDimpleLeft";
connectAttr "CTRL_R_mouth_dimple.ty" "facial_attrs_out.mouthDimpleRight";
connectAttr "CTRL_L_mouth_upperLipRaise.ty" "facial_attrs_out.mouthUpperUpLeft";
connectAttr "CTRL_R_mouth_upperLipRaise.ty" "facial_attrs_out.mouthUpperUpRight"
		;
connectAttr "CTRL_L_mouth_lowerLipDepress.ty" "facial_attrs_out.mouthLowerDownLeft"
		;
connectAttr "CTRL_R_mouth_lowerLipDepress.ty" "facial_attrs_out.mouthLowerDownRight"
		;
connectAttr "CTRL_L_mouth_sharpCornerPull.ty" "facial_attrs_out.mouthPressLeft";
connectAttr "CTRL_R_mouth_sharpCornerPull.ty" "facial_attrs_out.mouthPressRight"
		;
connectAttr "CTRL_L_mouth_stretch.ty" "facial_attrs_out.mouthStretchLeft";
connectAttr "CTRL_R_mouth_stretch.ty" "facial_attrs_out.mouthStretchRight";
connectAttr "multDoubleLinear1.o" "facial_attrs_out.mouthClose";
connectAttr "remapValue30.ov" "facial_attrs_out.mouthRollUpper";
connectAttr "remapValue32.ov" "facial_attrs_out.mouthRollLower";
connectAttr "transformGeometry25.og" "facial_global_ctrlShape.cr";
connectAttr "pasted__groupId31.id" "FRM_C_jawShape.iog.og[0].gid";
connectAttr "pasted__GUI2D_black_shaderSG.mwc" "FRM_C_jawShape.iog.og[0].gco";
connectAttr "CTRL_L_eye_blink.ty" "ARKit_controller_1_clamp5.ipr";
connectAttr "CTRL_R_eye_blink.ty" "ARKit_controller_1_clamp6.ipr";
connectAttr "CTRL_L_eye_blink.ty" "ARKit_controller_1_upEyelid_L_in_ctrl_zeroToNegOne_remap.i"
		;
connectAttr "CTRL_R_eye_blink.ty" "upEyelid_R_in_ctrl_zeroToNegOne_remap.i";
connectAttr "CTRL_C_jaw.tx" "remapValue36.i";
connectAttr "CTRL_C_jaw.tx" "clamp24.ipr";
connectAttr "CTRL_C_mouth.tx" "ARKit_controller_1_mouth_ctrl_zeroToOne_clamp.ipr"
		;
connectAttr "CTRL_C_mouth.tx" "ARKit_controller_1_mouth_ctrl_zeroToNegOne_remap.i"
		;
connectAttr "addDoubleLinear1.o" "clamp26.ipr";
connectAttr "addDoubleLinear2.o" "clamp26.ipg";
connectAttr "clamp23.opr" "addDoubleLinear1.i1";
connectAttr "clamp23.opg" "addDoubleLinear1.i2";
connectAttr "CTRL_mouthShrugRollLower.ty" "clamp23.ipr";
connectAttr "CTRL_C_mouth.ty" "clamp23.ipg";
connectAttr "clamp22.opr" "addDoubleLinear2.i1";
connectAttr "clamp22.opg" "addDoubleLinear2.i2";
connectAttr "CTRL_mouthShrugRollUpper.ty" "clamp22.ipr";
connectAttr "CTRL_C_mouth.ty" "clamp22.ipg";
connectAttr "CTRL_C_jaw.ty" "multDoubleLinear1.i1";
connectAttr "CTRL_C_mouthClose.ty" "multDoubleLinear1.i2";
connectAttr "CTRL_mouthShrugRollUpper.ty" "remapValue30.i";
connectAttr "CTRL_mouthShrugRollLower.ty" "remapValue32.i";
connectAttr "makeNurbCircle1.oc" "transformGeometry25.ig";
connectAttr "pasted__GUI2D_black_shaderSG1.msg" "pasted__materialInfo3.sg";
connectAttr "pasted__GUI2D_black_shader1.msg" "pasted__materialInfo3.m";
connectAttr "pasted__GUI2D_black_shader1.oc" "pasted__GUI2D_black_shaderSG1.ss";
connectAttr "FRM_R_brow_raiseOutShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" -na
		;
connectAttr "FRM_C_browInnerUpShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" -na
		;
connectAttr "FRM_L_brow_raiseOutShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" -na
		;
connectAttr "FRM_R_eye_squintInnerShape.iog" "pasted__GUI2D_black_shaderSG1.dsm"
		 -na;
connectAttr "FRM_L_eye_squintInnerShape.iog" "pasted__GUI2D_black_shaderSG1.dsm"
		 -na;
connectAttr "FRM_L_eye_cheekRaiseShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" 
		-na;
connectAttr "FRM_R_eye_cheekRaiseShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" 
		-na;
connectAttr "FRM_L_nose_sneerShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" -na;
connectAttr "FRM_R_nose_sneerShape.iog" "pasted__GUI2D_black_shaderSG1.dsm" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG1.msg" "pasted__materialInfo4.sg";
connectAttr "pasted__GUI2D_yellow_shader1.msg" "pasted__materialInfo4.m";
connectAttr "pasted__GUI2D_yellow_shader1.oc" "pasted__GUI2D_yellow_shaderSG1.ss"
		;
connectAttr "CTRL_R_brow_raiseOutShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm"
		 -na;
connectAttr "CTRL_C_browInnerUpShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm" -na
		;
connectAttr "CTRL_L_brow_raiseOutShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm"
		 -na;
connectAttr "CTRL_R_eye_squintInnerShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm"
		 -na;
connectAttr "CTRL_L_eye_squintInnerShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm"
		 -na;
connectAttr "CTRL_L_eye_cheekRaiseShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm"
		 -na;
connectAttr "CTRL_R_eye_cheekRaiseShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm"
		 -na;
connectAttr "CTRL_L_nose_sneerShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm" -na
		;
connectAttr "CTRL_R_nose_sneerShape.iog" "pasted__GUI2D_yellow_shaderSG1.dsm" -na
		;
connectAttr "pasted__GUI2D_black_shaderSG2.msg" "pasted__materialInfo5.sg";
connectAttr "pasted__GUI2D_black_shader2.msg" "pasted__materialInfo5.m";
connectAttr "pasted__GUI2D_black_shader2.oc" "pasted__GUI2D_black_shaderSG2.ss";
connectAttr "FRM_R_brow_downShape.iog" "pasted__GUI2D_black_shaderSG2.dsm" -na;
connectAttr "FRM_L_brow_downShape.iog" "pasted__GUI2D_black_shaderSG2.dsm" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG2.msg" "pasted__materialInfo6.sg";
connectAttr "pasted__GUI2D_yellow_shader2.msg" "pasted__materialInfo6.m";
connectAttr "pasted__GUI2D_yellow_shader2.oc" "pasted__GUI2D_yellow_shaderSG2.ss"
		;
connectAttr "CTRL_R_brow_downShape.iog" "pasted__GUI2D_yellow_shaderSG2.dsm" -na
		;
connectAttr "CTRL_L_brow_downShape.iog" "pasted__GUI2D_yellow_shaderSG2.dsm" -na
		;
connectAttr "pasted__GUI2D_black_shaderSG3.msg" "pasted__materialInfo7.sg";
connectAttr "pasted__GUI2D_black_shader3.msg" "pasted__materialInfo7.m";
connectAttr "pasted__GUI2D_black_shader3.oc" "pasted__GUI2D_black_shaderSG3.ss";
connectAttr "FRM_L_eye_blinkShape.iog" "pasted__GUI2D_black_shaderSG3.dsm" -na;
connectAttr "FRM_R_eye_blinkShape.iog" "pasted__GUI2D_black_shaderSG3.dsm" -na;
connectAttr "FRM_C_mouthShrugRollUpperShape.iog" "pasted__GUI2D_black_shaderSG3.dsm"
		 -na;
connectAttr "FRM_C_mouthShrugRollLowerShape.iog" "pasted__GUI2D_black_shaderSG3.dsm"
		 -na;
connectAttr "FRM_C_cheekPuffShape.iog" "pasted__GUI2D_black_shaderSG3.dsm" -na;
connectAttr "FRM_C_mouthFunnelShape.iog" "pasted__GUI2D_black_shaderSG3.dsm" -na
		;
connectAttr "FRM_C_mouthPuckerShape.iog" "pasted__GUI2D_black_shaderSG3.dsm" -na
		;
connectAttr "pasted__GUI2D_yellow_shaderSG3.msg" "pasted__materialInfo8.sg";
connectAttr "pasted__GUI2D_yellow_shader3.msg" "pasted__materialInfo8.m";
connectAttr "pasted__GUI2D_yellow_shader3.oc" "pasted__GUI2D_yellow_shaderSG3.ss"
		;
connectAttr "CTRL_L_eye_blinkShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm" -na
		;
connectAttr "CTRL_R_eye_blinkShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm" -na
		;
connectAttr "CTRL_mouthShrugRollUpperShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm"
		 -na;
connectAttr "CTRL_mouthShrugRollLowerShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm"
		 -na;
connectAttr "CTRL_C_cheekPuffShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm" -na
		;
connectAttr "CTRL_C_mouthFunnelShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm" -na
		;
connectAttr "CTRL_C_mouthPuckerShape.iog" "pasted__GUI2D_yellow_shaderSG3.dsm" -na
		;
connectAttr "pasted__GUI2D_black_shaderSG.msg" "pasted__materialInfo1.sg";
connectAttr "pasted__GUI2D_black_shader.msg" "pasted__materialInfo1.m";
connectAttr "pasted__GUI2D_black_shader.oc" "pasted__GUI2D_black_shaderSG.ss";
connectAttr "FRM_L_mouth_upperLipRaiseShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_R_mouth_upperLipRaiseShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_L_mouth_sharpCornerPullShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_R_mouth_sharpCornerPullShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_L_mouth_cornerPullShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_R_mouth_cornerPullShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_L_mouth_dimpleShape.iog" "pasted__GUI2D_black_shaderSG.dsm" -na
		;
connectAttr "FRM_R_mouth_dimpleShape.iog" "pasted__GUI2D_black_shaderSG.dsm" -na
		;
connectAttr "FRM_L_mouth_cornerDepressShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_R_mouth_cornerDepressShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_L_mouth_stretchShape.iog" "pasted__GUI2D_black_shaderSG.dsm" -na
		;
connectAttr "FRM_L_mouth_lowerLipDepressShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_R_mouth_stretchShape.iog" "pasted__GUI2D_black_shaderSG.dsm" -na
		;
connectAttr "FRM_R_mouth_lowerLipDepressShape.iog" "pasted__GUI2D_black_shaderSG.dsm"
		 -na;
connectAttr "FRM_C_mouthShape.iog" "pasted__GUI2D_black_shaderSG.dsm" -na;
connectAttr "FRM_C_jawShape.iog.og[0]" "pasted__GUI2D_black_shaderSG.dsm" -na;
connectAttr "FRM_C_jaw_fwdBackShape.iog" "pasted__GUI2D_black_shaderSG.dsm" -na;
connectAttr "pasted__groupId31.msg" "pasted__GUI2D_black_shaderSG.gn" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG.msg" "pasted__materialInfo2.sg";
connectAttr "pasted__GUI2D_yellow_shader.msg" "pasted__materialInfo2.m";
connectAttr "pasted__GUI2D_yellow_shader.oc" "pasted__GUI2D_yellow_shaderSG.ss";
connectAttr "CTRL_L_mouth_upperLipRaiseShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_R_mouth_upperLipRaiseShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_L_mouth_sharpCornerPullShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_R_mouth_sharpCornerPullShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_L_mouth_cornerPullShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_R_mouth_cornerPullShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_L_mouth_dimpleShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" -na
		;
connectAttr "CTRL_R_mouth_dimpleShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" -na
		;
connectAttr "CTRL_L_mouth_cornerDepressShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_R_mouth_cornerDepressShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_L_mouth_stretchShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" 
		-na;
connectAttr "CTRL_L_mouth_lowerLipDepressShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_R_mouth_stretchShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" 
		-na;
connectAttr "CTRL_R_mouth_lowerLipDepressShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm"
		 -na;
connectAttr "CTRL_C_mouthShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" -na;
connectAttr "CTRL_C_jawShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" -na;
connectAttr "CTRL_C_jaw_fwdBackShape.iog" "pasted__GUI2D_yellow_shaderSG.dsm" -na
		;
connectAttr "pasted__GUI2D_black_shaderSG4.msg" "pasted__materialInfo9.sg";
connectAttr "pasted__GUI2D_black_shader4.msg" "pasted__materialInfo9.m";
connectAttr "pasted__GUI2D_black_shader4.oc" "pasted__GUI2D_black_shaderSG4.ss";
connectAttr "FRM_C_mouthCloseShape.iog" "pasted__GUI2D_black_shaderSG4.dsm" -na;
connectAttr "pasted__GUI2D_orange_shaderSG.msg" "pasted__materialInfo10.sg";
connectAttr "pasted__GUI2D_orange_shader.msg" "pasted__materialInfo10.m";
connectAttr "pasted__GUI2D_orange_shader.oc" "pasted__GUI2D_orange_shaderSG.ss";
connectAttr "CTRL_C_mouthCloseShape.iog" "pasted__GUI2D_orange_shaderSG.dsm" -na
		;
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_black_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":defaultRenderGlobals.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_black_shaderSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG1.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_black_shaderSG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG2.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_black_shaderSG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG3.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_black_shaderSG4.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "pasted__GUI2D_orange_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_black_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_black_shaderSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG1.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_black_shaderSG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG2.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_black_shaderSG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_yellow_shaderSG3.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_black_shaderSG4.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "pasted__GUI2D_orange_shaderSG.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "pasted__GUI2D_black_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_black_shaderSG1.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG1.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_black_shaderSG2.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG2.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_black_shaderSG3.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_yellow_shaderSG3.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_black_shaderSG4.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_orange_shaderSG.pa" ":renderPartition.st" -na;
connectAttr "pasted__GUI2D_black_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_yellow_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_black_shader1.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_yellow_shader1.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_black_shader2.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_yellow_shader2.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_black_shader3.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_yellow_shader3.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_black_shader4.msg" ":defaultShaderList1.s" -na;
connectAttr "pasted__GUI2D_orange_shader.msg" ":defaultShaderList1.s" -na;
connectAttr "ARKit_controller_1_upEyelid_L_in_ctrl_zeroToNegOne_remap.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "ARKit_controller_1_clamp5.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ARKit_controller_1_clamp6.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "ARKit_controller_1_mouth_ctrl_zeroToNegOne_remap.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "ARKit_controller_1_mouth_ctrl_zeroToOne_clamp.msg" ":defaultRenderUtilityList1.u"
		 -na;
connectAttr "remapValue30.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp22.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp23.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue32.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "remapValue36.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp24.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "addDoubleLinear2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "multDoubleLinear1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "clamp26.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of ARKit_controller.ma
