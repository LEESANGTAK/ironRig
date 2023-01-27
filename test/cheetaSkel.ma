//Maya ASCII 2020 scene
//Name: cheetaSkel.ma
//Last modified: Fri, Jan 27, 2023 02:54:15 PM
//Codeset: 949
requires maya "2020";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2020";
fileInfo "version" "2020";
fileInfo "cutIdentifier" "202011110415-b1e20b88e2";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 19043)\n";
fileInfo "UUID" "BA605136-472D-F373-EB33-339D1CEA7036";
createNode transform -s -n "persp";
	rename -uid "3DED88ED-4EF2-8AA6-A701-C1BBC2C0EC5E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 173.18579782881642 72.466372494500746 73.390232701718872 ;
	setAttr ".r" -type "double3" -6.9383527297087548 -2453.800000001952 9.8519134963491605e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "3335DB27-4478-5401-21A4-92ABF3313CD3";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 174.20369570020245;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 0.0029506683349609375 40.220112164473449 8.4462343624379201 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
createNode transform -s -n "top";
	rename -uid "2D566490-4643-2007-21C9-568E2D583B08";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 1000.1 0 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "1DA46BB2-43B1-7538-B48F-948702745F8E";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
createNode transform -s -n "front";
	rename -uid "8E941FBC-42CC-2265-5F24-E48EC77E8F23";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 0 0 1000.1 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "11D856BD-4129-6E16-9C82-3693F6BFBE57";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 30;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
createNode transform -s -n "side";
	rename -uid "0E5F4F84-4F53-2053-9FBA-CEB490844F57";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.9440600144858 77.988869311749681 -27.932514862885355 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "8782B4ED-4828-BE75-A527-4CAE24882ACF";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.9411093461508;
	setAttr ".ow" 250.79688716728776;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".tp" -type "double3" 0.0029506683349609375 40.220112160534242 8.4462343677206491 ;
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
createNode transform -n "skeleton";
	rename -uid "419A76A4-4CFE-AD57-3207-769FD407E876";
createNode joint -n "Hip_joint" -p "skeleton";
	rename -uid "5CDDDF2D-4148-1DA3-5CE3-27B67B8C34FE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.3290705182007561e-15 80.827528697891978 -44.566743799407398 ;
	setAttr ".r" -type "double3" -7.9513867036587919e-15 -1.8288189418415221e-14 1.2689980606894206e-30 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90 -62.58585356851659 90 ;
	setAttr ".bps" -type "matrix" 0 0.46041897397730863 0.88770173391837093 0 -5.5511151231257815e-17 0.88770173391837104 -0.46041897397730863 0
		 -1 -5.5511151231257815e-17 0 0 7.1054273576010019e-15 80.827528697891978 -44.566743799407391 1;
	setAttr ".radi" 1.6883451436141514;
createNode joint -n "Spine_1" -p "Hip_joint";
	rename -uid "EB2271A7-40D4-488B-41C6-ED85FCE43C14";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 5.6825345886476981 -4.1419191919315921 -5.3290705182007388e-15 ;
	setAttr ".r" -type "double3" -5.1092084544619457e-17 -3.758157001789744e-14 0.26668650348608502 ;
	setAttr ".s" -type "double3" 0.99999392032623291 0.99999392032623291 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.7201619688934234e-14 -44.566466280738759 ;
	setAttr ".bps" -type "matrix" -2.2204325496627162e-16 -0.29046050192336942 0.95688062866370771 0
		 -5.5510813741567918e-17 0.95688062866370782 0.29046050192336942 0 -1 5.5511151231257839e-17 -2.2204460492503131e-16 0
		 7.105427357600994e-15 79.767086594360279 -37.615329807367651 1;
	setAttr ".radi" 1.5;
createNode joint -n "Spine_2" -p "Spine_1";
	rename -uid "1BB829BA-4C00-9CCD-184B-83BDC860EE0A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 14.480387286793373 2.8421709430404001e-14 -1.9748282455545733e-15 ;
	setAttr ".r" -type "double3" -4.2133881307911613e-16 -5.4872986656025137e-14 -0.70193204716368029 ;
	setAttr ".s" -type "double3" 0.99999392032623291 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 7.3940251182853904 ;
	setAttr ".bps" -type "matrix" -2.2699929594337639e-16 -0.17697270161743694 0.98420958315373752 0
		 -2.9257265212214775e-17 0.98421556686330069 0.17697377756026988 0 -1 5.5511151231257839e-17 -2.2204460492503131e-16 0
		 5.8649832768237465e-15 75.561106034993529 -23.75932771708684 1;
	setAttr ".radi" 1.5;
createNode joint -n "Spine_3" -p "Spine_2";
	rename -uid "BE2DA9B9-46BA-7FD5-C601-18B593972EEA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 16.105769629040019 1.4210854715202001e-14 -1.7379718598097448e-14 ;
	setAttr ".r" -type "double3" 1.3752296385302629e-15 1.0183316397153126e-13 0.81649168222444179 ;
	setAttr ".s" -type "double3" 0.99999392032623291 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 10.210614091264947 ;
	setAttr ".bps" -type "matrix" -2.2840426522271397e-16 0.014547860828632797 0.99988809395588807 0
		 1.4702101026603973e-17 0.9998941729862616 -0.014547949275418304 0 -1 5.5511151231257839e-17 -2.2204460492503131e-16 0
		 1.9588703508502897e-14 72.710824472114268 -7.907874904119236 1;
	setAttr ".radi" 1.5;
createNode joint -n "Spine_4" -p "Spine_3";
	rename -uid "1905E002-4BF8-F871-2CB2-81AA5A35DA9A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.992460223127287 4.2632564145606011e-14 -1.2723924588312603e-14 ;
	setAttr ".r" -type "double3" -1.5694865899230376e-15 -1.0493416408562895e-13 -0.55410349479806531 ;
	setAttr ".s" -type "double3" 0.99999392032623291 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 7.9452287741900012 ;
	setAttr ".bps" -type "matrix" -2.246151809671461e-16 0.14305458030966009 0.98970865801095986 0
		 4.3962501039883308e-17 0.98971467515330747 -0.14305545004012682 0 -1 5.5511151231257839e-17 -2.2204460492503131e-16 0
		 2.8659881970448636e-14 72.943480557747819 8.0827956660488667 1;
	setAttr ".radi" 1.5;
createNode joint -n "Spine_5" -p "Spine_4";
	rename -uid "F06A93DD-40FA-F39A-EB08-1E953A5E2088";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 16.630162148235136 -1.4210854715202001e-14 -6.233246874226218e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "___";
	setAttr ".jo" -type "double3" 0 0 -0.24626711815362801 ;
	setAttr ".pa" -type "double3" 0 -90 0 ;
	setAttr ".bps" -type "matrix" -2.248034295623026e-16 0.13880017776148645 0.99032040807678978 0
		 4.2996657362633284e-17 0.99032040807679 -0.13880017776148632 0 -1 5.5511151231257839e-17 -2.2204460492503131e-16 0
		 8.7256963832271993e-14 75.322501424345177 24.541811128283332 1;
	setAttr ".radi" 1.5;
createNode joint -n "joint80" -p "Spine_5";
	rename -uid "2210924A-453F-8DF5-AB13-41B71E16C01A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.7125719503023689 -0.0091546362596943709 -0.012294495601220935 ;
	setAttr ".r" -type "double3" -1.497214406168776e-06 -1.2622826350502279e-14 3.1805548463890798e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.9784236600801508 90 0 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0.012294495601307132 75.967541225644453 29.210037970338188 1;
	setAttr ".radi" 1.5;
createNode joint -n "Neck1" -p "joint80";
	rename -uid "F6BA9F21-43EA-94C8-33CE-E4BB585751B1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -0.012294495601315351 -0.88137337538407223 4.2377477140331727 ;
	setAttr ".r" -type "double3" -6.3682460571589169e-17 -1.1269083686296097e-15 0.18703664694140218 ;
	setAttr ".s" -type "double3" 0.99998772144317627 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000000057 -60.953155451078068 90.000000000000028 ;
	setAttr ".bps" -type "matrix" 0.00012458227326951797 0.48841627212194477 0.87259880133363132 0
		 -2.0659965407898722e-07 0.87260791012780559 -0.48842137052174617 0 -0.99999999223944536 6.0668998869445337e-05 0.00010881351876301792 0
		 7.1054273576009995e-15 75.08616796099831 33.447785707402808 1;
	setAttr ".radi" 1.1100627789013828;
createNode joint -n "Neck2" -p "Neck1";
	rename -uid "C6EE5564-4890-CB25-07A1-D38AE190AABE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 4.8885521667236844 -7.1054273576010003e-15 1.6163640849021638e-15 ;
	setAttr ".r" -type "double3" 2.4239615936979022e-16 -1.1718399023112213e-14 -0.37261458502608036 ;
	setAttr ".s" -type "double3" 0.99998772144317627 1 1 ;
	setAttr ".jo" -type "double3" 0 0 -0.61080496471463697 ;
	setAttr ".bps" -type "matrix" 0.00011262002812142805 0.47336552569607654 0.88085424724090233 0
		 1.893131414365749e-06 0.88086344084625745 -0.47337046652374476 0 -0.99999999365644043 5.4979141575788355e-05 9.8307747761805132e-05 0
		 0.00060902694193255336 77.473816386343145 37.713530468342825 1;
	setAttr ".radi" 1.1100627789013828;
createNode joint -n "Neck3" -p "Neck2";
	rename -uid "4223A4EA-4953-AB22-5060-F888DE100760";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 4.6601306773070661 0 2.5549468767604129e-15 ;
	setAttr ".r" -type "double3" 5.3739853821940646e-17 -1.4432212355503493e-14 -0.057584137864853079 ;
	setAttr ".s" -type "double3" 0.99998772144317627 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.3537344312528767 ;
	setAttr ".bps" -type "matrix" -0.00013345751858289046 0.43579106629659436 0.90003625882977545 0
		 6.5050905995819168e-06 0.90004565541224424 -0.4357956150894905 0 -0.99999999107320159 -5.2305929585947309e-05 -0.00012295400266154876 0
		 0.0011338509898578498 79.679761594219016 41.818426368146376 1;
	setAttr ".radi" 1.11;
createNode joint -n "Neck4" -p "Neck3";
	rename -uid "221881F8-46C3-3932-A6E1-F7A2F7329709";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 4.9826052703046306 0 4.0223863329213722e-15 ;
	setAttr ".r" -type "double3" -2.7918422430928208e-16 1.8123950443096971e-14 0.52546755060192329 ;
	setAttr ".s" -type "double3" 0.99998772144317627 1 1 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.5800846563129864 ;
	setAttr ".bps" -type "matrix" -0.00011382673233467573 0.40324797039621707 0.91507934076665565 0
		 1.6261411675667842e-06 0.91508889188929421 -0.40325217908670885 0 -0.99999999352028024 -4.4413292931447175e-05 -0.00010481840982611383 0
		 0.00046888485440093914 81.851136457900097 46.302951774856879 1;
	setAttr ".radi" 1.11;
createNode joint -n "Head" -p "Neck4";
	rename -uid "30724161-4C8C-507B-A85B-B387C03F060A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 4.1192859066414513 7.1054273576010003e-15 2.8400640062587032e-15 ;
	setAttr ".jo" -type "double3" 0 0 0.0010083048689236724 ;
	setAttr ".bps" -type "matrix" -0.00011382789101755272 0.40326828053553537 0.91508178921729399 0
		 1.6281443383438812e-06 0.91508179521907873 -0.40326828297794132 0 -0.99999999352028024 -4.4413292931447175e-05 -0.00010481840982611383 0
		 9.2820553760503133e-14 83.512230139235015 50.072425206735709 1;
	setAttr ".radi" 1.11;
createNode joint -n "Head_1" -p "Head";
	rename -uid "077BBE83-4F20-58B0-0E79-8E8D0695DB68";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 1.1141119787762932 -1.4210854715202001e-14 1.5777218104420236e-29 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jot" -type "string" "___";
	setAttr ".bps" -type "matrix" -0.00011382789101755272 0.40326828053553537 0.91508178921729399 0
		 1.6281443383438812e-06 0.91508179521907873 -0.40326828297794132 0 -0.99999999352028024 -4.4413292931447175e-05 -0.00010481840982611383 0
		 -0.00012681701680867738 83.961516161240155 51.091928789662745 1;
	setAttr ".radi" 1.2858171236329021;
createNode joint -n "Head_4" -p "Head_1";
	rename -uid "8D4174DE-4330-5174-04CA-25A6203CD562";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 12.023723181557596 -10.935185152798512 1.3723535217611468e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0.0097494186822492581 -0.044859645895893009 -42.436967821190855 ;
	setAttr ".bps" -type "matrix" -0.00086805432194880534 -0.31985754163774477 0.94746524977919522 0
		 -0.00024576642338950197 0.94746564636959429 0.31985745035611107 0 -0.99999959304019692 4.4798496465039483e-05 -0.00090106189323159425 0
		 -0.001513256128553232 78.80371347362626 66.504432252310863 1;
	setAttr ".radi" 1.2858171236329021;
createNode joint -n "Head_3" -p "Head_1";
	rename -uid "BF697229-4868-CB0A-41E0-A6A36FA49A31";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 15.432701195050763 2.0062854880124288 -1.463302009254219e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 23.01742707683956 90 0 ;
	setAttr ".bps" -type "matrix" 0.99999999352028024 4.4413292931472573e-05 0.00010481840982610263 0
		 -4.3009446658618899e-05 0.99991081255204739 -0.013355339445016157 0 -0.00010540221594263054 0.013355334850295608 0.99991080798309673 0
		 -0.0018802223241723296 92.020950362279379 64.405041307771342 1;
	setAttr ".radi" 1.11;
createNode joint -n "L_Front_Scapula" -p "joint80";
	rename -uid "939F38D5-4CDC-0DFC-C92B-A780B79F17A3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 9.9832785139309568 10.249830823940329 -0.68197511181308101 ;
	setAttr ".ro" 4;
	setAttr ".ra" -type "double3" -180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 89.999999999999673 -4.2394275106969683 -90.000000000000014 ;
	setAttr ".bps" -type "matrix" 0 -0.99726384104029986 0.073924497655024082 0 -5.7062061993673383e-15 -0.073924497655023957 -0.99726384104029986 0
		 1 -2.6850261621310906e-16 -5.6510301309672742e-15 0 9.9955730095322686 86.217372031763844 28.52806259068349 1;
	setAttr ".radi" 1.8219674885754134;
createNode joint -n "L_Front_Shoulder" -p "L_Front_Scapula";
	rename -uid "E6BD68EE-49DC-BE82-1E06-F0BCA66160E8";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 24.82363291573494 -7.1054273576010003e-15 -7.1054273576010003e-15 ;
	setAttr ".r" -type "double3" -0.07855345179444953 -0.012898110688597921 8.8417618867969147e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 24.067210298362568 ;
	setAttr ".bps" -type "matrix" -0.00022511566015496033 -0.94071644132093057 -0.33919393619494997 0
		 0.0013710229929271862 -0.3391939163389025 0.94071547633417318 0 -0.99999903480898045 -0.00025327290011195147 0.0013661017332727728 0
		 9.9955730095322615 61.461660521643594 30.363137183951924 1;
	setAttr ".radi" 1.3848822435970267;
createNode joint -n "L_Front_Knee" -p "L_Front_Shoulder";
	rename -uid "F9C213A5-411E-1109-E8FC-139522F70CEE";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 20.467142496475901 -5.1514348342607263e-14 1.7763568394002505e-14 ;
	setAttr ".r" -type "double3" 1.7145302334050646e-26 5.4785593003683101e-26 -1.6614491730056268e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 17.06695047196968 ;
	setAttr ".bps" -type "matrix" 0.00018717798116332237 -0.99883927546436058 -0.048167071264866912 0
		 0.0013767154793019674 -0.048166769070277893 0.99883835880077187 0 -0.99999903480898045 -0.00025327290011195147 0.0013661017332727728 0
		 9.9909655352376632 42.207883068350412 23.420806557909277 1;
	setAttr ".radi" 1.8043337729754796;
createNode joint -n "L_Front_Fetlock" -p "L_Front_Knee";
	rename -uid "6DCC4A73-4EEC-3102-D068-8C8E3CF3AFF7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 24.615471680368177 3.5527136788005001e-15 2.5401902803423582e-13 ;
	setAttr ".r" -type "double3" 0.076527328462741684 -0.021914431613991054 -1.4634247464734598e-05 ;
	setAttr ".ra" -type "double3" -180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 8.2380269346501187 ;
	setAttr ".bps" -type "matrix" 2.9399819437129528e-08 -0.99543426641082411 0.095449574410491594 0
		 -3.3019418041371068e-08 -0.095449574410492483 -0.99543426641082344 0 0.99999999999999911 2.6113898447940528e-08 -3.5674860389151714e-08 0
		 9.995573009531924 17.620983169917977 22.235151379262675 1;
	setAttr ".radi" 1.0879537987860608;
createNode joint -n "L_Front_Ankle" -p "L_Front_Fetlock";
	rename -uid "DC5028C0-4814-12BF-5EBB-0780F148C948";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.186925866795828 2.1316282072803006e-14 3.5527136788005001e-15 ;
	setAttr ".r" -type "double3" -7.6287049278949721e-07 -8.7685917693371938e-22 -1.0230023593063171e-21 ;
	setAttr ".ra" -type "double3" -180 0 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 -84.522803883831457 ;
	setAttr ".bps" -type "matrix" 3.5674860428343875e-08 8.3266726846886741e-17 0.999999999999999 0
		 2.6113898294678718e-08 -0.99999999999999978 -7.2164496600635175e-16 0 0.99999999999999911 2.6113898447940528e-08 -3.5674860389151714e-08 0
		 9.9955734560248057 2.503396760668501 23.684736989852002 1;
	setAttr ".radi" 0.98399223779836853;
createNode joint -n "L_Front_Ball" -p "L_Front_Ankle";
	rename -uid "5646A759-4E7C-EE23-CA71-80B90E6EFC46";
	setAttr ".t" -type "double3" 5.3753630101478862 -3.2393315687606616e-06 -3.6285843982852839e-06 ;
	setAttr ".bps" -type "matrix" 3.5674860428343875e-08 8.3266726846886741e-17 0.999999999999999 0
		 2.6113898294678718e-08 -0.99999999999999978 -7.2164496600635175e-16 0 0.99999999999999911 2.6113898447940528e-08 -3.5674860389151714e-08 0
		 9.9955700192056476 2.5033999999999756 29.060100000000013 1;
	setAttr ".radi" 0.98399223779836853;
createNode joint -n "L_Front_Toe" -p "L_Front_Ball";
	rename -uid "C1839CB4-4C84-9A5C-2294-E98B762F5DAC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 3.8972563359170032 3.2393315581025206e-06 3.628584385850786e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -180 0 90.000000000000028 ;
	setAttr ".bps" -type "matrix" 2.6113898294678701e-08 -0.99999999999999978 -1.165734175856414e-15 0
		 3.567486030587921e-08 -3.60822486201206e-16 0.999999999999999 0 -0.99999999999999911 -2.6113898447940528e-08 3.5674860266687035e-08 0
		 9.9955737868241936 2.5033967606685126 32.957356335916884 1;
	setAttr ".radi" 0.98399223779836853;
createNode joint -n "L_Front_Knee1" -p "L_Front_Knee";
	rename -uid "69DF5059-4F80-E01B-D427-3B8AD9136C05";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.1538679200920257 1.4210854715202004e-14 6.2172489379008766e-14 ;
	setAttr ".r" -type "double3" 1.7145302334050646e-26 5.4785593003683101e-26 -1.6614491730056268e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.3295078233375367e-18 7.9513867036587919e-16 ;
	setAttr ".bps" -type "matrix" 0.00018717798116321753 -0.9988392754643608 -0.048167071264867058 0
		 0.0013767154793019639 -0.048166769070277893 0.99883835880077187 0 -0.99999903480898056 -0.00025327290011119166 0.0013661017332727791 0
		 9.9921174038112337 36.061158093742314 23.124392763247634 1;
	setAttr ".radi" 1.8043337729754796;
createNode joint -n "L_Front_Knee2" -p "L_Front_Knee";
	rename -uid "7A0130A6-4C48-3E6D-90A6-B894A681B120";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 12.30773584018408 7.1054273576010019e-15 1.2967404927621828e-13 ;
	setAttr ".r" -type "double3" 1.7145302334050646e-26 5.4785593003683101e-26 -1.6614491730056268e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.3295078233375367e-18 7.9513867036587919e-16 ;
	setAttr ".bps" -type "matrix" 0.00018717798116321753 -0.9988392754643608 -0.048167071264867058 0
		 0.0013767154793019639 -0.048166769070277893 0.99883835880077187 0 -0.99999903480898056 -0.00025327290011119166 0.0013661017332727791 0
		 9.9932692723847953 29.914433119134202 22.827978968585974 1;
	setAttr ".radi" 1.8043337729754796;
createNode joint -n "L_Front_Knee3" -p "L_Front_Knee";
	rename -uid "7AD91CB7-4439-7870-D615-FF86082C06C7";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 18.461603760276127 1.0658141036401503e-14 1.900701818158268e-13 ;
	setAttr ".r" -type "double3" 1.7145302334050646e-26 5.4785593003683101e-26 -1.6614491730056268e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 -2.3295078233375367e-18 7.9513867036587919e-16 ;
	setAttr ".bps" -type "matrix" 0.00018717798116321753 -0.9988392754643608 -0.048167071264867058 0
		 0.0013767154793019639 -0.048166769070277893 0.99883835880077187 0 -0.99999903480898056 -0.00025327290011119166 0.0013661017332727791 0
		 9.9944211409583623 23.767708144526086 22.531565173924328 1;
	setAttr ".radi" 1.8043337729754796;
createNode joint -n "R_Front_Scapula" -p "joint80";
	rename -uid "36E1F507-4B4C-172C-F562-F2B86D317F14";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -10.007864495601313 10.249858792175502 -0.68193770249582997 ;
	setAttr ".ro" 4;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -90.000000000000341 4.2394275106969532 89.999999999999588 ;
	setAttr ".bps" -type "matrix" 7.1054273576010019e-15 0.99726384104029975 -0.073924497655023791 0
		 5.6621374255882984e-15 -0.073924497655023735 -0.99726384104029975 0 -1 6.5503158452884236e-15 -5.9952043329758453e-15 0
		 -9.9955699999999901 86.217400000000012 28.528100000000009 1;
	setAttr ".radi" 1.8219674885754134;
createNode joint -n "R_Front_Shoulder" -p "R_Front_Scapula";
	rename -uid "C729F111-415B-E0AE-8334-AD97232825F3";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -24.823615922838322 7.353828951295327e-05 -1.758593271006248e-13 ;
	setAttr ".r" -type "double3" -0.0785456927541794 -0.012896996787644541 8.8401250373025487e-06 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -24.067210298362568 ;
	setAttr ".bps" -type "matrix" 4.1786714107987677e-15 0.9407164128130685 0.33919408996047118 0
		 -2.178896861321344e-08 0.33919408996047112 -0.94071641281306828 0 -0.99999999999999978 -7.3906855660906916e-09 2.0497241986805069e-08 0
		 -9.9955699999999901 61.461700000000008 30.363100000000017 1;
	setAttr ".radi" 1.3848822435970267;
createNode joint -n "R_Front_Knee" -p "R_Front_Shoulder";
	rename -uid "8717B7AA-4D49-3AAC-53AE-92891F80EA2F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -20.467152799752846 -3.9616608740189449e-05 -7.460698725481052e-14 ;
	setAttr ".r" -type "double3" -7.8584486067406143e-28 -9.8698240165039387e-28 1.2662440396130448e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 17.06695047196968 ;
	setAttr ".bps" -type "matrix" -6.3948175878572294e-09 0.99883929916792691 0.048166943412723318 0
		 -2.082943737227796e-08 0.048166943412723207 -0.99883929916792669 0 -0.99999999999999978 -7.3906855660906916e-09 2.0497241986805069e-08 0
		 -9.9955699999991374 42.207900000000009 23.420800000000003 1;
	setAttr ".radi" 1.8043337729754796;
createNode joint -n "R_Front_Fetlock" -p "R_Front_Knee";
	rename -uid "B3D8D01E-45AF-5774-AC6F-468BD7A6330C";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -24.615468692822034 -5.1947900779225606e-05 -1.5276668818842149e-13 ;
	setAttr ".r" -type "double3" 0.076521524008646896 -0.021913806625408254 -1.4633522509850666e-05 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 8.2380269346501187 ;
	setAttr ".bps" -type "matrix" -9.313394555552878e-09 0.99543426641082422 -0.095449574410492982 0
		 -1.9698219083973453e-08 -0.095449574410493121 -0.995434266410824 0 -0.99999999999999978 -7.3906855660906916e-09 2.0497241986805069e-08 0
		 -9.9955698425864696 17.621000000000006 22.235199999999988 1;
	setAttr ".radi" 1.0879537987860608;
createNode joint -n "R_Front_Ankle" -p "R_Front_Fetlock";
	rename -uid "B71D2426-429A-531E-3830-82BF21CD4C89";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -15.186931224000285 8.6516945572157056e-05 -1.06581410364015e-13 ;
	setAttr ".r" -type "double3" -6.2847760505719089e-12 2.4079297122785194e-27 -3.8526875396490255e-26 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 84.522803883831457 ;
	setAttr ".bps" -type "matrix" -2.0497241810099332e-08 -7.2164496600635175e-16 -0.99999999999999967 0
		 7.3906854489914382e-09 -0.99999999999999989 5.9674487573602164e-16 0 -0.99999999999999978 -7.3906855660906916e-09 2.0497241986805069e-08 0
		 -9.9955697011461844 2.5034000000000063 23.684699999999996 1;
	setAttr ".radi" 0.98399223779836853;
createNode joint -n "R_Front_Ball" -p "R_Front_Ankle";
	rename -uid "E2502B4A-49DE-276D-7E6C-AF8A97B6E963";
	setAttr ".t" -type "double3" -5.3389000000000131 -3.1086244689504383e-14 -1.7497114868092467e-12 ;
	setAttr ".bps" -type "matrix" -2.0497241810099332e-08 -7.2164496600635175e-16 -0.99999999999999967 0
		 7.3906854489914382e-09 -0.99999999999999989 5.9674487573602164e-16 0 -0.99999999999999978 -7.3906855660906916e-09 2.0497241986805069e-08 0
		 -9.9955695917117104 2.5034000000000414 29.023600000000009 1;
	setAttr ".radi" 0.98399223779836853;
createNode joint -n "R_Front_Toe" -p "R_Front_Ball";
	rename -uid "6664AC52-41FF-8648-DE03-13B84F602067";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.9337999999999802 3.4638958368304884e-14 1.6928680679484387e-12 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -90.000000000000028 ;
	setAttr ".bps" -type "matrix" -7.3906854489914291e-09 0.99999999999999989 -1.5265566588595917e-16 0
		 -2.0497241810099335e-08 -2.7755575615628918e-16 -0.99999999999999967 0 -0.99999999999999978 -7.3906855660906916e-09 2.0497241986805069e-08 0
		 -9.9955695110813529 2.5034000000000094 32.957399999999993 1;
	setAttr ".radi" 0.98399223779836853;
createNode joint -n "joint26" -p "Hip_joint";
	rename -uid "9138D091-44ED-35FC-14F8-05896F979E1B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -12.252151871605648 3.9052238167117395 5.3290705182007514e-15 ;
	setAttr ".r" -type "double3" -1.9142267189973727e-50 -1.1034765745125397e-32 1.987846675914698e-16 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 180 0 178.85244880144305 ;
	setAttr ".bps" -type "matrix" 0 -0.44254844318862974 -0.89674459877454527 0 8.3266726846886741e-17 0.89674459877454527 -0.44254844318862974 0
		 1 -8.3266726846886741e-17 0 0 7.1054273576010034e-15 78.653079457587495 -57.241039402905116 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint39" -p "joint26";
	rename -uid "48A78F25-4058-D68C-462C-AAA1CDCDCA20";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.0620799472401572 0 -1.4199496293978212e-29 ;
	setAttr ".r" -type "double3" 0 0 -3.0215269473903409e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 26.266595232926758 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 7.1054273576009892e-15 76.855412300828618 -60.883687655383113 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint40" -p "joint39";
	rename -uid "0572EFE8-4453-B085-6ADA-3784AEB0C459";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.267652545312977 0 -1.1604957799729344e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 6.1021926975875278e-15 76.855412300828647 -65.151340200696097 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint41" -p "joint40";
	rename -uid "A6DE7164-4A8C-92AA-ABB8-D79D17EC8FF9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.4648012924626954 0 -4.0314442777803252e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 2.3089735050908447e-15 76.855412300828675 -71.616141493158793 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint42" -p "joint41";
	rename -uid "77021FC7-4717-71F4-BD24-41A79DA6BE31";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.3575073643759614 0 -4.4278854118846474e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -1.847790995251323e-15 76.855412300828718 -78.973648857534755 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint43" -p "joint42";
	rename -uid "485EC4C3-420C-B839-9CB7-04A8365BBDFA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.0264628591915237 2.8421709430404001e-14 -4.2808721191520716e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -5.8697410473284433e-15 76.855412300828789 -86.000111716726281 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint44" -p "joint43";
	rename -uid "28A3D066-4BFD-8FE5-CE6E-6F9A0944BF5A";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.2126753933577561 -2.8421709430404001e-14 -4.3635670963141497e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -9.9675242265546594e-15 76.855412300828803 -93.212787110084037 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint45" -p "joint44";
	rename -uid "077330AB-4817-F4FE-AF1B-10884D5C9C80";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.0471531407655572 2.8421709430404001e-14 -4.2900604499478595e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -1.3997900181648347e-14 76.855412300828874 -100.2599402508496 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint46" -p "joint45";
	rename -uid "027C4B7E-47DE-78B8-B407-A881FD6236A0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.6057907432642784 -1.4210854715202001e-14 -4.5381453814340874e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -1.8255775518189308e-14 76.855412300828903 -107.86573099411387 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint47" -p "joint46";
	rename -uid "B39023BA-45DF-1C01-4715-F78B7A205EFD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.7506227142824988 -1.4210854715202001e-14 -4.6024636970045519e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -2.2572632175846188e-14 76.855412300828931 -115.61635370839637 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint48" -p "joint47";
	rename -uid "8A5AFBD5-4D8A-6938-EF0E-B5BB5D27916F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.7920032774305366 0 -4.6208403585961276e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -2.6906340639536202e-14 76.855412300828974 -123.40835698582691 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint49" -p "joint48";
	rename -uid "390955F1-4865-EBEC-677E-918159183446";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 8.6403048219657563 -7.1054273576010019e-14 -4.9975619212233982e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -3.1585511126905444e-14 76.855412300828945 -132.04866180779266 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint50" -p "joint49";
	rename -uid "CCA4932E-48C2-83A3-7DD3-019C2588250D";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.6678615879863781 9.9475983006414013e-14 -4.5657103738214131e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -3.5868664172496059e-14 76.855412300829087 -139.71652339577903 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint51" -p "joint50";
	rename -uid "D3929D3E-4344-5C42-9818-EE8642835B77";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.6126572277109403 -4.2632564145606011e-14 -4.0971055032363705e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -3.9722096164241896e-14 76.855412300829087 -146.32918062348998 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "joint52" -p "joint51";
	rename -uid "A77A949C-463D-EFEA-7EFE-2582995DFEA1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.688461041326291 -1.4210854715202001e-14 -3.2425907392282704e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 3.6849560335503014e-17 5.440092820663267e-15 -1 0 7.4668987557580903e-17 1 5.440092820663267e-15 0
		 1 -8.3266726846886741e-17 0 0 -4.279191917544716e-14 76.855412300829101 -151.01764166481627 1;
	setAttr ".radi" 0.93007731946289296;
createNode joint -n "L_Back_Hip" -p "Hip_joint";
	rename -uid "E99D8393-4B19-875F-E238-B2BE9EA931F4";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -5.2171979837778011 -5.4075953349514947 -9.9602200000000085 ;
	setAttr ".r" -type "double3" 7.4946175435682703e-15 -2.6023748650120558e-14 9.5416640443905497e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -131.65918150312424 ;
	setAttr ".bps" -type "matrix" 0 -0.96925223632062962 -0.24606930403335253 0 -9.9920072216264089e-16 -0.24606930403335259 0.96925223632062962 0
		 -1 2.2204460492503131e-16 -1.1102230246251565e-15 0 9.9602200000000209 73.625100000000032 -46.708299999999952 1;
	setAttr ".radi" 2;
createNode joint -n "L_Back_Knee" -p "L_Back_Hip";
	rename -uid "15E6A1A0-47C0-677A-75B9-B8B552FB76FA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 30.538628139883308 2.1316282072803006e-14 -1.7763568394002505e-15 ;
	setAttr ".r" -type "double3" 0 0 4.5163876476781927e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -29.461247535969068 ;
	setAttr ".bps" -type "matrix" 4.9144166276397865e-16 -0.72289138479508097 -0.69096168185294482 0
		 -8.6999262943436413e-16 -0.69096168185294482 0.72289138479508108 0 -1 2.2204460492503131e-16 -1.1102230246251565e-15 0
		 9.9602200000000245 44.025466381254049 -54.222918972514385 1;
	setAttr ".radi" 1.5468631347911834;
createNode joint -n "L_Back_Fetlock" -p "L_Back_Knee";
	rename -uid "31F62042-4F70-DAA2-2065-8BA2A515BDD0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 26.792775219951405 2.1316282072803006e-13 1.5987211554602254e-14 ;
	setAttr ".r" -type "double3" 1.5453816111340122e-14 -1.2876982987798972e-14 -5.915831707522141e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 42.73600566004729 ;
	setAttr ".bps" -type "matrix" -2.2943744622549621e-16 -0.99985661431772543 -0.016933717993842912 0
		 -9.7250220639331485e-16 -0.016933717993842967 0.99985661431772554 0 -1 2.2204460492503131e-16 -1.1102230246251565e-15 0
		 9.9602200000000281 24.657200000000003 -72.735699999999909 1;
	setAttr ".radi" 1.6206336545935147;
createNode joint -n "L_Back_Ankle" -p "L_Back_Fetlock";
	rename -uid "4A35B1B9-412B-AB6B-D2D8-3BB58F834E22";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 22.156976993263296 -8.5265128291212022e-14 1.2434497875801753e-14 ;
	setAttr ".r" -type "double3" 1.0906459355872573e-15 -1.3760063085760322e-14 1.2722218725854067e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999999999997 0 90.970276947562553 ;
	setAttr ".bps" -type "matrix" -9.6847753448932829e-16 -1.8353374375834619e-15 1 0
		 -8.1242651605698053e-16 -1 -1.7763568394002513e-15 0 1 -7.8859849468982927e-16 1.1102230246251556e-15 0
		 9.9602200000000085 2.5034000000000241 -73.110899999999972 1;
	setAttr ".radi" 1.0174745112814572;
createNode joint -n "L_Back_Ball" -p "L_Back_Ankle";
	rename -uid "30656581-49F9-6E2E-B19F-B1B0CC0566CE";
	setAttr ".t" -type "double3" 5.3081999999999852 2.6201263381153694e-14 5.3290705182007514e-15 ;
	setAttr ".bps" -type "matrix" -9.6847753448932829e-16 -1.8353374375834619e-15 1 0
		 -8.1242651605698053e-16 -1 -1.7763568394002513e-15 0 1 -7.8859849468982927e-16 1.1102230246251556e-15 0
		 9.9602200000000085 2.5033999999999881 -67.802699999999987 1;
	setAttr ".radi" 1.0174745112814572;
createNode joint -n "L_Back_Toe" -p "L_Back_Ball";
	rename -uid "2B83CD68-48D3-13DF-4BB9-75882A4928EA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 4.1470000000000304 -2.7977620220553945e-14 -8.8817841970012555e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" -179.99999829245269 0 0 ;
	setAttr ".bps" -type "matrix" -9.6847753448932829e-16 -1.8353374375834619e-15 1 0
		 -2.9802322141822678e-08 0.99999999999999956 1.7763568063130254e-15 0 -0.99999999999999956 -2.9802322165650701e-08 -1.1102230775647153e-15 0
		 9.9602199999999961 2.5034000000000085 -63.655699999999953 1;
	setAttr ".radi" 1.0174745112814572;
createNode joint -n "L_Back_Fetlock1" -p "L_Back_Fetlock";
	rename -uid "CBAD6AC8-4170-4D0D-5CCE-7F89F2BADBA1";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.3856592178642231 -1.4210854715202004e-14 0 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.1805546814635176e-15 ;
	setAttr ".bps" -type "matrix" -1.1319505966139698e-16 -0.99985661431772521 -0.016933717993843442 0
		 -9.9868665409519989e-16 -0.01693371799384303 0.99985661431772554 0 -0.99999999999999989 5.6423199445986293e-16 -2.119633635277998e-15 0
		 9.9602200000000227 17.272599779921777 -72.860766670393872 1;
	setAttr ".radi" 1.6206336545935147;
createNode joint -n "L_Back_Fetlock2" -p "L_Back_Fetlock";
	rename -uid "B1B1D052-487F-2FC3-FA2C-219C5F7ACB37";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 14.771318435728446 -2.8421709430404007e-14 7.1054273576010019e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.1805546814635176e-15 ;
	setAttr ".bps" -type "matrix" -1.1319505966139698e-16 -0.99985661431772521 -0.016933717993843442 0
		 -9.9868665409519989e-16 -0.01693371799384303 0.99985661431772554 0 -0.99999999999999989 5.6423199445986293e-16 -2.119633635277998e-15 0
		 9.9602200000000174 9.8879995598435535 -72.985833340787806 1;
	setAttr ".radi" 1.6206336545935147;
createNode joint -n "L_Back_Knee1" -p "L_Back_Knee";
	rename -uid "38D47527-434B-13B3-9932-E3BAC85EF42E";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 6.6981938049878567 2.8421709430404007e-14 -5.3290705182007514e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.180554681463516e-15 ;
	setAttr ".bps" -type "matrix" 7.6857858083015227e-16 -0.72289138479507986 -0.69096168185294582 0
		 -8.5273153496143404e-16 -0.69096168185294404 0.72289138479508042 0 -1 2.2204460492503072e-16 -1.1102230246251559e-15 0
		 9.9602200000000209 39.183399785940495 -58.851114229385729 1;
	setAttr ".radi" 1.5468631347911834;
createNode joint -n "L_Back_Knee2" -p "L_Back_Knee";
	rename -uid "DEA8EC90-4DEB-30A5-CFCF-599D47915EBD";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 13.396387609975712 5.6843418860808015e-14 3.5527136788005009e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.180554681463516e-15 ;
	setAttr ".bps" -type "matrix" 7.6857858083015227e-16 -0.72289138479507986 -0.69096168185294582 0
		 -8.5273153496143404e-16 -0.69096168185294404 0.72289138479508042 0 -1 2.2204460492503072e-16 -1.1102230246251559e-15 0
		 9.9602200000000174 34.341333190626983 -63.47930948625708 1;
	setAttr ".radi" 1.5468631347911834;
createNode joint -n "L_Back_Knee3" -p "L_Back_Knee";
	rename -uid "DCE1CFCF-4058-E184-2205-6190CB8A9415";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 20.094581414963567 1.4210854715202004e-13 1.0658141036401503e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -3.180554681463516e-15 ;
	setAttr ".bps" -type "matrix" 7.6857858083015227e-16 -0.72289138479507986 -0.69096168185294582 0
		 -8.5273153496143404e-16 -0.69096168185294404 0.72289138479508042 0 -1 2.2204460492503072e-16 -1.1102230246251559e-15 0
		 9.9602200000000156 29.499266595313429 -68.107504743128416 1;
	setAttr ".radi" 1.5468631347911834;
createNode joint -n "L_Back_Hip1" -p "L_Back_Hip";
	rename -uid "EEF33A00-4282-056B-2B87-C39C19D6AC6B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 7.6346570349708074 2.1316282072803006e-14 1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -4.7708320221952752e-15 ;
	setAttr ".bps" -type "matrix" 5.4657729351443762e-17 -0.96925223632062951 -0.24606930403335267 0
		 -9.9237092698785772e-16 -0.2460693040333525 0.9692522363206294 0 -1 -7.9970891020408318e-16 -4.6201514836141998e-16 0
		 9.9602200000000227 66.225191595313518 -48.586954743128551 1;
	setAttr ".radi" 2;
createNode joint -n "L_Back_Hip2" -p "L_Back_Hip";
	rename -uid "DC1CC501-4A2C-8264-2204-3FA9A3E0D7F9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 15.269314069941629 0 -1.7763568394002505e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -4.7708320221952752e-15 ;
	setAttr ".bps" -type "matrix" 5.4657729351443762e-17 -0.96925223632062951 -0.24606930403335267 0
		 -9.9237092698785772e-16 -0.2460693040333525 0.9692522363206294 0 -1 -7.9970891020408318e-16 -4.6201514836141998e-16 0
		 9.9602200000000281 58.825283190627033 -50.465609486257186 1;
	setAttr ".radi" 2;
createNode joint -n "L_Back_Hip3" -p "L_Back_Hip";
	rename -uid "FEEC2119-4809-8DCB-844C-87A165AB82B6";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" 22.903971104912472 -1.4210854715202004e-14 -5.3290705182007514e-15 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -4.7708320221952752e-15 ;
	setAttr ".bps" -type "matrix" 5.4657729351443762e-17 -0.96925223632062951 -0.24606930403335267 0
		 -9.9237092698785772e-16 -0.2460693040333525 0.9692522363206294 0 -1 -7.9970891020408318e-16 -4.6201514836141998e-16 0
		 9.9602200000000281 51.425374785940534 -52.3442642293858 1;
	setAttr ".radi" 2;
createNode joint -n "R_Back_Hip" -p "Hip_joint";
	rename -uid "0D7531F5-49E6-B5A3-4009-23BDFB38FDE9";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -5.2171979837778295 -5.4075953349505141 9.9602199999999979 ;
	setAttr ".r" -type "double3" 1.3631454401431612e-14 -3.3347096458723218e-15 8.5937606680058725e-30 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 7.9513867036587897e-14 6.361109362927032e-15 48.340818496875755 ;
	setAttr ".bps" -type "matrix" 1.1102230246251565e-16 0.96925223632062951 0.24606930403335259 0
		 -1.3877787807814457e-15 0.24606930403335259 -0.96925223632062951 0 -1 -2.7755575615628914e-16 1.3322676295501878e-15 0
		 -9.9602199999999854 73.625100000000018 -46.708299999999987 1;
	setAttr ".radi" 2;
createNode joint -n "R_Back_Knee" -p "R_Back_Hip";
	rename -uid "CE9A1E55-44A4-CB6C-08EB-4FB40E5FF3BA";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -30.538590886285164 -1.0116610617671995e-05 -1.0658141036401503e-14 ;
	setAttr ".r" -type "double3" -8.8148750918139262e-28 -1.0237894915014155e-26 9.4968159434526405e-13 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -29.461247535969061 ;
	setAttr ".bps" -type "matrix" 7.7922371266489953e-16 0.72289138479508119 0.69096168185294471 0
		 -1.1537184672406194e-15 0.69096168185294471 -0.72289138479508119 0 -1 -2.7755575615628914e-16 1.3322676295501878e-15 0
		 -9.9602199999999783 44.025499999999994 -54.222899999999996 1;
	setAttr ".radi" 1.5468631347911834;
createNode joint -n "R_Back_Fetlock" -p "R_Back_Knee";
	rename -uid "3352DFE1-45BD-3939-E5C1-E5B558EB157F";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -26.792812631933728 -9.5141980267499076e-06 -2.4868995751603503e-14 ;
	setAttr ".r" -type "double3" 7.6333312355124402e-14 -2.4479007495892199e-28 -1.6306294645146789e-43 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 42.73600566004729 ;
	setAttr ".bps" -type "matrix" -2.1060731904726554e-16 0.99985661431772566 0.016933717993842745 0
		 -1.3761905584602146e-15 0.016933717993842745 -0.99985661431772566 0 -1 -2.7755575615628914e-16 1.3322676295501878e-15 0
		 -9.9602199999999748 24.657200000000003 -72.735699999999966 1;
	setAttr ".radi" 1.6206336545935147;
createNode joint -n "R_Back_Ankle" -p "R_Back_Fetlock";
	rename -uid "4005B0A5-4D49-3913-E319-04A8706A2B90";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -22.156976993263306 7.1054273576010019e-14 0 ;
	setAttr ".r" -type "double3" 8.5377362080715644e-07 -1.4435928985827843e-21 1.1227944594134171e-21 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999914622637 0 90.970276947562553 ;
	setAttr ".bps" -type "matrix" -1.3724268683170456e-15 1.609823385706477e-15 -1.0000000000000002 0
		 -1.4901161106104273e-08 1.0000000000000002 1.7208457080213269e-15 0 1 1.4901161149778885e-08 -1.332267606078938e-15 0
		 -9.9602199999999694 2.5034000000000134 -73.110900000000015 1;
	setAttr ".radi" 1.0174745112814572;
createNode joint -n "R_Back_Ball" -p "R_Back_Ankle";
	rename -uid "44949F7F-4DD3-CB53-B193-B59971034E93";
	setAttr ".t" -type "double3" -5.624500000000026 -4.4853010194856324e-14 -4.4408920985006262e-14 ;
	setAttr ".bps" -type "matrix" -1.3724268683170456e-15 1.609823385706477e-15 -1.0000000000000002 0
		 -1.4901161106104273e-08 1.0000000000000002 1.7208457080213269e-15 0 1 1.4901161149778885e-08 -1.332267606078938e-15 0
		 -9.9602200000000067 2.5033999999999597 -67.486399999999989 1;
	setAttr ".radi" 1.0174745112814572;
createNode joint -n "R_Back_Toe" -p "R_Back_Ball";
	rename -uid "A6F477D9-451C-D734-433F-D3972C5D8586";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -3.8306999999999931 6.0840221749458578e-14 3.1974423109204508e-14 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 179.99999704244132 0 0 ;
	setAttr ".bps" -type "matrix" -1.3724268683170456e-15 1.609823385706477e-15 -1.0000000000000002 0
		 6.6520297749310804e-08 -0.99999999999999811 -1.7208457767918282e-15 0 -0.99999999999999789 -6.6520297792985437e-08 1.3322675172503665e-15 0
		 -9.9602199999999694 2.5034000000000143 -63.655699999999996 1;
	setAttr ".radi" 1.0174745112814572;
createNode joint -n "R_Back_Fetlock1" -p "R_Back_Fetlock";
	rename -uid "7235D146-4D11-C7BF-5203-8CB727D2ECD0";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -7.3856592178642373 1.4210854715202004e-14 1.7763568394002505e-15 ;
	setAttr ".r" -type "double3" 7.6333312355124402e-14 -2.4479007495892199e-28 -1.6306294645146789e-43 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.9817700138720468e-15 ;
	setAttr ".bps" -type "matrix" -2.4501887103057596e-16 0.9998566143177261 0.016933717993842655 2.7105054312137111e-20
		 -1.3890566071205135e-15 0.016933717993842752 -0.99985661431772577 -1.7347234759768071e-18
		 -1 -2.7755575615628904e-16 1.3322676295501875e-15 3.0814879110195774e-33 -9.9602199999999765 17.272599779921766 -72.860766670393915 0.99999999999999989;
	setAttr ".radi" 1.6206336545935147;
createNode joint -n "R_Back_Fetlock2" -p "R_Back_Fetlock";
	rename -uid "50154EA4-4D20-440F-DBBD-B6A0364AE4EC";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -14.771318435728457 2.8421709430404007e-14 1.7763568394002505e-15 ;
	setAttr ".r" -type "double3" 7.6333312355124402e-14 -2.4479007495892199e-28 -1.6306294645146789e-43 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".jo" -type "double3" 0 0 -2.9817700138720468e-15 ;
	setAttr ".bps" -type "matrix" -2.4501887103057596e-16 0.9998566143177261 0.016933717993842655 2.7105054312137111e-20
		 -1.3890566071205135e-15 0.016933717993842752 -0.99985661431772577 -1.7347234759768071e-18
		 -1 -2.7755575615628904e-16 1.3322676295501875e-15 3.0814879110195774e-33 -9.9602199999999748 9.8879995598435464 -72.985833340787877 0.99999999999999989;
	setAttr ".radi" 1.6206336545935147;
createNode joint -n "R_Back_Hip1" -p "R_Back_Hip";
	rename -uid "5A7F1F2D-417E-B5CF-90C9-2C869B586373";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -7.6346477215712909 -2.5291526455362145e-06 -3.5527136788005009e-15 ;
	setAttr ".r" -type "double3" 1.3631454401431612e-14 -3.3347096458723218e-15 8.5937606680058725e-30 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 7.6541188412933112e-17 0.9692522363206294 0.2460693040333525 0
		 -1.3894862295751411e-15 0.24606930403335237 -0.96925223632062918 0 -1 -2.7755575615628914e-16 1.332267629550188e-15 0
		 -9.9602199999999854 66.225200000000015 -48.586950000000016 1;
	setAttr ".radi" 2;
createNode joint -n "R_Back_Hip2" -p "R_Back_Hip";
	rename -uid "4BB623D1-4B3C-1F55-D835-879125F9472B";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -15.269295443142582 -5.0583053052832838e-06 -5.3290705182007514e-15 ;
	setAttr ".r" -type "double3" 1.3631454401431612e-14 -3.3347096458723218e-15 8.5937606680058725e-30 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 7.6541188412933112e-17 0.9692522363206294 0.2460693040333525 0
		 -1.3894862295751411e-15 0.24606930403335237 -0.96925223632062918 0 -1 -2.7755575615628914e-16 1.332267629550188e-15 0
		 -9.9602199999999854 58.82530000000002 -50.465600000000016 1;
	setAttr ".radi" 2;
createNode joint -n "R_Back_Hip3" -p "R_Back_Hip";
	rename -uid "B8E6B32A-4FAF-1B5C-A21F-E68982326056";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".t" -type "double3" -22.90394316471388 -7.5874579650303531e-06 -7.1054273576010019e-15 ;
	setAttr ".r" -type "double3" 1.3631454401431612e-14 -3.3347096458723218e-15 8.5937606680058725e-30 ;
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 7.6541188412933112e-17 0.9692522363206294 0.2460693040333525 0
		 -1.3894862295751411e-15 0.24606930403335237 -0.96925223632062918 0 -1 -2.7755575615628914e-16 1.332267629550188e-15 0
		 -9.9602199999999836 51.425400000000003 -52.344250000000009 1;
	setAttr ".radi" 2;
createNode transform -n "Cheetah_Mesh";
	rename -uid "1192B629-4DC3-3CBC-D6A0-C8A4E24E3CBD";
	setAttr ".rp" -type "double3" 0 48.818378090858452 -38.635978698730462 ;
	setAttr ".sp" -type "double3" 0 48.818378090858452 -38.635978698730462 ;
createNode transform -n "polySurface20" -p "Cheetah_Mesh";
	rename -uid "F14999AD-41E8-07C0-8164-E7A8BBC2A5F4";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 0 48.818378090858452 -38.635978698730462 ;
	setAttr ".sp" -type "double3" 0 48.818378090858452 -38.635978698730462 ;
createNode mesh -n "polySurfaceShape20" -p "polySurface20";
	rename -uid "D9240F4C-46AD-9D53-F3C2-F291A3959B7A";
	addAttr -ci true -h true -sn "sref" -ln "surfaceReference" -min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "reff" -ln "referenceFile" -dt "string";
	addAttr -ci true -h true -sn "fns" -ln "furNameSpace" -dt "string";
	addAttr -ci true -sn "mso" -ln "miShadingSamplesOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "msh" -ln "miShadingSamples" -min 0 -smx 8 -at "float";
	addAttr -ci true -sn "mdo" -ln "miMaxDisplaceOverride" -min 0 -max 1 -at "bool";
	addAttr -ci true -sn "mmd" -ln "miMaxDisplace" -min 0 -smx 1 -at "float";
	setAttr -k off ".v";
	setAttr -s 6 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".lev" 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".vcs" 2;
createNode mesh -n "polySurfaceShape20Orig" -p "polySurface20";
	rename -uid "89BC3FE1-4C55-0346-775F-56BE0D686F69";
	addAttr -ci true -h true -sn "sref" -ln "surfaceReference" -min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "reff" -ln "referenceFile" -dt "string";
	addAttr -ci true -h true -sn "fns" -ln "furNameSpace" -dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 4758 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0.3218151 0.92832255 0.32260367
		 0.9267925 0.32371134 0.92711592 0.32315838 0.92906326 0.9688673 0.85639125 0.97051328
		 0.85535085 0.97135949 0.85613537 0.96973759 0.85765445 0.61610687 0.98269773 0.61646581
		 0.98045635 0.61754274 0.98057282 0.61754274 0.98298299 0.61861962 0.98045635 0.61897856
		 0.98269773 0.98399222 0.85765445 0.98237008 0.85613537 0.98321646 0.85535085 0.98486215
		 0.85639125 0.38162714 0.96100897 0.38218004 0.96295619 0.38107225 0.9632796 0.38028374
		 0.96174967 0.44728401 0.97338539 0.44877788 0.97374433 0.44844496 0.97482115 0.44694501
		 0.97482115 0.44877788 0.97589809 0.44728401 0.97625709 0.32309964 0.92502856 0.3238712
		 0.92508203 0.97184658 0.85405725 0.9725129 0.85445005 0.61682481 0.97824007 0.61754274
		 0.97824848 0.61826068 0.97824007 0.98121685 0.85444999 0.98188311 0.85405719 0.38233992
		 0.96499008 0.38156837 0.96504343 0.73714674 0.85508835 0.7367878 0.85678244 0.73606986
		 0.85679066 0.73606986 0.85520482 0.73535192 0.85678244 0.73499298 0.85508835 0.32323191
		 0.92312038 0.32361647 0.92306674 0.97280055 0.85259497 0.97316855 0.85271895 0.61718374
		 0.97617787 0.61754274 0.97614706 0.61790168 0.97617787 0.98056102 0.85271895 0.98092902
		 0.85259497 0.38208511 0.96700537 0.38170052 0.96695173 0.7364288 0.85865617 0.73606986
		 0.85862529 0.73571086 0.85865617 0.62419736 0.9875682 0.62466317 0.98900181 0.6241172
		 0.99043524 0.62287915 0.99102902 0.62167442 0.99043524 0.62120843 0.98900181 0.62175459
		 0.9875682 0.62299228 0.98697442 0.32294869 0.92117459 0.33747125 0.93457824 0.33856466
		 0.93305469 0.33772799 0.93483782 0.33808729 0.93494529 0.33071992 0.93494529 0.33024251
		 0.93305469 0.33107924 0.93483782 0.33133596 0.93457824 0.38141724 0.96889746 0.73606986
		 0.86060202 0.17564368 0.96192497 0.17575479 0.96173149 0.17703116 0.96248227 0.17694825
		 0.96273166 0.97261286 0.86529446 0.97283518 0.86516768 0.9736411 0.86640996 0.97341877
		 0.86659944 0.5966174 0.98166972 0.59666413 0.9813816 0.59805322 0.98167181 0.59805322
		 0.98198241 0.59944224 0.9813816 0.59948903 0.98166972 0.96567178 0.86728746 0.96544927
		 0.86709809 0.96625513 0.86585569 0.96647745 0.86598259 0.19643782 0.95227027 0.19652069
		 0.9525196 0.19524427 0.95327014 0.19513328 0.95307666 0.3834103 0.97288895 0.38361064
		 0.97293562 0.38329759 0.9743247 0.38309783 0.9743247 0.38361064 0.97571379 0.3834103
		 0.97576064 0.17649545 0.96044087 0.1770689 0.95870447 0.17783608 0.95879465 0.17758477
		 0.96081811 0.9743185 0.86432159 0.97572887 0.86307818 0.97637475 0.86350203 0.97512418
		 0.86514616 0.59697634 0.97945929 0.59733528 0.97724432 0.59805322 0.9772684 0.59805322
		 0.97959846 0.5987711 0.97724432 0.59913009 0.97945929 0.96396619 0.8658343 0.96271551
		 0.86419004 0.9633615 0.86376631 0.96477169 0.86500961 0.19707429 0.9541837 0.19732563
		 0.95620722 0.19655848 0.95629758 0.19598496 0.954561 0.77612585 0.86060923 0.77576679
		 0.86226821 0.77504891 0.86229229 0.77504891 0.86074847 0.77433103 0.86226821 0.77397197
		 0.86060923 0.17728926 0.95680177 0.17767566 0.95676601 0.97677332 0.861646 0.977135
		 0.8617869 0.59769422 0.97515589 0.59805322 0.97513294 0.59841216 0.97515589 0.96195531
		 0.86247504 0.96231705 0.86233401 0.19716537 0.9582358 0.19677879 0.95819986 0.77540785
		 0.86412936 0.77504891 0.86410636 0.77468991 0.86412936 0.71046823 0.86529535 0.71097404
		 0.86673087 0.7104677 0.86816645 0.7092464 0.868761 0.70802492 0.86816645 0.70751947
		 0.86673087 0.70802546 0.86529535 0.70924693 0.86470079 0.17709984 0.95483708 0.27951565
		 0.95818442 0.28065097 0.95673025 0.27976492 0.95845693 0.28012118 0.95856977 0.27277479
		 0.95856977 0.27224508 0.95673025 0.27313107 0.95845693 0.27338031 0.95818442 0.19658932
		 0.96016479 0.77504891 0.86608762 0.38463062 0.9743247 0.38494724 0.97540158 0.38494724
		 0.97324789 0.29258084 0.9281171 0.29270816 0.92789751 0.29397696 0.9286468 0.29388136
		 0.92893016 0.8766529 0.87326366 0.87690681 0.87312037 0.87770671 0.874358 0.87745249
		 0.87457269 0.53814876 0.98118037 0.53820211 0.9808529 0.53958464 0.98114246 0.53958464
		 0.98149574 0.54096723 0.9808529 0.54102051 0.98118037 0.82700378 0.87503195 0.8267495
		 0.87481719 0.82754934 0.87357968 0.82780325 0.87372303 0.30362588 0.92117482 0.30372155
		 0.9214583 0.30245277 0.92220742 0.30232558 0.92198783 0.43926877 0.97338539 0.43949747
		 0.97343868 0.43918684 0.97482127 0.43895897 0.97482127 0.43949747 0.9762038 0.43926877
		 0.97625709 0.29343858 0.92663783 0.29401961 0.92490423 0.29478624 0.92499804 0.29452589
		 0.92702031 0.87836426 0.8722977 0.87978196 0.87105942 0.88042575 0.87148637 0.87916577
		 0.87312621 0.53850776 0.97897333 0.5388667 0.9767589 0.53958464 0.97678453 0.53958464
		 0.97911477 0.54030263 0.9767589 0.54066157 0.97897333 0.82529038 0.8735854 0.82403058
		 0.87194562 0.82467413 0.87151873 0.826092 0.87275702 0.3042706 0.92308462 0.30453086
		 0.92510706 0.30376425 0.9252007 0.30318308 0.92346722 0.8151049 0.86065716 0.8147459
		 0.86231256 0.81402802 0.86233824 0.81402802 0.86079866 0.81331003 0.86231256 0.81295109
		 0.86065722 0.29424855 0.92300242 0.29463515 0.92296833 0.88083518 0.86963058 0.8811962
		 0.86977303 0.5392257 0.97466809 0.53958464 0.97464591 0.53994364 0.97466809 0.82325995
		 0.87023228 0.82362098 0.87008989 0.30437973 0.92713678 0.30399314 0.92710263 0.81438696
		 0.8641721 0.81402802 0.86414993 0.81366897 0.8641721 0.65293169 0.98760629 0.65343344
		 0.98904175 0.65292329 0.99047726 0.65170014 0.99107182 0.65048051 0.99047726 0.64997876
		 0.98904175 0.65048891 0.98760629 0.65171218 0.98701167 0.2940684 0.92103618 0.23588806
		 0.96531928;
	setAttr ".uvst[0].uvsp[250:499]" 0.23702736 0.96387202 0.23613657 0.96559292
		 0.2364925 0.96570623 0.22914834 0.96560979 0.22861345 0.96377563 0.22950427 0.96549642
		 0.22975278 0.96522272 0.30381298 0.9290688 0.81402802 0.86613125 0.44049472 0.97482127
		 0.44080976 0.97589809 0.4408097 0.97374433 0.43485436 0.9685086 0.43579352 0.96727872
		 0.43681544 0.96774912 0.43604717 0.96939379 0.77414185 0.87471092 0.77345955 0.8730132
		 0.77433735 0.87230939 0.7754671 0.87403995 0.13666461 0.96274137 0.13701661 0.96083784
		 0.13807249 0.96101654 0.13807249 0.96308613 0.13912842 0.96083784 0.13948038 0.96274137
		 0.76514089 0.87078542 0.76401109 0.87251598 0.76313347 0.87181216 0.76381576 0.87011445
		 0.45553675 0.97226131 0.45630503 0.97390604 0.45528322 0.97437626 0.45434394 0.97314656
		 0.46667999 0.98362249 0.46632802 0.98514092 0.4652721 0.98486561 0.4652721 0.98336661
		 0.4642162 0.98514092 0.46386421 0.98362249 0.43649051 0.96578163 0.437226 0.96595323
		 0.7724821 0.87156755 0.77296454 0.8709864 0.13736857 0.95886046 0.13807249 0.95891958
		 0.13877641 0.95886046 0.76263827 0.87383896 0.76215601 0.87325782 0.4567157 0.97570211
		 0.45598012 0.97587353 0.46597606 0.98653024 0.4652721 0.98630148 0.46456817 0.98653024
		 0.43686563 0.96408606 0.4372437 0.96409816 0.77127618 0.87044704 0.77145612 0.87011445
		 0.13772054 0.95693082 0.13807249 0.95692885 0.13842446 0.95693094 0.76113003 0.87471092
		 0.76094991 0.8743785 0.45673323 0.977557 0.45635539 0.97756904 0.53092003 0.98542869
		 0.530568 0.98706287 0.53021604 0.98706079 0.53021604 0.98548782 0.52986407 0.98706287
		 0.52951211 0.98542869 0.59533066 0.98659444 0.59589303 0.98797399 0.59546304 0.98935342
		 0.594293 0.98992485 0.59306788 0.98935342 0.59250569 0.98797399 0.59293556 0.98659444
		 0.59410572 0.98602295 0.43685514 0.96227986 0.14864284 0.96828246 0.14977205 0.96707767
		 0.14886589 0.96857786 0.13807249 0.95516032 0.1422846 0.96857786 0.14137836 0.96707767
		 0.14250757 0.96828246 0.45634481 0.97937512 0.53021604 0.98884314 0.33155987 0.92832261
		 0.33162037 0.92820525 0.33294562 0.92891383 0.33290318 0.92906332 0.92209238 0.85707933
		 0.92221868 0.85699934 0.92308706 0.85822588 0.92296261 0.85834247 0.63559639 0.98273492
		 0.63562393 0.98256302 0.63703227 0.98283535 0.63703227 0.98302013 0.63844055 0.98256302
		 0.63846809 0.98273492 0.93721735 0.85834247 0.93709284 0.85822588 0.93796116 0.85699934
		 0.93808746 0.85707933 0.3134138 0.92117476 0.31345615 0.92132407 0.31213081 0.92203283
		 0.31207037 0.92191523 0.37546864 0.97288901 0.37558323 0.97291648 0.37524468 0.97432488
		 0.37512961 0.97432488 0.37558323 0.97573316 0.37546864 0.97576064 0.33234844 0.92679268
		 0.33284441 0.92502862 0.33361605 0.92508203 0.33345622 0.92711592 0.92373842 0.85603881
		 0.9250716 0.85474521 0.92573792 0.855138 0.92458463 0.8568235 0.63595533 0.98049366
		 0.63631433 0.97827733 0.63703227 0.97828573 0.63703227 0.98061007 0.63775015 0.97827744
		 0.63810915 0.98049366 0.93559521 0.85682338 0.93444198 0.855138 0.93510824 0.85474521
		 0.93644142 0.85603881 0.31396666 0.92312193 0.31412655 0.92515606 0.31335482 0.92520934
		 0.31285891 0.9234454 0.7468915 0.85508829 0.74653256 0.85678226 0.74581462 0.85679042
		 0.74581462 0.85520464 0.74509674 0.85678226 0.74473774 0.85508829 0.33297667 0.92312038
		 0.33336124 0.92306685 0.92602563 0.85328287 0.92639369 0.85340691 0.63667327 0.97621512
		 0.63703227 0.97618431 0.63739121 0.97621512 0.93378615 0.85340691 0.93415415 0.85328287
		 0.31387174 0.92717135 0.31348717 0.92711771 0.74617356 0.85865605 0.74581462 0.85862523
		 0.74545568 0.85865605 0.60501707 0.98656768 0.60548311 0.98800117 0.60493696 0.98943466
		 0.60369885 0.99002844 0.60249418 0.98943466 0.60202837 0.98800117 0.60257429 0.98656768
		 0.60381222 0.98597389 0.33269346 0.92117465 0.32301369 0.93457824 0.32410717 0.93305475
		 0.32327044 0.93483788 0.32362971 0.9349454 0.31626233 0.93494576 0.31578493 0.93305516
		 0.31662163 0.93483824 0.31687835 0.9345786 0.31320387 0.92906362 0.74581462 0.8606019
		 0.37662953 0.97432488 0.37696254 0.97540176 0.37696254 0.97324795 0.15615416 0.9617846
		 0.15639687 0.96136171 0.15764007 0.96204603 0.15745866 0.96259141 0.92998272 0.86598229
		 0.93046892 0.86570501 0.93127477 0.8668732 0.93078876 0.8672874 0.57712781 0.98171872
		 0.57723016 0.98108882 0.57856363 0.98135209 0.57856363 0.98203146 0.57989722 0.98108882
		 0.57999957 0.98171872 0.92304152 0.8672874 0.92255545 0.8668732 0.92336136 0.86570501
		 0.92384744 0.86598229 0.20618254 0.95236939 0.20636398 0.9529146 0.20512079 0.95359886
		 0.20487802 0.95317596 0.43128675 0.97338539 0.43172473 0.97348762 0.43141115 0.97482127
		 0.4309743 0.97482127 0.43172473 0.97615469 0.43128675 0.97625709 0.1570058 0.96030056
		 0.15757933 0.95856416 0.15834655 0.95865434 0.15809518 0.96067786 0.93168843 0.86500961
		 0.93309885 0.86376613 0.93374461 0.8641898 0.93249404 0.865834 0.57748675 0.97950828
		 0.57784569 0.97729331 0.57856363 0.97731739 0.57856363 0.97964746 0.57928157 0.97729331
		 0.57964057 0.97950828 0.92133617 0.86583412 0.92008567 0.86418986 0.92073148 0.86376613
		 0.92214185 0.86500961 0.20681903 0.95428282 0.20707037 0.95630634 0.20630319 0.95639646
		 0.20572969 0.95466012 0.78587049 0.86060941 0.78551155 0.86226839 0.78479356 0.86229247
		 0.78479356 0.86074859 0.78407568 0.86226839 0.78371674 0.86060941 0.15779962 0.9566614
		 0.15818606 0.95662564 0.9341433 0.86233401 0.93450487 0.86247474 0.57820469 0.97520494
		 0.57856363 0.97518194 0.57892263 0.97520494 0.91932529 0.86247486 0.91968703 0.86233401
		 0.20690992 0.95833492 0.20652351 0.95829934 0.78515261 0.86412948 0.78479356 0.86410654;
	setAttr ".uvst[0].uvsp[500:749]" 0.78443468 0.86412948 0.70087838 0.86559176
		 0.70138419 0.86702734 0.70087785 0.86846286 0.69965655 0.86905742 0.69843507 0.86846286
		 0.69792926 0.86702734 0.6984356 0.86559176 0.69965708 0.86499721 0.15761027 0.95469677
		 0.26497447 0.96532613 0.26610973 0.96387196 0.26522374 0.96559858 0.26557997 0.96571147
		 0.25823376 0.96571153 0.25770399 0.96387202 0.25858995 0.96559876 0.25883922 0.96532625
		 0.20633423 0.96026391 0.78479356 0.86608779 0.43250701 0.97482127 0.43282369 0.97589809
		 0.43282369 0.97374433 0.27309129 0.95192575 0.27319792 0.95174176 0.27447197 0.95250136
		 0.27439186 0.95273882 0.8125813 0.87375593 0.81279403 0.87363571 0.81359386 0.87488496
		 0.81338084 0.87506479 0.54789352 0.98118043 0.54793817 0.98090595 0.5493294 0.9811998
		 0.5493294 0.98149574 0.55072057 0.98090595 0.55076522 0.98118043 0.89107537 0.86746556
		 0.89086217 0.86728567 0.89166218 0.86603642 0.89187485 0.86615652 0.23541281 0.95198649
		 0.23549293 0.95222396 0.23421888 0.95298368 0.23411229 0.95279968 0.36745334 0.97288913
		 0.367645 0.97293371 0.3673346 0.97432488 0.36714357 0.97432488 0.367645 0.97571611
		 0.36745334 0.9757607 0.27394903 0.95044637 0.27453002 0.94871289 0.27529663 0.9488067
		 0.27503639 0.95082891 0.81429261 0.8727898 0.81571037 0.87155169 0.81635416 0.87197846
		 0.81509417 0.8736183 0.54825252 0.97897333 0.54861146 0.97675878 0.5493294 0.97678453
		 0.5493294 0.97911477 0.55004728 0.97675878 0.55040628 0.97897333 0.88936198 0.86601901
		 0.88810217 0.86437917 0.88874578 0.8639524 0.89016348 0.86519051 0.23605749 0.95389646
		 0.23631778 0.95591873 0.23555098 0.95601237 0.23496999 0.95427907 0.83459437 0.86063379
		 0.83423537 0.86228913 0.83351743 0.86231488 0.83351743 0.86077523 0.83279949 0.86228913
		 0.83244056 0.86063379 0.27475905 0.94681102 0.27514559 0.94677699 0.81676358 0.87012279
		 0.81712449 0.87026513 0.5489704 0.9746682 0.5493294 0.97464591 0.54968834 0.9746682
		 0.88733155 0.86266583 0.88769257 0.86252332 0.23616664 0.95794845 0.23578005 0.95791429
		 0.83387643 0.86414862 0.83351743 0.86412644 0.83315843 0.86414862 0.64333326 0.98760617
		 0.64384341 0.98904169 0.64334166 0.99047714 0.64212197 0.99107176 0.64089888 0.99047714
		 0.64038867 0.98904169 0.64089048 0.98760617 0.64211011 0.98701161 0.27457884 0.94484484
		 0.22133873 0.9657023 0.22247808 0.96425515 0.22158729 0.965976 0.22194323 0.96608937
		 0.2145991 0.96608937 0.2140643 0.96425515 0.21495503 0.965976 0.21520346 0.9657023
		 0.23559989 0.95988065 0.83351743 0.86610776 0.36867929 0.97432488 0.36899433 0.97540176
		 0.36899433 0.97324806 0.42510954 0.96836621 0.42604864 0.96713656 0.42707059 0.96760684
		 0.42630231 0.96925151 0.79479438 0.87461883 0.79411215 0.87292111 0.79498976 0.8722173
		 0.79611963 0.87394786 0.11717511 0.96270484 0.11752707 0.96080136 0.11858299 0.96098006
		 0.11858299 0.96304971 0.11963892 0.96080136 0.11999088 0.96270484 0.75481445 0.87078089
		 0.75368464 0.87251127 0.75280702 0.87180775 0.75348932 0.87010992 0.40681294 0.96213746
		 0.40758121 0.96378201 0.40655923 0.96425241 0.40562013 0.96302271 0.48458207 0.98362571
		 0.48423013 0.98514402 0.4831742 0.98486876 0.4831742 0.98336971 0.48211828 0.98514402
		 0.48176631 0.98362571 0.42674562 0.96563947 0.42748111 0.96581095 0.79313463 0.87147552
		 0.79361707 0.87089431 0.11787903 0.95882386 0.11858299 0.95888299 0.11928692 0.95882386
		 0.752312 0.87383437 0.75182956 0.87325341 0.40799171 0.96557814 0.40725613 0.96574932
		 0.48387811 0.98653346 0.4831742 0.98630458 0.48247021 0.98653346 0.42712077 0.96394378
		 0.42749879 0.963956 0.79192865 0.87035495 0.79210865 0.8700223 0.11823104 0.95689422
		 0.11858299 0.95689225 0.11893495 0.95689422 0.75080359 0.87470633 0.75062364 0.87437356
		 0.40800941 0.96743315 0.4076314 0.96744519 0.52337688 0.98542869 0.52302492 0.98706281
		 0.52267295 0.98706079 0.52267295 0.98548782 0.52232099 0.98706281 0.52196896 0.98542869
		 0.58594036 0.98659444 0.58637017 0.98797399 0.5858078 0.98935354 0.58458287 0.98992491
		 0.58341271 0.98935354 0.58298284 0.98797399 0.58354521 0.98659444 0.58477014 0.98602301
		 0.42711028 0.96213746 0.17770125 0.96792787 0.1788305 0.96672308 0.17792425 0.96822333
		 0.11858299 0.95512372 0.17134283 0.96822351 0.17043658 0.9667232 0.17156596 0.96792799
		 0.40762082 0.96925151 0.52267295 0.98884314 0.34130466 0.92188084 0.34264788 0.92114013
		 0.34320074 0.92308754 0.34209317 0.92341077 0.99800801 0.85639125 0.9971379 0.85765445
		 0.99551594 0.85613555 0.99636215 0.85535085 0.62872332 0.98269773 0.62728745 0.98298299
		 0.62728745 0.98057282 0.62836438 0.98045635 0.62585163 0.98269773 0.62621063 0.98045635
		 0.98414052 0.86670548 0.98327029 0.86544228 0.98491645 0.86440188 0.98576266 0.86518627
		 0.3523927 0.96831113 0.35104939 0.96757042 0.35183796 0.96604043 0.35294566 0.96636391
		 0.42334518 0.97611457 0.42300612 0.9746787 0.4245061 0.9746787 0.42483902 0.97575551
		 0.42334518 0.97324282 0.42483902 0.97360176 0.34336066 0.92512125 0.34258911 0.92517477
		 0.99436253 0.85445005 0.99502897 0.85405719 0.62728745 0.97824848 0.62800545 0.97824019
		 0.62656957 0.97824007 0.98624963 0.86310822 0.98691595 0.86350101 0.35233393 0.96427649
		 0.35310557 0.9643299 0.75448251 0.86060476 0.75555938 0.86072117 0.75555938 0.86230689
		 0.75484151 0.86229879 0.75663626 0.86060476 0.75627732 0.86229879 0.34310603 0.92713654
		 0.34272143 0.9270829 0.99370688 0.85271895 0.99407488 0.85259497 0.62728745 0.97614706
		 0.62764645 0.97617787 0.62692851 0.97617787 0.98720372 0.861646 0.9875716 0.86176991
		 0.35246617 0.96236825 0.35285076 0.96231467 0.75555938 0.8641417 0.75520045 0.86417252;
	setAttr ".uvst[0].uvsp[750:999]" 0.75591832 0.86417252 0.61216456 0.9875682
		 0.61340261 0.98697442 0.61460733 0.9875682 0.61507314 0.98900181 0.61452717 0.99043524
		 0.6132893 0.99102902 0.61208439 0.99043524 0.6116184 0.98900181 0.34243816 0.92902881
		 0.30964959 0.93458372 0.30939278 0.9348433 0.30855608 0.93306017 0.30903348 0.93495077
		 0.30194333 0.93495077 0.30158398 0.9348433 0.30242071 0.93306017 0.30132726 0.93458372
		 0.35218298 0.9604224 0.75555938 0.86611837 0.21462275 0.95317578 0.21592727 0.95236939
		 0.21601014 0.95261872 0.21473372 0.95336926 0.9558199 0.86598259 0.95501423 0.86728746
		 0.95479172 0.86709809 0.95559758 0.86585569 0.6092338 0.98166972 0.60779798 0.98198241
		 0.60779798 0.98167181 0.60918707 0.9813816 0.6063621 0.98166972 0.60640889 0.9813816
		 0.94144624 0.86728746 0.94064027 0.86598247 0.9408626 0.86585569 0.94166857 0.86709803
		 0.186693 0.9627316 0.18538843 0.96192491 0.18549949 0.96173143 0.18677591 0.96248227
		 0.41533393 0.97611475 0.41502142 0.97467887 0.41522121 0.97467887 0.41553423 0.9760679
		 0.41533387 0.973243 0.41553423 0.97328985 0.21547443 0.95466012 0.21656375 0.95428264
		 0.21681508 0.95630634 0.21604793 0.95639646 0.95411432 0.86500961 0.95330864 0.8658343
		 0.95205814 0.86419004 0.95270395 0.86376631 0.60887486 0.97945929 0.60779798 0.97959846
		 0.60779798 0.9772684 0.60851586 0.97724432 0.6067211 0.97945929 0.60708004 0.97724432
		 0.94315159 0.86583418 0.94234604 0.86500961 0.9437564 0.86376625 0.94440228 0.86419004
		 0.18732947 0.96081805 0.1862402 0.96044087 0.18681365 0.95870435 0.18758082 0.95879465
		 0.79346156 0.86055225 0.79453844 0.86069155 0.79453844 0.86223537 0.7938205 0.86221129
		 0.79561532 0.86055225 0.79525632 0.86221129 0.21665464 0.95833492 0.21626824 0.95829916
		 0.95129776 0.86247492 0.9516595 0.86233401 0.60779798 0.97513294 0.60815692 0.97515589
		 0.60743898 0.97515589 0.94480085 0.86233401 0.94516253 0.86247492 0.18703401 0.95680159
		 0.18742047 0.95676583 0.79453844 0.86404943 0.7941795 0.86407244 0.79489738 0.86407244
		 0.6888454 0.86559176 0.6900667 0.86499721 0.69128817 0.86559176 0.69179392 0.86702728
		 0.69128764 0.86846286 0.69006616 0.86905742 0.68884486 0.86846286 0.68833923 0.86702728
		 0.21607895 0.96026373 0.295192 0.93437594 0.29494274 0.93464833 0.29405686 0.93292165
		 0.29458654 0.93476117 0.28739169 0.95856977 0.28703552 0.95845693 0.28792149 0.95673025
		 0.28678626 0.95818442 0.18684459 0.95483708 0.79453844 0.86603069 0.41687086 0.97360194
		 0.41655421 0.97467887 0.41687086 0.97575581 0.24385701 0.9527995 0.24515752 0.95198649
		 0.24525318 0.95226997 0.24398424 0.95301908 0.87051755 0.8732788 0.86971813 0.87458777
		 0.86946386 0.87437302 0.8702637 0.87313551 0.56051004 0.98157287 0.55907416 0.98188829
		 0.55907416 0.98153502 0.56045675 0.9812454 0.55763835 0.98157287 0.55769157 0.9812454
		 0.85609531 0.87459737 0.85529566 0.87328845 0.85554963 0.8731451 0.85634947 0.87438262
		 0.26464704 0.95988047 0.26334652 0.95906734 0.26347384 0.95884782 0.26474267 0.95959705
		 0.3594673 0.97517419 0.35915756 0.97373843 0.3593854 0.97373843 0.35969597 0.97512096
		 0.3594673 0.97230256 0.35969603 0.97235572 0.24471472 0.95427889 0.24580204 0.95389628
		 0.2460625 0.95591855 0.24529588 0.95601237 0.86880636 0.87231284 0.86800474 0.87314123
		 0.86674488 0.87150139 0.86738867 0.8710745 0.56015104 0.97936583 0.55907416 0.97950739
		 0.55907416 0.97717708 0.55979204 0.97715139 0.55799729 0.97936583 0.55835623 0.97715133
		 0.85780853 0.87315083 0.85700703 0.87232244 0.85842478 0.87108415 0.85906857 0.87151098
		 0.26529163 0.9579705 0.2642042 0.95758814 0.26478526 0.95585454 0.26555195 0.95594829
		 0.82269579 0.86062425 0.82377273 0.86076581 0.82377273 0.86230534 0.82305473 0.86227971
		 0.82484955 0.86062437 0.82449061 0.86227971 0.24591137 0.95794845 0.24552478 0.95791429
		 0.86597425 0.86978811 0.86633533 0.86964566 0.55907416 0.97503847 0.5594331 0.97506064
		 0.55871522 0.97506064 0.85947794 0.86965525 0.85983896 0.86979771 0.26501423 0.95395261
		 0.26540083 0.95391858 0.82377273 0.86411703 0.82341379 0.86413932 0.82413167 0.8641392
		 0.66007054 0.98737055 0.66128999 0.98677605 0.66251332 0.98737055 0.66302347 0.98880613
		 0.66252172 0.99024153 0.66130203 0.9908362 0.66007894 0.99024153 0.65956879 0.98880613
		 0.24534462 0.95988065 0.20792897 0.96570259 0.20768046 0.96597618 0.20678973 0.96425533
		 0.20732462 0.96608955 0.20011947 0.96599036 0.19976354 0.965877 0.20065431 0.96415621
		 0.19951501 0.96560329 0.26483402 0.95198649 0.82377273 0.8660984 0.36100832 0.9726615
		 0.36069328 0.97373843 0.36100823 0.97481531 0.46408868 0.97314644 0.46528149 0.97226119
		 0.46604976 0.9739058 0.46502778 0.97437614 0.80512053 0.87012708 0.8064459 0.87079805
		 0.80531603 0.87252861 0.80443841 0.87182456 0.14922516 0.96274137 0.14781728 0.96308613
		 0.14781728 0.96101654 0.14887318 0.96083784 0.14640939 0.96274137 0.14676136 0.96083784
		 0.7444883 0.86851889 0.74316317 0.86918986 0.74248087 0.86749208 0.74335855 0.86678833
		 0.47502619 0.97948724 0.47383335 0.97860205 0.47477251 0.97737229 0.47579443 0.97784257
		 0.45491317 0.98362249 0.45632103 0.98336661 0.45632103 0.98486561 0.45526516 0.98514092
		 0.45772892 0.98362249 0.45737696 0.98514092 0.46646026 0.97570187 0.46572468 0.97587323
		 0.80394322 0.87385154 0.80346084 0.87327021 0.14781728 0.95891958 0.14852121 0.95886046
		 0.14711334 0.95886046 0.74150342 0.86604655 0.74198586 0.8654654 0.4754695 0.9758752
		 0.47620502 0.97604668 0.45632103 0.98630148 0.45561713 0.98653024 0.45702496 0.98653024
		 0.46647796 0.97755671 0.46609995 0.97756892 0.8024348 0.87472367 0.80225503 0.8743909;
	setAttr ".uvst[0].uvsp[1000:1249]" 0.14781728 0.95692885 0.14816923 0.95693082
		 0.14746529 0.95693094 0.74029738 0.86492604 0.7404775 0.86459345 0.47584468 0.97417957
		 0.47622275 0.97419173 0.51442581 0.98542869 0.5151298 0.98548782 0.5151298 0.98706079
		 0.51477778 0.98706281 0.51583368 0.98542869 0.51548171 0.98706287 0.57402253 0.98659444
		 0.57524747 0.98602301 0.57641762 0.98659444 0.57684749 0.98797399 0.5762853 0.98935354
		 0.57506019 0.98992491 0.57389021 0.98935354 0.57346016 0.98797399 0.46608937 0.97937506
		 0.13524294 0.96828246 0.1350199 0.96857786 0.13411364 0.96707767 0.14781728 0.95516032
		 0.12707214 0.96832401 0.1268491 0.96802855 0.12797831 0.96682376 0.47583413 0.97237337
		 0.5151298 0.98884314 0.36079419 0.96116304 0.36213744 0.96042252 0.36217996 0.96057183
		 0.36085463 0.96128058 0.94978118 0.85707933 0.94891107 0.85834247 0.94878662 0.85822588
		 0.94965488 0.85699934 0.64821285 0.98273492 0.64677697 0.98302013 0.64677697 0.98283535
		 0.64818531 0.98256302 0.64534116 0.98273492 0.64536864 0.98256302 0.95804369 0.85834247
		 0.95717353 0.85707933 0.95729971 0.85699934 0.95816821 0.85822594 0.3718822 0.96889758
		 0.37053889 0.96815687 0.37059939 0.96803951 0.37192464 0.96874815 0.40739223 0.97611463
		 0.4070532 0.97467881 0.4071683 0.97467881 0.40750682 0.97608715 0.40739223 0.973243
		 0.40750682 0.97327048 0.36158273 0.96269315 0.36269048 0.96236974 0.36285037 0.96440381
		 0.36207864 0.96445709 0.94813514 0.85603881 0.94728899 0.85682338 0.94613576 0.85513794
		 0.94680196 0.85474521 0.64785385 0.98049366 0.64677697 0.98061007 0.64677697 0.97828573
		 0.64749491 0.97827733 0.6457001 0.98049366 0.6460591 0.97827744 0.95966578 0.8568235
		 0.95881963 0.85603881 0.9601528 0.85474521 0.96081907 0.855138 0.37243518 0.96695018
		 0.37132746 0.96662694 0.37182343 0.96486294 0.37259507 0.96491629 0.76422727 0.86060923
		 0.76530415 0.86072558 0.76530415 0.86231136 0.76458621 0.8623032 0.76638103 0.86060923
		 0.76602209 0.8623032 0.36259556 0.9664191 0.36221099 0.96636546 0.94547993 0.85340691
		 0.94584793 0.85328287 0.64677697 0.97618431 0.64713597 0.97621512 0.64641804 0.97621512
		 0.96110672 0.85328287 0.96147478 0.85340691 0.37195569 0.9629547 0.37234026 0.96290118
		 0.76530415 0.86414617 0.76494521 0.86417699 0.76566315 0.86417699 0.63126445 0.98760551
		 0.63246936 0.98701167 0.63370723 0.98760551 0.6342532 0.989039 0.63378739 0.9904725
		 0.63258266 0.99106628 0.63134462 0.9904725 0.63079846 0.989039 0.36192769 0.96831119
		 0.35302225 0.97382623 0.3527655 0.97408575 0.3519288 0.97230262 0.3524062 0.97419327
		 0.34531599 0.93491089 0.34495673 0.93480337 0.34579349 0.93302017 0.34469995 0.93454373
		 0.37167248 0.96100891 0.76530415 0.86612284 0.40888616 0.97360194 0.40855312 0.97467881
		 0.40888616 0.97575569 0.22436756 0.95269638 0.2256719 0.95188975 0.22585334 0.95243496
		 0.22461015 0.95311928 0.91318983 0.86590981 0.91238397 0.8672148 0.9118979 0.86680079
		 0.91270381 0.86563259 0.58974433 0.98171872 0.58830845 0.98203146 0.58830845 0.98135209
		 0.58964199 0.98108882 0.58687258 0.98171872 0.58697492 0.98108882 0.89881629 0.8672033
		 0.89801025 0.86589831 0.89849645 0.86562109 0.8993023 0.86678928 0.16720343 0.96273178
		 0.16589892 0.96192497 0.16614164 0.96150208 0.16738486 0.9621864 0.39938098 0.9763118
		 0.39906853 0.97487593 0.39950538 0.97487593 0.39981896 0.97620946 0.39938098 0.97344017
		 0.39981902 0.97354239 0.22521906 0.95418048 0.22630857 0.95380306 0.22655991 0.9558267
		 0.22579275 0.95591688 0.9114843 0.86493713 0.91067863 0.86576152 0.90942812 0.86411732
		 0.91007394 0.86369365 0.58938533 0.97950828 0.58830845 0.97964746 0.58830845 0.97731739
		 0.58902639 0.97729331 0.58723152 0.97950828 0.58759052 0.97729331 0.90052158 0.86575013
		 0.89971596 0.86492562 0.90112638 0.86368215 0.90177226 0.86410594 0.16783993 0.96081811
		 0.16675058 0.96044093 0.16732413 0.95870447 0.1680913 0.95879465 0.80320626 0.86065722
		 0.8042832 0.86079639 0.8042832 0.86234033 0.8035652 0.86231625 0.80536002 0.86065722
		 0.80500108 0.86231625 0.22639947 0.95785534 0.22601287 0.95781976 0.90866774 0.86240226
		 0.90902948 0.86226153 0.58830845 0.97518194 0.58866739 0.97520494 0.58794951 0.97520494
		 0.90217072 0.86225003 0.9025324 0.86239088 0.16754444 0.95680177 0.16793086 0.95676601
		 0.8042832 0.8641544 0.80392414 0.86417729 0.80464214 0.86417729 0.67925483 0.8655917
		 0.68047613 0.86499703 0.68169761 0.8655917 0.68220389 0.86702716 0.68169814 0.86846268
		 0.68047667 0.86905736 0.67925537 0.86846268 0.67874902 0.86702716 0.2258236 0.95978409
		 0.25156853 0.96532625 0.25131917 0.96559876 0.25043318 0.96387202 0.25096288 0.96571153
		 0.2437681 0.96571153 0.2434119 0.96559876 0.24429789 0.96387202 0.24316262 0.96532625
		 0.16735506 0.95483708 0.8042832 0.8661356 0.40091792 0.97379911 0.40060124 0.97487593
		 0.40091792 0.97595286 0.25360185 0.9527995 0.25490236 0.95198649 0.25498247 0.95222378
		 0.25370842 0.9529835 0.84916031 0.87373257 0.84836102 0.87504143 0.84814781 0.8748616
		 0.84894782 0.87361234 0.57025474 0.98157299 0.56881893 0.98188829 0.56881893 0.9815923
		 0.5702101 0.98129845 0.56738305 0.98157299 0.56742769 0.98129845 0.83473819 0.87504143
		 0.83393854 0.87373245 0.83415139 0.87361234 0.83495122 0.8748616 0.28413659 0.95273882
		 0.28283605 0.95192575 0.28294274 0.95174176 0.28421673 0.95250136 0.39139232 0.97513419
		 0.39108253 0.97369844 0.39127359 0.97369844 0.39158398 0.97508967 0.39139232 0.97226256
		 0.39158398 0.97230721 0.25445953 0.95427889 0.25554705 0.95389646 0.25580731 0.95591855
		 0.25504071 0.95601237 0.84744895 0.87276644 0.84664762 0.87359494 0.84538764 0.8719551;
	setAttr ".uvst[0].uvsp[1250:1499]" 0.84603143 0.87152833 0.5698958 0.97936583
		 0.56881893 0.97950733 0.56881887 0.97717708 0.56953681 0.97715133 0.56774199 0.97936583
		 0.56810093 0.97715133 0.83645141 0.87359494 0.83564997 0.87276644 0.83706772 0.87152833
		 0.83771151 0.8719551 0.28478119 0.95082891 0.28369382 0.95044637 0.28427479 0.94871289
		 0.28504148 0.9488067 0.84218538 0.86063379 0.84326226 0.86077523 0.84326226 0.86231488
		 0.84254432 0.86228913 0.84433919 0.86063379 0.84398019 0.86228913 0.25565618 0.95794827
		 0.25526959 0.95791411 0.84461719 0.87024176 0.84497821 0.87009931 0.56881893 0.97503847
		 0.56917787 0.9750607 0.56845993 0.9750607 0.83812082 0.87009931 0.83848184 0.87024176
		 0.28450379 0.9468109 0.28489032 0.94677699 0.84326226 0.86412644 0.84290326 0.86414862
		 0.84362119 0.86414862 0.66966915 0.86568069 0.6708923 0.86508602 0.67211193 0.86568069
		 0.67261368 0.86711615 0.67210352 0.86855167 0.67088038 0.86914623 0.66966075 0.86855167
		 0.669159 0.86711615 0.25508943 0.95988065 0.19337974 0.96817023 0.19313122 0.96844387
		 0.19224049 0.96672308 0.19277529 0.96855724 0.18557024 0.96855724 0.18521431 0.96844387
		 0.1861051 0.96672308 0.1849658 0.96817023 0.2843236 0.94484484 0.84326226 0.86610776
		 0.39293328 0.9726215 0.39261827 0.97369844 0.39293331 0.97477537 0.41536495 0.96302271
		 0.41655776 0.96213746 0.41732603 0.96378201 0.41630405 0.96425241 0.7328369 0.86459345
		 0.73416203 0.86526442 0.73303217 0.8669948 0.73215461 0.86629134 0.1297356 0.96248734
		 0.12832773 0.96283227 0.12832773 0.96076256 0.12938365 0.96058387 0.12691985 0.96248734
		 0.12727182 0.96058387 0.78579336 0.87400478 0.784468 0.87467575 0.78378582 0.87297809
		 0.7846635 0.87227422 0.4457919 0.96939385 0.44459912 0.96850872 0.44553822 0.9672789
		 0.44656011 0.9677493 0.47281525 0.98373467 0.47422314 0.98347867 0.47422314 0.98497778
		 0.47316721 0.98525304 0.47563103 0.98373467 0.47527906 0.98525304 0.41773653 0.96557796
		 0.41700095 0.96574932 0.73165959 0.86831796 0.73117715 0.86773676 0.12832773 0.95866549
		 0.12903169 0.95860636 0.1276238 0.95860636 0.78280836 0.87153244 0.78329068 0.87095129
		 0.44623518 0.96578181 0.4469707 0.96595341 0.47422314 0.98641354 0.47351924 0.98664242
		 0.4749271 0.98664242 0.41775423 0.96743298 0.41737622 0.96744519 0.73015118 0.86918986
		 0.72997117 0.86885732 0.12832773 0.95667475 0.12867971 0.95667678 0.12797576 0.95667678
		 0.78160238 0.87041187 0.78178239 0.87007922 0.44661039 0.96408629 0.44698843 0.96409845
		 0.50688267 0.98553258 0.5075866 0.98559171 0.5075866 0.98716462 0.50723463 0.98716664
		 0.50829053 0.98553258 0.50793856 0.98716664 0.56436729 0.98645121 0.56553751 0.98587984
		 0.56676245 0.98645121 0.56732482 0.9878307 0.56689495 0.98921025 0.56572479 0.98978174
		 0.56449986 0.98921025 0.56393749 0.9878307 0.41736564 0.96925151 0.16430117 0.96792799
		 0.16407812 0.96822351 0.16317195 0.9667232 0.12832773 0.95490623 0.1561304 0.96808314
		 0.15590735 0.96778768 0.1570366 0.96658295 0.44659987 0.96228004 0.5075866 0.98894703
		 0.39224291 0.89866483 0.39234385 0.90602499 0.38953492 0.90633595 0.38792849 0.89830375
		 0.53384447 0.91650403 0.52908427 0.91581446 0.52908427 0.90677392 0.5333091 0.9078747
		 0.39727265 0.90975004 0.40024203 0.89654237 0.40734273 0.89999598 0.40293431 0.91042501
		 0.021494938 0.90085977 0.014139985 0.90085977 0.014424158 0.89665818 0.02124889 0.89821386
		 0.016705669 0.89079207 0.019895215 0.89303005 0.072931536 0.29709649 0.077489264
		 0.28322801 0.095507547 0.29261267 0.093855478 0.30607963 0.079450354 0.26519585 0.096369989
		 0.27526027 0.51089227 0.71446836 0.48785272 0.71290678 0.48785272 0.69871891 0.51091892
		 0.69633305 0.012889598 0.23443837 0.024254354 0.22158346 0.039992124 0.24225971 0.023196056
		 0.24515425 0.056036539 0.27413899 0.064024158 0.25377524 0.049273137 0.29086351 0.28048098
		 0.8304047 0.27372462 0.8286317 0.27484179 0.82343102 0.28049979 0.82639354 0.27749199
		 0.8188566 0.28205949 0.82466066 0.28389615 0.8157239 0.29107898 0.81752324 0.28804797
		 0.82391858 0.28461972 0.82316118 0.29003042 0.82583469 0.29077294 0.8302086 0.28623539
		 0.83160967 0.28567302 0.82640022 0.4360218 0.72381812 0.43611735 0.74051082 0.42842209
		 0.74259526 0.42842209 0.72618538 0.23554441 0.76271605 0.2218276 0.76401967 0.2218276
		 0.73611993 0.23566027 0.73489881 0.44836408 0.72398454 0.45102885 0.7396639 0.08715377
		 0.24306065 0.10203822 0.25526047 0.1003272 0.21860333 0.11609198 0.22927228 0.51356572
		 0.76027107 0.48785272 0.75464207 0.48785272 0.73025906 0.51286417 0.73435295 0.51064879
		 0.55907452 0.49376857 0.54093999 0.51138091 0.5275625 0.52808118 0.54640383 0.45384839
		 0.57502311 0.4416219 0.5867694 0.43243417 0.55863702 0.44106576 0.55093378 0.2218276
		 0.70871288 0.233593 0.70653427 0.41474518 0.54039258 0.42093873 0.53222936 0.42216513
		 0.56735933 0.43379948 0.59479624 0.19780496 0.118877 0.17760748 0.1079536 0.18408723
		 0.089366198 0.20833245 0.10207071 0.18473119 0.058951333 0.20117936 0.046398498 0.21880026
		 0.061352674 0.21305227 0.078790508 0.9546423 0.71088624 0.93321449 0.7064243 0.93321449
		 0.6875425 0.9586935 0.691737 0.93321449 0.66522002 0.93321449 0.64828032 0.95779055
		 0.651196 0.95700401 0.66824704 0.95747858 0.79667085 0.97379953 0.78372604 0.98067778
		 0.79571402 0.96556681 0.81198716 0.11684108 0.56769294 0.1187171 0.58915091 0.095382877
		 0.59003252 0.095165484 0.57039356 0.15574023 0.09531644 0.16122994 0.078325793 0.28339279
		 0.60681498 0.26397505 0.59485763 0.26518536 0.591703 0.28618059 0.60158265 0.2477316
		 0.59381157 0.24742426 0.58158565 0.2218276 0.67016929 0.23263472 0.66948837 0.2218276
		 0.6382345;
	setAttr ".uvst[0].uvsp[1500:1749]" 0.23203029 0.63640523 0.23616295 0.63188273
		 0.23973192 0.66823083 0.24153429 0.70006907 0.43029913 0.52586424 0.41385937 0.50189298
		 0.42061529 0.49848136 0.24553372 0.63629156 0.24657303 0.66634601 0.41440877 0.46967512
		 0.42287791 0.46924564 0.43191251 0.49402294 0.44394222 0.51743382 0.43572879 0.4671464
		 0.44798356 0.48673514 0.45332727 0.46085006 0.46985081 0.45184904 0.48091751 0.4691624
		 0.46517554 0.47805429 0.12107081 0.17999038 0.10945179 0.1976907 0.090676568 0.18655574
		 0.1039774 0.16923746 0.12792803 0.20977607 0.13957845 0.19322222 0.13269822 0.1631255
		 0.14469434 0.14638638 0.16213053 0.1597679 0.15104596 0.17812183 0.72448575 0.59950852
		 0.70129526 0.60266298 0.70129526 0.58175302 0.723728 0.58116013 0.70129526 0.56488866
		 0.70129526 0.54805964 0.72606611 0.54680717 0.72450101 0.56423348 0.65320474 0.78215522
		 0.64288908 0.78041577 0.64120299 0.76832896 0.65215695 0.76949239 0.6394943 0.75201684
		 0.65251678 0.75163686 0.7797547 0.47744545 0.77752227 0.49177945 0.76655978 0.48627955
		 0.76837093 0.47361678 0.78933376 0.50167429 0.7897808 0.48318228 0.79648238 0.46838033
		 0.8012417 0.49604639 0.047969338 0.32484609 0.030502297 0.31890661 0.03012355 0.3073504
		 0.04847841 0.31575891 0.048718799 0.30472434 0.066471495 0.31060505 0.063201323 0.32181776
		 0.061504539 0.33060247 0.073349163 0.33868939 0.078734107 0.33025092 0.14527994 0.86414897
		 0.13565733 0.86414897 0.13471566 0.84561443 0.14423844 0.84278613 0.99162817 0.71495444
		 0.98398137 0.72028828 0.96571445 0.72113752 0.96508765 0.7019015 0.13246933 0.54866922
		 0.11434702 0.54694206 0.11505377 0.5310443 0.13230397 0.52943319 0.13388082 0.58609295
		 0.13315637 0.56865567 0.1304597 0.60616189 0.14021401 0.60068238 0.93321449 0.71976459
		 0.95015728 0.72337663 0.84843457 0.83836031 0.83863837 0.83386004 0.83828735 0.82290721
		 0.84808284 0.82624817 0.82157052 0.41278723 0.8085351 0.4103274 0.81249732 0.40040392
		 0.8231234 0.40138155 0.81812656 0.46598712 0.8093124 0.46501198 0.80636024 0.44137937
		 0.82058698 0.44364646 0.47679615 0.86266214 0.46226284 0.87847602 0.4523949 0.87198061
		 0.4666428 0.85931528 0.81746483 0.73914707 0.80110866 0.73526394 0.79981041 0.72428286
		 0.81443733 0.72924733 0.48926926 0.65024412 0.48580378 0.65413105 0.47349736 0.64266372
		 0.47743303 0.63963449 0.39380819 0.5851028 0.38219973 0.58493137 0.38499534 0.57251334
		 0.39634386 0.57282704 0.020086687 0.58279836 0.0083223758 0.58510298 0.0085768197
		 0.57282734 0.019661762 0.57179743 0.57563609 0.76013154 0.56054229 0.7645458 0.55935419
		 0.75308782 0.57267672 0.74890542 0.59103215 0.75081575 0.58749491 0.73964626 0.37333089
		 0.4312714 0.3793731 0.42985559 0.38200974 0.43881911 0.37539729 0.44230786 0.53183055
		 0.68523782 0.52582192 0.67504025 0.53110391 0.66829926 0.53833932 0.67977959 0.39045256
		 0.46752548 0.39089522 0.48475745 0.38265023 0.48451287 0.38266993 0.46862057 0.38769183
		 0.42943349 0.38889343 0.43709037 0.020817347 0.42943367 0.027667085 0.43055651 0.024857793
		 0.4390803 0.019147396 0.43709064 0.016343946 0.48475772 0.016997214 0.46752578 0.023920875
		 0.4686183 0.023779782 0.48470041 0.26593608 0.79722208 0.2588416 0.78547573 0.26606786
		 0.7817654 0.27253905 0.79186618 0.067209229 0.87604964 0.063681506 0.86838508 0.06943512
		 0.86342371 0.074541941 0.87243962 0.25960013 0.74721253 0.26249859 0.76079208 0.25435302
		 0.7609055 0.25362697 0.75024962 0.81959403 0.76464355 0.81227601 0.76460308 0.81100208
		 0.75788093 0.82036239 0.75786978 0.29028231 0.91704488 0.28743222 0.90517879 0.29865807
		 0.90516639 0.29829904 0.91685665 0.22161618 0.93621075 0.23164912 0.93623394 0.2298926
		 0.94783062 0.22051691 0.94789833 0.090404443 0.93993849 0.097178794 0.94235057 0.097284935
		 0.9492237 0.090589799 0.95085144 0.7420643 0.6642561 0.76181412 0.65704226 0.76568705
		 0.67747092 0.74495161 0.6781944 0.34166887 0.63389182 0.33918467 0.64719343 0.31571081
		 0.63935453 0.31892696 0.61892587 0.27469894 0.52941513 0.29222098 0.53443128 0.28922492
		 0.54737854 0.26891729 0.54101628 0.31438333 0.53719836 0.31379792 0.55132335 0.11982103
		 0.48465809 0.13046955 0.48538601 0.13006653 0.49708116 0.11836684 0.49809861 0.97895545
		 0.65352046 0.98334795 0.66595447 0.96626753 0.66954947 0.96482885 0.65785432 0.33567885
		 0.67763442 0.33182541 0.69223565 0.30928791 0.69946891 0.30693942 0.69413078 0.10145432
		 0.4931803 0.10530803 0.4798438 0.13317426 0.47355279 0.12257411 0.47155628 0.12509483
		 0.45902434 0.13594466 0.46246368 0.3248938 0.88342845 0.32669112 0.89927351 0.31819317
		 0.90117472 0.31886572 0.88763589 0.31012139 0.89957708 0.31355104 0.8836785 0.54498601
		 0.79505855 0.54886365 0.78794378 0.55836308 0.79189461 0.55317724 0.8013941 0.53262603
		 0.78244978 0.52918255 0.79065198 0.53818738 0.84953302 0.53767002 0.86571985 0.52555186
		 0.85586482 0.5271309 0.840693 0.26843202 0.44995281 0.27961817 0.45239601 0.28782776
		 0.46776739 0.27466851 0.46283132 0.30915043 0.51273334 0.31370619 0.52422994 0.29322079
		 0.52155739 0.29342508 0.51139927 0.60606796 0.86979771 0.59222049 0.8656261 0.59361887
		 0.85307854 0.60602838 0.85585445 0.59858531 0.80244184 0.59761828 0.78389925 0.60605061
		 0.78727531 0.60627514 0.80278885 0.61380744 0.78244972 0.61366081 0.79666317 0.042206008
		 0.71765077 0.062744267 0.71969593 0.055257872 0.73745221 0.036485389 0.72965074 0.075599551
		 0.73680407 0.076350659 0.72097117 0.08898636 0.67080826 0.078029916 0.67404205 0.082815625
		 0.66144335 0.092546389 0.65892094 0.096870847 0.79239064 0.10940561 0.78361762 0.109692
		 0.79926521 0.099173807 0.80472082 0.10810455 0.47047177 0.11461369 0.45640862 0.18111271
		 0.85390604;
	setAttr ".uvst[0].uvsp[1750:1999]" 0.181822 0.86264586 0.17373939 0.86264586
		 0.17332806 0.85108691 0.45730242 0.85476339 0.45730242 0.84988385 0.46944821 0.85004485
		 0.46886137 0.85532385 0.16796355 0.85050005 0.16394994 0.84017938 0.1716309 0.84114951
		 0.17955199 0.84356689 0.79690886 0.6219973 0.78867084 0.62741798 0.78666413 0.6189642
		 0.7960884 0.61223805 0.78545612 0.61124748 0.7952683 0.60460925 0.80546832 0.59819156
		 0.80823493 0.60729736 0.81229287 0.61931998 0.8195073 0.62382567 0.82182431 0.60954249
		 0.8254683 0.6167748 0.020512342 0.40973377 0.026760284 0.41746822 0.019802308 0.4237397
		 0.015850207 0.41687647 0.15827172 0.82672942 0.16532743 0.82503372 0.17455049 0.83295399
		 0.1639498 0.83618784 0.089330398 0.7955451 0.090735458 0.80527169 0.080223791 0.80522531
		 0.079499699 0.79362381 0.067779608 0.80456823 0.067779608 0.79334092 0.067779608
		 0.78374028 0.076956309 0.78296453 0.8196466 0.25309387 0.83248854 0.23271203 0.84010035
		 0.23741651 0.82693273 0.25840873 0.81263423 0.2472524 0.82498151 0.22807235 0.77974904
		 0.25126415 0.76885337 0.23272511 0.77636057 0.22808543 0.78802687 0.24768642 0.77171123
		 0.25543419 0.76123917 0.23743106 0.72255212 0.1747485 0.71062648 0.15523933 0.71807873
		 0.15063359 0.73004514 0.17011757 0.72528517 0.14617972 0.7373271 0.16561715 0.8635065
		 0.16528974 0.87554258 0.14584865 0.88274914 0.15030271 0.87078881 0.16979034 0.89020145
		 0.15490825 0.87828159 0.17442127 0.69728386 0.13269964 0.68330657 0.11047774 0.69071245
		 0.10590066 0.70469761 0.12811781 0.69783288 0.10150009 0.71183264 0.12370793 0.88966006
		 0.12378792 0.90326935 0.10133877 0.91039014 0.10573953 0.89679527 0.1281978 0.91779566
		 0.11031661 0.90420902 0.13277963 0.747729 0.21554939 0.73578656 0.19601412 0.74331927
		 0.19135857 0.75530189 0.21086919 0.75067502 0.18681251 0.76273209 0.20627715 0.83842945
		 0.20615233 0.85048276 0.18668552 0.85783863 0.19123156 0.84585983 0.21074456 0.86537141
		 0.19588731 0.8534326 0.21542478 0.073104121 0.92334938 0.072349183 0.91418308 0.081878342
		 0.91393113 0.084178291 0.92334938 0.62993985 0.0068104486 0.63597608 0.0019781955
		 0.64224631 0.011844396 0.63517809 0.016212661 0.96538758 0.0019782411 0.97142833
		 0.0068135974 0.96569401 0.015909163 0.95862597 0.011541079 0.10330752 0.91736245
		 0.10255733 0.92652863 0.091838725 0.92652863 0.094138764 0.91711038 0.19922681 0.85844415
		 0.19932793 0.86264586 0.19164887 0.86264586 0.19156875 0.85737008 0.19250575 0.84971547
		 0.78985047 0.64176583 0.7911101 0.64871228 0.78603476 0.65059525 0.78268719 0.64270806
		 0.79722172 0.63258666 0.80616266 0.63579041 0.17124838 0.79471397 0.18526079 0.80496347
		 0.17993818 0.81034768 0.17148748 0.80593789 0.17494301 0.81528652 0.16804427 0.81263512
		 0.39682162 0.91708374 0.39371827 0.91871947 0.39176688 0.91108519 0.32896724 0.90845764
		 0.32088116 0.90969729 0.32076043 0.90652567 0.3271395 0.90516621 0.52908427 0.92978048
		 0.52908427 0.92191756 0.53498995 0.92238683 0.53538162 0.93071979 0.46941453 0.82164025
		 0.46886241 0.83215642 0.45730242 0.83095211 0.45730242 0.82092887 0.7562927 0.59685564
		 0.76596212 0.59040529 0.77413481 0.59846389 0.76412952 0.60365778 0.77673036 0.58115733
		 0.78406018 0.5895828 0.78795749 0.57273221 0.79385388 0.58067983 0.040967554 0.36372441
		 0.037668902 0.37904474 0.023425676 0.36433023 0.027726954 0.35539711 0.049770892
		 0.36892885 0.04485723 0.38688233 0.36110163 0.77338845 0.36018053 0.76177365 0.37333408
		 0.7582503 0.3739841 0.77647811 0.34677914 0.77250886 0.34677914 0.76257348 0.45730242
		 0.84168148 0.46916515 0.84255463 0.78094751 0.6051271 0.7716769 0.61156744 0.77698189
		 0.61763889 0.79089111 0.59711301 0.80094749 0.58821535 0.020706188 0.39137524 0.013440103
		 0.38284862 0.018960852 0.37349042 0.026675956 0.38340992 0.028212115 0.40021801 0.025049083
		 0.39121482 0.027315537 0.39127579 0.029439434 0.39763981 0.26139763 0.9202081 0.26667815
		 0.90701568 0.27909774 0.90680134 0.27395555 0.92498356 0.34677914 0.74280459 0.35990036
		 0.74320394 0.38372386 0.55761963 0.38340205 0.5414874 0.39364263 0.54109609 0.39504701
		 0.55712998 0.011147366 0.55713028 0.013109909 0.54109627 0.021558594 0.54057723 0.021076355
		 0.55673772 0.79275745 0.70567328 0.80143601 0.69462556 0.81108612 0.70196998 0.80483651
		 0.71348143 0.41909587 0.95575315 0.42519483 0.94551516 0.43067884 0.94879079 0.42586136
		 0.95814604 0.82148194 0.70713007 0.81672996 0.71878511 0.25551301 0.72085941 0.25459859
		 0.70639956 0.26450437 0.70590127 0.26602405 0.71931058 0.81563324 0.31770912 0.81597227
		 0.30617452 0.82309467 0.30544695 0.82276177 0.31772965 0.81386656 0.38819575 0.81467295
		 0.37478647 0.82395643 0.3750428 0.82367438 0.38910219 0.55530006 0.74300718 0.55041087
		 0.73144019 0.56076187 0.72685736 0.56741333 0.73836666 0.56878322 0.71934026 0.57852477
		 0.73020214 0.39653507 0.8987118 0.39566404 0.90660143 0.39418793 0.9052372 0.3944827
		 0.89893109 0.48518977 0.97751868 0.48636633 0.97237337 0.48789594 0.9733448 0.48758692
		 0.97814506 0.10515589 0.95934844 0.10353242 0.95521122 0.10925238 0.9551236 0.11037059
		 0.95934844 0.16847458 0.81387866 0.1728349 0.8167603 0.17078274 0.81819493 0.16889349
		 0.81508923 0.048297573 0.94258296 0.050093465 0.94677103 0.045417089 0.94584918 0.04576312
		 0.94346279 0.75999832 0.84721684 0.7587114 0.8455708 0.76077467 0.84509456 0.76133609
		 0.84505057 0.15988345 0.81632149 0.1618658 0.81414771 0.164373 0.81490159 0.16211018
		 0.81626874 0.16368395 0.78516555 0.16351128 0.7836175 0.16848563 0.78524834 0.16874263
		 0.78643614 0.79811609 0.64089209 0.79861295 0.64702028 0.79709816 0.64779949 0.79649067
		 0.64158875 0.79836565 0.64134914 0.79773337 0.639898;
	setAttr ".uvst[0].uvsp[2000:2249]" 0.79767185 0.63826293 0.79938614 0.64075661
		 0.16394925 0.81231207 0.15929021 0.81337321 0.15721524 0.8055793 0.16351137 0.80535448
		 0.1653474 0.81340158 0.16670844 0.81446213 0.18382667 0.8189351 0.17453589 0.81882834
		 0.17257914 0.81878197 0.17067432 0.81873685 0.17116806 0.82175505 0.17923801 0.8267296
		 0.045100175 0.94096619 0.045355469 0.93920672 0.76086235 0.85269451 0.7625311 0.84887975
		 0.32781523 0.91551989 0.31994808 0.9171831 0.95239234 0.8452369 0.96224266 0.8464399
		 0.95896983 0.84929138 0.95340192 0.84754473 0.48941895 0.9748081 0.48952737 0.97927839
		 0.48758692 0.97814506 0.48789594 0.9733448 0.48357821 0.97937828 0.48518977 0.97751868
		 0.16498893 0.79393619 0.071253374 0.93741858 0.071178809 0.94510537 0.069210701 0.94479072
		 0.06946487 0.93739939 0.79960775 0.65260857 0.79790896 0.65305084 0.96111441 0.82995069
		 0.95992047 0.83032447 0.95911425 0.82455403 0.9602859 0.82377249 0.96181017 0.83536595
		 0.96178162 0.83669329 0.95378143 0.83667547 0.95425755 0.83512574 0.071243696 0.94826365
		 0.069409199 0.94797361 0.68955433 0.76494843 0.70425206 0.75260079 0.70460176 0.75629532
		 0.69336951 0.76767576 0.87644923 0.81600004 0.8745091 0.82937771 0.86947078 0.82912326
		 0.87183189 0.81405503 0.80500621 0.81476015 0.81124043 0.80628115 0.81425434 0.80787569
		 0.80720419 0.81929904 0.027560489 0.38795686 0.81705266 0.79194373 0.81297684 0.79363632
		 0.042770933 0.41685274 0.032784447 0.40757135 0.039576687 0.40007475 0.052134633
		 0.40485021 0.067779608 0.83290917 0.067779608 0.81720954 0.08052063 0.81777549 0.080900833
		 0.83179468 0.16954806 0.82100224 0.16797107 0.82026941 0.010040697 0.4022074 0.0088852933
		 0.41097769 0.78728777 0.82315773 0.79407328 0.83136278 0.78450805 0.83864379 0.78176779
		 0.8299439 0.15038703 0.92562121 0.15030736 0.91689306 0.15894085 0.92243427 0.16840513
		 0.93526584 0.33935568 0.8264817 0.35096061 0.81863254 0.35275587 0.8299526 0.34076962
		 0.83798742 0.042844493 0.9098568 0.034902506 0.90886146 0.037254564 0.88965493 0.044925954
		 0.90089321 0.37674347 0.9403705 0.37638575 0.92805105 0.38158718 0.92271107 0.38428915
		 0.9252283 0.2019425 0.92834246 0.20255475 0.91988254 0.20354515 0.91843724 0.21104327
		 0.93269885 0.68585432 0.78303808 0.68237132 0.78119034 0.78681195 0.79808027 0.79199666
		 0.79194373 0.79414487 0.80377692 0.78809112 0.80417812 0.010092353 0.93879759 0.01235771
		 0.93874508 0.013448317 0.94650245 0.0099992631 0.94870138 0.35926169 0.81314218 0.35852182
		 0.81953377 0.91299719 0.84917611 0.91300887 0.83699447 0.92197245 0.83512592 0.91769731
		 0.84713167 0.79022688 0.81591994 0.79887086 0.81916618 0.35589346 0.83746141 0.3462894
		 0.84951562 0.084883668 0.89195728 0.087492548 0.900657 0.080423959 0.90993941 0.081777766
		 0.88965464 0.23718999 0.90998274 0.22896399 0.90723586 0.22795132 0.89930058 0.2397421
		 0.89927256 0.22896399 0.89137173 0.23718999 0.88861579 0.02359488 0.4047617 0.014066905
		 0.39634877 0.03349065 0.42544216 0.8664785 0.77671009 0.868985 0.77264428 0.87558067
		 0.77264696 0.87249082 0.7783255 0.64487344 0.64998323 0.64516765 0.64054811 0.65201867
		 0.63890028 0.65099466 0.65053374 0.33791602 0.89306283 0.33350888 0.88633966 0.34081447
		 0.88342863 0.34393343 0.88916612 0.41401687 0.79404575 0.41354513 0.78793412 0.42167923
		 0.79160696 0.42108935 0.79599851 0.078091793 0.70394248 0.068374716 0.70483744 0.072972424
		 0.69093001 0.082484521 0.68835437 0.13694018 0.43070874 0.13095781 0.44382134 0.12175419
		 0.44165874 0.12891898 0.42943358 0.12090763 0.83595723 0.11123345 0.83579296 0.10746114
		 0.82134074 0.11719318 0.81925368 0.53794771 0.82556015 0.54046196 0.80708015 0.54855007
		 0.81315088 0.54595488 0.82916254 0.52752757 0.80208963 0.52740252 0.82043439 0.29439667
		 0.48085514 0.30230662 0.4988122 0.29059142 0.49913245 0.28333226 0.48132062 0.606754
		 0.83607352 0.59568924 0.83747834 0.59810799 0.81763935 0.60644668 0.81714988 0.063851118
		 0.68687922 0.053674988 0.70226175 0.12576953 0.8855108 0.12008641 0.88784105 0.12023731
		 0.86880428 0.12712713 0.86533552 0.21298505 0.8846243 0.20682691 0.8638221 0.2139321
		 0.85771292 0.22702111 0.86716694 0.42599237 0.45012453 0.41265064 0.45217085 0.41076314
		 0.44088987 0.41929889 0.43861029 0.15047885 0.10797951 0.16732566 0.11940232 0.15667623
		 0.13183668 0.14157219 0.1205287 0.17469396 0.14563437 0.18747641 0.1324027 0.72487903
		 0.6352064 0.70129526 0.63947284 0.70129526 0.62059557 0.7236101 0.61708218 0.04445859
		 0.39541441 0.034801386 0.40239248 0.20098004 0.91604233 0.20280303 0.91445386 0.81654507
		 0.59538138 0.81928355 0.60276574 0.026740937 0.40080905 0.037123874 0.38514447 0.045223746
		 0.38747409 0.029543476 0.38836408 0.50111866 0.94439948 0.51502573 0.94356829 0.51250863
		 0.95073217 0.50823587 0.95061463 0.8117851 0.78709835 0.8131578 0.78280836 0.81939745
		 0.78254479 0.81908441 0.78717744 0.27851671 0.83599877 0.27309129 0.83333868 0.50616741
		 0.93463117 0.51317793 0.93472707 0.57463193 0.91791916 0.56114203 0.91780764 0.56216532
		 0.90957022 0.5721733 0.90922004 0.29437131 0.83539587 0.28642097 0.83712167 0.02070345
		 0.81299269 0.021186054 0.80792892 0.023997355 0.80472088 0.028516755 0.80702537 0.56780857
		 0.92437005 0.56254375 0.92462605 0.4921324 0.60339385 0.5103299 0.59634316 0.51952022
		 0.61300564 0.49972448 0.62199622 0.39866525 0.60660553 0.38710922 0.61324573 0.39067617
		 0.59873289 0.3972483 0.59732622 0.52336603 0.87134296 0.52756208 0.88667434 0.52411407
		 0.88857472 0.51865929 0.88256347 0.93967879 0.75975549 0.93106222 0.78025126 0.92988819
		 0.77031386 0.93737394 0.75137973 0.50717896 0.63660198 0.52235305 0.62766629 0.14978689
		 0.0074170358;
	setAttr ".uvst[0].uvsp[2250:2499]" 0.15832447 0.014644607 0.14234392 0.02908971
		 0.13349259 0.02146952 0.11575942 0.5181613 0.13051318 0.51790321 0.98902732 0.6892001
		 0.96534628 0.69037157 0.27041903 0.58140558 0.25797826 0.56114048 0.29221892 0.5915674
		 0.77499253 0.73727798 0.75331795 0.74606746 0.74023396 0.72727734 0.74905819 0.69904763
		 0.055671483 0.75011742 0.075107642 0.7464208 0.02947229 0.74162829 0.32521218 0.51917815
		 0.33218479 0.53122103 0.2799325 0.5179314 0.96511722 0.64602113 0.97370481 0.64201152
		 0.3271912 0.71361363 0.30943421 0.71319652 0.07866621 0.75899029 0.055275396 0.76497024
		 0.93321449 0.74433726 0.93321449 0.72998178 0.94362581 0.73395741 0.94273627 0.74738824
		 0.81440216 0.26602033 0.80515534 0.25953856 0.79730093 0.25886318 0.78634393 0.2659314
		 0.77911311 0.27508336 0.14746457 0.58261913 0.15039305 0.56951779 0.1500541 0.59374142
		 0.92361724 0.084241353 0.93101513 0.088813506 0.91651142 0.079849541 0.67742133 0.084442087
		 0.68452716 0.080050096 0.67002326 0.089014053 0.93986535 0.05783572 0.94725394 0.062402211
		 0.93277687 0.053454679 0.66109633 0.058083732 0.66818482 0.053702869 0.6537078 0.062650219
		 0.95302325 0.036478452 0.96040654 0.041041296 0.9459452 0.032103617 0.64789373 0.03675421
		 0.65497196 0.032379553 0.64051062 0.041317232 0.97307181 0.020468902 0.62780064 0.020772399
		 0.98681307 0.77832395 0.99556899 0.78298932 0.99800801 0.79245847 0.98692125 0.79245847
		 0.26280364 0.74392658 0.26559407 0.75055754 0.26744184 0.75423521 0.26673633 0.75857776
		 0.57020748 0.97104692 0.56168139 0.96553957 0.56019306 0.9579457 0.56617618 0.96034318
		 0.070245728 0.85436738 0.073416837 0.84983712 0.078735389 0.85608709 0.076034702
		 0.85965222 0.51888478 0.96550477 0.51453489 0.97054482 0.50599682 0.96431535 0.51626235
		 0.95758957 0.20108773 0.88910389 0.20838411 0.90373021 0.20741543 0.90987962 0.20361209
		 0.91046244 0.019727506 0.92337704 0.029620696 0.91491902 0.030227421 0.92088991 0.020908646
		 0.93475366 0.8125543 0.77849823 0.81953835 0.77942467 0.61417598 0.95141309 0.61515236
		 0.95378435 0.60441327 0.95021188 0.61392152 0.93788958 0.28942671 0.85030872 0.27622694
		 0.85029811 0.43095642 0.92783302 0.44166434 0.92415267 0.44669336 0.93561673 0.44080821
		 0.94152355 0.74748075 0.79290026 0.75963295 0.78413296 0.76248246 0.79439598 0.76077193
		 0.79277861 0.63693684 0.92569113 0.62311196 0.91849041 0.62584108 0.90843636 0.63998705
		 0.91822916 0.92988479 0.83113438 0.91819453 0.83097875 0.92016345 0.81828547 0.92811376
		 0.81649542 0.76134181 0.80135363 0.74896216 0.81075346 0.81959313 0.76532578 0.8264662
		 0.76521963 0.82563537 0.77887446 0.63684738 0.93494236 0.62402439 0.9258849 0.75416976
		 0.75766301 0.75946641 0.76120299 0.75389361 0.76942605 0.75006711 0.76439738 0.29736608
		 0.82804734 0.29855308 0.83340538 0.96837807 0.84329331 0.97505856 0.83431596 0.98012537
		 0.8421098 0.97444344 0.84860343 0.025683368 0.79740316 0.029616304 0.79087651 0.03405831
		 0.79471362 0.69395989 0.84160739 0.70129871 0.83729279 0.70008761 0.84427267 0.6940316
		 0.85082972 0.02277478 0.80142236 0.52544922 0.68809164 0.52060837 0.67873698 0.25471061
		 0.64900804 0.25417393 0.63659889 0.26184863 0.63728935 0.26236403 0.64882392 0.74612665
		 0.75963795 0.74821681 0.75472414 0.29568875 0.82282132 0.06260445 0.86309487 0.066572025
		 0.85925633 0.2783038 0.81296134 0.28389925 0.81016994 0.29222021 0.81195551 0.7408399
		 0.75561762 0.74224341 0.75005889 0.038688507 0.79793 0.036379341 0.80780745 0.0019920222
		 0.95269281 0.0062647802 0.9528299 0.0073720422 0.96097755 0.0036911319 0.96200776
		 0.27361909 0.73671335 0.27431059 0.74576151 0.082047731 0.83690071 0.089149445 0.84724981
		 0.59586841 0.96044368 0.59649909 0.97087544 0.58948857 0.97102076 0.59044302 0.95777595
		 0.26393571 0.94799507 0.25392771 0.94760257 0.25574818 0.93811518 0.25992996 0.93614817
		 0.76846194 0.77149081 0.76301676 0.78014153 0.018042553 0.79212588 0.018658586 0.78296453
		 0.56228089 0.93350554 0.5659743 0.93195492 0.82508641 0.78239286 0.54614025 0.7053358
		 0.53950369 0.69598728 0.54573119 0.6894269 0.55276859 0.69833767 0.5387252 0.7095018
		 0.53313744 0.69964373 0.81566632 0.34731692 0.8160367 0.33472744 0.82342172 0.33373213
		 0.82358164 0.34676319 0.25437483 0.67782283 0.25429642 0.66512883 0.26222107 0.66584224
		 0.26283628 0.67843175 0.82525438 0.68154132 0.83168542 0.67251647 0.8385036 0.67584771
		 0.83312136 0.68530953 0.81799597 0.6752668 0.82500899 0.66657257 0.014794462 0.51110685
		 0.015614379 0.49815556 0.023332404 0.49869257 0.022835197 0.51154965 0.38320127 0.5114274
		 0.38285902 0.49841562 0.39151198 0.49815533 0.39220449 0.51110661 0.024512084 0.82862544
		 0.030478749 0.81985193 0.037165672 0.82363057 0.031326596 0.83288682 0.018038355
		 0.82696795 0.023777409 0.81838113 0.81578869 0.294348 0.82352191 0.29348332 0.25360176
		 0.62458903 0.26191702 0.62546283 0.26012388 0.77281666 0.2670165 0.77182138 0.2728129
		 0.78052998 0.25301147 0.7761336 0.017249649 0.45445994 0.02426056 0.45593795 0.38244197
		 0.45595956 0.39052615 0.45445973 0.5155862 0.92416471 0.51406032 0.93063962 0.50893575
		 0.92950416 0.51164895 0.92414492 0.50438172 0.92684323 0.509278 0.92250073 0.50123
		 0.92047048 0.50298196 0.9133051 0.50850636 0.91618758 0.50775105 0.91974711 0.51105303
		 0.91409773 0.5153625 0.913315 0.51665169 0.91813147 0.5115208 0.91869384 0.63619876
		 0.6338101 0.64294356 0.63235104 0.63799739 0.64380091 0.65105855 0.63209116 0.68423617
		 0.65958416 0.69090998 0.66056508 0.68841004 0.66829121 0.68274677 0.66639328 0.35539484
		 0.95643097 0.35209677 0.94977945 0.35842335 0.94441098 0.36295551 0.95199895 0.4459441
		 0.90742916 0.44774145 0.92016119;
	setAttr ".uvst[0].uvsp[2500:2749]" 0.44109577 0.91993612 0.44001967 0.91044956
		 0.95602095 0.75800407 0.94870412 0.75801599 0.94742876 0.75147098 0.95678908 0.75137973
		 0.78935063 0.85656095 0.7890116 0.84276801 0.80025983 0.84276801 0.79732418 0.85642183
		 0.72542059 0.837322 0.73542017 0.837322 0.73381138 0.85086483 0.7244947 0.85097575
		 0.12158915 0.89242387 0.1191737 0.89902711 0.11230411 0.89907807 0.11067615 0.89253634
		 0.84682316 0.85625893 0.84588248 0.84235185 0.85294294 0.84481329 0.85283947 0.84909678
		 0.949184 0.77953804 0.95049912 0.77664346 0.95617259 0.77632153 0.95594794 0.77761745
		 0.60977459 0.9267872 0.61602932 0.9284727 0.61293089 0.93389803 0.60824877 0.93326223
		 0.4368141 0.95147836 0.4368141 0.94551498 0.44911209 0.94587713 0.44911209 0.95828849
		 0.14862621 0.93984491 0.14862616 0.95116889 0.13743876 0.94839454 0.13743885 0.93972069
		 0.60955089 0.91593754 0.61549026 0.9126181 0.61697656 0.92056841 0.61084014 0.9207539
		 0.96121222 0.77629632 0.96187806 0.77973449 0.66751397 0.82410312 0.66225082 0.8243652
		 0.66093278 0.81760985 0.67442375 0.81785607 0.44902834 0.90413535 0.45193568 0.9110961
		 0.45375291 0.91492414 0.4520326 0.91938359 0.49986148 0.96838176 0.49121073 0.96301287
		 0.48983884 0.95549625 0.49566734 0.95781922 0.70139045 0.80487168 0.70462698 0.80050784
		 0.71000403 0.80643129 0.70730883 0.80988544 0.60998088 0.95777577 0.61489671 0.96200168
		 0.60710531 0.9711414 0.60263449 0.95967299 0.18750963 0.88910389 0.1949524 0.90372676
		 0.19382529 0.90972209 0.19002597 0.91032702 0.054808624 0.92208463 0.064452782 0.91393089
		 0.065254353 0.91971773 0.055780862 0.9334079 0.94958955 0.77191436 0.95618743 0.77269793
		 0.71481079 0.83094144 0.71580499 0.83329898 0.7038098 0.82858229 0.71545547 0.81760997
		 0.7529828 0.81858855 0.75598854 0.83331722 0.74278879 0.83328509 0.74507856 0.81764144
		 0.46642938 0.93463117 0.47115958 0.94661701 0.4600662 0.95150483 0.45434394 0.94652236
		 0.86233371 0.7932272 0.87315291 0.78231698 0.87716228 0.79382944 0.87543291 0.79220647
		 0.91917676 0.80297053 0.90572083 0.79590333 0.90955919 0.78458875 0.92200887 0.79638439
		 0.63364398 0.95479834 0.62195373 0.95470893 0.62392259 0.94042015 0.63187295 0.93893391
		 0.87621045 0.80070662 0.86369085 0.8100636 0.11247154 0.91311884 0.11806137 0.91266847
		 0.91917366 0.81237632 0.906385 0.80322468 0.58277071 0.88180643 0.58803064 0.88524252
		 0.5824095 0.8931011 0.57854247 0.88827354 0.60763377 0.90962857 0.61293328 0.9084363
		 0.90065402 0.82649797 0.90503311 0.81636786 0.91168356 0.82473332 0.9061324 0.8311224
		 0.86525559 0.76365256 0.86929089 0.75689149 0.87359583 0.7607457 0.65305126 0.96301836
		 0.66025782 0.95878989 0.65912664 0.96570981 0.65291131 0.97219276 0.86253244 0.76762694
		 0.86479139 0.77105147 0.574619 0.8835755 0.57684767 0.87889397 0.6058374 0.92676741
		 0.6057092 0.92131627 0.50827527 0.9087044 0.51344538 0.90700608 0.60346645 0.92512321
		 0.60193956 0.92236954 0.60269475 0.91881019 0.60524136 0.91672021 0.081199698 0.96021616
		 0.076300092 0.95672441 0.076247163 0.95166361 0.082451843 0.95364934 0.4981122 0.92542183
		 0.49467403 0.92044908 0.4970445 0.91273069 0.56933206 0.87955678 0.57030571 0.87378901
		 0.87822878 0.76388502 0.70074266 0.81361842 0.69773823 0.80968064 0.048961766 0.95170951
		 0.053245202 0.95183492 0.054905299 0.95994449 0.05105824 0.96090037 0.45943412 0.89711726
		 0.46042579 0.9060992 0.71156693 0.7870295 0.72020829 0.79799473 0.8259207 0.84475398
		 0.82655144 0.85663265 0.81954092 0.85663277 0.82049537 0.84273511 0.39524212 0.95696837
		 0.38523406 0.95670879 0.38705459 0.94583935 0.39123636 0.94436193 0.59689534 0.89517713
		 0.58991599 0.90444481 0.857777 0.75820959 0.85868818 0.74910784 0.66178793 0.83330119
		 0.66538298 0.83168805 0.96177733 0.77224755 0.63844717 0.65119869 0.31090567 0.74836242
		 0.30433932 0.75052214 0.30354768 0.74613059 0.31098133 0.74280459 0.40858206 0.79261988
		 0.40814042 0.7854144 0.68822825 0.67752409 0.68289351 0.67802662 0.64467776 0.66055435
		 0.63831919 0.66046119 0.65063655 0.66098255 0.68783379 0.68823618 0.68250328 0.68847543
		 0.3423613 0.90113717 0.34803677 0.89642501 0.41405892 0.80281264 0.40871927 0.80219066
		 0.42108324 0.80402881 0.31114516 0.75686044 0.30463618 0.75855249 0.067612484 0.61989659
		 0.063787602 0.61355841 0.068693779 0.61015344 0.073146373 0.61685759 0.64421576 0.69672585
		 0.63794863 0.69322687 0.63817501 0.68153483 0.64452225 0.68532252 0.65039635 0.6890527
		 0.65078169 0.69989055 0.68721831 0.72513568 0.68115163 0.72738355 0.68177348 0.71654564
		 0.68731159 0.71406507 0.40551418 0.88998789 0.40043691 0.88195151 0.40444893 0.87413412
		 0.40979737 0.88273221 0.41612193 0.87759477 0.41065589 0.87031424 0.41533145 0.83259165
		 0.41470936 0.82207096 0.42181754 0.82149065 0.42252722 0.83139259 0.31115821 0.78657722
		 0.30444509 0.78591621 0.3048116 0.77601433 0.31127894 0.77630359 0.08830516 0.64066786
		 0.080256581 0.64217365 0.076326929 0.63406491 0.082710125 0.63215995 0.63855976 0.66955775
		 0.64467096 0.67099404 0.65073603 0.67235702 0.68209273 0.69984996 0.68756986 0.69918984
		 0.39392635 0.87099689 0.39853692 0.86527354 0.40542099 0.86263311 0.41406214 0.81146622
		 0.42143688 0.81200886 0.30462268 0.76653254 0.31141245 0.76540631 0.071615323 0.62610996
		 0.078002356 0.62310207 0.55445474 0.71785533 0.56225586 0.71035653 0.3929145 0.52866787
		 0.3836326 0.52895391 0.013923072 0.52866811 0.022242527 0.52847552 0.80874729 0.686746
		 0.81708646 0.69348991 0.8263002 0.69791669 0.25448248 0.69440848 0.2636928 0.69449705
		 0.81517357 0.36338225 0.82375962 0.36337769 0.54561347 0.72232515 0.83259386 0.65704232;
	setAttr ".uvst[0].uvsp[2750:2999]" 0.8394438 0.66199851 0.88420558 0.84914213
		 0.87848258 0.83784676 0.88503808 0.83511412 0.89175135 0.8469882 0.78342265 0.71507996
		 0.25735652 0.73272187 0.26814485 0.73151875 0.85637456 0.86362129 0.85612333 0.8638345
		 0.85465431 0.86046374 0.85490555 0.86025047 0.68445647 0.86029798 0.68414873 0.8602978
		 0.68391627 0.85791147 0.68422389 0.85791165 0.76107782 0.84496528 0.7616393 0.84492129
		 0.39002842 0.9655174 0.39033607 0.96551722 0.39118356 0.96827084 0.39087591 0.96827102
		 0.39031819 0.9631502 0.39062575 0.96315002 0.54417032 0.98607934 0.54386723 0.98594975
		 0.54409057 0.98548728 0.5443936 0.9856168 0.5440951 0.98897278 0.54379207 0.98884314
		 0.76283431 0.84875035 0.39116877 0.96096003 0.39147651 0.96095985 0.68347681 0.85541481
		 0.68378437 0.85541499 0.94824296 0.8463856 0.95054793 0.83663887 0.96966147 0.8265031
		 0.96683389 0.81901503 0.79189992 0.65296119 0.027813427 0.89773518 0.025144545 0.89108247
		 0.028767228 0.90085977 0.25457606 0.61080647 0.26269048 0.61682063 0.078539856 0.88566333
		 0.084981553 0.88048226 0.13904345 0.93572938 0.13081782 0.9249171 0.13411191 0.91720682
		 0.14381456 0.92885095 0.8147549 0.28570583 0.82233298 0.27907479 0.069393776 0.67433274
		 0.54524684 0.85218883 0.11703985 0.79657018 0.10108123 0.82324541 0.30869716 0.80617839
		 0.2989969 0.80581015 0.3017171 0.79769009 0.31045994 0.79729319 0.41844794 0.8521859
		 0.41623086 0.84322029 0.42504418 0.84316647 0.42799968 0.85128647 0.26977763 0.44116443
		 0.27935791 0.44288605 0.25414699 0.4450027 0.25942153 0.43704611 0.68939936 0.74535179
		 0.68080044 0.74764538 0.68078929 0.73630184 0.68847466 0.7349233 0.64312261 0.71759093
		 0.64371818 0.70654809 0.65192121 0.70880884 0.65235871 0.72015238 0.10575742 0.65356708
		 0.090885743 0.65021551 0.099942252 0.64543003 0.082616121 0.65216339 0.27222919 0.43150324
		 0.28112176 0.43248555 0.26474088 0.42943352 0.094996467 0.63815659 0.11429417 0.94500434
		 0.11102583 0.95113218 0.10342024 0.94557446 0.10819613 0.93993837 0.39536232 0.85803783
		 0.40171275 0.85617745 0.4397558 0.71033967 0.44022995 0.69486105 0.45047608 0.69339848
		 0.44802687 0.70965981 0.42842209 0.71247631 0.42842209 0.69721889 0.44162059 0.78081423
		 0.42842209 0.77810925 0.42842209 0.75988472 0.43987069 0.76052624 0.79424649 0.44072783
		 0.80318719 0.52102464 0.79385936 0.52544707 0.048347536 0.21928087 0.068150759 0.22962292
		 0.086273625 0.31976083 0.07925906 0.20732562 0.51262355 0.78008997 0.48785272 0.77569199
		 0.0019921134 0.25004545 0.017668188 0.25962126 0.57859266 0.77326363 0.56174421 0.77845836
		 0.82089835 0.42552781 0.80576003 0.42353159 0.57911313 0.93788952 0.57934111 0.94824284
		 0.5654341 0.95395416 0.56590891 0.942994 0.79383475 0.74050552 0.81114918 0.75259537
		 0.80258495 0.75127167 0.47869906 0.87226909 0.46670663 0.89098686 0.017612517 0.59732646
		 0.0063782674 0.59873313 0.38021675 0.5987497 0.35624349 0.86674243 0.34153447 0.87943709
		 0.3347955 0.87011248 0.34824729 0.85727251 0.44555959 0.44293365 0.46155345 0.43502215
		 0.98467934 0.7419861 0.99800789 0.72624731 0.99550104 0.73544014 0.96883458 0.74112397
		 0.095570154 0.54841173 0.13664667 0.084891334 0.14206375 0.067060702 0.43819219 0.42943349
		 0.49518484 0.5097459 0.47788078 0.52289182 0.46178743 0.50552201 0.47964054 0.49381414
		 0.4748466 0.60925245 0.4852927 0.62458175 0.28550774 0.85430014 0.29586932 0.8566708
		 0.30107674 0.87225026 0.28992736 0.87616217 0.49048746 0.6414302 0.48785272 0.68494898
		 0.51227397 0.68190217 0.15660299 0.84017926 0.15556888 0.86414897 0.1283139 0.052471943
		 0.11928806 0.041668281 0.15519758 0.038411427 0.17071995 0.048811156 0.40840086 0.44959062
		 0.40480065 0.441315 0.22406787 0.84017938 0.23191148 0.84670073 0.23048212 0.61240035
		 0.23616523 0.61080652 0.2218276 0.61408383 0.30012217 0.69916159 0.30016142 0.70429915
		 0.29647881 0.71594596 0.29860446 0.73815399 0.31015912 0.73881316 0.72587126 0.65097046
		 0.70129526 0.65559262 0.11143188 0.88843244 0.11143188 0.86964124 0.77144665 0.70075274
		 0.77728724 0.73224711 0.33629224 0.66253155 0.30914035 0.6626364 0.10965549 0.033342984
		 0.12677152 0.013654574 0.14369902 0.0019782411 0.11627415 0.50888282 0.12915571 0.50820118
		 0.98612589 0.67770845 0.96571046 0.68066943 0.11736145 0.84544927 0.12301338 0.83994883
		 0.11143188 0.84750193 0.2813153 0.56413013 0.26335874 0.55112857 0.31220469 0.57180321
		 0.47955346 0.59616393 0.49969217 0.58303922 0.46125227 0.53571606 0.47365087 0.55705452
		 0.37156036 0.61493438 0.52725887 0.57695174 0.48792493 0.57491821 0.467446 0.59786087
		 0.45595732 0.6104725 0.46737921 0.62372351 0.46398252 0.62967902 0.45021605 0.61980116
		 0.42842209 0.66903687 0.44213891 0.66829926 0.11808903 0.15325893 0.54263395 0.61829567
		 0.53309888 0.60450089 0.48785272 0.67071921 0.51182234 0.66829926 0.027596811 0.29817176
		 0.029364962 0.2837745 0.81211859 0.51683939 0.81103408 0.53911054 0.80207658 0.54281569
		 0.010539912 0.27490363 0.03580967 0.26585916 0.80979782 0.49108326 0.82184225 0.48833168
		 0.82178098 0.5116967 0.54777908 0.62901831 0.52733082 0.63971025 0.45208502 0.75948691
		 0.50581545 0.65883684 0.50236058 0.66430777 0.53729725 0.90278238 0.5294863 0.90065855
		 0.12772442 0.90418166 0.1446927 0.89242387 0.13803704 0.90714353 0.12810659 0.91321534
		 0.81960231 0.75387836 0.78136003 0.45887506 0.78584695 0.43891048 0.76923943 0.45576119
		 0.45512202 0.78142297 0.099021941 0.50451314 0.081653647 0.7691704 0.057444926 0.77897298
		 0.13882369 0.44977134 0.46898687 0.81128567 0.45730242 0.80943489 0.74760818 0.59172916
		 0.75710344 0.58464855 0.76811081 0.57486778 0.78014386 0.56491685 0.79451209 0.5569163;
	setAttr ".uvst[0].uvsp[3000:3249]" 0.80153137 0.5644874 0.043659117 0.35347855
		 0.053121746 0.35925996 0.3623507 0.78453362 0.37474629 0.78610522 0.34677914 0.78335506
		 0.46884796 0.79913121 0.45730242 0.79745597 0.47960824 0.80160218 0.47942165 0.81431091
		 0.75708324 0.57005924 0.74572045 0.5807032 0.77060801 0.55800033 0.78272259 0.54680717
		 0.046158656 0.33762816 0.057648264 0.3439672 0.36413926 0.79833406 0.37601054 0.8013739
		 0.34677914 0.79728395 0.46933019 0.78646523 0.45730242 0.78541452 0.48046991 0.78695148
		 0.74233896 0.56387681 0.73304403 0.57559329 0.76113111 0.55110604 0.031479005 0.33226165
		 0.067704655 0.34979185 0.36531365 0.8091507 0.34677914 0.80834502 0.6722765 0.84389275
		 0.67374969 0.84397411 0.67435068 0.84732461 0.67294157 0.84732461 0.95894963 0.81885225
		 0.95733845 0.82168049 0.95717359 0.81597871 0.19372529 0.94124383 0.19054037 0.94650275
		 0.18766682 0.94827873 0.19085175 0.94301981 0.72383583 0.86742914 0.72354025 0.86871892
		 0.72354025 0.86584538 0.72383583 0.8645556 0.52450609 0.98143727 0.52748424 0.9745363
		 0.53035778 0.9745363 0.52737963 0.98143727 0.19711411 0.93669039 0.19424057 0.93846625
		 0.95814466 0.82745093 0.66926664 0.83729267 0.66940296 0.84389275 0.6663931 0.83729267
		 0.5572331 0.98587984 0.55780208 0.98670733 0.55780208 0.98958087 0.5572331 0.98875338
		 0.67160213 0.85792124 0.66872859 0.85792124 0.66950524 0.85474795 0.67237878 0.85474795
		 0.67006803 0.84732461 0.48636633 0.97237337 0.050901152 0.94167924 0.054897379 0.94771802
		 0.75914812 0.85661334 0.75862414 0.8494423 0.75659186 0.84605998 0.15759599 0.81637567
		 0.045617733 0.93739939 0.39224291 0.89866483 0.38792849 0.89830375 0.38953492 0.90633595
		 0.39234385 0.90602499 0.53384447 0.91650403 0.5333091 0.9078747 0.52908427 0.90677392
		 0.52908427 0.91581446 0.39727265 0.90975004 0.40293431 0.91042501 0.40734273 0.89999598
		 0.40024203 0.89654237 0.021494938 0.90085977 0.02124889 0.89821386 0.014424158 0.89665818
		 0.014139985 0.90085977 0.019895215 0.89303005 0.016705669 0.89079207 0.072931536
		 0.29709649 0.093855478 0.30607963 0.095507547 0.29261267 0.077489264 0.28322801 0.096369989
		 0.27526027 0.079450354 0.26519585 0.51089227 0.71446836 0.51091892 0.69633305 0.48785272
		 0.69871891 0.48785272 0.71290678 0.012889598 0.23443837 0.023196056 0.24515425 0.039992124
		 0.24225971 0.024254354 0.22158346 0.064024158 0.25377524 0.056036539 0.27413899 0.049273137
		 0.29086351 0.28048098 0.8304047 0.28049979 0.82639354 0.27484179 0.82343102 0.27372462
		 0.8286317 0.28205949 0.82466066 0.27749199 0.8188566 0.28389615 0.8157239 0.28461972
		 0.82316118 0.28804797 0.82391858 0.29107898 0.81752324 0.29003042 0.82583469 0.28567302
		 0.82640022 0.28623539 0.83160967 0.29077294 0.8302086 0.4360218 0.72381812 0.42842209
		 0.72618538 0.42842209 0.74259526 0.43611735 0.74051082 0.23554441 0.76271605 0.23566027
		 0.73489881 0.2218276 0.73611993 0.2218276 0.76401967 0.44836408 0.72398454 0.45102885
		 0.7396639 0.10203822 0.25526047 0.08715377 0.24306065 0.11609198 0.22927228 0.1003272
		 0.21860333 0.51356572 0.76027107 0.51286417 0.73435295 0.48785272 0.73025906 0.48785272
		 0.75464207 0.51064879 0.55907452 0.52808118 0.54640383 0.51138091 0.5275625 0.49376857
		 0.54093999 0.45384839 0.57502311 0.44106576 0.55093378 0.43243417 0.55863702 0.4416219
		 0.5867694 0.233593 0.70653427 0.2218276 0.70871288 0.41474518 0.54039258 0.42216513
		 0.56735933 0.42093873 0.53222936 0.43379948 0.59479624 0.19780496 0.118877 0.20833245
		 0.10207071 0.18408723 0.089366198 0.17760748 0.1079536 0.18473119 0.058951333 0.21305227
		 0.078790508 0.21880026 0.061352674 0.20117936 0.046398498 0.9546423 0.71088624 0.9586935
		 0.691737 0.93321449 0.6875425 0.93321449 0.7064243 0.93321449 0.66522002 0.95700401
		 0.66824704 0.95779055 0.651196 0.93321449 0.64828032 0.95747858 0.79667085 0.96556681
		 0.81198716 0.98067778 0.79571402 0.97379953 0.78372604 0.11684108 0.56769294 0.095165484
		 0.57039356 0.095382877 0.59003252 0.1187171 0.58915091 0.16122994 0.078325793 0.15574023
		 0.09531644 0.28339279 0.60681498 0.28618059 0.60158265 0.26518536 0.591703 0.26397505
		 0.59485763 0.24742426 0.58158565 0.2477316 0.59381157 0.23263472 0.66948837 0.2218276
		 0.67016929 0.23203029 0.63640523 0.2218276 0.6382345 0.23973192 0.66823083 0.23616295
		 0.63188273 0.24153429 0.70006907 0.43029913 0.52586424 0.42061529 0.49848136 0.41385937
		 0.50189298 0.24657303 0.66634601 0.24553372 0.63629156 0.41440877 0.46967512 0.43191251
		 0.49402294 0.42287791 0.46924564 0.44394222 0.51743382 0.44798356 0.48673514 0.43572879
		 0.4671464 0.45332727 0.46085006 0.46517554 0.47805429 0.48091751 0.4691624 0.46985081
		 0.45184904 0.12107081 0.17999038 0.1039774 0.16923746 0.090676568 0.18655574 0.10945179
		 0.1976907 0.12792803 0.20977607 0.13957845 0.19322222 0.13269822 0.1631255 0.15104596
		 0.17812183 0.16213053 0.1597679 0.14469434 0.14638638 0.72448575 0.59950852 0.723728
		 0.58116013 0.70129526 0.58175302 0.70129526 0.60266298 0.70129526 0.56488866 0.72450101
		 0.56423348 0.72606611 0.54680717 0.70129526 0.54805964 0.65320474 0.78215522 0.65215695
		 0.76949239 0.64120299 0.76832896 0.64288908 0.78041577 0.65251678 0.75163686 0.6394943
		 0.75201684 0.7797547 0.47744545 0.76837093 0.47361678 0.76655978 0.48627955 0.77752227
		 0.49177945 0.78933376 0.50167429 0.7897808 0.48318228 0.8012417 0.49604639 0.79648238
		 0.46838033 0.047969338 0.32484609 0.04847841 0.31575891 0.03012355 0.3073504 0.030502297
		 0.31890661 0.048718799 0.30472434 0.063201323 0.32181776 0.066471495 0.31060505 0.061504539
		 0.33060247 0.073349163 0.33868939 0.078734107 0.33025092 0.14527994 0.86414897 0.14423844
		 0.84278613;
	setAttr ".uvst[0].uvsp[3250:3499]" 0.13471566 0.84561443 0.13565733 0.86414897
		 0.99162817 0.71495444 0.96508765 0.7019015 0.96571445 0.72113752 0.98398137 0.72028828
		 0.13246933 0.54866922 0.13230397 0.52943319 0.11505377 0.5310443 0.11434702 0.54694206
		 0.13388082 0.58609295 0.13315637 0.56865567 0.1304597 0.60616189 0.14021401 0.60068238
		 0.93321449 0.71976459 0.95015728 0.72337663 0.84843457 0.83836031 0.84808284 0.82624817
		 0.83828735 0.82290721 0.83863837 0.83386004 0.82157052 0.41278723 0.8231234 0.40138155
		 0.81249732 0.40040392 0.8085351 0.4103274 0.81812656 0.46598712 0.82058698 0.44364646
		 0.80636024 0.44137937 0.8093124 0.46501198 0.47679615 0.86266214 0.4666428 0.85931528
		 0.4523949 0.87198061 0.46226284 0.87847602 0.81746483 0.73914707 0.81443733 0.72924733
		 0.79981041 0.72428286 0.80110866 0.73526394 0.48926926 0.65024412 0.47743303 0.63963449
		 0.47349736 0.64266372 0.48580378 0.65413105 0.39380819 0.5851028 0.39634386 0.57282704
		 0.38499534 0.57251334 0.38219973 0.58493137 0.020086687 0.58279836 0.019661762 0.57179743
		 0.0085768197 0.57282734 0.0083223758 0.58510298 0.57563609 0.76013154 0.57267672
		 0.74890542 0.55935419 0.75308782 0.56054229 0.7645458 0.59103215 0.75081575 0.58749491
		 0.73964626 0.37333089 0.4312714 0.37539729 0.44230786 0.38200974 0.43881911 0.3793731
		 0.42985559 0.53183055 0.68523782 0.53833932 0.67977959 0.53110391 0.66829926 0.52582192
		 0.67504025 0.39045256 0.46752548 0.38266993 0.46862057 0.38265023 0.48451287 0.39089522
		 0.48475745 0.38889343 0.43709037 0.38769183 0.42943349 0.020817347 0.42943367 0.019147396
		 0.43709064 0.024857793 0.4390803 0.027667085 0.43055651 0.016343946 0.48475772 0.023779782
		 0.48470041 0.023920875 0.4686183 0.016997214 0.46752578 0.26593608 0.79722208 0.27253905
		 0.79186618 0.26606786 0.7817654 0.2588416 0.78547573 0.067209229 0.87604964 0.074541941
		 0.87243962 0.06943512 0.86342371 0.063681506 0.86838508 0.25960013 0.74721253 0.25362697
		 0.75024962 0.25435302 0.7609055 0.26249859 0.76079208 0.81959403 0.76464355 0.82036239
		 0.75786978 0.81100208 0.75788093 0.81227601 0.76460308 0.29028231 0.91704488 0.29829904
		 0.91685665 0.29865807 0.90516639 0.28743222 0.90517879 0.22161618 0.93621075 0.22051691
		 0.94789833 0.2298926 0.94783062 0.23164912 0.93623394 0.090404443 0.93993849 0.090589799
		 0.95085144 0.097284935 0.9492237 0.097178794 0.94235057 0.7420643 0.6642561 0.74495161
		 0.6781944 0.76568705 0.67747092 0.76181412 0.65704226 0.34166887 0.63389182 0.31892696
		 0.61892587 0.31571081 0.63935453 0.33918467 0.64719343 0.27469894 0.52941513 0.26891729
		 0.54101628 0.28922492 0.54737854 0.29222098 0.53443128 0.31438333 0.53719836 0.31379792
		 0.55132335 0.11982103 0.48465809 0.11836684 0.49809861 0.13006653 0.49708116 0.13046955
		 0.48538601 0.97895545 0.65352046 0.96482885 0.65785432 0.96626753 0.66954947 0.98334795
		 0.66595447 0.33567885 0.67763442 0.30693942 0.69413078 0.30928791 0.69946891 0.33182541
		 0.69223565 0.10530803 0.4798438 0.10145432 0.4931803 0.13317426 0.47355279 0.13594466
		 0.46246368 0.12509483 0.45902434 0.12257411 0.47155628 0.3248938 0.88342845 0.31886572
		 0.88763589 0.31819317 0.90117472 0.32669112 0.89927351 0.31355104 0.8836785 0.31012139
		 0.89957708 0.54498601 0.79505855 0.55317724 0.8013941 0.55836308 0.79189461 0.54886365
		 0.78794378 0.53262603 0.78244978 0.52918255 0.79065198 0.53818738 0.84953302 0.5271309
		 0.840693 0.52555186 0.85586482 0.53767002 0.86571985 0.26843202 0.44995281 0.27466851
		 0.46283132 0.28782776 0.46776739 0.27961817 0.45239601 0.30915043 0.51273334 0.29342508
		 0.51139927 0.29322079 0.52155739 0.31370619 0.52422994 0.60606796 0.86979771 0.60602838
		 0.85585445 0.59361887 0.85307854 0.59222049 0.8656261 0.59858531 0.80244184 0.60627514
		 0.80278885 0.60605061 0.78727531 0.59761828 0.78389925 0.61366081 0.79666317 0.61380744
		 0.78244972 0.042206008 0.71765077 0.036485389 0.72965074 0.055257872 0.73745221 0.062744267
		 0.71969593 0.075599551 0.73680407 0.076350659 0.72097117 0.08898636 0.67080826 0.092546389
		 0.65892094 0.082815625 0.66144335 0.078029916 0.67404205 0.096870847 0.79239064 0.099173807
		 0.80472082 0.109692 0.79926521 0.10940561 0.78361762 0.11461369 0.45640862 0.10810455
		 0.47047177 0.18111271 0.85390604 0.17332806 0.85108691 0.17373939 0.86264586 0.181822
		 0.86264586 0.45730242 0.85476339 0.46886137 0.85532385 0.46944821 0.85004485 0.45730242
		 0.84988385 0.16796355 0.85050005 0.1716309 0.84114951 0.16394994 0.84017938 0.17955199
		 0.84356689 0.79690886 0.6219973 0.7960884 0.61223805 0.78666413 0.6189642 0.78867084
		 0.62741798 0.7952683 0.60460925 0.78545612 0.61124748 0.80823493 0.60729736 0.80546832
		 0.59819156 0.81229287 0.61931998 0.8195073 0.62382567 0.8254683 0.6167748 0.82182431
		 0.60954249 0.020512342 0.40973377 0.015850207 0.41687647 0.019802308 0.4237397 0.026760284
		 0.41746822 0.15827172 0.82672942 0.1639498 0.83618784 0.17455049 0.83295399 0.16532743
		 0.82503372 0.089330398 0.7955451 0.079499699 0.79362381 0.080223791 0.80522531 0.090735458
		 0.80527169 0.067779608 0.79334092 0.067779608 0.80456823 0.076956309 0.78296453 0.067779608
		 0.78374028 0.8196466 0.25309387 0.82693273 0.25840873 0.84010035 0.23741651 0.83248854
		 0.23271203 0.81263423 0.2472524 0.82498151 0.22807235 0.77974904 0.25126415 0.78802687
		 0.24768642 0.77636057 0.22808543 0.76885337 0.23272511 0.77171123 0.25543419 0.76123917
		 0.23743106 0.72255212 0.1747485 0.73004514 0.17011757 0.71807873 0.15063359 0.71062648
		 0.15523933 0.7373271 0.16561715 0.72528517 0.14617972 0.8635065 0.16528974 0.87078881
		 0.16979034 0.88274914 0.15030271 0.87554258 0.14584865 0.87828159 0.17442127 0.89020145
		 0.15490825;
	setAttr ".uvst[0].uvsp[3500:3749]" 0.69728386 0.13269964 0.70469761 0.12811781
		 0.69071245 0.10590066 0.68330657 0.11047774 0.71183264 0.12370793 0.69783288 0.10150009
		 0.88966006 0.12378792 0.89679527 0.1281978 0.91039014 0.10573953 0.90326935 0.10133877
		 0.90420902 0.13277963 0.91779566 0.11031661 0.747729 0.21554939 0.75530189 0.21086919
		 0.74331927 0.19135857 0.73578656 0.19601412 0.76273209 0.20627715 0.75067502 0.18681251
		 0.83842945 0.20615233 0.84585983 0.21074456 0.85783863 0.19123156 0.85048276 0.18668552
		 0.8534326 0.21542478 0.86537141 0.19588731 0.073104121 0.92334938 0.084178291 0.92334938
		 0.081878342 0.91393113 0.072349183 0.91418308 0.62993985 0.0068104486 0.63517809
		 0.016212661 0.64224631 0.011844396 0.63597608 0.0019781955 0.96538758 0.0019782411
		 0.95862597 0.011541079 0.96569401 0.015909163 0.97142833 0.0068135974 0.10330752
		 0.91736245 0.094138764 0.91711038 0.091838725 0.92652863 0.10255733 0.92652863 0.19922681
		 0.85844415 0.19156875 0.85737008 0.19164887 0.86264586 0.19932793 0.86264586 0.19250575
		 0.84971547 0.78985047 0.64176583 0.78268719 0.64270806 0.78603476 0.65059525 0.7911101
		 0.64871228 0.79722172 0.63258666 0.80616266 0.63579041 0.17124838 0.79471397 0.17148748
		 0.80593789 0.17993818 0.81034768 0.18526079 0.80496347 0.16804427 0.81263512 0.17494301
		 0.81528652 0.39682162 0.91708374 0.39176688 0.91108519 0.39371827 0.91871947 0.32896724
		 0.90845764 0.3271395 0.90516621 0.32076043 0.90652567 0.32088116 0.90969729 0.52908427
		 0.92978048 0.53538162 0.93071979 0.53498995 0.92238683 0.52908427 0.92191756 0.46941453
		 0.82164025 0.45730242 0.82092887 0.45730242 0.83095211 0.46886241 0.83215642 0.7562927
		 0.59685564 0.76412952 0.60365778 0.77413481 0.59846389 0.76596212 0.59040529 0.77673036
		 0.58115733 0.78406018 0.5895828 0.79385388 0.58067983 0.78795749 0.57273221 0.040967554
		 0.36372441 0.027726954 0.35539711 0.023425676 0.36433023 0.037668902 0.37904474 0.04485723
		 0.38688233 0.049770892 0.36892885 0.36110163 0.77338845 0.3739841 0.77647811 0.37333408
		 0.7582503 0.36018053 0.76177365 0.34677914 0.76257348 0.34677914 0.77250886 0.46916515
		 0.84255463 0.45730242 0.84168148 0.7716769 0.61156744 0.78094751 0.6051271 0.77698189
		 0.61763889 0.79089111 0.59711301 0.80094749 0.58821535 0.020706188 0.39137524 0.026675956
		 0.38340992 0.018960852 0.37349042 0.013440103 0.38284862 0.028212115 0.40021801 0.029439434
		 0.39763981 0.027315537 0.39127579 0.025049083 0.39121482 0.26139763 0.9202081 0.27395555
		 0.92498356 0.27909774 0.90680134 0.26667815 0.90701568 0.35990036 0.74320394 0.34677914
		 0.74280459 0.38372386 0.55761963 0.39504701 0.55712998 0.39364263 0.54109609 0.38340205
		 0.5414874 0.011147366 0.55713028 0.021076355 0.55673772 0.021558594 0.54057723 0.013109909
		 0.54109627 0.79275745 0.70567328 0.80483651 0.71348143 0.81108612 0.70196998 0.80143601
		 0.69462556 0.41909587 0.95575315 0.42586136 0.95814604 0.43067884 0.94879079 0.42519483
		 0.94551516 0.81672996 0.71878511 0.82148194 0.70713007 0.25551301 0.72085941 0.26602405
		 0.71931058 0.26450437 0.70590127 0.25459859 0.70639956 0.81563324 0.31770912 0.82276177
		 0.31772965 0.82309467 0.30544695 0.81597227 0.30617452 0.81386656 0.38819575 0.82367438
		 0.38910219 0.82395643 0.3750428 0.81467295 0.37478647 0.55530006 0.74300718 0.56741333
		 0.73836666 0.56076187 0.72685736 0.55041087 0.73144019 0.57852477 0.73020214 0.56878322
		 0.71934026 0.39653507 0.8987118 0.3944827 0.89893109 0.39418793 0.9052372 0.39566404
		 0.90660143 0.48518977 0.97751868 0.48758692 0.97814506 0.48789594 0.9733448 0.48636633
		 0.97237337 0.10515589 0.95934844 0.11037059 0.95934844 0.10925238 0.9551236 0.10353242
		 0.95521122 0.16847458 0.81387866 0.16889349 0.81508923 0.17078274 0.81819493 0.1728349
		 0.8167603 0.048297573 0.94258296 0.04576312 0.94346279 0.045417089 0.94584918 0.050093465
		 0.94677103 0.75999832 0.84721684 0.76133609 0.84505057 0.76077467 0.84509456 0.7587114
		 0.8455708 0.15988345 0.81632149 0.16211018 0.81626874 0.164373 0.81490159 0.1618658
		 0.81414771 0.16368395 0.78516555 0.16874263 0.78643614 0.16848563 0.78524834 0.16351128
		 0.7836175 0.79811609 0.64089209 0.79649067 0.64158875 0.79709816 0.64779949 0.79861295
		 0.64702028 0.79836565 0.64134914 0.79938614 0.64075661 0.79767185 0.63826293 0.79773337
		 0.639898 0.16394925 0.81231207 0.16351137 0.80535448 0.15721524 0.8055793 0.15929021
		 0.81337321 0.16670844 0.81446213 0.1653474 0.81340158 0.18382667 0.8189351 0.17453589
		 0.81882834 0.17067432 0.81873685 0.17257914 0.81878197 0.17923801 0.8267296 0.17116806
		 0.82175505 0.045100175 0.94096619 0.045355469 0.93920672 0.76086235 0.85269451 0.7625311
		 0.84887975 0.32781523 0.91551989 0.31994808 0.9171831 0.95239234 0.8452369 0.95340192
		 0.84754473 0.95896983 0.84929138 0.96224266 0.8464399 0.48941895 0.9748081 0.48789594
		 0.9733448 0.48758692 0.97814506 0.48952737 0.97927839 0.48518977 0.97751868 0.48357821
		 0.97937828 0.16498893 0.79393619 0.071253374 0.93741858 0.06946487 0.93739939 0.069210701
		 0.94479072 0.071178809 0.94510537 0.79960775 0.65260857 0.79790896 0.65305084 0.96111441
		 0.82995069 0.9602859 0.82377249 0.95911425 0.82455403 0.95992047 0.83032447 0.96181017
		 0.83536595 0.95425755 0.83512574 0.95378143 0.83667547 0.96178162 0.83669329 0.069409199
		 0.94797361 0.071243696 0.94826365 0.68955433 0.76494843 0.69336951 0.76767576 0.70460176
		 0.75629532 0.70425206 0.75260079 0.87644923 0.81600004 0.87183189 0.81405503 0.86947078
		 0.82912326 0.8745091 0.82937771 0.80500621 0.81476015 0.80720419 0.81929904 0.81425434
		 0.80787569 0.81124043 0.80628115 0.027560489 0.38795686 0.81705266 0.79194373 0.81297684
		 0.79363632 0.042770933 0.41685274;
	setAttr ".uvst[0].uvsp[3750:3999]" 0.052134633 0.40485021 0.039576687 0.40007475
		 0.032784447 0.40757135 0.067779608 0.83290917 0.080900833 0.83179468 0.08052063 0.81777549
		 0.067779608 0.81720954 0.16797107 0.82026941 0.16954806 0.82100224 0.010040697 0.4022074
		 0.0088852933 0.41097769 0.78728777 0.82315773 0.78176779 0.8299439 0.78450805 0.83864379
		 0.79407328 0.83136278 0.15038703 0.92562121 0.16840513 0.93526584 0.15894085 0.92243427
		 0.15030736 0.91689306 0.33935568 0.8264817 0.34076962 0.83798742 0.35275587 0.8299526
		 0.35096061 0.81863254 0.042844493 0.9098568 0.044925954 0.90089321 0.037254564 0.88965493
		 0.034902506 0.90886146 0.37674347 0.9403705 0.38428915 0.9252283 0.38158718 0.92271107
		 0.37638575 0.92805105 0.2019425 0.92834246 0.21104327 0.93269885 0.20354515 0.91843724
		 0.20255475 0.91988254 0.68585432 0.78303808 0.68237132 0.78119034 0.78681195 0.79808027
		 0.78809112 0.80417812 0.79414487 0.80377692 0.79199666 0.79194373 0.010092353 0.93879759
		 0.0099992631 0.94870138 0.013448317 0.94650245 0.01235771 0.93874508 0.35852182 0.81953377
		 0.35926169 0.81314218 0.91299719 0.84917611 0.91769731 0.84713167 0.92197245 0.83512592
		 0.91300887 0.83699447 0.79022688 0.81591994 0.79887086 0.81916618 0.3462894 0.84951562
		 0.35589346 0.83746141 0.084883668 0.89195728 0.081777766 0.88965464 0.080423959 0.90993941
		 0.087492548 0.900657 0.23718999 0.90998274 0.2397421 0.89927256 0.22795132 0.89930058
		 0.22896399 0.90723586 0.23718999 0.88861579 0.22896399 0.89137173 0.02359488 0.4047617
		 0.014066905 0.39634877 0.03349065 0.42544216 0.8664785 0.77671009 0.87249082 0.7783255
		 0.87558067 0.77264696 0.868985 0.77264428 0.64487344 0.64998323 0.65099466 0.65053374
		 0.65201867 0.63890028 0.64516765 0.64054811 0.33791602 0.89306283 0.34393343 0.88916612
		 0.34081447 0.88342863 0.33350888 0.88633966 0.41401687 0.79404575 0.42108935 0.79599851
		 0.42167923 0.79160696 0.41354513 0.78793412 0.078091793 0.70394248 0.082484521 0.68835437
		 0.072972424 0.69093001 0.068374716 0.70483744 0.13694018 0.43070874 0.12891898 0.42943358
		 0.12175419 0.44165874 0.13095781 0.44382134 0.12090763 0.83595723 0.11719318 0.81925368
		 0.10746114 0.82134074 0.11123345 0.83579296 0.53794771 0.82556015 0.54595488 0.82916254
		 0.54855007 0.81315088 0.54046196 0.80708015 0.52752757 0.80208963 0.52740252 0.82043439
		 0.29439667 0.48085514 0.28333226 0.48132062 0.29059142 0.49913245 0.30230662 0.4988122
		 0.606754 0.83607352 0.60644668 0.81714988 0.59810799 0.81763935 0.59568924 0.83747834
		 0.063851118 0.68687922 0.053674988 0.70226175 0.12576953 0.8855108 0.12712713 0.86533552
		 0.12023731 0.86880428 0.12008641 0.88784105 0.21298505 0.8846243 0.22702111 0.86716694
		 0.2139321 0.85771292 0.20682691 0.8638221 0.42599237 0.45012453 0.41929889 0.43861029
		 0.41076314 0.44088987 0.41265064 0.45217085 0.15047885 0.10797951 0.14157219 0.1205287
		 0.15667623 0.13183668 0.16732566 0.11940232 0.17469396 0.14563437 0.18747641 0.1324027
		 0.72487903 0.6352064 0.7236101 0.61708218 0.70129526 0.62059557 0.70129526 0.63947284
		 0.04445859 0.39541441 0.034801386 0.40239248 0.20098004 0.91604233 0.20280303 0.91445386
		 0.81928355 0.60276574 0.81654507 0.59538138 0.026740937 0.40080905 0.045223746 0.38747409
		 0.037123874 0.38514447 0.029543476 0.38836408 0.50111866 0.94439948 0.50823587 0.95061463
		 0.51250863 0.95073217 0.51502573 0.94356829 0.8117851 0.78709835 0.81908441 0.78717744
		 0.81939745 0.78254479 0.8131578 0.78280836 0.27309129 0.83333868 0.27851671 0.83599877
		 0.50616741 0.93463117 0.51317793 0.93472707 0.57463193 0.91791916 0.5721733 0.90922004
		 0.56216532 0.90957022 0.56114203 0.91780764 0.28642097 0.83712167 0.29437131 0.83539587
		 0.02070345 0.81299269 0.028516755 0.80702537 0.023997355 0.80472088 0.021186054 0.80792892
		 0.56780857 0.92437005 0.56254375 0.92462605 0.4921324 0.60339385 0.49972448 0.62199622
		 0.51952022 0.61300564 0.5103299 0.59634316 0.39866525 0.60660553 0.3972483 0.59732622
		 0.39067617 0.59873289 0.38710922 0.61324573 0.52336603 0.87134296 0.51865929 0.88256347
		 0.52411407 0.88857472 0.52756208 0.88667434 0.93967879 0.75975549 0.93737394 0.75137973
		 0.92988819 0.77031386 0.93106222 0.78025126 0.50717896 0.63660198 0.52235305 0.62766629
		 0.14978689 0.0074170358 0.13349259 0.02146952 0.14234392 0.02908971 0.15832447 0.014644607
		 0.13051318 0.51790321 0.11575942 0.5181613 0.98902732 0.6892001 0.96534628 0.69037157
		 0.27041903 0.58140558 0.25797826 0.56114048 0.29221892 0.5915674 0.77499253 0.73727798
		 0.74905819 0.69904763 0.74023396 0.72727734 0.75331795 0.74606746 0.055671483 0.75011742
		 0.075107642 0.7464208 0.02947229 0.74162829 0.33218479 0.53122103 0.32521218 0.51917815
		 0.2799325 0.5179314 0.96511722 0.64602113 0.97370481 0.64201152 0.30943421 0.71319652
		 0.3271912 0.71361363 0.07866621 0.75899029 0.055275396 0.76497024 0.93321449 0.74433726
		 0.94273627 0.74738824 0.94362581 0.73395741 0.93321449 0.72998178 0.80515534 0.25953856
		 0.81440216 0.26602033 0.78634393 0.2659314 0.79730093 0.25886318 0.77911311 0.27508336
		 0.14746457 0.58261913 0.15039305 0.56951779 0.1500541 0.59374142 0.93101513 0.088813506
		 0.92361724 0.084241353 0.91651142 0.079849541 0.68452716 0.080050096 0.67742133 0.084442087
		 0.67002326 0.089014053 0.94725394 0.062402211 0.93986535 0.05783572 0.93277687 0.053454679
		 0.66818482 0.053702869 0.66109633 0.058083732 0.6537078 0.062650219 0.96040654 0.041041296
		 0.95302325 0.036478452 0.9459452 0.032103617 0.65497196 0.032379553 0.64789373 0.03675421
		 0.64051062 0.041317232 0.97307181 0.020468902 0.62780064 0.020772399 0.98681307 0.77832395
		 0.98692125 0.79245847 0.99800801 0.79245847 0.99556899 0.78298932 0.26559407 0.75055754;
	setAttr ".uvst[0].uvsp[4000:4249]" 0.26280364 0.74392658 0.26673633 0.75857776
		 0.26744184 0.75423521 0.57020748 0.97104692 0.56617618 0.96034318 0.56019306 0.9579457
		 0.56168139 0.96553957 0.070245728 0.85436738 0.076034702 0.85965222 0.078735389 0.85608709
		 0.073416837 0.84983712 0.51888478 0.96550477 0.51626235 0.95758957 0.50599682 0.96431535
		 0.51453489 0.97054482 0.20108773 0.88910389 0.20361209 0.91046244 0.20741543 0.90987962
		 0.20838411 0.90373021 0.019727506 0.92337704 0.020908646 0.93475366 0.030227421 0.92088991
		 0.029620696 0.91491902 0.8125543 0.77849823 0.81953835 0.77942467 0.61417598 0.95141309
		 0.61392152 0.93788958 0.60441327 0.95021188 0.61515236 0.95378435 0.27622694 0.85029811
		 0.28942671 0.85030872 0.43095642 0.92783302 0.44080821 0.94152355 0.44669336 0.93561673
		 0.44166434 0.92415267 0.74748075 0.79290026 0.76077193 0.79277861 0.76248246 0.79439598
		 0.75963295 0.78413296 0.63693684 0.92569113 0.63998705 0.91822916 0.62584108 0.90843636
		 0.62311196 0.91849041 0.92988479 0.83113438 0.92811376 0.81649542 0.92016345 0.81828547
		 0.91819453 0.83097875 0.74896216 0.81075346 0.76134181 0.80135363 0.82563537 0.77887446
		 0.8264662 0.76521963 0.81959313 0.76532578 0.63684738 0.93494236 0.62402439 0.9258849
		 0.75416976 0.75766301 0.75006711 0.76439738 0.75389361 0.76942605 0.75946641 0.76120299
		 0.29855308 0.83340538 0.29736608 0.82804734 0.96837807 0.84329331 0.97444344 0.84860343
		 0.98012537 0.8421098 0.97505856 0.83431596 0.03405831 0.79471362 0.029616304 0.79087651
		 0.025683368 0.79740316 0.69395989 0.84160739 0.6940316 0.85082972 0.70008761 0.84427267
		 0.70129871 0.83729279 0.02277478 0.80142236 0.52544922 0.68809164 0.52060837 0.67873698
		 0.25471061 0.64900804 0.26236403 0.64882392 0.26184863 0.63728935 0.25417393 0.63659889
		 0.74821681 0.75472414 0.74612665 0.75963795 0.29568875 0.82282132 0.066572025 0.85925633
		 0.06260445 0.86309487 0.28389925 0.81016994 0.2783038 0.81296134 0.29222021 0.81195551
		 0.74224341 0.75005889 0.7408399 0.75561762 0.036379341 0.80780745 0.038688507 0.79793
		 0.0019920222 0.95269281 0.0036911319 0.96200776 0.0073720422 0.96097755 0.0062647802
		 0.9528299 0.27361909 0.73671335 0.27431059 0.74576151 0.082047731 0.83690071 0.089149445
		 0.84724981 0.59586841 0.96044368 0.59044302 0.95777595 0.58948857 0.97102076 0.59649909
		 0.97087544 0.26393571 0.94799507 0.25992996 0.93614817 0.25574818 0.93811518 0.25392771
		 0.94760257 0.76846194 0.77149081 0.76301676 0.78014153 0.018042553 0.79212588 0.018658586
		 0.78296453 0.56228089 0.93350554 0.5659743 0.93195492 0.82508641 0.78239286 0.54614025
		 0.7053358 0.55276859 0.69833767 0.54573119 0.6894269 0.53950369 0.69598728 0.5387252
		 0.7095018 0.53313744 0.69964373 0.81566632 0.34731692 0.82358164 0.34676319 0.82342172
		 0.33373213 0.8160367 0.33472744 0.25437483 0.67782283 0.26283628 0.67843175 0.26222107
		 0.66584224 0.25429642 0.66512883 0.82525438 0.68154132 0.83312136 0.68530953 0.8385036
		 0.67584771 0.83168542 0.67251647 0.81799597 0.6752668 0.82500899 0.66657257 0.014794462
		 0.51110685 0.022835197 0.51154965 0.023332404 0.49869257 0.015614379 0.49815556 0.38320127
		 0.5114274 0.39220449 0.51110661 0.39151198 0.49815533 0.38285902 0.49841562 0.024512084
		 0.82862544 0.031326596 0.83288682 0.037165672 0.82363057 0.030478749 0.81985193 0.018038355
		 0.82696795 0.023777409 0.81838113 0.82352191 0.29348332 0.81578869 0.294348 0.26191702
		 0.62546283 0.25360176 0.62458903 0.2728129 0.78052998 0.2670165 0.77182138 0.26012388
		 0.77281666 0.25301147 0.7761336 0.02426056 0.45593795 0.017249649 0.45445994 0.38244197
		 0.45595956 0.39052615 0.45445973 0.5155862 0.92416471 0.51164895 0.92414492 0.50893575
		 0.92950416 0.51406032 0.93063962 0.509278 0.92250073 0.50438172 0.92684323 0.50123
		 0.92047048 0.50775105 0.91974711 0.50850636 0.91618758 0.50298196 0.9133051 0.51105303
		 0.91409773 0.5115208 0.91869384 0.51665169 0.91813147 0.5153625 0.913315 0.63619876
		 0.6338101 0.63799739 0.64380091 0.64294356 0.63235104 0.65105855 0.63209116 0.68423617
		 0.65958416 0.68274677 0.66639328 0.68841004 0.66829121 0.69090998 0.66056508 0.35539484
		 0.95643097 0.36295551 0.95199895 0.35842335 0.94441098 0.35209677 0.94977945 0.4459441
		 0.90742916 0.44001967 0.91044956 0.44109577 0.91993612 0.44774145 0.92016119 0.95602095
		 0.75800407 0.95678908 0.75137973 0.94742876 0.75147098 0.94870412 0.75801599 0.78935063
		 0.85656095 0.79732418 0.85642183 0.80025983 0.84276801 0.7890116 0.84276801 0.72542059
		 0.837322 0.7244947 0.85097575 0.73381138 0.85086483 0.73542017 0.837322 0.12158915
		 0.89242387 0.11067615 0.89253634 0.11230411 0.89907807 0.1191737 0.89902711 0.84682316
		 0.85625893 0.85283947 0.84909678 0.85294294 0.84481329 0.84588248 0.84235185 0.949184
		 0.77953804 0.95594794 0.77761745 0.95617259 0.77632153 0.95049912 0.77664346 0.60977459
		 0.9267872 0.60824877 0.93326223 0.61293089 0.93389803 0.61602932 0.9284727 0.4368141
		 0.95147836 0.44911209 0.95828849 0.44911209 0.94587713 0.4368141 0.94551498 0.14862621
		 0.93984491 0.13743885 0.93972069 0.13743876 0.94839454 0.14862616 0.95116889 0.60955089
		 0.91593754 0.61084014 0.9207539 0.61697656 0.92056841 0.61549026 0.9126181 0.96187806
		 0.77973449 0.96121222 0.77629632 0.66751397 0.82410312 0.67442375 0.81785607 0.66093278
		 0.81760985 0.66225082 0.8243652 0.45193568 0.9110961 0.44902834 0.90413535 0.4520326
		 0.91938359 0.45375291 0.91492414 0.49986148 0.96838176 0.49566734 0.95781922 0.48983884
		 0.95549625 0.49121073 0.96301287 0.70139045 0.80487168 0.70730883 0.80988544 0.71000403
		 0.80643129 0.70462698 0.80050784 0.60998088 0.95777577 0.60263449 0.95967299 0.60710531
		 0.9711414;
	setAttr ".uvst[0].uvsp[4250:4499]" 0.61489671 0.96200168 0.18750963 0.88910389
		 0.19002597 0.91032702 0.19382529 0.90972209 0.1949524 0.90372676 0.054808624 0.92208463
		 0.055780862 0.9334079 0.065254353 0.91971773 0.064452782 0.91393089 0.94958955 0.77191436
		 0.95618743 0.77269793 0.71481079 0.83094144 0.71545547 0.81760997 0.7038098 0.82858229
		 0.71580499 0.83329898 0.7529828 0.81858855 0.74507856 0.81764144 0.74278879 0.83328509
		 0.75598854 0.83331722 0.46642938 0.93463117 0.45434394 0.94652236 0.4600662 0.95150483
		 0.47115958 0.94661701 0.86233371 0.7932272 0.87543291 0.79220647 0.87716228 0.79382944
		 0.87315291 0.78231698 0.91917676 0.80297053 0.92200887 0.79638439 0.90955919 0.78458875
		 0.90572083 0.79590333 0.63364398 0.95479834 0.63187295 0.93893391 0.62392259 0.94042015
		 0.62195373 0.95470893 0.86369085 0.8100636 0.87621045 0.80070662 0.11247154 0.91311884
		 0.11806137 0.91266847 0.91917366 0.81237632 0.906385 0.80322468 0.58277071 0.88180643
		 0.57854247 0.88827354 0.5824095 0.8931011 0.58803064 0.88524252 0.61293328 0.9084363
		 0.60763377 0.90962857 0.90065402 0.82649797 0.9061324 0.8311224 0.91168356 0.82473332
		 0.90503311 0.81636786 0.87359583 0.7607457 0.86929089 0.75689149 0.86525559 0.76365256
		 0.65305126 0.96301836 0.65291131 0.97219276 0.65912664 0.96570981 0.66025782 0.95878989
		 0.86253244 0.76762694 0.86479139 0.77105147 0.57684767 0.87889397 0.574619 0.8835755
		 0.6057092 0.92131627 0.6058374 0.92676741 0.50827527 0.9087044 0.51344538 0.90700608
		 0.60346645 0.92512321 0.60193956 0.92236954 0.60269475 0.91881019 0.60524136 0.91672021
		 0.081199698 0.96021616 0.082451843 0.95364934 0.076247163 0.95166361 0.076300092
		 0.95672441 0.49467403 0.92044908 0.4981122 0.92542183 0.4970445 0.91273069 0.57030571
		 0.87378901 0.56933206 0.87955678 0.87822878 0.76388502 0.69773823 0.80968064 0.70074266
		 0.81361842 0.048961766 0.95170951 0.05105824 0.96090037 0.054905299 0.95994449 0.053245202
		 0.95183492 0.45943412 0.89711726 0.46042579 0.9060992 0.71156693 0.7870295 0.72020829
		 0.79799473 0.8259207 0.84475398 0.82049537 0.84273511 0.81954092 0.85663277 0.82655144
		 0.85663265 0.39524212 0.95696837 0.39123636 0.94436193 0.38705459 0.94583935 0.38523406
		 0.95670879 0.59689534 0.89517713 0.58991599 0.90444481 0.857777 0.75820959 0.85868818
		 0.74910784 0.66178793 0.83330119 0.66538298 0.83168805 0.96177733 0.77224755 0.63844717
		 0.65119869 0.31090567 0.74836242 0.31098133 0.74280459 0.30354768 0.74613059 0.30433932
		 0.75052214 0.40814042 0.7854144 0.40858206 0.79261988 0.68822825 0.67752409 0.68289351
		 0.67802662 0.64467776 0.66055435 0.63831919 0.66046119 0.65063655 0.66098255 0.68783379
		 0.68823618 0.68250328 0.68847543 0.3423613 0.90113717 0.34803677 0.89642501 0.41405892
		 0.80281264 0.40871927 0.80219066 0.42108324 0.80402881 0.31114516 0.75686044 0.30463618
		 0.75855249 0.067612484 0.61989659 0.073146373 0.61685759 0.068693779 0.61015344 0.063787602
		 0.61355841 0.64421576 0.69672585 0.64452225 0.68532252 0.63817501 0.68153483 0.63794863
		 0.69322687 0.65078169 0.69989055 0.65039635 0.6890527 0.68721831 0.72513568 0.68731159
		 0.71406507 0.68177348 0.71654564 0.68115163 0.72738355 0.40551418 0.88998789 0.40979737
		 0.88273221 0.40444893 0.87413412 0.40043691 0.88195151 0.41612193 0.87759477 0.41065589
		 0.87031424 0.41533145 0.83259165 0.42252722 0.83139259 0.42181754 0.82149065 0.41470936
		 0.82207096 0.31115821 0.78657722 0.31127894 0.77630359 0.3048116 0.77601433 0.30444509
		 0.78591621 0.08830516 0.64066786 0.082710125 0.63215995 0.076326929 0.63406491 0.080256581
		 0.64217365 0.64467096 0.67099404 0.63855976 0.66955775 0.65073603 0.67235702 0.68756986
		 0.69918984 0.68209273 0.69984996 0.39853692 0.86527354 0.39392635 0.87099689 0.40542099
		 0.86263311 0.42143688 0.81200886 0.41406214 0.81146622 0.31141245 0.76540631 0.30462268
		 0.76653254 0.078002356 0.62310207 0.071615323 0.62610996 0.55445474 0.71785533 0.56225586
		 0.71035653 0.3929145 0.52866787 0.3836326 0.52895391 0.013923072 0.52866811 0.022242527
		 0.52847552 0.80874729 0.686746 0.81708646 0.69348991 0.8263002 0.69791669 0.25448248
		 0.69440848 0.2636928 0.69449705 0.81517357 0.36338225 0.82375962 0.36337769 0.54561347
		 0.72232515 0.8394438 0.66199851 0.83259386 0.65704232 0.88420558 0.84914213 0.89175135
		 0.8469882 0.88503808 0.83511412 0.87848258 0.83784676 0.78342265 0.71507996 0.25735652
		 0.73272187 0.26814485 0.73151875 0.85637456 0.86362129 0.85490555 0.86025047 0.85465431
		 0.86046374 0.85612333 0.8638345 0.68445647 0.86029798 0.68422389 0.85791165 0.68391627
		 0.85791147 0.68414873 0.8602978 0.7616393 0.84492129 0.76107782 0.84496528 0.39002842
		 0.9655174 0.39087591 0.96827102 0.39118356 0.96827084 0.39033607 0.96551722 0.39031819
		 0.9631502 0.39062575 0.96315002 0.54417032 0.98607934 0.5443936 0.9856168 0.54409057
		 0.98548728 0.54386723 0.98594975 0.5440951 0.98897278 0.54379207 0.98884314 0.76283431
		 0.84875035 0.39116877 0.96096003 0.39147651 0.96095985 0.68378437 0.85541499 0.68347681
		 0.85541481 0.95054793 0.83663887 0.94824296 0.8463856 0.96966147 0.8265031 0.96683389
		 0.81901503 0.79189992 0.65296119 0.027813427 0.89773518 0.025144545 0.89108247 0.028767228
		 0.90085977 0.26269048 0.61682063 0.25457606 0.61080647 0.078539856 0.88566333 0.084981553
		 0.88048226 0.13904345 0.93572938 0.14381456 0.92885095 0.13411191 0.91720682 0.13081782
		 0.9249171 0.82233298 0.27907479 0.8147549 0.28570583 0.069393776 0.67433274 0.54524684
		 0.85218883 0.11703985 0.79657018 0.10108123 0.82324541 0.30869716 0.80617839 0.31045994
		 0.79729319 0.3017171 0.79769009 0.2989969 0.80581015 0.41844794 0.8521859 0.42799968
		 0.85128647;
	setAttr ".uvst[0].uvsp[4500:4749]" 0.42504418 0.84316647 0.41623086 0.84322029
		 0.27935791 0.44288605 0.26977763 0.44116443 0.25414699 0.4450027 0.25942153 0.43704611
		 0.68939936 0.74535179 0.68847466 0.7349233 0.68078929 0.73630184 0.68080044 0.74764538
		 0.64312261 0.71759093 0.65235871 0.72015238 0.65192121 0.70880884 0.64371818 0.70654809
		 0.10575742 0.65356708 0.099942252 0.64543003 0.090885743 0.65021551 0.082616121 0.65216339
		 0.28112176 0.43248555 0.27222919 0.43150324 0.26474088 0.42943352 0.094996467 0.63815659
		 0.11429417 0.94500434 0.10819613 0.93993837 0.10342024 0.94557446 0.11102583 0.95113218
		 0.40171275 0.85617745 0.39536232 0.85803783 0.4397558 0.71033967 0.44802687 0.70965981
		 0.45047608 0.69339848 0.44022995 0.69486105 0.42842209 0.71247631 0.42842209 0.69721889
		 0.44162059 0.78081423 0.43987069 0.76052624 0.42842209 0.75988472 0.42842209 0.77810925
		 0.79424649 0.44072783 0.80318719 0.52102464 0.79385936 0.52544707 0.068150759 0.22962292
		 0.048347536 0.21928087 0.086273625 0.31976083 0.07925906 0.20732562 0.51262355 0.78008997
		 0.48785272 0.77569199 0.0019921134 0.25004545 0.017668188 0.25962126 0.57859266 0.77326363
		 0.56174421 0.77845836 0.82089835 0.42552781 0.80576003 0.42353159 0.57911313 0.93788952
		 0.56590891 0.942994 0.5654341 0.95395416 0.57934111 0.94824284 0.79383475 0.74050552
		 0.80258495 0.75127167 0.81114918 0.75259537 0.47869906 0.87226909 0.46670663 0.89098686
		 0.017612517 0.59732646 0.0063782674 0.59873313 0.38021675 0.5987497 0.35624349 0.86674243
		 0.34824729 0.85727251 0.3347955 0.87011248 0.34153447 0.87943709 0.44555959 0.44293365
		 0.46155345 0.43502215 0.98467934 0.7419861 0.99550104 0.73544014 0.99800789 0.72624731
		 0.96883458 0.74112397 0.095570154 0.54841173 0.13664667 0.084891334 0.14206375 0.067060702
		 0.43819219 0.42943349 0.49518484 0.5097459 0.47964054 0.49381414 0.46178743 0.50552201
		 0.47788078 0.52289182 0.4748466 0.60925245 0.4852927 0.62458175 0.28550774 0.85430014
		 0.28992736 0.87616217 0.30107674 0.87225026 0.29586932 0.8566708 0.49048746 0.6414302
		 0.48785272 0.68494898 0.51227397 0.68190217 0.15556888 0.86414897 0.15660299 0.84017926
		 0.11928806 0.041668281 0.1283139 0.052471943 0.15519758 0.038411427 0.17071995 0.048811156
		 0.40480065 0.441315 0.40840086 0.44959062 0.23191148 0.84670073 0.22406787 0.84017938
		 0.23048212 0.61240035 0.23616523 0.61080652 0.2218276 0.61408383 0.30012217 0.69916159
		 0.30016142 0.70429915 0.29647881 0.71594596 0.29860446 0.73815399 0.31015912 0.73881316
		 0.72587126 0.65097046 0.70129526 0.65559262 0.11143188 0.86964124 0.11143188 0.88843244
		 0.77728724 0.73224711 0.77144665 0.70075274 0.33629224 0.66253155 0.30914035 0.6626364
		 0.12677152 0.013654574 0.10965549 0.033342984 0.14369902 0.0019782411 0.12915571
		 0.50820118 0.11627415 0.50888282 0.98612589 0.67770845 0.96571046 0.68066943 0.12301338
		 0.83994883 0.11736145 0.84544927 0.11143188 0.84750193 0.2813153 0.56413013 0.26335874
		 0.55112857 0.31220469 0.57180321 0.47955346 0.59616393 0.49969217 0.58303922 0.46125227
		 0.53571606 0.47365087 0.55705452 0.37156036 0.61493438 0.52725887 0.57695174 0.48792493
		 0.57491821 0.467446 0.59786087 0.45595732 0.6104725 0.46398252 0.62967902 0.46737921
		 0.62372351 0.45021605 0.61980116 0.44213891 0.66829926 0.42842209 0.66903687 0.11808903
		 0.15325893 0.54263395 0.61829567 0.53309888 0.60450089 0.48785272 0.67071921 0.51182234
		 0.66829926 0.027596811 0.29817176 0.029364962 0.2837745 0.80207658 0.54281569 0.81103408
		 0.53911054 0.81211859 0.51683939 0.03580967 0.26585916 0.010539912 0.27490363 0.80979782
		 0.49108326 0.82178098 0.5116967 0.82184225 0.48833168 0.54777908 0.62901831 0.52733082
		 0.63971025 0.45208502 0.75948691 0.50581545 0.65883684 0.50236058 0.66430777 0.53729725
		 0.90278238 0.5294863 0.90065855 0.12772442 0.90418166 0.12810659 0.91321534 0.13803704
		 0.90714353 0.1446927 0.89242387 0.81960231 0.75387836 0.78136003 0.45887506 0.78584695
		 0.43891048 0.76923943 0.45576119 0.45512202 0.78142297 0.099021941 0.50451314 0.081653647
		 0.7691704 0.057444926 0.77897298 0.13882369 0.44977134 0.46898687 0.81128567 0.45730242
		 0.80943489 0.74760818 0.59172916 0.75710344 0.58464855 0.76811081 0.57486778 0.78014386
		 0.56491685 0.79451209 0.5569163 0.80153137 0.5644874 0.043659117 0.35347855 0.053121746
		 0.35925996 0.3623507 0.78453362 0.37474629 0.78610522 0.34677914 0.78335506 0.46884796
		 0.79913121 0.45730242 0.79745597 0.47942165 0.81431091 0.47960824 0.80160218 0.75708324
		 0.57005924 0.74572045 0.5807032 0.77060801 0.55800033 0.78272259 0.54680717 0.046158656
		 0.33762816 0.057648264 0.3439672 0.36413926 0.79833406 0.37601054 0.8013739 0.34677914
		 0.79728395 0.46933019 0.78646523 0.45730242 0.78541452 0.48046991 0.78695148 0.74233896
		 0.56387681 0.73304403 0.57559329 0.76113111 0.55110604 0.031479005 0.33226165 0.067704655
		 0.34979185 0.36531365 0.8091507 0.34677914 0.80834502 0.6722765 0.84389275 0.67294157
		 0.84732461 0.67435068 0.84732461 0.67374969 0.84397411 0.95894963 0.81885225 0.95717359
		 0.81597871 0.95733845 0.82168049 0.19372529 0.94124383 0.19085175 0.94301981 0.18766682
		 0.94827873 0.19054037 0.94650275 0.72383583 0.86742914 0.72383583 0.8645556 0.72354025
		 0.86584538 0.72354025 0.86871892 0.52450609 0.98143727 0.52737963 0.98143727 0.53035778
		 0.9745363 0.52748424 0.9745363 0.19711411 0.93669039 0.19424057 0.93846625 0.95814466
		 0.82745093 0.66926664 0.83729267 0.6663931 0.83729267 0.66940296 0.84389275 0.5572331
		 0.98587984 0.5572331 0.98875338 0.55780208 0.98958087 0.55780208 0.98670733 0.67160213
		 0.85792124 0.67237878 0.85474795 0.66950524 0.85474795 0.66872859 0.85792124 0.67006803
		 0.84732461;
	setAttr ".uvst[0].uvsp[4750:4757]" 0.48636633 0.97237337 0.050901152 0.94167924
		 0.054897379 0.94771802 0.75914812 0.85661334 0.75862414 0.8494423 0.75659186 0.84605998
		 0.15759599 0.81637567 0.045617733 0.93739939;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 2185 ".vt";
	setAttr ".vt[0:165]"  6.48692417 2.4453342 -66.1076889 6.59336042 2.46456027 -65.59886169
		 6.46110106 2.7705133 -65.50775146 6.31057787 2.87037754 -66.085105896 6.59336042 3.076463223 -65.41661072
		 6.48692417 3.29541945 -66.062530518 6.9126668 3.20319486 -65.3788681 6.9126668 3.47147822 -66.053161621
		 7.23196936 3.076463223 -65.41661072 7.3384099 3.29541945 -66.062538147 7.36423349 2.7705133 -65.50775909
		 7.51475763 2.87037754 -66.085105896 7.23196936 2.46456027 -65.59886169 7.3384099 2.4453342 -66.1076889
		 6.9126668 2.3378315 -65.63659668 6.9126668 2.26927614 -66.11704254 6.69979763 2.35414982 -65.076629639
		 6.61162424 2.53822303 -64.96981812 6.69979763 2.72229528 -64.86299133 6.9126668 2.7985394 -64.81876373
		 7.12553501 2.72229528 -64.86299133 7.21371317 2.53822303 -64.96981812 7.12553501 2.35414982 -65.076629639
		 6.9126668 2.27790499 -65.12088013 6.80623198 2.10945439 -64.57472229 6.76214552 2.18642402 -64.50123596
		 6.80623198 2.2633934 -64.42776489 6.9126668 2.29527473 -64.39732361 7.019100666 2.2633934 -64.42776489
		 7.063186646 2.18642402 -64.50123596 7.019100666 2.10945439 -64.57471466 6.9126668 2.077571154 -64.60515594
		 6.9126668 1.73467886 -64.12808228 8.89006233 2.69594264 -63.81013489 8.90393639 2.7019856 -63.74403381
		 8.73333549 3.11260366 -63.73442459 8.71371651 3.12158608 -63.81026077 8.90393639 3.52322435 -63.72481155
		 8.89006233 3.54722857 -63.81040192 9.31580734 3.69330835 -63.72083664 9.31580734 3.7235353 -63.81044769
		 9.72767448 3.52322435 -63.72481155 9.74154854 3.54722857 -63.81040192 9.89827728 3.11260366 -63.73442459
		 9.91789627 3.12158608 -63.81026077 9.72767448 2.7019856 -63.74403381 9.74154854 2.69594431 -63.81013489
		 9.31580734 2.53190184 -63.7480278 9.31580734 2.51963592 -63.81008148 8.99650002 2.74230051 -63.30304718
		 9.10293388 2.6599195 -62.77567673 9.014760971 2.84942937 -62.67883682 8.86424065 3.0526793 -63.22839355
		 9.10293388 3.038938761 -62.5819931 8.99650002 3.36305833 -63.15374374 9.31580734 3.1174376 -62.54187775
		 9.31580734 3.4916203 -63.12281036 9.52867699 3.038938761 -62.5819931 9.63511467 3.36305833 -63.15374374
		 9.6168499 2.84942937 -62.67883682 9.76737213 3.0526793 -63.22839355 9.5286808 2.6599195 -62.77567673
		 9.63511467 2.74230051 -63.30304718 9.31580734 2.58142138 -62.8157959 9.31580734 2.61373806 -63.33397293
		 9.20936966 2.44235921 -62.26141739 9.1652832 2.52313948 -62.19215775 9.20937157 2.60392237 -62.12288666
		 9.31580734 2.63738203 -62.094200134 9.42224121 2.60392237 -62.12288666 9.46632767 2.52313948 -62.19214249
		 9.42224121 2.44235921 -62.26141739 9.31580734 2.40889716 -62.29011536 9.31580734 2.091955662 -61.79541397
		 10.86996269 2.51980615 -63.99295044 10.88575554 2.52708197 -63.91773224 10.71595192 2.93567133 -63.90892029
		 10.69362068 2.94544268 -63.99530411 10.88575554 3.34426069 -63.90009689 10.86996269 3.37107921 -63.99768066
		 11.29570293 3.51350355 -63.89645004 11.29570293 3.54738092 -63.99867249 11.70565701 3.34426069 -63.90009689
		 11.72144699 3.37107921 -63.99768066 11.87545776 2.93567133 -63.90892029 11.89779568 2.94544268 -63.99531174
		 11.70565701 2.52708077 -63.91773224 11.72144699 2.51980615 -63.99295044 11.29570293 2.3578372 -63.92139816
		 11.29570293 2.34350157 -63.99196625 10.97639847 2.56882691 -63.48611832 11.082836151 2.48921752 -62.95831299
		 10.99465942 2.67923427 -62.86246872 10.84413719 2.87959218 -63.41308975 11.082836151 2.86925125 -62.76662445
		 10.97639847 3.19035959 -63.340065 11.29570293 2.94795799 -62.72692871 11.29570293 3.31908298 -63.30981827
		 11.50858212 2.86925125 -62.76662445 11.61501503 3.19035959 -63.340065 11.59675503 2.67923427 -62.86246872
		 11.74727631 2.87959218 -63.41308975 11.50858212 2.48921752 -62.95832062 11.61501503 2.56882691 -63.48611832
		 11.29570293 2.41051078 -62.99802399 11.29570293 2.44010377 -63.51636887 11.18927383 2.27436304 -62.4429245
		 11.14518547 2.35550714 -62.37408447 11.18927383 2.43665051 -62.30524063 11.29570293 2.47026134 -62.27672958
		 11.40214157 2.43665051 -62.30524063 11.44622993 2.35550714 -62.37408447 11.40214157 2.27436304 -62.4429245
		 11.29570293 2.24075174 -62.47143555 11.29570293 1.92641294 -61.9750824 13.18668461 2.015286684 -66.34494781
		 13.29104996 2.13289809 -65.8883667 13.1613636 2.44194365 -65.84768677 13.013773918 2.42433023 -66.38227081
		 13.29104996 2.75098658 -65.80700684 13.18668461 2.83337188 -66.41960144 13.60413361 2.8789978 -65.79017639
		 13.60413361 3.0028002262 -66.43507385 13.91721821 2.75098658 -65.80700684 14.021583557 2.83337188 -66.41960144
		 14.046906471 2.44194365 -65.84768677 14.19449615 2.42433023 -66.38227081 13.91721821 2.13289809 -65.8883667
		 14.021583557 2.015286684 -66.34494781 13.60413361 2.0048885345 -65.90522766 13.60413361 1.84585667 -66.32946014
		 13.39540768 2.12971139 -65.40211487 13.30895424 2.32579184 -65.33071899 13.39540768 2.52187395 -65.25932312
		 13.60413361 2.60309339 -65.22975159 13.81285763 2.52187395 -65.25932312 13.89931297 2.32579184 -65.33071899
		 13.81285858 2.12971139 -65.40211487 13.60413361 2.048492193 -65.43169403 13.49977112 1.99472082 -64.91595459
		 13.45654297 2.082334995 -64.86009216 13.49977398 2.16994905 -64.804245 13.60413361 2.20624018 -64.78111267
		 13.708498 2.16994905 -64.80426025 13.7517252 2.082334995 -64.86009216 13.708498 1.99472082 -64.91595459
		 13.60413361 1.95842934 -64.93908691 13.60413361 1.72511125 -64.46203613 6.53074884 2.59799409 30.96319771
		 6.5389142 2.59947014 31.0022220612 6.3659482 3.015375137 31.030073166 6.35440111 3.023034811 30.98578262
		 6.5389142 3.43128467 31.057918549 6.53074884 3.44807863 31.0083637238 6.95649099 3.60356021 31.069444656
		 6.95649099 3.62413788 31.017723083 7.37406969 3.43128467 31.057918549 7.38223076 3.44807863 31.0083637238
		 7.54703712 3.015375137 31.030073166 7.55858183 3.023034811 30.98578262 7.37406969 2.59947014 31.0022220612
		 7.38223076 2.59799409 30.96319771 6.95649099 2.42719245 30.99068451 6.95649099 2.42193389 30.95383263
		 6.6371851 2.61721873 31.47202682 6.74362135 2.50680876 31.99425697;
	setAttr ".vt[166:331]" 6.65544605 2.69088006 32.10106659 6.5049243 2.92317152 31.56315231
		 6.74362135 2.87495255 32.207901 6.6371851 3.22912455 31.65427017 6.95649099 2.95120025 32.25214005
		 6.95649099 3.35585356 31.69200134 7.16935968 2.87495255 32.20788574 7.2758007 3.22912455 31.65427017
		 7.25753689 2.69088006 32.10107422 7.40805721 2.92317152 31.56315231 7.16936398 2.50680876 31.99425697
		 7.2758007 2.61721873 31.47202682 6.95649099 2.43056488 31.9500103 6.95649099 2.49049115 31.4342823
		 6.85005236 2.26211476 32.49617004 6.80596972 2.33908272 32.56964111 6.85005236 2.4160533 32.64312363
		 6.95649099 2.44793463 32.67355347 7.062925816 2.4160533 32.64312363 7.10701418 2.33908272 32.56964111
		 7.062925816 2.26211476 32.49617004 6.95649099 2.230232 32.46573257 6.95649099 1.88733816 32.94281006
		 8.80138969 2.79539371 32.91781616 8.83172417 2.80860567 33.062320709 8.66793633 3.20140076 33.083511353
		 8.62503815 3.22103834 32.91767502 8.83172417 3.59419179 33.10469055 8.80138969 3.64668131 32.9175415
		 9.22712898 3.75689197 33.11346817 9.22712898 3.82298541 32.91749573 9.62254143 3.59419179 33.10469055
		 9.65287399 3.64668131 32.9175415 9.78631973 3.20140076 33.083511353 9.829216 3.22103834 32.91766739
		 9.62254143 2.80860567 33.06231308 9.65287399 2.79539633 32.91780472 9.22712898 2.64590693 33.053546906
		 9.22712898 2.6190896 32.91786194 8.90782356 2.84175134 33.4248848 9.014253616 2.75937057 33.95225906
		 8.92608452 2.94887924 34.049102783 8.77556229 3.15213132 33.49954605 9.014253616 3.13839149 34.1459465
		 8.90782356 3.46250916 33.57420349 9.22712898 3.21688819 34.18605804 9.22712898 3.59107208 33.60513306
		 9.43999863 3.13839149 34.1459465 9.54643631 3.46250916 33.57420349 9.52817154 2.94887924 34.049102783
		 9.67869759 3.15213132 33.49954605 9.43999863 2.75937057 33.95225906 9.54643631 2.84175134 33.4248848
		 9.22712898 2.68087196 33.91214371 9.22712898 2.71318913 33.39395905 9.12069511 2.54180932 34.46651077
		 9.076604843 2.6225903 34.53577805 9.12069511 2.70337462 34.6050415 9.22712898 2.73683405 34.63373566
		 9.33356476 2.70337462 34.6050415 9.37765312 2.6225903 34.53577805 9.33356476 2.54180932 34.46651077
		 9.22712898 2.50835133 34.43782425 9.22712898 2.19140601 34.93252945 10.78128624 2.73305464 32.84774399
		 10.79452515 2.73915195 32.91077042 10.62365532 3.15050292 32.91777039 10.60493851 3.15869284 32.84537888
		 10.79452515 3.56185341 32.92478943 10.78128624 3.58432579 32.84300995 11.20703125 3.73224163 32.92769241
		 11.20703125 3.76062822 32.84202957 11.61953163 3.56185341 32.92478943 11.63277054 3.58432579 32.84300995
		 11.79039955 3.15050292 32.91777039 11.80912399 3.15869284 32.84537888 11.61953163 2.73915029 32.91077042
		 11.63277054 2.73305464 32.84774399 11.20703125 2.56876254 32.90787888 11.20703125 2.55675125 32.84872437
		 10.88772202 2.78207612 33.3545723 10.99415779 2.70246649 33.88237 10.90598488 2.89248252 33.97821426
		 10.75546646 3.092841625 33.42759705 10.99415779 3.082499027 34.074062347 10.88772202 3.40361047 33.50062561
		 11.20703125 3.16120815 34.11376953 11.20703125 3.53233218 33.53087616 11.41989899 3.082499027 34.074062347
		 11.52633572 3.40361047 33.50062561 11.5080719 2.89248252 33.97822189 11.65860081 3.092841625 33.42759705
		 11.41989899 2.70246649 33.88237 11.52633572 2.78207612 33.3545723 11.20703125 2.62375975 33.84268951
		 11.20703125 2.65335035 33.32432175 11.10059547 2.48761272 34.39776993 11.056509018 2.5687561 34.46660995
		 11.10059547 2.64989758 34.53544998 11.20703125 2.68351054 34.56396103 11.31346798 2.64989758 34.53544998
		 11.35754967 2.5687561 34.46660995 11.31346798 2.48761272 34.39776993 11.20703125 2.4540019 34.3692627
		 11.20703125 2.13966274 34.86560822 13.098005295 2.060727119 30.88998985 13.20236778 2.17833829 31.3465519
		 13.072685242 2.4873817 31.38722992 12.92509365 2.46976805 30.85265541 13.20236969 2.7964282 31.42790985
		 13.098008156 2.87881088 30.81531143 13.51545906 2.92443562 31.44475555 13.51545906 3.048241138 30.79983711
		 13.82854462 2.7964282 31.42790985 13.9329071 2.87881088 30.81531143 13.95823288 2.4873817 31.38722992
		 14.10581493 2.46976805 30.85265541 13.8285408 2.17833829 31.3465519 13.9329071 2.060727119 30.88998985
		 13.51545906 2.050329208 31.32970428 13.51545906 1.89129317 30.90545273 13.30673027 2.17515016 31.83280182
		 13.22027588 2.37123322 31.90419579 13.30673027 2.567312 31.97559738 13.51545906 2.64853024 32.0051765442
		 13.72417831 2.567312 31.97559738 13.81063747 2.37123322 31.90420151 13.72417831 2.17515016 31.83280182
		 13.51545906 2.093930244 31.80322266 13.41109467 2.040158987 32.3189621 13.36786747 2.12777305 32.37482452
		 13.41109467 2.21538711 32.43067169 13.51545906 2.25167918 32.45380783 13.61981773 2.21538711 32.43067169
		 13.66304779 2.12777305 32.37481689 13.61981773 2.040158987 32.3189621 13.51545906 2.0038702488 32.29582977
		 13.51545906 1.77055013 32.77290726 -6.48692417 2.44533348 -66.1076889 -6.59336042 2.46456003 -65.59886169
		 -6.46110201 2.77051473 -65.50775146 -6.31057882 2.87037754 -66.085105896 -6.59336042 3.07646656 -65.41661072
		 -6.48692417 3.2954216 -66.062530518 -6.9126668 3.20319653 -65.3788681 -6.91266632 3.47148037 -66.053161621
		 -7.23197079 3.076462507 -65.41661072 -7.3384099 3.29541945 -66.062545776 -7.36423349 2.77051473 -65.50775909
		 -7.51475763 2.87037802 -66.085113525 -7.23197126 2.46456051 -65.59886169 -7.33841085 2.44533515 -66.1076889
		 -6.91266727 2.33783102 -65.63659668 -6.91266775 2.26927567 -66.11705017 -6.69979811 2.35414934 -65.076629639
		 -6.61162424 2.53822446 -64.96981812 -6.69979668 2.72229838 -64.86299133 -6.91266727 2.79854131 -64.81876373
		 -7.12553644 2.72229528 -64.86299133 -7.21371412 2.53822255 -64.96981049 -7.12553644 2.35415053 -65.076629639
		 -6.91266727 2.2779057 -65.12088776 -6.80623245 2.10945463 -64.57472229 -6.76214552 2.18642473 -64.50123596
		 -6.80623102 2.26339483 -64.42775726 -6.91266727 2.29527617 -64.39732361;
	setAttr ".vt[332:497]" -7.01910162 2.26339412 -64.42776489 -7.063187599 2.18642402 -64.50123596
		 -7.01910162 2.10945487 -64.57471466 -6.91266775 2.077571869 -64.60516357 -6.91266775 1.73467886 -64.12808228
		 -8.89006424 2.69594407 -63.81014252 -8.90393829 2.70198631 -63.74404144 -8.73333645 3.11260414 -63.73442078
		 -8.71371841 3.12158775 -63.81026077 -8.90393734 3.52322507 -63.72481155 -8.89006329 3.54722857 -63.8103981
		 -9.31580734 3.69330978 -63.72083664 -9.3158083 3.72353482 -63.81044006 -9.72767448 3.52322459 -63.72480774
		 -9.74154949 3.54722857 -63.8103981 -9.89827824 3.11260319 -63.73442078 -9.91789818 3.12158585 -63.81026077
		 -9.72767544 2.70198536 -63.74403381 -9.74154949 2.69594431 -63.81013489 -9.31580925 2.53190184 -63.74803543
		 -9.3158083 2.51963687 -63.81008911 -8.99650097 2.7422998 -63.30304718 -9.10293484 2.65991879 -62.77567291
		 -9.014761925 2.84942961 -62.67883682 -8.8642416 3.052678585 -63.22839355 -9.10293388 3.038942575 -62.58199692
		 -8.99650097 3.36306214 -63.15374756 -9.3158083 3.11744046 -62.54187775 -9.3158083 3.49162507 -63.12281036
		 -9.52867794 3.038938999 -62.5819931 -9.63511467 3.36305881 -63.15373611 -9.61685181 2.84942842 -62.67883682
		 -9.76737309 3.052678823 -63.22839355 -9.52868176 2.65991688 -62.77567673 -9.63511658 2.74229956 -63.30305099
		 -9.3158083 2.58141875 -62.8157959 -9.3158083 2.61373687 -63.33397293 -9.20937157 2.44235849 -62.26141739
		 -9.16528416 2.52314043 -62.19215393 -9.20937252 2.60392451 -62.12288666 -9.31580734 2.63738394 -62.094192505
		 -9.42224121 2.60392284 -62.12288666 -9.46632862 2.52313948 -62.19214249 -9.42224216 2.44235802 -62.26141357
		 -9.3158083 2.40889525 -62.29011154 -9.3158083 2.091956377 -61.79541397 -10.86996365 2.51980782 -63.99295044
		 -10.88575554 2.52708364 -63.91772461 -10.71595287 2.93567252 -63.9089241 -10.69362164 2.94544315 -63.99530411
		 -10.88575554 3.34426212 -63.90010071 -10.86996269 3.37107944 -63.99768066 -11.29570293 3.51350379 -63.89645386
		 -11.29570293 3.54738164 -63.99866486 -11.70565701 3.34426069 -63.90009689 -11.72144794 3.37107801 -63.99768066
		 -11.87545967 2.93567085 -63.9089241 -11.89779854 2.94544244 -63.99531174 -11.70565796 2.52707982 -63.91773605
		 -11.72144794 2.51980615 -63.99294662 -11.29570484 2.35783792 -63.92139816 -11.29570484 2.34350228 -63.99196243
		 -10.97640038 2.56882715 -63.4861145 -11.082837105 2.489218 -62.95831299 -10.99466038 2.67923284 -62.86247635
		 -10.8441391 2.87959337 -63.41308975 -11.082836151 2.86925983 -62.76663208 -10.97640038 3.19036818 -63.34007645
		 -11.29570293 2.94796681 -62.72693253 -11.29570293 3.31909037 -63.3098259 -11.50858402 2.86925054 -62.76662445
		 -11.61501694 3.19035959 -63.34006882 -11.59675598 2.67923284 -62.8624649 -11.74727821 2.8795917 -63.41308975
		 -11.50858212 2.4892168 -62.95832062 -11.61501694 2.56882596 -63.48612976 -11.29570484 2.41051078 -62.99802017
		 -11.29570484 2.44010401 -63.51636887 -11.18927479 2.27436423 -62.4429245 -11.14518547 2.3555069 -62.37408829
		 -11.18927383 2.43665242 -62.30524063 -11.29570293 2.47026348 -62.27672958 -11.40214157 2.43664956 -62.30524063
		 -11.44623089 2.35550666 -62.37408447 -11.40214157 2.2743578 -62.44291306 -11.2957058 2.24074745 -62.4714241
		 -11.29570484 1.92641151 -61.97507858 -13.1866827 2.015286922 -66.34494781 -13.291049 2.13289833 -65.8883667
		 -13.16136265 2.44194341 -65.84768677 -13.013772964 2.42433095 -66.38227081 -13.29104996 2.75098634 -65.80700684
		 -13.1866827 2.83337045 -66.41959381 -13.60413647 2.8789978 -65.79017639 -13.60413361 3.002799511 -66.43506622
		 -13.91722012 2.75098729 -65.80700684 -14.021583557 2.83337188 -66.41959381 -14.046907425 2.44194293 -65.84768677
		 -14.19449711 2.42433047 -66.38227081 -13.91721821 2.1328969 -65.8883667 -14.021583557 2.015286207 -66.34494781
		 -13.60413361 2.0048873425 -65.90522766 -13.6041317 1.84585524 -66.32946014 -13.39541054 2.12971163 -65.4021225
		 -13.30895615 2.32579136 -65.33072662 -13.39540958 2.52187157 -65.25932312 -13.60413361 2.60309172 -65.22975159
		 -13.81285763 2.52187419 -65.25932312 -13.89931393 2.32579088 -65.33071899 -13.81285858 2.12971115 -65.40211487
		 -13.60413456 2.04849267 -65.43169403 -13.49977303 1.99471998 -64.91595459 -13.45654488 2.082335234 -64.86009979
		 -13.49977398 2.16994786 -64.80423737 -13.6041317 2.20623946 -64.78110504 -13.70849705 2.16995049 -64.80425262
		 -13.75172329 2.082336426 -64.86009216 -13.70849609 1.99472487 -64.91596222 -13.60413361 1.95843196 -64.93908691
		 -13.6041317 1.72511387 -64.46203613 -6.53074884 2.59799409 30.96319389 -6.53891516 2.5994699 31.0022220612
		 -6.36594915 3.015374899 31.030067444 -6.35440207 3.023034334 30.98578072 -6.53891468 3.43128467 31.057918549
		 -6.5307498 3.44807863 31.0083580017 -6.95649195 3.60356283 31.069444656 -6.95649195 3.62414098 31.017723083
		 -7.37407064 3.43128729 31.057918549 -7.38223124 3.44808197 31.0083637238 -7.54703712 3.015375137 31.030073166
		 -7.55858183 3.023034811 30.98578262 -7.37406969 2.5994699 31.0022182465 -7.38223076 2.59799409 30.96319389
		 -6.95649147 2.42719221 30.9906826 -6.95649099 2.42193317 30.9538269 -6.63718653 2.61721873 31.47202682
		 -6.7436204 2.50680637 31.99425697 -6.65544701 2.69088006 32.10106659 -6.5049243 2.92317128 31.56315231
		 -6.74362326 2.87495279 32.20790482 -6.6371851 3.22912478 31.65427017 -6.95649195 2.95120311 32.25213623
		 -6.95649147 3.3558557 31.69200134 -7.16935968 2.87495518 32.20788193 -7.2758007 3.22912621 31.65426254
		 -7.25753593 2.69088054 32.10107422 -7.40805721 2.92317152 31.56315231 -7.16936445 2.50680876 31.99425697
		 -7.2758007 2.61721873 31.47202682 -6.95649099 2.4305625 31.9500103 -6.95649147 2.49049139 31.4342823
		 -6.85005188 2.2621119 32.49617004 -6.80597067 2.33908248 32.56964111 -6.85005379 2.41605353 32.64312363
		 -6.95649195 2.4479351 32.67355347 -7.062925816 2.41605377 32.64312363 -7.10701418 2.33908272 32.56964111
		 -7.062926769 2.26211476 32.49617004 -6.95649099 2.23022962 32.46573257 -6.95649195 1.8873378 32.94281006
		 -8.80139065 2.79539347 32.91781616 -8.83172512 2.80860543 33.062320709 -8.66793728 3.20140052 33.083511353
		 -8.6250391 3.22103834 32.91767502 -8.83172512 3.59419179 33.10469055;
	setAttr ".vt[498:663]" -8.80139065 3.64668131 32.91754532 -9.22712994 3.75689244 33.11346817
		 -9.22712994 3.82298565 32.91749954 -9.62254143 3.59419179 33.10469055 -9.65287495 3.64668131 32.91754532
		 -9.78632069 3.20140052 33.083511353 -9.82921696 3.22103834 32.91766739 -9.62254238 2.80860567 33.06231308
		 -9.65287495 2.79539633 32.91780853 -9.22712994 2.64590549 33.053546906 -9.22712994 2.61908841 32.91786575
		 -8.90782452 2.84175134 33.4248848 -9.014253616 2.75936937 33.95225906 -8.92608547 2.94887924 34.049098969
		 -8.77556229 3.15213108 33.49954224 -9.014255524 3.13839221 34.1459465 -8.90782452 3.46250916 33.57420349
		 -9.22713184 3.21688962 34.18606186 -9.22712994 3.59107232 33.60513306 -9.44000149 3.13839269 34.14595032
		 -9.54643726 3.46250963 33.57420349 -9.52817249 2.94887877 34.049102783 -9.67869854 3.15213108 33.49954605
		 -9.44000053 2.75937057 33.95225906 -9.54643726 2.84175014 33.42488098 -9.22712994 2.68087149 33.91214371
		 -9.22712994 2.71318889 33.39395523 -9.12069607 2.54180789 34.46651077 -9.076605797 2.62259007 34.53577805
		 -9.12069607 2.70337486 34.6050415 -9.22713184 2.736835 34.63373947 -9.33356762 2.70337486 34.6050415
		 -9.37765408 2.62258959 34.53577805 -9.33356667 2.54180932 34.46651459 -9.22712994 2.50835037 34.43782806
		 -9.22712994 2.19140577 34.93252945 -10.78128719 2.73305464 32.84774399 -10.7945261 2.73915243 32.91077042
		 -10.62365532 3.15050244 32.91776657 -10.60494041 3.15869212 32.84537506 -10.7945261 3.56185317 32.92478561
		 -10.78128719 3.58432508 32.84300613 -11.20703316 3.73224354 32.9276886 -11.20703316 3.76062942 32.84202576
		 -11.61953259 3.5618546 32.92478943 -11.63277054 3.58432627 32.84300613 -11.79040146 3.15050316 32.91777039
		 -11.8091259 3.15869355 32.84537888 -11.61953259 2.739151 32.91077042 -11.63277054 2.73305583 32.84774399
		 -11.20703316 2.56876302 32.90787888 -11.20703316 2.55675125 32.84872437 -10.88772202 2.78207612 33.3545723
		 -10.99415684 2.70246577 33.88237 -10.90598488 2.89248252 33.97821426 -10.75546646 3.092841625 33.42759705
		 -10.9941597 3.082499504 34.074062347 -10.88772297 3.40361071 33.50062561 -11.20703411 3.16120934 34.11377335
		 -11.20703316 3.53233457 33.53087616 -11.41990089 3.082500219 34.074066162 -11.52633953 3.4036119 33.50062943
		 -11.50807285 2.892483 33.97822189 -11.65860081 3.092841625 33.42759705 -11.41989994 2.70246673 33.88236618
		 -11.52633572 2.78207636 33.3545723 -11.20703125 2.62375903 33.84268951 -11.20703316 2.65335107 33.32432175
		 -11.10059643 2.48761177 34.39776993 -11.056510925 2.56875634 34.46660995 -11.10059738 2.64989781 34.53544998
		 -11.20703316 2.6835103 34.56396103 -11.31346798 2.64989734 34.53544998 -11.35755062 2.5687561 34.46660614
		 -11.31346798 2.48761272 34.39776993 -11.20703316 2.45400095 34.3692627 -11.20703316 2.1396625 34.86560822
		 -13.098006248 2.060727119 30.88998985 -13.20236874 2.17833829 31.3465519 -13.072687149 2.48738146 31.38722992
		 -12.92509556 2.46976733 30.85265541 -13.20237064 2.7964282 31.42790985 -13.098011017 2.87881088 30.81531334
		 -13.51546097 2.92443538 31.44475555 -13.51546001 3.048241854 30.79983711 -13.82854462 2.79642749 31.42790794
		 -13.9329052 2.87881041 30.81530571 -13.95823383 2.48738003 31.3872242 -14.10581493 2.46976686 30.85265541
		 -13.82854271 2.17833686 31.34654808 -13.93290806 2.060726881 30.88999176 -13.51546097 2.050329685 31.32970619
		 -13.51546001 1.89129388 30.90545273 -13.30673218 2.17515039 31.83280182 -13.22027683 2.37123346 31.90419769
		 -13.30673218 2.567312 31.9756031 -13.51546097 2.6485281 32.0051765442 -13.72418022 2.56731057 31.97559738
		 -13.81064129 2.37123203 31.90419579 -13.72418022 2.17514873 31.832798 -13.51546097 2.093930721 31.80322647
		 -13.41109467 2.040158272 32.3189621 -13.36786842 2.12777305 32.37482452 -13.41109657 2.21538711 32.43067169
		 -13.51546001 2.25167823 32.45380783 -13.61981869 2.21538663 32.43067551 -13.66305065 2.12777281 32.37481689
		 -13.61981869 2.040158987 32.31895828 -13.51546097 2.0038704872 32.29582977 -13.51546001 1.77054989 32.77290726
		 0 84.13207245 72.82268524 0 81.78659058 74.52604675 0 75.2638855 70.78089905 0 75.68205261 68.30968475
		 0 88.70804596 17.62944603 0 58.27204895 40.49365997 0 48.66227341 23.55532265 0 86.59301758 -2.63620925
		 0 87.79353333 12.045446396 0 48.6283989 0.43176186 0 51.3186264 -7.45880413 0 86.42256165 -54.23510742
		 0 88.83914948 -49.13899612 0 91.47158051 -37.59538651 0 66.75384521 -37.4615097 0 64.5916214 -50.59585571
		 0 57.22567749 -17.21206284 0 63.23067474 -24.18564415 0 88.22454834 -20.50881195
		 0 87.14896393 -14.25978565 0 66.27381897 42.82706833 0 63.10871887 41.70863724 0 91.0068359375 26.66389847
		 0 92.11126709 38.10640717 0 74.77415466 53.70687866 0 93.88730621 52.4884758 0 84.5085907 -57.71133423
		 0 76.95613861 63.15950394 0 76.61151886 61.073516846 0 76.26487732 59.57462311 0 93.73429871 66.64977264
		 0 92.13964081 69.12879944 0 90.065414429 70.90674591 0 81.092247009 -71.48106384
		 0 81.034873962 -64.13361359 0 72.9046936 -65.3077774 0 73.098800659 -71.48105621
		 0 73.11450195 -93.32185364 0 73.15354156 -100.10159302 0 80.82781219 -100.10159302
		 0 80.86928558 -93.32185364 0 73.32776642 -107.86654663 0 73.25557709 -115.65028381
		 0 80.83828735 -115.65028381 0 80.92607117 -107.86654663 0 73.10275269 -79.10614014
		 0 73.1415863 -85.89506531 0 80.97499084 -85.89507294 0 81.015365601 -79.10614014
		 0 73.93231201 -150.35870361 0 73.2363205 -146.92878723 0 80.26780701 -150.35870361
		 0 80.76321411 -146.92877197 0 76.54857635 65.35401917 0 87.98487854 70.34780121 0 87.10834503 70.44673157;
	setAttr ".vt[664:829]" 0 85.3092804 71.73729706 0 75.82507324 56.95912933 0 96.10279083 57.99990082
		 0 80.48474884 73.63845062 0 78.40873718 72.6291275 0 77.59614563 72.1984787 0 95.13339996 63.11952209
		 0 77.09211731 -151.79800415 0 82.60929871 -60.10282898 0 71.49871826 -59.19792938
		 0 80.81742859 -123.13466644 0 73.25024414 -123.1346817 0 80.79241943 -132.3276062
		 0 73.24381256 -132.3276062 0 80.77783203 -139.76556396 0 73.24005127 -139.76556396
		 0 67.2580719 -54.85592651 0 47.72134399 18.81861877 0 53.81137085 36.89801788 0 86.9201889 4.10489941
		 0 89.41310883 -25.9922142 0 68.77294922 -57.7841301 0 89.69078827 22.46853256 0 92.099258423 35.062770844
		 0 91.28233337 -43.13972092 0 66.51077271 -30.90769196 0 90.65491486 -31.9652977 0 64.57872772 -43.83424377
		 0 47.23526382 9.29570198 0 86.85012817 -8.45184612 0 91.85534668 31.099569321 0 50.87897491 32.68380737
		 0 49.59095001 27.75988579 2.44243789 81.83345795 72.9948349 1.66009188 83.51380157 71.82208252
		 1.41143548 83.9670639 72.48207092 1.25268817 81.78167725 74.13931274 2.044589043 83.8796463 70.14437866
		 3.46804357 80.55558014 71.37364197 4.12416029 80.791008 69.082504272 3.48321128 83.55010223 69.077430725
		 1.24584544 75.78128815 68.33846283 0.784554 75.33055878 70.65391541 2.98516703 76.47901154 68.62783051
		 2.3216064 75.93512726 69.81687927 11.76450443 83.5485611 18.66204453 6.83143902 87.45718384 18.45139122
		 16.3311882 76.61721802 11.43468857 8.447855 -0.074073419 27.24163246 6.44453239 -0.083898783 26.61754608
		 6.77578688 -0.072545402 24.81176758 8.45342636 -0.070595689 25.84558296 7.56159925 -0.059882738 23.22510529
		 8.91589737 -0.06718225 25.24369621 9.46048164 -0.050948475 22.1386528 11.59025574 -0.05565545 22.76295662
		 10.69153595 -0.064940676 24.98638344 9.67503357 -0.063724712 24.72313499 11.27935028 -0.068102062 25.65233612
		 11.49951553 -0.072146632 27.17442322 10.15408516 -0.067092448 27.66594505 9.9873333 -0.065121435 25.85131454
		 3.91345739 58.15938187 41.50614548 3.36052942 48.42262268 22.9586544 6.53919554 49.56438065 16.34788895
		 5.81297922 48.87305069 22.44332314 9.5028286 66.28997803 38.96475983 12.67575073 82.4524765 11.77621841
		 7.41610146 86.026039124 11.99019814 12.95869827 80.68063354 -3.061230421 7.59663963 85.10289001 -2.89687514
		 10.22964191 60.91811371 -9.30550957 15.25160027 74.51389313 -2.94296384 7.53475523 51.52169418 -0.3932164
		 6.34168005 53.94944382 -8.84580994 8.21689796 56.69712448 -9.10744953 4.13872576 48.95183182 0.20601255
		 3.77242494 52.072338104 -7.7523365 7.60469246 89.34115601 -37.34286499 11.21060467 83.50936127 -36.98339081
		 15.6722517 81.10424805 -49.77070236 7.5547514 87.023406982 -49.43269348 11.080137253 79.32483673 -55.52589798
		 6.35354471 84.69822693 -54.63933563 15.64845753 61.98119354 -50.46301651 13.15115261 62.031944275 -57.21705246
		 12.31352901 72.8985672 -56.44597626 15.97889042 74.0074005127 -49.73223495 12.78975582 75.28490448 -36.37374496
		 0.52577591 63.75939178 -50.78233719 2.78083587 66.89038086 -37.8376236 3.51662827 57.41321945 -17.34273911
		 3.37304997 63.60599518 -24.59131622 4.76631784 63.77439117 -26.063640594 5.85940123 57.68634415 -17.60097122
		 8.16302013 59.01455307 -17.40834808 8.0065145493 61.28419113 -25.37615776 9.73413372 63.64118195 -24.429636
		 9.91729927 62.20684433 -16.77339172 12.46573353 73.98178864 -15.6143465 11.18961716 74.28331757 -21.75755119
		 12.13916397 80.49316406 -21.11860657 12.7381525 80.078468323 -15.011627197 7.80131912 85.044464111 -14.49102879
		 8.0044517517 85.97846985 -20.70205116 3.5611999 66.78955841 42.87456894 3.6993947 63.45372772 41.90085983
		 7.048126221 64.58895111 40.89893341 6.86935806 68.42033386 42.036201477 10.055560112 71.77301025 40.11117554
		 11.44666767 78.82183838 39.57934189 10.91837978 84.95884705 39.090171814 8.82297039 88.65578461 38.53131104
		 5.47363281 91.6185379 38.13008499 3.044170618 75.3061142 53.79088974 5.79711342 77.029296875 53.50024796
		 7.55193758 80.2971344 53.091041565 8.7430706 84.75646973 52.45521545 8.68809986 90.89014435 53.8707428
		 7.045248985 93.24604034 54.72697067 3.52479768 93.93631744 52.73692322 2.80766916 65.42455292 -56.83927536
		 3.042160988 73.43965149 -60.37906265 8.80767441 73.184021 -59.98653793 9.6092844 61.55423355 -60.3679657
		 7.80767965 78.36096191 -58.77924347 5.023697376 82.84638977 -57.89970016 9.42409611 53.70186996 36.31869125
		 8.11362934 48.67062759 31.8077755 11.18593216 48.60302353 32.67591476 14.52392006 49.1949234 29.53892517
		 14.48212814 61.19145584 31.034631729 9.29652405 53.57780838 14.95786095 6.41792917 50.59775925 21.47060776
		 8.35444927 50.82642365 17.28132057 6.65374517 48.52518463 23.22390938 17.21143913 61.67967606 21.2599926
		 12.42262745 55.54670715 16.41721725 13.23828125 51.24850464 18.98475838 11.45781422 51.24351501 15.96664524
		 17.2460022 61.32992172 26.8952446 15.11782265 50.375103 24.47956657 12.73197365 1.58975267 23.6875515
		 11.92863083 1.16995645 21.57968903 11.55482483 3.82770467 20.69743729 12.60341072 4.86215591 22.73022079
		 12.57353973 17.31836891 22.55596733 12.51181221 13.13885307 22.48271751 11.67612076 12.87574291 20.089735031
		 11.72563362 17.18172264 20.06530571 9.6498518 12.66275883 19.0048027039 9.6827507 17.12737465 18.71974373
		 9.4614048 1.044796109 20.87992859 9.54303741 3.31513095 20.0701828 7.80229998 1.37769878 22.058660507
		 7.9266305 3.90508366 20.67538834 7.88023996 12.88136196 20.026639938 7.878407 17.23039055 19.98995972
		 7.40789938 13.15400314 22.43839073 7.39919043 17.38417435 22.48689461 7.091202259 1.73500073 24.20694733
		 7.19328547 4.96450567 22.72899818 6.224226 2.46487069 26.18697929 7.95423269 5.9532547 24.8012085
		 10.26963043 4.93716764 32.00026702881 8.099796295 4.94553709 32.019557953;
	setAttr ".vt[830:995]" 7.72204638 3.43802571 33.4309845 10.49746799 3.38222408 33.40036011
		 7.18648958 -0.080350004 34.17190933 11.10033417 -0.084029481 34.17331696 9.62531853 -0.085515648 34.014904022
		 13.091596603 -0.078635007 34.064891815 13.022521973 3.35986781 33.18597031 9.78672791 3.37996078 33.13378906
		 12.30730438 4.94317389 31.80316734 10.26938438 4.93563032 31.76151657 5.854918 41.87627792 -46.86976242
		 10.53998375 39.73731613 -43.31155777 10.51311398 52.86097336 -37.34604645 5.29850483 52.19226456 -42.024944305
		 15.20088863 43.48051834 -48.0011901855 15.83029366 52.66678238 -44.54553604 6.45053148 47.20882416 -58.092445374
		 4.96981525 44.57009506 -52.89101791 2.078555107 53.58763885 -51.012134552 4.27527428 54.38077927 -57.56795883
		 12.58572483 48.27802658 -58.5785141 9.97408009 48.49385834 -60.3584404 10.049412727 55.25875092 -59.73934555
		 13.31828785 55.46086502 -57.76338577 13.22945976 64.019989014 -36.59835815 15.88091373 54.16522217 -52.17961502
		 14.86106396 46.85053253 -54.074867249 9.45247078 44.9852066 -61.039848328 11.69821453 44.39321899 -58.69521332
		 11.90212917 40.67738724 -60.4467659 9.46797466 41.6971817 -62.62747955 12.35883141 26.48169518 -76.27988434
		 9.83910561 27.24118996 -77.41199493 7.44576025 26.56113625 -76.43471527 8.089878082 41.28111267 -59.75260162
		 7.99017477 43.79632187 -58.56254959 6.0098161697 41.21243286 -54.64565659 6.43480635 38.42567825 -56.17763901
		 6.9302702 25.092535019 -72.060028076 8.056181908 24.46293831 -68.85771942 6.87031794 36.20868683 -52.0033416748
		 6.45569468 38.52641678 -49.06211853 10.5615921 37.16182327 -47.12498474 10.54986191 34.36353683 -51.79918671
		 10.55644417 24.018764496 -67.81190491 12.85640526 24.30544472 -69.265625 13.83821583 36.69773483 -54.72568512
		 14.65417099 40.68161392 -50.46632385 14.8894968 43.53921509 -55.40223312 14.26310253 39.11915588 -58.52946854
		 13.39070511 25.010477066 -72.11313629 2.45033121 77.18947601 63.12699509 3.066692829 76.92163849 61.10219574
		 3.22238278 76.73779297 59.34884262 5.96053696 78.44026947 59.052501678 5.70316553 78.67572784 61.034095764
		 5.36094618 78.49838257 63.17448044 6.60292625 80.38969421 63.46875381 7.22263288 80.82526398 61.024440765
		 7.8132205 81.05280304 58.77226639 8.69799519 84.78784943 58.60707092 8.091983795 83.98144531 61.33551407
		 8.25678444 83.43175507 65.000007629395 7.85518837 85.02822876 67.26107025 8.82664299 87.31819916 64.021636963
		 8.59418297 87.57446289 66.41189575 7.53960371 90.56502533 64.3494339 6.72587395 92.69808197 65.26255798
		 6.38999796 91.58893585 67.90962982 7.64498138 90.071495056 66.9992218 2.7209692 89.57897186 70.8948288
		 4.51152229 89.25112915 69.97162628 3.47510195 92.108078 68.9125824 3.66693521 93.66649628 66.20292664
		 2.82329035 79.64533997 -64.33837891 2.8191371 79.71551514 -71.48106384 3.56892633 76.95651245 -64.7186203
		 3.55801487 77.09601593 -71.48106384 2.82329035 74.30727386 -65.10662079 2.8191371 74.47653198 -71.48106384
		 2.80096412 74.47607422 -100.10159302 2.80553627 74.45092773 -93.32186127 3.51025558 76.99066925 -100.10159302
		 3.52226853 76.99187469 -93.32186127 2.80096412 79.50526428 -100.10159302 2.80553627 79.53286743 -93.32186127
		 2.79576564 74.56234741 -115.65028381 2.79664898 74.63722229 -107.86654663 3.49659157 77.046936035 -115.65028381
		 3.49891615 77.12690735 -107.86654663 2.79576564 79.53151703 -115.65028381 2.79664898 79.6166153 -107.86654663
		 2.8099966 74.49158478 -85.89507294 2.81449318 74.46639252 -79.10614777 3.5339911 77.058288574 -85.89507294
		 3.5458107 77.059066772 -79.10614777 2.8099966 79.62501526 -85.89507294 2.81449318 79.65175629 -79.10614777
		 2.71788478 74.74946594 -150.11683655 2.79259682 74.53347778 -146.92878723 3.24263024 77.10043335 -150.39476013
		 3.48826599 76.99977875 -146.92878723 2.71788478 79.45333099 -150.11683655 2.79259682 79.46607971 -146.92878723
		 1.55942476 76.45394897 65.33177948 3.83397841 77.28256226 66.25434113 5.54112673 79.62830353 65.58868408
		 5.40568638 81.033424377 67.62999725 5.21487284 83.69846344 68.29602814 6.71498394 86.49263 68.23340607
		 5.020814419 85.66994476 68.95287323 2.13161707 85.92207336 69.59199524 1.86720467 86.74718475 70.011405945
		 1.75107372 85.01839447 71.42008209 2.027927876 87.6653595 70.022964478 3.14728737 76.35771942 56.91927338
		 6.017287254 78.014709473 56.68271255 8.045885086 80.64601135 56.047901154 9.10747242 84.99271393 55.38607025
		 8.75752544 88.16812897 59.62497711 8.78301048 88.49615479 56.68533325 7.52710295 91.16426086 60.68525696
		 8.29556656 89.10731506 58.90747833 7.81190825 89.45648193 58.56961441 7.8409605 91.27254486 59.84373474
		 6.28327179 93.5271759 58.87761688 3.48117089 95.6922226 58.12454605 12.75794697 39.053085327 17.78406715
		 9.8648386 38.90790176 16.078893661 7.29606438 38.79151917 17.52243233 6.648983 38.49327087 21.78622246
		 8.13002205 13.37713432 24.34149933 8.14455795 17.51055908 24.56365776 7.77920771 38.58488083 25.61281204
		 10.54469967 38.1256485 27.066326141 10.21472168 17.54719734 25.53137589 10.18130207 13.48229313 25.31447983
		 12.068915367 13.36201096 24.38320923 12.12514687 17.46580505 24.60561943 13.08065033 38.39442062 25.63804626
		 13.76360226 38.81620026 21.85936165 2.69609261 81.27588654 71.92572784 1.80852616 83.16802979 70.89477539
		 1.8907584 83.084831238 71.47975159 2.5622108 81.57597351 72.38838196 1.4440186 80.80999756 73.058677673
		 1.52316976 81.25097656 73.55251312 1.22672117 80.24563599 73.31932068 5.44257593 87.10467529 68.75783539
		 4.86342525 86.43412018 69.002204895 3.27509332 87.82277679 69.093544006 4.1837101 87.97968292 69.13504791
		 2.69565248 86.7798996 68.80526733 2.72560883 86.8530426 68.78258514 3.5121336 86.37848663 69.11479187
		 3.78001142 78.8425293 69.49459839 3.72880888 78.38354492 69.50911713 4.55804729 78.86708832 68.045333862
		 4.6535511 79.21927643 68.054908752 4.4769907 78.92695618 67.89117432 3.65663958 78.45830536 69.51426697
		 3.57834888 77.93043518 69.46572876 4.40797186 78.37247467 67.8010025 4.64568424 78.89137268 67.58073425
		 4.84844637 79.047416687 67.15873718 3.82734036 85.54642487 69.11325836;
	setAttr ".vt[996:1161]" 4.21404457 86.24819183 69.091468811 6.59937334 87.54281616 68.27593231
		 5.43303823 87.31222534 68.78214264 6.11225891 88.5951767 69.034500122 5.014860153 87.7441864 68.97670746
		 2.98710728 78.14296722 71.078826904 0.94090605 78.12085724 72.10327911 0.926485 77.53728485 71.90239716
		 2.89908385 77.57900238 70.91430664 3.021348715 78.42489624 71.18208313 2.97456861 78.031295776 71.090270996
		 0.99343389 78.41960907 72.41291809 1.01757443 77.9601059 72.18341064 10.78494167 92.2195816 53.70845413
		 11.66244984 98.23417664 52.88523483 12.81448841 96.86508179 53.8715744 10.48176003 93.060455322 54.99107742
		 9.86875248 97.65892029 57.18666458 9.83285236 96.16500854 56.97823334 7.90866375 91.19543457 61.083862305
		 8.69862938 94.11637115 59.89690399 8.61491108 94.77561951 60.76887894 7.61767673 90.96989441 62.53097534
		 8.49245167 89.39094543 57.69430542 3.38029814 94.93314362 62.61154175 6.66942644 93.18757629 61.82720566
		 9.2339077 95.48188019 53.29007721 10.068083763 92.90231323 53.25297928 7.71881962 94.0053787231 54.81912231
		 8.067256927 91.41744232 55.49413681 7.57542944 96.44152832 57.56581497 7.45474625 95.051132202 56.94111633
		 8.22968578 89.87208557 57.48789215 7.008813858 94.79458618 60.64424896 7.45163488 93.46440125 60.20658112
		 8.62994957 87.36893463 61.91440582 11.97905159 7.16249847 -72.10829926 12.0063877106 5.51454592 -71.92922211
		 12.48478889 4.60233021 -73.59318542 12.39345646 6.79583216 -73.87650299 11.44194603 6.43543911 -75.78382111
		 11.39192772 3.5195334 -75.86885834 9.55916977 3.14925051 -76.76721954 9.71202087 6.59865808 -76.4371109
		 8.24729347 6.44965982 -75.79831696 8.14466667 3.71200776 -75.8618927 7.37284422 4.66461325 -73.56542969
		 7.59336138 6.80109119 -73.67313385 8.39226151 7.22387409 -71.90058136 8.24249458 5.41172409 -71.92430878
		 10.24804688 6.50074863 -70.58178711 10.28320503 7.80286837 -70.97137451 10.96944809 62.40391541 -33.98800659
		 4.47677374 3.00075697899 31.35957146 8.60033607 2.98291945 31.63829803 7.85399151 4.50054264 30.07913208
		 6.58707714 4.50607491 30.12352371 8.36124802 5.82170391 26.21526337 10.21135521 6.20399094 26.54340363
		 10.11853027 7.73651218 25.87575722 7.86543798 -0.087683782 29.18306923 6.25674725 -0.089875251 28.25452614
		 5.97376776 -0.076250657 32.86281967 8.052440643 -0.090158574 32.82076645 15.72312737 2.67144084 31.072414398
		 11.72326088 2.65331173 31.10010719 12.026660919 -0.089788556 32.27609253 14.99412155 -0.077818491 32.40552902
		 12.56645203 -0.091844022 28.9703846 10.20911026 -0.073683627 29.58314896 11.8981781 5.78007507 26.33437729
		 12.11690521 5.77035046 24.83520699 13.69994354 4.2503686 29.79971123 12.13888168 4.24411821 29.70658684
		 3.087026119 80.62604523 -60.2617836 4.1091938 77.3243103 -60.4539299 2.79488492 79.51332855 -123.13466644
		 3.49427748 77.033821106 -123.13466644 2.79488492 74.55433655 -123.13466644 2.79382896 79.49150848 -132.3276062
		 3.49150229 77.018096924 -132.3276062 2.79382896 74.54470825 -132.3276062 2.79321289 79.47878265 -139.76556396
		 3.48988318 77.0089416504 -139.76556396 2.79321289 74.53907776 -139.76556396 5.79164076 2.34497857 27.50719833
		 7.090873718 4.019465446 27.1773777 8.18229866 4.77400064 27.070129395 8.34811592 2.441468 29.75548744
		 10.25313759 5.46419191 27.1737709 10.084438324 2.40292501 32.95447159 12.070520401 2.37316322 28.57652473
		 12.060937881 5.12671328 27.1569767 13.80939293 2.15039945 25.35673904 14.81705475 2.449404 27.075275421
		 13.80638027 -0.085224733 28.28064919 13.45443916 -0.080766566 26.41579628 13.15606499 4.078810215 27.049844742
		 12.95708752 -0.069533356 24.60107994 12.92392254 25.6428833 22.076007843 12.8836937 21.84953117 22.36138916
		 11.95765591 21.58230019 19.65331078 11.99495316 25.35667992 19.31328011 12.40414524 25.84053421 24.59570885
		 12.36897945 22.08156395 24.63326454 10.30278206 26.0047283173 25.65986252 10.27058029 22.38972092 25.58722115
		 8.052396774 25.8241806 24.52885246 8.012526512 22.16885567 24.57382965 7.18355274 25.61152077 21.95719337
		 7.16282749 21.91699219 22.23585129 7.68786192 25.39288712 19.14833069 7.67050266 21.66797447 19.50990677
		 9.7246685 25.26158142 17.90900612 9.68827152 21.5017128 18.22925949 12.65254402 9.54507637 22.34096527
		 11.79485321 8.90999794 20.065313339 12.17615414 10.042600632 24.26047707 10.16390896 10.29898357 25.36610985
		 7.97291803 10.039896011 24.22145844 7.20950079 9.54376793 22.32779312 7.72778273 8.90352821 20.016838074
		 9.5892601 8.46529007 19.074678421 8.36516762 -0.053771242 -69.51902771 6.44528484 -0.053771242 -70.050888062
		 6.78199387 -0.047340859 -71.83317566 8.37104416 -0.053778987 -70.89141846 7.57097387 -0.03163537 -73.41088104
		 8.85857582 -0.053778987 -71.7178421 9.46053505 -0.04551864 -74.51800537 11.58511925 -0.033028785 -73.89961243
		 10.73043442 -0.053778987 -71.98683167 9.67503929 -0.053778987 -72.25008392 11.3501091 -0.05377122 -71.09916687
		 11.58219719 -0.053771242 -69.59700012 10.15408516 -0.053778987 -69.14761353 9.98733521 -0.053778987 -70.93608856
		 12.68038177 1.63996828 -72.89524841 11.7554388 1.20735264 -75.20263672 9.46687508 1.13029993 -76.076538086
		 7.9924345 1.42113137 -74.69831848 7.14980745 1.79243779 -72.35804749 6.28191662 2.51889062 -70.39292908
		 10.26969337 5.024673939 -64.65746307 8.10021019 5.024188042 -64.66192627 7.72204638 3.49234223 -63.32728577
		 10.49746513 3.45108819 -63.32098007 7.18648958 -0.59739172 -62.65196991 11.10033417 -0.59739172 -62.64077759
		 9.62531853 -0.59739172 -62.79408646 13.091596603 -0.59739172 -62.76292801 13.022521973 3.41820121 -63.55854797
		 9.78672409 3.45108819 -63.57742691 12.30631638 5.024673939 -64.86734772 10.26942444 5.017493725 -64.88954163
		 4.47677374 3.049059868 -65.38294983 8.60033798 3.049059868 -65.05506134 7.87048864 4.57531929 -66.57283783
		 6.6004138 4.58150291 -66.53295898 8.63244247 5.72653055 -70.72077942 10.31467247 6.0057725906 -70.43595886
		 7.86543417 0.29413787 -67.5538559 6.25674725 -0.010304365 -68.44571686 5.97376776 -0.59739906 -63.96430206
		 8.052436829 -0.59739906 -63.96434402 15.72313309 2.71975565 -65.66313171;
	setAttr ".vt[1162:1327]" 11.72293663 2.71974039 -65.57732391 12.02665329 -0.59742045 -64.50404358
		 14.99412727 -0.59739906 -64.41353607 12.56645203 0.29413015 -67.74176025 10.20911026 0.29414365 -67.22367859
		 11.80895233 5.68871403 -70.62313843 13.67431259 4.3192606 -66.85209656 12.11375427 4.3227191 -66.94133759
		 5.81460953 2.39625859 -69.10154724 7.22203779 4.12313032 -69.45332336 8.36273003 4.88619709 -69.59169006
		 8.35449219 2.51783705 -66.88724518 10.31907082 5.46700144 -69.50590515 10.084438324 2.46897793 -63.76063538
		 12.053239822 2.44876075 -68.054153442 11.97650814 5.19083071 -69.51957703 13.73558807 2.21030235 -71.23735046
		 14.77430916 2.49830556 -69.55073547 13.80638695 -0.010283092 -68.44488525 13.45285702 -0.053765461 -70.26525116
		 13.042460442 4.17215681 -69.58688354 12.94928265 -0.044933882 -72.061882019 11.55439854 9.56987667 -75.85533142
		 12.47368622 9.54655552 -74.074356079 9.84250259 9.69682121 -76.44617462 8.29988289 9.62586689 -75.93577576
		 7.70087099 9.63890553 -73.76972198 8.39294052 9.82332039 -71.93714142 10.33386421 10.18393421 -71.11595154
		 12.089539528 9.67791271 -72.37924194 12.55317116 15.79076958 -74.21440125 11.71027279 16.55887604 -75.96073914
		 10.01150322 16.89583206 -76.58420563 8.30777931 16.92940331 -76.15837097 7.8173337 16.0047264099 -73.98697662
		 8.58750153 15.53356647 -71.82596588 10.49241066 15.36152649 -70.89918518 12.13011932 15.44730854 -72.13349915
		 14.19987774 42.63593292 22.17462349 12.80314827 43.4691925 16.99379349 10.086874008 43.56221771 14.98832321
		 7.24030447 43.25685501 16.63430405 6.53640127 42.54745102 22.20230103 7.77122927 42.102211 26.66545105
		 10.67567635 41.74547577 28.050504684 13.22784328 42.035362244 26.18693733 5.442626 87.12182617 68.66120911
		 4.86347532 86.45128632 68.90557861 3.27514458 87.84806824 69.0043106079 4.18376064 88.0043106079 69.045173645
		 2.69570303 86.7986145 68.71268463 2.72565866 86.87152863 68.68900299 3.51218319 86.39565277 69.018173218
		 4.21409607 86.2653656 68.99485016 5.43308878 87.32939148 68.68551636 5.014910221 87.76449585 68.88297272
		 12.97078419 30.56525803 -62.53424835 13.37519646 31.90348625 -64.98712158 11.49087811 32.80334473 -66.28814697
		 10.22241306 34.00078582764 -68.50553894 8.86289501 33.1269722 -66.34873199 7.31147194 31.89842796 -63.41205978
		 8.20139122 30.28284264 -60.69390869 10.67389584 29.72098732 -60.51729965 12.81293774 26.83600235 -66.50876617
		 10.62302971 26.33805084 -65.11341095 8.3429184 26.98352242 -65.63328552 7.39364386 28.054645538 -68.4794693
		 8.46269417 29.052310944 -72.43266296 10.038539886 29.68488693 -74.20298767 11.82590961 28.40907669 -72.37786865
		 13.33404922 27.74034882 -69.53968811 12.60790443 21.67089462 -70.66189575 10.51545525 21.78859329 -69.11666107
		 8.2401619 21.80454826 -70.40583801 7.2980361 22.46740913 -73.090591431 7.82378864 23.46900177 -76.34465027
		 9.91726303 23.87774849 -77.29173279 12.028630257 23.20741272 -76.081550598 13.068361282 22.32421684 -73.05141449
		 12.25669289 18.49350166 -71.62397766 10.55221176 18.23834991 -70.35905457 8.65371895 18.65306664 -71.58222961
		 7.8657136 19.50436592 -73.97827148 8.35750198 20.56688499 -76.18965149 10.052773476 20.93758011 -76.86824036
		 11.78504658 20.29502106 -75.96795654 12.68453598 19.25754738 -73.88881683 12.53475285 12.23815441 -74.20815277
		 11.63822937 12.66531754 -75.98720551 9.89665031 13.069455147 -76.58997345 8.25826645 12.8737278 -76.1519928
		 7.69336748 12.37074184 -74.096908569 8.43793678 12.38917446 -72.008140564 10.39314461 12.55008316 -71.13075256
		 12.16777325 12.21746063 -72.41955566 3.50113273 48.030193329 17.80587578 7.016259193 53.16302109 37.16007233
		 3.39460659 52.94301987 37.65830994 16.4863224 70.70095062 19.0078792572 17.31796837 66.7651825 22.35624504
		 11.91361237 86.50055695 23.49595451 12.93918705 77.51055145 37.29880905 12.094491005 83.9717865 36.22337723
		 9.96703053 88.13272858 35.45650864 15.75946236 75.47346497 4.075573921 12.40427017 81.25914764 3.63592362
		 7.62414026 85.26241302 3.86740756 12.35873413 87.96564484 27.70437622 14.52831841 46.30385971 23.17819214
		 13.60523224 45.41723633 27.67336845 10.7799654 44.68787003 30.4539032 7.87530422 44.54709244 28.97226334
		 6.40285397 45.48300171 24.24151421 8.0046348572 46.51874161 18.1107235 10.57309723 47.20207596 15.63164139
		 13.25292969 47.15124893 17.8427124 14.87240696 78.3146286 18.27034378 7.6981535 86.91325378 -26.31674004
		 11.83827686 81.64450073 -26.63023376 12.22176743 74.79918671 -27.51053429 9.92727947 64.84509277 -29.53440857
		 14.68270493 81.69835663 29.24213409 14.91040516 80.26215363 24.55830193 4.19101572 67.0060653687 -58.91383362
		 9.47120953 67.25786591 -60.23788834 13.34181595 66.74575043 -56.70136642 15.9634943 67.18151855 -50.12869263
		 13.25090599 68.47648621 -36.5365181 10.67440987 68.50814056 -28.5821228 10.86465168 67.93317413 -22.8927784
		 11.75914764 67.49501038 -16.1048069 13.93341637 67.59393311 -2.33739996 15.56237698 67.93573761 4.70423365
		 14.48250771 55.52072906 26.077068329 15.50363541 56.047405243 20.20161057 12.72997475 53.89505005 34.83571243
		 15.2708168 54.56726456 30.92305756 6.83932495 90.42684174 23.054239273 7.24110603 92.65313721 26.70848274
		 6.33425426 92.038513184 35.16222 15.47633743 62.73204041 -42.426754 15.014395714 67.91718292 -42.39197159
		 13.78134727 74.79055023 -42.63095474 12.62066269 82.87677765 -42.70286179 7.19968414 89.33699799 -42.98530197
		 10.0012407303 62.3492775 -30.038368225 4.94225359 66.52005005 -31.98806572 2.98326612 66.69589233 -31.3041687
		 11.80658531 64.9447937 -33.47016144 10.8956337 68.4332428 -33.039325714 11.76844311 75.11904144 -32.066261292
		 11.36282825 82.70765686 -31.65189743 7.66683865 88.48548126 -31.83562088 4.90591049 66.13404083 -38.57926941
		 12.93343735 60.86442566 -36.47133255 15.97337532 58.16328812 -43.22171783 15.72919655 57.49632263 -51.25619507
		 13.21573257 58.15124893 -57.52315521 9.87630367 58.1354866 -60.22489929 3.38980722 57.78814316 -57.36435699
		 3.434021 60.56261826 -43.98492432 1.75816917 63.60302734 -43.94673157 1.36132252 60.26343155 -51.067485809
		 15.81167507 61.48181152 16.24608612 16.55469513 69.0096893311 11.90956783;
	setAttr ".vt[1328:1493]" 13.66641712 61.11906815 12.61873531 13.76686954 60.90232849 34.99703979
		 11.18309879 61.90106583 37.90388107 12.28418732 60.50398636 5.62997293 10.30623722 53.10705566 7.077934265
		 7.51897287 49.051891327 8.13474274 4.067157269 47.39489365 8.93993092 9.82986927 54.041427612 -0.99100715
		 11.66852856 60.3072319 -1.79087567 13.17642021 67.1750412 -9.24977207 14.34901142 74.054214478 -9.38445854
		 12.90153217 80.23246765 -9.33685589 7.75922346 84.93088531 -8.89686966 12.16562843 29.95888519 18.79387856
		 13.17006683 30.13198662 21.93048477 12.62779427 30.17230988 24.85723686 10.36618042 30.17365837 26.040359497
		 7.93864012 30.14740753 24.77362633 6.99885321 29.94244957 21.75961876 7.55866098 29.81698418 18.60499382
		 9.7527523 29.87406731 17.46305847 9.7675972 34.15370178 17.028398514 7.41642046 33.99980545 17.98922539
		 6.82448721 34.043243408 21.56808853 7.84260654 34.29742432 24.99454117 10.42038155 34.14967728 26.41038895
		 12.82676029 34.22567749 25.068147659 13.48203659 34.35870361 21.74292183 12.39798355 34.26974106 18.54795456
		 13.47350025 82.87317657 33.40267944 11.78184032 88.16920471 32.11856079 7.10721016 92.82938385 31.34109306
		 15.81835747 74.74474335 30.38179398 14.86500072 76.26959991 34.62377167 16.58408737 67.32373047 26.86683464
		 12.65036201 70.10428619 37.59368134 14.23938179 68.6326828 35.33919907 16.27048874 67.81680298 31.078845978
		 15.88635826 73.41464233 25.61228371 2.28171349 49.78952026 32.63056183 2.25338173 48.48926926 27.61562347
		 5.91296387 49.25305939 27.20157623 6.70309544 50.31227112 32.012260437 7.22688246 51.72840881 31.57208061
		 6.40689754 50.66984177 27.051040649 5.87117386 49.63029861 27.10920906 6.40607023 48.78394699 29.4756794
		 7.91675615 58.49638367 40.89645004 15.82766438 48.11888123 -46.1811142 10.65444088 46.3655014 -40.62216949
		 5.59180117 46.0091094971 -44.81554794 3.51166964 48.056915283 -51.62842178 5.13580179 50.8956337 -57.74230576
		 9.79360008 52.22245026 -59.83913422 12.86152458 52.26324463 -58.20458221 15.548172 50.80492401 -53.013027191
		 13.68613243 35.52833939 -61.44923782 13.30323982 33.81464767 -58.6204071 10.76500511 32.24262238 -56.20347977
		 7.48421478 33.71451187 -55.89958954 6.86460686 35.57337189 -58.80454254 8.70602322 37.35595322 -62.079551697
		 9.85131168 37.93379593 -64.871521 11.68671894 36.69489288 -63.2031517 0 73.24320221 50.81811142
		 3.26950598 73.88762665 50.64102554 5.48168898 75.61701965 50.47317886 7.88264418 79.31865692 49.83086395
		 8.98007679 84.12734222 49.38037491 9.2519331 89.24327087 49.49231339 7.50535393 91.80723572 49.432724
		 3.90317845 92.96549988 49.53437805 0 93.3585434 49.55426788 0 71.5329895 47.78947449
		 3.20116806 72.30484772 47.95757675 5.95184517 74.051353455 47.65190506 8.1076498 77.77015686 46.95035553
		 9.32563019 82.8057785 46.26665497 9.66063213 87.7519989 45.8838768 7.75737095 90.89492798 45.64025497
		 4.32785845 92.054100037 45.55964279 0 92.69882202 45.57195663 0 69.48730469 44.87834167
		 3.26346254 70.081497192 45.095039368 6.29991674 71.81924438 44.88233948 8.92038441 75.45626068 43.96892929
		 10.014193535 80.96363068 43.035694122 10.28254223 86.1509552 42.10093689 8.28775501 89.74186707 41.90880966
		 4.92256641 91.41748047 41.71117783 0 92.21234894 41.58599091 0 77.98574829 72.39938354
		 0 78.14009857 72.36212921 3.72880888 78.38354492 68.50749207 4.55804729 78.86708832 67.043708801
		 4.4769907 78.92695618 66.88954926 3.65663958 78.45830536 68.51264191 4.64568424 78.89137268 66.57910919
		 2.98710728 78.14296722 70.077201843 0.94090611 78.12085724 71.10165405 2.97456861 78.031295776 70.088645935
		 1.01757443 77.9601059 71.18178558 0 77.98574829 71.39775848 0 78.14009094 71.36049652
		 0.97236753 81.51734924 72.44538116 1.78821242 82.035255432 71.33100891 1.65433002 82.39356995 71.81446075
		 1.051518679 82.064376831 72.97708893 4.34541082 88.60684204 69.32032013 3.0017588139 88.6890564 69.75468445
		 2.38146162 87.25372314 69.16703796 2.28700137 86.76376343 69.1728363 2.83116174 86.15335846 69.1227951
		 4.023293495 85.90203094 68.87483215 4.94106102 86.057182312 68.75048828 6.070221424 86.80276489 68.27175903
		 6.0083594322 87.42596436 68.30505371 5.55617714 88.16395569 68.77783203 -2.44243789 81.83345795 72.9948349
		 -1.66009188 83.51380157 71.82208252 -1.41143548 83.9670639 72.48207092 -1.25268817 81.78167725 74.13931274
		 -2.044589043 83.8796463 70.14437866 -3.46804357 80.55558014 71.37364197 -4.12416029 80.791008 69.082504272
		 -3.48321128 83.55010223 69.077430725 -1.24584544 75.78128815 68.33846283 -0.784554 75.33055878 70.65391541
		 -2.98516703 76.47901154 68.62783051 -2.3216064 75.93512726 69.81687927 -11.76450443 83.5485611 18.66204453
		 -6.83143902 87.45718384 18.45139122 -16.3311882 76.61721802 11.43468857 -8.447855 -0.074073419 27.24163246
		 -6.44453239 -0.083898783 26.61754608 -6.77578688 -0.072545402 24.81176758 -8.45342636 -0.070595689 25.84558296
		 -7.56159925 -0.059882738 23.22510529 -8.91589737 -0.06718225 25.24369621 -9.46048164 -0.050948475 22.1386528
		 -11.59025574 -0.05565545 22.76295662 -10.69153595 -0.064940676 24.98638344 -9.67503357 -0.063724712 24.72313499
		 -11.27935028 -0.068102062 25.65233612 -11.49951553 -0.072146632 27.17442322 -10.15408516 -0.067092448 27.66594505
		 -9.9873333 -0.065121435 25.85131454 -3.91345739 58.15938187 41.50614548 -3.36052942 48.42262268 22.9586544
		 -6.53919554 49.56438065 16.34788895 -5.81297922 48.87305069 22.44332314 -9.5028286 66.28997803 38.96475983
		 -12.67575073 82.4524765 11.77621841 -7.41610146 86.026039124 11.99019814 -12.95869827 80.68063354 -3.061230421
		 -7.59663963 85.10289001 -2.89687514 -10.22964191 60.91811371 -9.30550957 -15.25160027 74.51389313 -2.94296384
		 -7.53475523 51.52169418 -0.3932164 -6.34168005 53.94944382 -8.84580994 -8.21689796 56.69712448 -9.10744953
		 -4.13872576 48.95183182 0.20601255 -3.77242494 52.072338104 -7.7523365 -7.60469246 89.34115601 -37.34286499
		 -11.21060467 83.50936127 -36.98339081 -15.6722517 81.10424805 -49.77070236;
	setAttr ".vt[1494:1659]" -7.5547514 87.023406982 -49.43269348 -11.080137253 79.32483673 -55.52589798
		 -6.35354471 84.69822693 -54.63933563 -15.64845753 61.98119354 -50.46301651 -13.15115261 62.031944275 -57.21705246
		 -12.31352901 72.8985672 -56.44597626 -15.97889042 74.0074005127 -49.73223495 -12.78975582 75.28490448 -36.37374496
		 -0.52577591 63.75939178 -50.78233719 -2.78083587 66.89038086 -37.8376236 -3.51662827 57.41321945 -17.34273911
		 -3.37304997 63.60599518 -24.59131622 -4.76631784 63.77439117 -26.063640594 -5.85940123 57.68634415 -17.60097122
		 -8.16302013 59.01455307 -17.40834808 -8.0065145493 61.28419113 -25.37615776 -9.73413372 63.64118195 -24.429636
		 -9.91729927 62.20684433 -16.77339172 -12.46573353 73.98178864 -15.6143465 -11.18961716 74.28331757 -21.75755119
		 -12.13916397 80.49316406 -21.11860657 -12.7381525 80.078468323 -15.011627197 -7.80131912 85.044464111 -14.49102879
		 -8.0044517517 85.97846985 -20.70205116 -3.5611999 66.78955841 42.87456894 -3.6993947 63.45372772 41.90085983
		 -7.048126221 64.58895111 40.89893341 -6.86935806 68.42033386 42.036201477 -10.055560112 71.77301025 40.11117554
		 -11.44666767 78.82183838 39.57934189 -10.91837978 84.95884705 39.090171814 -8.82297039 88.65578461 38.53131104
		 -5.47363281 91.6185379 38.13008499 -3.044170618 75.3061142 53.79088974 -5.79711342 77.029296875 53.50024796
		 -7.55193758 80.2971344 53.091041565 -8.7430706 84.75646973 52.45521545 -8.68809986 90.89014435 53.8707428
		 -7.045248985 93.24604034 54.72697067 -3.52479768 93.93631744 52.73692322 -2.80766916 65.42455292 -56.83927536
		 -3.042160988 73.43965149 -60.37906265 -8.80767441 73.184021 -59.98653793 -9.6092844 61.55423355 -60.3679657
		 -7.80767965 78.36096191 -58.77924347 -5.023697376 82.84638977 -57.89970016 -9.42409611 53.70186996 36.31869125
		 -8.11362934 48.67062759 31.8077755 -11.18593216 48.60302353 32.67591476 -14.52392006 49.1949234 29.53892517
		 -14.48212814 61.19145584 31.034631729 -9.29652405 53.57780838 14.95786095 -6.41792917 50.59775925 21.47060776
		 -8.35444927 50.82642365 17.28132057 -6.65374517 48.52518463 23.22390938 -17.21143913 61.67967606 21.2599926
		 -12.42262745 55.54670715 16.41721725 -13.23828125 51.24850464 18.98475838 -11.45781422 51.24351501 15.96664524
		 -17.2460022 61.32992172 26.8952446 -15.11782265 50.375103 24.47956657 -12.73197365 1.58975267 23.6875515
		 -11.92863083 1.16995645 21.57968903 -11.55482483 3.82770467 20.69743729 -12.60341072 4.86215591 22.73022079
		 -12.57353973 17.31836891 22.55596733 -12.51181221 13.13885307 22.48271751 -11.67612076 12.87574291 20.089735031
		 -11.72563362 17.18172264 20.06530571 -9.6498518 12.66275883 19.0048027039 -9.6827507 17.12737465 18.71974373
		 -9.4614048 1.044796109 20.87992859 -9.54303741 3.31513095 20.0701828 -7.80229998 1.37769878 22.058660507
		 -7.9266305 3.90508366 20.67538834 -7.88023996 12.88136196 20.026639938 -7.878407 17.23039055 19.98995972
		 -7.40789938 13.15400314 22.43839073 -7.39919043 17.38417435 22.48689461 -7.091202259 1.73500073 24.20694733
		 -7.19328547 4.96450567 22.72899818 -6.224226 2.46487069 26.18697929 -7.95423269 5.9532547 24.8012085
		 -10.26963043 4.93716764 32.00026702881 -8.099796295 4.94553709 32.019557953 -7.72204638 3.43802571 33.4309845
		 -10.49746799 3.38222408 33.40036011 -7.18648958 -0.080350004 34.17190933 -11.10033417 -0.084029481 34.17331696
		 -9.62531853 -0.085515648 34.014904022 -13.091596603 -0.078635007 34.064891815 -13.022521973 3.35986781 33.18597031
		 -9.78672791 3.37996078 33.13378906 -12.30730438 4.94317389 31.80316734 -10.26938438 4.93563032 31.76151657
		 -5.854918 41.87627792 -46.86976242 -10.53998375 39.73731613 -43.31155777 -10.51311398 52.86097336 -37.34604645
		 -5.29850483 52.19226456 -42.024944305 -15.20088863 43.48051834 -48.0011901855 -15.83029366 52.66678238 -44.54553604
		 -6.45053148 47.20882416 -58.092445374 -4.96981525 44.57009506 -52.89101791 -2.078555107 53.58763885 -51.012134552
		 -4.27527428 54.38077927 -57.56795883 -12.58572483 48.27802658 -58.5785141 -9.97408009 48.49385834 -60.3584404
		 -10.049412727 55.25875092 -59.73934555 -13.31828785 55.46086502 -57.76338577 -13.22945976 64.019989014 -36.59835815
		 -15.88091373 54.16522217 -52.17961502 -14.86106396 46.85053253 -54.074867249 -9.45247078 44.9852066 -61.039848328
		 -11.69821453 44.39321899 -58.69521332 -11.90212917 40.67738724 -60.4467659 -9.46797466 41.6971817 -62.62747955
		 -12.35883141 26.48169518 -76.27988434 -9.83910561 27.24118996 -77.41199493 -7.44576025 26.56113625 -76.43471527
		 -8.089878082 41.28111267 -59.75260162 -7.99017477 43.79632187 -58.56254959 -6.0098161697 41.21243286 -54.64565659
		 -6.43480635 38.42567825 -56.17763901 -6.9302702 25.092535019 -72.060028076 -8.056181908 24.46293831 -68.85771942
		 -6.87031794 36.20868683 -52.0033416748 -6.45569468 38.52641678 -49.06211853 -10.5615921 37.16182327 -47.12498474
		 -10.54986191 34.36353683 -51.79918671 -10.55644417 24.018764496 -67.81190491 -12.85640526 24.30544472 -69.265625
		 -13.83821583 36.69773483 -54.72568512 -14.65417099 40.68161392 -50.46632385 -14.8894968 43.53921509 -55.40223312
		 -14.26310253 39.11915588 -58.52946854 -13.39070511 25.010477066 -72.11313629 -2.45033121 77.18947601 63.12699509
		 -3.066692829 76.92163849 61.10219574 -3.22238278 76.73779297 59.34884262 -5.96053696 78.44026947 59.052501678
		 -5.70316553 78.67572784 61.034095764 -5.36094618 78.49838257 63.17448044 -6.60292625 80.38969421 63.46875381
		 -7.22263288 80.82526398 61.024440765 -7.8132205 81.05280304 58.77226639 -8.69799519 84.78784943 58.60707092
		 -8.091983795 83.98144531 61.33551407 -8.25678444 83.43175507 65.000007629395 -7.85518837 85.02822876 67.26107025
		 -8.82664299 87.31819916 64.021636963 -8.59418297 87.57446289 66.41189575 -7.53960371 90.56502533 64.3494339
		 -6.72587395 92.69808197 65.26255798 -6.38999796 91.58893585 67.90962982 -7.64498138 90.071495056 66.9992218
		 -2.7209692 89.57897186 70.8948288 -4.51152229 89.25112915 69.97162628 -3.47510195 92.108078 68.9125824
		 -3.66693521 93.66649628 66.20292664 -2.82329035 79.64533997 -64.33837891 -2.8191371 79.71551514 -71.48106384
		 -3.56892633 76.95651245 -64.7186203 -3.55801487 77.09601593 -71.48106384 -2.82329035 74.30727386 -65.10662079
		 -2.8191371 74.47653198 -71.48106384 -2.80096412 74.47607422 -100.10159302;
	setAttr ".vt[1660:1825]" -2.80553627 74.45092773 -93.32186127 -3.51025558 76.99066925 -100.10159302
		 -3.52226853 76.99187469 -93.32186127 -2.80096412 79.50526428 -100.10159302 -2.80553627 79.53286743 -93.32186127
		 -2.79576564 74.56234741 -115.65028381 -2.79664898 74.63722229 -107.86654663 -3.49659157 77.046936035 -115.65028381
		 -3.49891615 77.12690735 -107.86654663 -2.79576564 79.53151703 -115.65028381 -2.79664898 79.6166153 -107.86654663
		 -2.8099966 74.49158478 -85.89507294 -2.81449318 74.46639252 -79.10614777 -3.5339911 77.058288574 -85.89507294
		 -3.5458107 77.059066772 -79.10614777 -2.8099966 79.62501526 -85.89507294 -2.81449318 79.65175629 -79.10614777
		 -2.71788478 74.74946594 -150.11683655 -2.79259682 74.53347778 -146.92878723 -3.24263024 77.10043335 -150.39476013
		 -3.48826599 76.99977875 -146.92878723 -2.71788478 79.45333099 -150.11683655 -2.79259682 79.46607971 -146.92878723
		 -1.55942476 76.45394897 65.33177948 -3.83397841 77.28256226 66.25434113 -5.54112673 79.62830353 65.58868408
		 -5.40568638 81.033424377 67.62999725 -5.21487284 83.69846344 68.29602814 -6.71498394 86.49263 68.23340607
		 -5.020814419 85.66994476 68.95287323 -2.13161707 85.92207336 69.59199524 -1.86720467 86.74718475 70.011405945
		 -1.75107372 85.01839447 71.42008209 -2.027927876 87.6653595 70.022964478 -3.14728737 76.35771942 56.91927338
		 -6.017287254 78.014709473 56.68271255 -8.045885086 80.64601135 56.047901154 -9.10747242 84.99271393 55.38607025
		 -8.75752544 88.16812897 59.62497711 -8.78301048 88.49615479 56.68533325 -7.52710295 91.16426086 60.68525696
		 -8.29556656 89.10731506 58.90747833 -7.81190825 89.45648193 58.56961441 -7.8409605 91.27254486 59.84373474
		 -6.28327179 93.5271759 58.87761688 -3.48117089 95.6922226 58.12454605 -12.75794697 39.053085327 17.78406715
		 -9.8648386 38.90790176 16.078893661 -7.29606438 38.79151917 17.52243233 -6.648983 38.49327087 21.78622246
		 -8.13002205 13.37713432 24.34149933 -8.14455795 17.51055908 24.56365776 -7.77920771 38.58488083 25.61281204
		 -10.54469967 38.1256485 27.066326141 -10.21472168 17.54719734 25.53137589 -10.18130207 13.48229313 25.31447983
		 -12.068915367 13.36201096 24.38320923 -12.12514687 17.46580505 24.60561943 -13.08065033 38.39442062 25.63804626
		 -13.76360226 38.81620026 21.85936165 -2.69609261 81.27588654 71.92572784 -1.80852616 83.16802979 70.89477539
		 -1.8907584 83.084831238 71.47975159 -2.5622108 81.57597351 72.38838196 -1.4440186 80.80999756 73.058677673
		 -1.52316976 81.25097656 73.55251312 -1.22672117 80.24563599 73.31932068 -5.44257593 87.10467529 68.75783539
		 -4.86342525 86.43412018 69.002204895 -3.27509332 87.82277679 69.093544006 -4.1837101 87.97968292 69.13504791
		 -2.69565248 86.7798996 68.80526733 -2.72560883 86.8530426 68.78258514 -3.5121336 86.37848663 69.11479187
		 -3.78001142 78.8425293 69.49459839 -3.72880888 78.38354492 69.50911713 -4.55804729 78.86708832 68.045333862
		 -4.6535511 79.21927643 68.054908752 -4.4769907 78.92695618 67.89117432 -3.65663958 78.45830536 69.51426697
		 -3.57834888 77.93043518 69.46572876 -4.40797186 78.37247467 67.8010025 -4.64568424 78.89137268 67.58073425
		 -4.84844637 79.047416687 67.15873718 -3.82734036 85.54642487 69.11325836 -4.21404457 86.24819183 69.091468811
		 -6.59937334 87.54281616 68.27593231 -5.43303823 87.31222534 68.78214264 -6.11225891 88.5951767 69.034500122
		 -5.014860153 87.7441864 68.97670746 -2.98710728 78.14296722 71.078826904 -0.94090605 78.12085724 72.10327911
		 -0.926485 77.53728485 71.90239716 -2.89908385 77.57900238 70.91430664 -3.021348715 78.42489624 71.18208313
		 -2.97456861 78.031295776 71.090270996 -0.99343389 78.41960907 72.41291809 -1.01757443 77.9601059 72.18341064
		 -10.78494167 92.2195816 53.70845413 -11.66244984 98.23417664 52.88523483 -12.81448841 96.86508179 53.8715744
		 -10.48176003 93.060455322 54.99107742 -9.86875248 97.65892029 57.18666458 -9.83285236 96.16500854 56.97823334
		 -7.90866375 91.19543457 61.083862305 -8.69862938 94.11637115 59.89690399 -8.61491108 94.77561951 60.76887894
		 -7.61767673 90.96989441 62.53097534 -8.49245167 89.39094543 57.69430542 -3.38029814 94.93314362 62.61154175
		 -6.66942644 93.18757629 61.82720566 -9.2339077 95.48188019 53.29007721 -10.068083763 92.90231323 53.25297928
		 -7.71881962 94.0053787231 54.81912231 -8.067256927 91.41744232 55.49413681 -7.57542944 96.44152832 57.56581497
		 -7.45474625 95.051132202 56.94111633 -8.22968578 89.87208557 57.48789215 -7.008813858 94.79458618 60.64424896
		 -7.45163488 93.46440125 60.20658112 -8.62994957 87.36893463 61.91440582 -11.97905159 7.16249847 -72.10829926
		 -12.0063877106 5.51454592 -71.92922211 -12.48478889 4.60233021 -73.59318542 -12.39345646 6.79583216 -73.87650299
		 -11.44194603 6.43543911 -75.78382111 -11.39192772 3.5195334 -75.86885834 -9.55916977 3.14925051 -76.76721954
		 -9.71202087 6.59865808 -76.4371109 -8.24729347 6.44965982 -75.79831696 -8.14466667 3.71200776 -75.8618927
		 -7.37284422 4.66461325 -73.56542969 -7.59336138 6.80109119 -73.67313385 -8.39226151 7.22387409 -71.90058136
		 -8.24249458 5.41172409 -71.92430878 -10.24804688 6.50074863 -70.58178711 -10.28320503 7.80286837 -70.97137451
		 -10.96944809 62.40391541 -33.98800659 -4.47677374 3.00075697899 31.35957146 -8.60033607 2.98291945 31.63829803
		 -7.85399151 4.50054264 30.07913208 -6.58707714 4.50607491 30.12352371 -8.36124802 5.82170391 26.21526337
		 -10.21135521 6.20399094 26.54340363 -10.11853027 7.73651218 25.87575722 -7.86543798 -0.087683782 29.18306923
		 -6.25674725 -0.089875251 28.25452614 -5.97376776 -0.076250657 32.86281967 -8.052440643 -0.090158574 32.82076645
		 -15.72312737 2.67144084 31.072414398 -11.72326088 2.65331173 31.10010719 -12.026660919 -0.089788556 32.27609253
		 -14.99412155 -0.077818491 32.40552902 -12.56645203 -0.091844022 28.9703846 -10.20911026 -0.073683627 29.58314896
		 -11.8981781 5.78007507 26.33437729 -12.11690521 5.77035046 24.83520699 -13.69994354 4.2503686 29.79971123
		 -12.13888168 4.24411821 29.70658684 -3.087026119 80.62604523 -60.2617836 -4.1091938 77.3243103 -60.4539299
		 -2.79488492 79.51332855 -123.13466644 -3.49427748 77.033821106 -123.13466644 -2.79488492 74.55433655 -123.13466644
		 -2.79382896 79.49150848 -132.3276062 -3.49150229 77.018096924 -132.3276062;
	setAttr ".vt[1826:1991]" -2.79382896 74.54470825 -132.3276062 -2.79321289 79.47878265 -139.76556396
		 -3.48988318 77.0089416504 -139.76556396 -2.79321289 74.53907776 -139.76556396 -5.79164076 2.34497857 27.50719833
		 -7.090873718 4.019465446 27.1773777 -8.18229866 4.77400064 27.070129395 -8.34811592 2.441468 29.75548744
		 -10.25313759 5.46419191 27.1737709 -10.084438324 2.40292501 32.95447159 -12.070520401 2.37316322 28.57652473
		 -12.060937881 5.12671328 27.1569767 -13.80939293 2.15039945 25.35673904 -14.81705475 2.449404 27.075275421
		 -13.80638027 -0.085224733 28.28064919 -13.45443916 -0.080766566 26.41579628 -13.15606499 4.078810215 27.049844742
		 -12.95708752 -0.069533356 24.60107994 -12.92392254 25.6428833 22.076007843 -12.8836937 21.84953117 22.36138916
		 -11.95765591 21.58230019 19.65331078 -11.99495316 25.35667992 19.31328011 -12.40414524 25.84053421 24.59570885
		 -12.36897945 22.08156395 24.63326454 -10.30278206 26.0047283173 25.65986252 -10.27058029 22.38972092 25.58722115
		 -8.052396774 25.8241806 24.52885246 -8.012526512 22.16885567 24.57382965 -7.18355274 25.61152077 21.95719337
		 -7.16282749 21.91699219 22.23585129 -7.68786192 25.39288712 19.14833069 -7.67050266 21.66797447 19.50990677
		 -9.7246685 25.26158142 17.90900612 -9.68827152 21.5017128 18.22925949 -12.65254402 9.54507637 22.34096527
		 -11.79485321 8.90999794 20.065313339 -12.17615414 10.042600632 24.26047707 -10.16390896 10.29898357 25.36610985
		 -7.97291803 10.039896011 24.22145844 -7.20950079 9.54376793 22.32779312 -7.72778273 8.90352821 20.016838074
		 -9.5892601 8.46529007 19.074678421 -8.36516762 -0.053771242 -69.51902771 -6.44528484 -0.053771242 -70.050888062
		 -6.78199387 -0.047340859 -71.83317566 -8.37104416 -0.053778987 -70.89141846 -7.57097387 -0.03163537 -73.41088104
		 -8.85857582 -0.053778987 -71.7178421 -9.46053505 -0.04551864 -74.51800537 -11.58511925 -0.033028785 -73.89961243
		 -10.73043442 -0.053778987 -71.98683167 -9.67503929 -0.053778987 -72.25008392 -11.3501091 -0.05377122 -71.09916687
		 -11.58219719 -0.053771242 -69.59700012 -10.15408516 -0.053778987 -69.14761353 -9.98733521 -0.053778987 -70.93608856
		 -12.68038177 1.63996828 -72.89524841 -11.7554388 1.20735264 -75.20263672 -9.46687508 1.13029993 -76.076538086
		 -7.9924345 1.42113137 -74.69831848 -7.14980745 1.79243779 -72.35804749 -6.28191662 2.51889062 -70.39292908
		 -10.26969337 5.024673939 -64.65746307 -8.10021019 5.024188042 -64.66192627 -7.72204638 3.49234223 -63.32728577
		 -10.49746513 3.45108819 -63.32098007 -7.18648958 -0.59739172 -62.65196991 -11.10033417 -0.59739172 -62.64077759
		 -9.62531853 -0.59739172 -62.79408646 -13.091596603 -0.59739172 -62.76292801 -13.022521973 3.41820121 -63.55854797
		 -9.78672409 3.45108819 -63.57742691 -12.30631638 5.024673939 -64.86734772 -10.26942444 5.017493725 -64.88954163
		 -4.47677374 3.049059868 -65.38294983 -8.60033798 3.049059868 -65.05506134 -7.87048864 4.57531929 -66.57283783
		 -6.6004138 4.58150291 -66.53295898 -8.63244247 5.72653055 -70.72077942 -10.31467247 6.0057725906 -70.43595886
		 -7.86543417 0.29413787 -67.5538559 -6.25674725 -0.010304365 -68.44571686 -5.97376776 -0.59739906 -63.96430206
		 -8.052436829 -0.59739906 -63.96434402 -15.72313309 2.71975565 -65.66313171 -11.72293663 2.71974039 -65.57732391
		 -12.02665329 -0.59742045 -64.50404358 -14.99412727 -0.59739906 -64.41353607 -12.56645203 0.29413015 -67.74176025
		 -10.20911026 0.29414365 -67.22367859 -11.80895233 5.68871403 -70.62313843 -13.67431259 4.3192606 -66.85209656
		 -12.11375427 4.3227191 -66.94133759 -5.81460953 2.39625859 -69.10154724 -7.22203779 4.12313032 -69.45332336
		 -8.36273003 4.88619709 -69.59169006 -8.35449219 2.51783705 -66.88724518 -10.31907082 5.46700144 -69.50590515
		 -10.084438324 2.46897793 -63.76063538 -12.053239822 2.44876075 -68.054153442 -11.97650814 5.19083071 -69.51957703
		 -13.73558807 2.21030235 -71.23735046 -14.77430916 2.49830556 -69.55073547 -13.80638695 -0.010283092 -68.44488525
		 -13.45285702 -0.053765461 -70.26525116 -13.042460442 4.17215681 -69.58688354 -12.94928265 -0.044933882 -72.061882019
		 -11.55439854 9.56987667 -75.85533142 -12.47368622 9.54655552 -74.074356079 -9.84250259 9.69682121 -76.44617462
		 -8.29988289 9.62586689 -75.93577576 -7.70087099 9.63890553 -73.76972198 -8.39294052 9.82332039 -71.93714142
		 -10.33386421 10.18393421 -71.11595154 -12.089539528 9.67791271 -72.37924194 -12.55317116 15.79076958 -74.21440125
		 -11.71027279 16.55887604 -75.96073914 -10.01150322 16.89583206 -76.58420563 -8.30777931 16.92940331 -76.15837097
		 -7.8173337 16.0047264099 -73.98697662 -8.58750153 15.53356647 -71.82596588 -10.49241066 15.36152649 -70.89918518
		 -12.13011932 15.44730854 -72.13349915 -14.19987774 42.63593292 22.17462349 -12.80314827 43.4691925 16.99379349
		 -10.086874008 43.56221771 14.98832321 -7.24030447 43.25685501 16.63430405 -6.53640127 42.54745102 22.20230103
		 -7.77122927 42.102211 26.66545105 -10.67567635 41.74547577 28.050504684 -13.22784328 42.035362244 26.18693733
		 -5.442626 87.12182617 68.66120911 -4.86347532 86.45128632 68.90557861 -3.27514458 87.84806824 69.0043106079
		 -4.18376064 88.0043106079 69.045173645 -2.69570303 86.7986145 68.71268463 -2.72565866 86.87152863 68.68900299
		 -3.51218319 86.39565277 69.018173218 -4.21409607 86.2653656 68.99485016 -5.43308878 87.32939148 68.68551636
		 -5.014910221 87.76449585 68.88297272 -12.97078419 30.56525803 -62.53424835 -13.37519646 31.90348625 -64.98712158
		 -11.49087811 32.80334473 -66.28814697 -10.22241306 34.00078582764 -68.50553894 -8.86289501 33.1269722 -66.34873199
		 -7.31147194 31.89842796 -63.41205978 -8.20139122 30.28284264 -60.69390869 -10.67389584 29.72098732 -60.51729965
		 -12.81293774 26.83600235 -66.50876617 -10.62302971 26.33805084 -65.11341095 -8.3429184 26.98352242 -65.63328552
		 -7.39364386 28.054645538 -68.4794693 -8.46269417 29.052310944 -72.43266296 -10.038539886 29.68488693 -74.20298767
		 -11.82590961 28.40907669 -72.37786865 -13.33404922 27.74034882 -69.53968811 -12.60790443 21.67089462 -70.66189575
		 -10.51545525 21.78859329 -69.11666107 -8.2401619 21.80454826 -70.40583801 -7.2980361 22.46740913 -73.090591431
		 -7.82378864 23.46900177 -76.34465027 -9.91726303 23.87774849 -77.29173279 -12.028630257 23.20741272 -76.081550598
		 -13.068361282 22.32421684 -73.05141449 -12.25669289 18.49350166 -71.62397766;
	setAttr ".vt[1992:2157]" -10.55221176 18.23834991 -70.35905457 -8.65371895 18.65306664 -71.58222961
		 -7.8657136 19.50436592 -73.97827148 -8.35750198 20.56688499 -76.18965149 -10.052773476 20.93758011 -76.86824036
		 -11.78504658 20.29502106 -75.96795654 -12.68453598 19.25754738 -73.88881683 -12.53475285 12.23815441 -74.20815277
		 -11.63822937 12.66531754 -75.98720551 -9.89665031 13.069455147 -76.58997345 -8.25826645 12.8737278 -76.1519928
		 -7.69336748 12.37074184 -74.096908569 -8.43793678 12.38917446 -72.008140564 -10.39314461 12.55008316 -71.13075256
		 -12.16777325 12.21746063 -72.41955566 -3.50113273 48.030193329 17.80587578 -7.016259193 53.16302109 37.16007233
		 -3.39460659 52.94301987 37.65830994 -16.4863224 70.70095062 19.0078792572 -17.31796837 66.7651825 22.35624504
		 -11.91361237 86.50055695 23.49595451 -12.93918705 77.51055145 37.29880905 -12.094491005 83.9717865 36.22337723
		 -9.96703053 88.13272858 35.45650864 -15.75946236 75.47346497 4.075573921 -12.40427017 81.25914764 3.63592362
		 -7.62414026 85.26241302 3.86740756 -12.35873413 87.96564484 27.70437622 -14.52831841 46.30385971 23.17819214
		 -13.60523224 45.41723633 27.67336845 -10.7799654 44.68787003 30.4539032 -7.87530422 44.54709244 28.97226334
		 -6.40285397 45.48300171 24.24151421 -8.0046348572 46.51874161 18.1107235 -10.57309723 47.20207596 15.63164139
		 -13.25292969 47.15124893 17.8427124 -14.87240696 78.3146286 18.27034378 -7.6981535 86.91325378 -26.31674004
		 -11.83827686 81.64450073 -26.63023376 -12.22176743 74.79918671 -27.51053429 -9.92727947 64.84509277 -29.53440857
		 -14.68270493 81.69835663 29.24213409 -14.91040516 80.26215363 24.55830193 -4.19101572 67.0060653687 -58.91383362
		 -9.47120953 67.25786591 -60.23788834 -13.34181595 66.74575043 -56.70136642 -15.9634943 67.18151855 -50.12869263
		 -13.25090599 68.47648621 -36.5365181 -10.67440987 68.50814056 -28.5821228 -10.86465168 67.93317413 -22.8927784
		 -11.75914764 67.49501038 -16.1048069 -13.93341637 67.59393311 -2.33739996 -15.56237698 67.93573761 4.70423365
		 -14.48250771 55.52072906 26.077068329 -15.50363541 56.047405243 20.20161057 -12.72997475 53.89505005 34.83571243
		 -15.2708168 54.56726456 30.92305756 -6.83932495 90.42684174 23.054239273 -7.24110603 92.65313721 26.70848274
		 -6.33425426 92.038513184 35.16222 -15.47633743 62.73204041 -42.426754 -15.014395714 67.91718292 -42.39197159
		 -13.78134727 74.79055023 -42.63095474 -12.62066269 82.87677765 -42.70286179 -7.19968414 89.33699799 -42.98530197
		 -10.0012407303 62.3492775 -30.038368225 -4.94225359 66.52005005 -31.98806572 -2.98326612 66.69589233 -31.3041687
		 -11.80658531 64.9447937 -33.47016144 -10.8956337 68.4332428 -33.039325714 -11.76844311 75.11904144 -32.066261292
		 -11.36282825 82.70765686 -31.65189743 -7.66683865 88.48548126 -31.83562088 -4.90591049 66.13404083 -38.57926941
		 -12.93343735 60.86442566 -36.47133255 -15.97337532 58.16328812 -43.22171783 -15.72919655 57.49632263 -51.25619507
		 -13.21573257 58.15124893 -57.52315521 -9.87630367 58.1354866 -60.22489929 -3.38980722 57.78814316 -57.36435699
		 -3.434021 60.56261826 -43.98492432 -1.75816917 63.60302734 -43.94673157 -1.36132252 60.26343155 -51.067485809
		 -15.81167507 61.48181152 16.24608612 -16.55469513 69.0096893311 11.90956783 -13.66641712 61.11906815 12.61873531
		 -13.76686954 60.90232849 34.99703979 -11.18309879 61.90106583 37.90388107 -12.28418732 60.50398636 5.62997293
		 -10.30623722 53.10705566 7.077934265 -7.51897287 49.051891327 8.13474274 -4.067157269 47.39489365 8.93993092
		 -9.82986927 54.041427612 -0.99100715 -11.66852856 60.3072319 -1.79087567 -13.17642021 67.1750412 -9.24977207
		 -14.34901142 74.054214478 -9.38445854 -12.90153217 80.23246765 -9.33685589 -7.75922346 84.93088531 -8.89686966
		 -12.16562843 29.95888519 18.79387856 -13.17006683 30.13198662 21.93048477 -12.62779427 30.17230988 24.85723686
		 -10.36618042 30.17365837 26.040359497 -7.93864012 30.14740753 24.77362633 -6.99885321 29.94244957 21.75961876
		 -7.55866098 29.81698418 18.60499382 -9.7527523 29.87406731 17.46305847 -9.7675972 34.15370178 17.028398514
		 -7.41642046 33.99980545 17.98922539 -6.82448721 34.043243408 21.56808853 -7.84260654 34.29742432 24.99454117
		 -10.42038155 34.14967728 26.41038895 -12.82676029 34.22567749 25.068147659 -13.48203659 34.35870361 21.74292183
		 -12.39798355 34.26974106 18.54795456 -13.47350025 82.87317657 33.40267944 -11.78184032 88.16920471 32.11856079
		 -7.10721016 92.82938385 31.34109306 -15.81835747 74.74474335 30.38179398 -14.86500072 76.26959991 34.62377167
		 -16.58408737 67.32373047 26.86683464 -12.65036201 70.10428619 37.59368134 -14.23938179 68.6326828 35.33919907
		 -16.27048874 67.81680298 31.078845978 -15.88635826 73.41464233 25.61228371 -2.28171349 49.78952026 32.63056183
		 -2.25338173 48.48926926 27.61562347 -5.91296387 49.25305939 27.20157623 -6.70309544 50.31227112 32.012260437
		 -7.22688246 51.72840881 31.57208061 -6.40689754 50.66984177 27.051040649 -5.87117386 49.63029861 27.10920906
		 -6.40607023 48.78394699 29.4756794 -7.91675615 58.49638367 40.89645004 -15.82766438 48.11888123 -46.1811142
		 -10.65444088 46.3655014 -40.62216949 -5.59180117 46.0091094971 -44.81554794 -3.51166964 48.056915283 -51.62842178
		 -5.13580179 50.8956337 -57.74230576 -9.79360008 52.22245026 -59.83913422 -12.86152458 52.26324463 -58.20458221
		 -15.548172 50.80492401 -53.013027191 -13.68613243 35.52833939 -61.44923782 -13.30323982 33.81464767 -58.6204071
		 -10.76500511 32.24262238 -56.20347977 -7.48421478 33.71451187 -55.89958954 -6.86460686 35.57337189 -58.80454254
		 -8.70602322 37.35595322 -62.079551697 -9.85131168 37.93379593 -64.871521 -11.68671894 36.69489288 -63.2031517
		 -3.26950598 73.88762665 50.64102554 -5.48168898 75.61701965 50.47317886 -7.88264418 79.31865692 49.83086395
		 -8.98007679 84.12734222 49.38037491 -9.2519331 89.24327087 49.49231339 -7.50535393 91.80723572 49.432724
		 -3.90317845 92.96549988 49.53437805 -3.20116806 72.30484772 47.95757675 -5.95184517 74.051353455 47.65190506
		 -8.1076498 77.77015686 46.95035553 -9.32563019 82.8057785 46.26665497 -9.66063213 87.7519989 45.8838768
		 -7.75737095 90.89492798 45.64025497 -4.32785845 92.054100037 45.55964279 -3.26346254 70.081497192 45.095039368
		 -6.29991674 71.81924438 44.88233948 -8.92038441 75.45626068 43.96892929;
	setAttr ".vt[2158:2184]" -10.014193535 80.96363068 43.035694122 -10.28254223 86.1509552 42.10093689
		 -8.28775501 89.74186707 41.90880966 -4.92256641 91.41748047 41.71117783 -3.72880888 78.38354492 68.50749207
		 -4.55804729 78.86708832 67.043708801 -4.4769907 78.92695618 66.88954926 -3.65663958 78.45830536 68.51264191
		 -4.64568424 78.89137268 66.57910919 -2.98710728 78.14296722 70.077201843 -0.94090611 78.12085724 71.10165405
		 -2.97456861 78.031295776 70.088645935 -1.01757443 77.9601059 71.18178558 -0.97236753 81.51734924 72.44538116
		 -1.78821242 82.035255432 71.33100891 -1.65433002 82.39356995 71.81446075 -1.051518679 82.064376831 72.97708893
		 -4.34541082 88.60684204 69.32032013 -3.0017588139 88.6890564 69.75468445 -2.38146162 87.25372314 69.16703796
		 -2.28700137 86.76376343 69.1728363 -2.83116174 86.15335846 69.1227951 -4.023293495 85.90203094 68.87483215
		 -4.94106102 86.057182312 68.75048828 -6.070221424 86.80276489 68.27175903 -6.0083594322 87.42596436 68.30505371
		 -5.55617714 88.16395569 68.77783203;
	setAttr -s 4320 ".ed";
	setAttr ".ed[0:165]"  0 1 0 1 2 0 2 3 0 3 0 0 2 4 0 4 5 0 5 3 0 4 6 0 6 7 0
		 7 5 0 6 8 0 8 9 0 9 7 0 8 10 0 10 11 0 11 9 0 10 12 0 12 13 0 13 11 0 12 14 0 14 15 0
		 15 13 0 14 1 0 0 15 0 1 16 0 16 17 0 17 2 0 17 18 0 18 4 0 18 19 0 19 6 0 19 20 0
		 20 8 0 20 21 0 21 10 0 21 22 0 22 12 0 22 23 0 23 14 0 23 16 0 16 24 0 24 25 0 25 17 0
		 25 26 0 26 18 0 26 27 0 27 19 0 27 28 0 28 20 0 28 29 0 29 21 0 29 30 0 30 22 0 30 31 0
		 31 23 0 31 24 0 24 32 0 32 25 0 32 26 0 32 27 0 32 28 0 32 29 0 32 30 0 32 31 0 33 34 0
		 34 35 0 35 36 0 36 33 0 35 37 0 37 38 0 38 36 0 37 39 0 39 40 0 40 38 0 39 41 0 41 42 0
		 42 40 0 41 43 0 43 44 0 44 42 0 43 45 0 45 46 0 46 44 0 45 47 0 47 48 0 48 46 0 47 34 0
		 33 48 0 49 50 0 50 51 0 51 52 0 52 49 0 51 53 0 53 54 0 54 52 0 53 55 0 55 56 0 56 54 0
		 55 57 0 57 58 0 58 56 0 57 59 0 59 60 0 60 58 0 59 61 0 61 62 0 62 60 0 61 63 0 63 64 0
		 64 62 0 63 50 0 49 64 0 50 65 0 65 66 0 66 51 0 66 67 0 67 53 0 67 68 0 68 55 0 68 69 0
		 69 57 0 69 70 0 70 59 0 70 71 0 71 61 0 71 72 0 72 63 0 72 65 0 65 73 0 73 66 0 73 67 0
		 73 68 0 73 69 0 73 70 0 73 71 0 73 72 0 39 56 0 58 41 0 37 54 0 35 52 0 34 49 0 47 64 0
		 45 62 0 43 60 0 74 75 0 75 76 0 76 77 0 77 74 0 76 78 0 78 79 0 79 77 0 78 80 0 80 81 0
		 81 79 0 80 82 0 82 83 0 83 81 0 82 84 0 84 85 0 85 83 0 84 86 0 86 87 0 87 85 0 86 88 0
		 88 89 0 89 87 0;
	setAttr ".ed[166:331]" 88 75 0 74 89 0 90 91 0 91 92 0 92 93 0 93 90 0 92 94 0
		 94 95 0 95 93 0 94 96 0 96 97 0 97 95 0 96 98 0 98 99 0 99 97 0 98 100 0 100 101 0
		 101 99 0 100 102 0 102 103 0 103 101 0 102 104 0 104 105 0 105 103 0 104 91 0 90 105 0
		 91 106 0 106 107 0 107 92 0 107 108 0 108 94 0 108 109 0 109 96 0 109 110 0 110 98 0
		 110 111 0 111 100 0 111 112 0 112 102 0 112 113 0 113 104 0 113 106 0 106 114 0 114 107 0
		 114 108 0 114 109 0 114 110 0 114 111 0 114 112 0 114 113 0 80 97 0 99 82 0 78 95 0
		 76 93 0 75 90 0 88 105 0 86 103 0 84 101 0 115 116 0 116 117 0 117 118 0 118 115 0
		 117 119 0 119 120 0 120 118 0 119 121 0 121 122 0 122 120 0 121 123 0 123 124 0 124 122 0
		 123 125 0 125 126 0 126 124 0 125 127 0 127 128 0 128 126 0 127 129 0 129 130 0 130 128 0
		 129 116 0 115 130 0 116 131 0 131 132 0 132 117 0 132 133 0 133 119 0 133 134 0 134 121 0
		 134 135 0 135 123 0 135 136 0 136 125 0 136 137 0 137 127 0 137 138 0 138 129 0 138 131 0
		 131 139 0 139 140 0 140 132 0 140 141 0 141 133 0 141 142 0 142 134 0 142 143 0 143 135 0
		 143 144 0 144 136 0 144 145 0 145 137 0 145 146 0 146 138 0 146 139 0 139 147 0 147 140 0
		 147 141 0 147 142 0 147 143 0 147 144 0 147 145 0 147 146 0 148 149 0 149 150 0 150 151 0
		 151 148 0 150 152 0 152 153 0 153 151 0 152 154 0 154 155 0 155 153 0 154 156 0 156 157 0
		 157 155 0 156 158 0 158 159 0 159 157 0 158 160 0 160 161 0 161 159 0 160 162 0 162 163 0
		 163 161 0 162 149 0 148 163 0 164 165 0 165 166 0 166 167 0 167 164 0 166 168 0 168 169 0
		 169 167 0 168 170 0 170 171 0 171 169 0 170 172 0 172 173 0 173 171 0 172 174 0 174 175 0
		 175 173 0 174 176 0 176 177 0 177 175 0 176 178 0;
	setAttr ".ed[332:497]" 178 179 0 179 177 0 178 165 0 164 179 0 165 180 0 180 181 0
		 181 166 0 181 182 0 182 168 0 182 183 0 183 170 0 183 184 0 184 172 0 184 185 0 185 174 0
		 185 186 0 186 176 0 186 187 0 187 178 0 187 180 0 180 188 0 188 181 0 188 182 0 188 183 0
		 188 184 0 188 185 0 188 186 0 188 187 0 152 169 0 171 154 0 150 167 0 149 164 0 162 179 0
		 160 177 0 158 175 0 156 173 0 189 190 0 190 191 0 191 192 0 192 189 0 191 193 0 193 194 0
		 194 192 0 193 195 0 195 196 0 196 194 0 195 197 0 197 198 0 198 196 0 197 199 0 199 200 0
		 200 198 0 199 201 0 201 202 0 202 200 0 201 203 0 203 204 0 204 202 0 203 190 0 189 204 0
		 205 206 0 206 207 0 207 208 0 208 205 0 207 209 0 209 210 0 210 208 0 209 211 0 211 212 0
		 212 210 0 211 213 0 213 214 0 214 212 0 213 215 0 215 216 0 216 214 0 215 217 0 217 218 0
		 218 216 0 217 219 0 219 220 0 220 218 0 219 206 0 205 220 0 206 221 0 221 222 0 222 207 0
		 222 223 0 223 209 0 223 224 0 224 211 0 224 225 0 225 213 0 225 226 0 226 215 0 226 227 0
		 227 217 0 227 228 0 228 219 0 228 221 0 221 229 0 229 222 0 229 223 0 229 224 0 229 225 0
		 229 226 0 229 227 0 229 228 0 193 210 0 212 195 0 191 208 0 190 205 0 203 220 0 201 218 0
		 199 216 0 197 214 0 230 231 0 231 232 0 232 233 0 233 230 0 232 234 0 234 235 0 235 233 0
		 234 236 0 236 237 0 237 235 0 236 238 0 238 239 0 239 237 0 238 240 0 240 241 0 241 239 0
		 240 242 0 242 243 0 243 241 0 242 244 0 244 245 0 245 243 0 244 231 0 230 245 0 246 247 0
		 247 248 0 248 249 0 249 246 0 248 250 0 250 251 0 251 249 0 250 252 0 252 253 0 253 251 0
		 252 254 0 254 255 0 255 253 0 254 256 0 256 257 0 257 255 0 256 258 0 258 259 0 259 257 0
		 258 260 0 260 261 0 261 259 0 260 247 0 246 261 0 247 262 0 262 263 0;
	setAttr ".ed[498:663]" 263 248 0 263 264 0 264 250 0 264 265 0 265 252 0 265 266 0
		 266 254 0 266 267 0 267 256 0 267 268 0 268 258 0 268 269 0 269 260 0 269 262 0 262 270 0
		 270 263 0 270 264 0 270 265 0 270 266 0 270 267 0 270 268 0 270 269 0 236 253 0 255 238 0
		 234 251 0 232 249 0 231 246 0 244 261 0 242 259 0 240 257 0 271 272 0 272 273 0 273 274 0
		 274 271 0 273 275 0 275 276 0 276 274 0 275 277 0 277 278 0 278 276 0 277 279 0 279 280 0
		 280 278 0 279 281 0 281 282 0 282 280 0 281 283 0 283 284 0 284 282 0 283 285 0 285 286 0
		 286 284 0 285 272 0 271 286 0 272 287 0 287 288 0 288 273 0 288 289 0 289 275 0 289 290 0
		 290 277 0 290 291 0 291 279 0 291 292 0 292 281 0 292 293 0 293 283 0 293 294 0 294 285 0
		 294 287 0 287 295 0 295 296 0 296 288 0 296 297 0 297 289 0 297 298 0 298 290 0 298 299 0
		 299 291 0 299 300 0 300 292 0 300 301 0 301 293 0 301 302 0 302 294 0 302 295 0 295 303 0
		 303 296 0 303 297 0 303 298 0 303 299 0 303 300 0 303 301 0 303 302 0 304 305 0 305 306 0
		 306 307 0 307 304 0 306 308 0 308 309 0 309 307 0 308 310 0 310 311 0 311 309 0 310 312 0
		 312 313 0 313 311 0 312 314 0 314 315 0 315 313 0 314 316 0 316 317 0 317 315 0 316 318 0
		 318 319 0 319 317 0 318 305 0 304 319 0 305 320 0 320 321 0 321 306 0 321 322 0 322 308 0
		 322 323 0 323 310 0 323 324 0 324 312 0 324 325 0 325 314 0 325 326 0 326 316 0 326 327 0
		 327 318 0 327 320 0 320 328 0 328 329 0 329 321 0 329 330 0 330 322 0 330 331 0 331 323 0
		 331 332 0 332 324 0 332 333 0 333 325 0 333 334 0 334 326 0 334 335 0 335 327 0 335 328 0
		 328 336 0 336 329 0 336 330 0 336 331 0 336 332 0 336 333 0 336 334 0 336 335 0 337 338 0
		 338 339 0 339 340 0 340 337 0 339 341 0 341 342 0 342 340 0 341 343 0;
	setAttr ".ed[664:829]" 343 344 0 344 342 0 343 345 0 345 346 0 346 344 0 345 347 0
		 347 348 0 348 346 0 347 349 0 349 350 0 350 348 0 349 351 0 351 352 0 352 350 0 351 338 0
		 337 352 0 353 354 0 354 355 0 355 356 0 356 353 0 355 357 0 357 358 0 358 356 0 357 359 0
		 359 360 0 360 358 0 359 361 0 361 362 0 362 360 0 361 363 0 363 364 0 364 362 0 363 365 0
		 365 366 0 366 364 0 365 367 0 367 368 0 368 366 0 367 354 0 353 368 0 354 369 0 369 370 0
		 370 355 0 370 371 0 371 357 0 371 372 0 372 359 0 372 373 0 373 361 0 373 374 0 374 363 0
		 374 375 0 375 365 0 375 376 0 376 367 0 376 369 0 369 377 0 377 370 0 377 371 0 377 372 0
		 377 373 0 377 374 0 377 375 0 377 376 0 343 360 0 362 345 0 341 358 0 339 356 0 338 353 0
		 351 368 0 349 366 0 347 364 0 378 379 0 379 380 0 380 381 0 381 378 0 380 382 0 382 383 0
		 383 381 0 382 384 0 384 385 0 385 383 0 384 386 0 386 387 0 387 385 0 386 388 0 388 389 0
		 389 387 0 388 390 0 390 391 0 391 389 0 390 392 0 392 393 0 393 391 0 392 379 0 378 393 0
		 394 395 0 395 396 0 396 397 0 397 394 0 396 398 0 398 399 0 399 397 0 398 400 0 400 401 0
		 401 399 0 400 402 0 402 403 0 403 401 0 402 404 0 404 405 0 405 403 0 404 406 0 406 407 0
		 407 405 0 406 408 0 408 409 0 409 407 0 408 395 0 394 409 0 395 410 0 410 411 0 411 396 0
		 411 412 0 412 398 0 412 413 0 413 400 0 413 414 0 414 402 0 414 415 0 415 404 0 415 416 0
		 416 406 0 416 417 0 417 408 0 417 410 0 410 418 0 418 411 0 418 412 0 418 413 0 418 414 0
		 418 415 0 418 416 0 418 417 0 384 401 0 403 386 0 382 399 0 380 397 0 379 394 0 392 409 0
		 390 407 0 388 405 0 419 420 0 420 421 0 421 422 0 422 419 0 421 423 0 423 424 0 424 422 0
		 423 425 0 425 426 0 426 424 0 425 427 0 427 428 0 428 426 0 427 429 0;
	setAttr ".ed[830:995]" 429 430 0 430 428 0 429 431 0 431 432 0 432 430 0 431 433 0
		 433 434 0 434 432 0 433 420 0 419 434 0 420 435 0 435 436 0 436 421 0 436 437 0 437 423 0
		 437 438 0 438 425 0 438 439 0 439 427 0 439 440 0 440 429 0 440 441 0 441 431 0 441 442 0
		 442 433 0 442 435 0 435 443 0 443 444 0 444 436 0 444 445 0 445 437 0 445 446 0 446 438 0
		 446 447 0 447 439 0 447 448 0 448 440 0 448 449 0 449 441 0 449 450 0 450 442 0 450 443 0
		 443 451 0 451 444 0 451 445 0 451 446 0 451 447 0 451 448 0 451 449 0 451 450 0 452 453 0
		 453 454 0 454 455 0 455 452 0 454 456 0 456 457 0 457 455 0 456 458 0 458 459 0 459 457 0
		 458 460 0 460 461 0 461 459 0 460 462 0 462 463 0 463 461 0 462 464 0 464 465 0 465 463 0
		 464 466 0 466 467 0 467 465 0 466 453 0 452 467 0 468 469 0 469 470 0 470 471 0 471 468 0
		 470 472 0 472 473 0 473 471 0 472 474 0 474 475 0 475 473 0 474 476 0 476 477 0 477 475 0
		 476 478 0 478 479 0 479 477 0 478 480 0 480 481 0 481 479 0 480 482 0 482 483 0 483 481 0
		 482 469 0 468 483 0 469 484 0 484 485 0 485 470 0 485 486 0 486 472 0 486 487 0 487 474 0
		 487 488 0 488 476 0 488 489 0 489 478 0 489 490 0 490 480 0 490 491 0 491 482 0 491 484 0
		 484 492 0 492 485 0 492 486 0 492 487 0 492 488 0 492 489 0 492 490 0 492 491 0 456 473 0
		 475 458 0 454 471 0 453 468 0 466 483 0 464 481 0 462 479 0 460 477 0 493 494 0 494 495 0
		 495 496 0 496 493 0 495 497 0 497 498 0 498 496 0 497 499 0 499 500 0 500 498 0 499 501 0
		 501 502 0 502 500 0 501 503 0 503 504 0 504 502 0 503 505 0 505 506 0 506 504 0 505 507 0
		 507 508 0 508 506 0 507 494 0 493 508 0 509 510 0 510 511 0 511 512 0 512 509 0 511 513 0
		 513 514 0 514 512 0 513 515 0 515 516 0 516 514 0 515 517 0 517 518 0;
	setAttr ".ed[996:1161]" 518 516 0 517 519 0 519 520 0 520 518 0 519 521 0 521 522 0
		 522 520 0 521 523 0 523 524 0 524 522 0 523 510 0 509 524 0 510 525 0 525 526 0 526 511 0
		 526 527 0 527 513 0 527 528 0 528 515 0 528 529 0 529 517 0 529 530 0 530 519 0 530 531 0
		 531 521 0 531 532 0 532 523 0 532 525 0 525 533 0 533 526 0 533 527 0 533 528 0 533 529 0
		 533 530 0 533 531 0 533 532 0 497 514 0 516 499 0 495 512 0 494 509 0 507 524 0 505 522 0
		 503 520 0 501 518 0 534 535 0 535 536 0 536 537 0 537 534 0 536 538 0 538 539 0 539 537 0
		 538 540 0 540 541 0 541 539 0 540 542 0 542 543 0 543 541 0 542 544 0 544 545 0 545 543 0
		 544 546 0 546 547 0 547 545 0 546 548 0 548 549 0 549 547 0 548 535 0 534 549 0 550 551 0
		 551 552 0 552 553 0 553 550 0 552 554 0 554 555 0 555 553 0 554 556 0 556 557 0 557 555 0
		 556 558 0 558 559 0 559 557 0 558 560 0 560 561 0 561 559 0 560 562 0 562 563 0 563 561 0
		 562 564 0 564 565 0 565 563 0 564 551 0 550 565 0 551 566 0 566 567 0 567 552 0 567 568 0
		 568 554 0 568 569 0 569 556 0 569 570 0 570 558 0 570 571 0 571 560 0 571 572 0 572 562 0
		 572 573 0 573 564 0 573 566 0 566 574 0 574 567 0 574 568 0 574 569 0 574 570 0 574 571 0
		 574 572 0 574 573 0 540 557 0 559 542 0 538 555 0 536 553 0 535 550 0 548 565 0 546 563 0
		 544 561 0 575 576 0 576 577 0 577 578 0 578 575 0 577 579 0 579 580 0 580 578 0 579 581 0
		 581 582 0 582 580 0 581 583 0 583 584 0 584 582 0 583 585 0 585 586 0 586 584 0 585 587 0
		 587 588 0 588 586 0 587 589 0 589 590 0 590 588 0 589 576 0 575 590 0 576 591 0 591 592 0
		 592 577 0 592 593 0 593 579 0 593 594 0 594 581 0 594 595 0 595 583 0 595 596 0 596 585 0
		 596 597 0 597 587 0 597 598 0 598 589 0 598 591 0 591 599 0 599 600 0;
	setAttr ".ed[1162:1327]" 600 592 0 600 601 0 601 593 0 601 602 0 602 594 0 602 603 0
		 603 595 0 603 604 0 604 596 0 604 605 0 605 597 0 605 606 0 606 598 0 606 599 0 599 607 0
		 607 600 0 607 601 0 607 602 0 607 603 0 607 604 0 607 605 0 607 606 0 608 609 0 610 611 0
		 613 682 0 615 683 0 616 612 0 681 692 0 617 618 0 619 620 0 620 688 0 622 691 0 618 624 0
		 624 625 0 626 627 0 627 693 0 628 629 0 629 613 0 612 686 0 630 694 0 631 1418 0
		 634 619 0 635 636 0 636 637 0 638 639 0 639 640 0 641 642 0 643 644 0 645 646 0 647 648 0
		 649 650 0 651 652 0 653 654 0 655 656 0 644 653 0 656 641 0 654 645 0 648 655 0 646 649 0
		 652 647 0 658 657 0 659 660 0 611 661 0 661 635 0 662 663 0 663 664 0 632 1392 0
		 637 665 0 665 632 0 633 666 0 664 608 0 609 667 0 640 662 0 668 1419 0 666 670 0
		 671 659 0 657 671 0 670 638 0 621 690 0 642 672 0 673 643 0 672 634 0 674 651 0 650 675 0
		 676 674 0 675 677 0 678 676 0 677 679 0 660 678 0 679 658 0 680 685 0 667 668 0 669 610 0
		 614 681 0 682 695 0 683 616 0 684 626 0 625 689 0 685 673 0 686 630 0 687 631 0 688 621 0
		 689 622 0 690 684 0 623 680 0 691 623 0 692 617 0 693 615 0 694 687 0 695 696 0 696 614 0
		 697 698 0 698 699 0 699 700 0 700 697 0 699 608 0 609 700 0 701 702 0 702 703 0 703 704 0
		 704 701 0 611 705 0 705 706 0 706 610 0 705 707 0 707 708 0 708 706 0 1270 1263 0
		 709 710 0 710 612 0 711 1279 0 712 713 0 713 714 0 714 715 0 715 712 0 714 716 0
		 716 717 0 717 715 0 718 719 0 719 720 0 720 721 0 721 718 0 722 723 0 723 724 0 724 725 0
		 725 722 0 726 613 0 614 727 0 729 727 0 709 731 0 731 732 0 732 710 0 731 1268 0
		 733 734 0 734 1269 0 734 615 0 616 732 0 736 1267 0 736 733 0 728 1333 0 737 738 0
		 738 739 0 739 1335 0 739 735 0 617 740 0 740 1334 0;
	setAttr ".ed[1328:1493]" 618 741 0 741 740 0 741 738 0 737 740 0 742 743 0 743 1306 0
		 744 745 0 745 1307 0 744 746 0 746 747 0 747 745 0 747 619 0 620 745 0 621 742 0
		 748 749 0 749 1288 0 750 751 0 751 1289 0 750 746 0 744 751 0 743 752 0 752 1305 0
		 753 1324 0 754 622 0 623 753 0 624 755 0 755 741 0 625 756 0 756 755 0 756 757 0
		 757 758 0 758 755 0 758 738 0 758 759 0 759 739 0 757 760 0 760 759 0 760 761 0 761 762 0
		 762 759 0 762 735 0 762 1293 0 763 1338 0 761 1292 0 764 763 0 764 765 0 765 766 0
		 766 763 0 766 1339 0 766 767 0 767 1340 0 765 768 0 768 767 0 768 626 0 627 767 0
		 769 628 0 629 770 0 770 769 0 726 770 0 730 771 0 771 770 0 771 772 0 772 769 0 773 772 0
		 774 773 0 775 774 0 776 775 0 777 776 0 631 777 0 778 632 0 779 778 0 780 779 0 781 780 0
		 782 781 0 783 782 0 784 783 0 633 784 0 785 1286 0 786 787 0 787 1287 0 788 785 0
		 787 750 0 749 788 0 789 746 0 787 789 0 789 790 0 790 747 0 790 634 0 793 792 0 794 793 0
		 796 797 0 797 729 0 799 798 0 803 802 0 798 803 0 801 796 0 795 804 0 805 794 0 802 805 0
		 804 800 0 806 807 0 807 808 0 808 809 0 809 806 0 810 811 0 811 812 0 812 813 0 813 810 0
		 814 815 0 815 813 0 812 814 0 807 816 0 816 817 0 817 808 0 816 818 0 818 819 0 819 817 0
		 814 820 0 820 821 0 821 815 0 820 822 0 822 823 0 823 821 0 818 824 0 824 825 0 825 819 0
		 826 827 0 827 825 0 824 826 0 828 829 0 829 830 0 830 831 0 831 828 0 830 832 0 832 833 0
		 833 831 0 834 835 0 835 836 0 836 837 0 837 834 0 836 838 0 838 839 0 839 837 0 840 841 0
		 841 1377 0 842 843 0 843 1378 0 844 1376 0 845 842 0 841 844 0 846 847 0 847 1379 0
		 848 849 0 849 1380 0 843 848 0 847 840 0 850 851 0 851 1381 0 852 853 0 853 1382 0
		 849 852 0 851 846 0 748 1303 0 845 855 0 855 1319 0 853 855 0;
	setAttr ".ed[1494:1659]" 855 1383 0 856 850 0 857 858 0 858 859 0 859 860 0 860 857 0
		 861 862 0 862 1231 0 862 863 0 863 1230 0 864 865 0 865 857 0 860 864 0 866 865 0
		 864 867 0 867 866 0 863 868 0 868 1229 0 868 869 0 869 1228 0 870 871 0 871 866 0
		 867 870 0 872 871 0 870 873 0 873 872 0 869 874 0 874 1227 0 874 875 0 875 1226 0
		 873 876 0 876 877 0 877 872 0 878 877 0 876 879 0 879 878 0 875 880 0 880 1233 0
		 880 861 0 858 878 0 879 859 0 881 635 0 636 882 0 882 881 0 637 883 0 883 882 0 883 884 0
		 884 885 0 885 882 0 885 886 0 886 881 0 887 886 0 885 888 0 888 887 0 884 889 0 889 888 0
		 889 890 0 890 891 0 891 888 0 891 892 0 892 887 0 893 892 0 892 894 0 894 895 0 895 893 0
		 896 897 0 897 898 0 898 899 0 899 896 0 900 901 0 901 898 0 898 902 0 902 900 0 897 903 0
		 903 902 0 903 638 0 639 902 0 640 900 0 904 905 0 905 641 0 642 904 0 906 907 0 907 905 0
		 904 906 0 908 909 0 909 907 0 906 908 0 644 909 0 908 643 0 646 910 0 910 911 0 911 645 0
		 910 912 0 912 913 0 913 911 0 912 914 0 914 915 0 915 913 0 914 647 0 648 915 0 650 916 0
		 916 917 0 917 649 0 916 918 0 918 919 0 919 917 0 918 920 0 920 921 0 921 919 0 920 651 0
		 652 921 0 654 922 0 922 923 0 923 653 0 922 924 0 924 925 0 925 923 0 924 926 0 926 927 0
		 927 925 0 926 655 0 656 927 0 923 909 0 925 907 0 927 905 0 911 922 0 913 924 0 915 926 0
		 917 910 0 919 912 0 921 914 0 657 928 0 928 929 0 929 658 0 928 930 0 930 931 0 931 929 0
		 930 932 0 932 933 0 933 931 0 932 659 0 660 933 0 661 934 0 934 705 0 881 934 0 886 935 0
		 935 934 0 935 707 0 887 936 0 936 935 0 892 937 0 937 936 0 893 938 0 938 937 0 893 939 0
		 939 940 0 940 938 0 941 942 0 942 943 0 943 701 0 701 941 0 944 662 0 663 942 0 942 944 0
		 664 943 0 665 945 0;
	setAttr ".ed[1660:1825]" 945 883 0 778 945 0 779 946 0 946 945 0 946 884 0 946 947 0
		 947 889 0 780 947 0 781 948 0 948 947 0 948 890 0 949 890 0 948 950 0 950 949 0 782 950 0
		 951 952 0 952 953 0 953 954 0 954 951 0 955 783 0 784 956 0 956 955 0 666 956 0 957 1356 0
		 958 957 0 959 958 0 960 959 0 822 961 0 961 962 0 962 823 0 963 960 0 964 963 0 965 966 0
		 966 967 0 967 968 0 968 965 0 969 964 0 970 969 0 957 970 0 971 972 0 972 973 0 973 974 0
		 974 971 0 943 699 0 698 701 0 975 971 0 974 976 0 976 975 0 667 977 0 977 700 0 939 1443 0
		 978 979 0 979 1442 0 900 1437 0 980 981 0 981 1436 0 942 1439 0 982 983 0 983 1438 0
		 941 1440 0 984 982 0 985 986 0 986 987 0 987 988 0 988 985 0 989 990 0 990 991 0
		 991 992 0 992 989 0 987 993 0 993 994 0 994 988 0 995 941 0 704 995 0 995 1441 0
		 996 984 0 895 997 0 997 939 0 997 1444 0 998 978 0 901 999 0 999 899 0 1000 1445 0
		 981 1000 0 900 944 0 983 980 0 701 972 0 971 702 0 698 973 0 697 974 0 977 702 0
		 975 977 0 700 976 0 703 937 0 938 704 0 940 995 0 979 996 0 1001 1002 0 1002 1003 0
		 1003 1004 0 1004 1001 0 1004 991 0 990 1001 0 1005 1006 0 1006 986 0 985 1005 0 1005 1007 0
		 1007 1008 0 1008 1006 0 1007 668 0 669 1003 0 1009 1010 0 1010 1011 0 1011 1012 0
		 1012 1009 0 1010 1013 0 1013 1014 0 1014 1011 0 1015 1016 0 1016 1017 0 1017 1018 0
		 1018 1015 0 950 1019 0 1019 952 0 952 949 0 1013 1017 0 1016 1014 0 1020 1021 0 1021 955 0
		 956 1020 0 670 1020 0 997 999 0 1000 998 0 895 899 0 894 896 0 783 1022 0 1022 1023 0
		 1023 782 0 1024 1025 0 1025 1012 0 1011 1024 0 955 1026 0 1026 1022 0 1027 1024 0
		 1014 1027 0 1023 1009 0 1009 950 0 1025 1028 0 1028 1019 0 1019 1012 0 1021 1018 0
		 1017 1029 0 1029 1021 0 1015 951 0 951 1030 0 1030 1016 0 1029 1026 0 1030 1027 0
		 1013 1026 0 1010 1022 0 930 671 0 1018 896 0 894 1031 0 1031 1018 0 1021 897 0 1020 903 0;
	setAttr ".ed[1826:1991]" 1032 1033 0 1033 1034 0 1034 1035 0 1035 1032 0 1036 1037 0
		 1037 1038 0 1038 1039 0 1039 1036 0 1040 1041 0 1041 1042 0 1042 1043 0 1043 1040 0
		 1044 1045 0 1045 1046 0 1046 1047 0 1047 1044 0 876 1385 0 1232 1220 0 754 1316 0
		 854 1311 0 854 1290 0 752 1313 0 743 1314 0 742 1315 0 954 1027 0 1028 953 0 949 1031 0
		 1031 891 0 949 1015 0 954 1025 0 1049 1050 0 1050 1051 0 1051 1052 0 1052 1049 0
		 827 1053 0 1053 1054 0 1054 1055 0 1055 827 0 712 1056 0 1056 1057 0 1057 713 0 1058 1059 0
		 1059 1050 0 1049 1058 0 1060 1061 0 1061 1062 0 1062 1063 0 1063 1060 0 723 1064 0
		 1064 1065 0 1065 724 0 1054 1066 0 1066 1067 0 1067 1055 0 1068 1069 0 1069 1061 0
		 1060 1068 0 992 994 0 993 989 0 794 1299 0 1329 1298 0 802 1297 0 804 1296 0 798 796 0
		 792 791 0 853 1320 0 852 1321 0 849 1322 0 848 1325 0 843 1323 0 844 877 0 878 856 0
		 856 844 0 841 872 0 840 871 0 847 866 0 846 865 0 851 857 0 850 858 0 784 1399 0
		 783 1398 0 782 1397 0 781 1396 0 780 1395 0 779 1394 0 778 1393 0 672 1070 0 1070 904 0
		 1070 1071 0 1071 906 0 1071 786 0 786 908 0 786 673 0 1071 789 0 1070 790 0 920 1072 0
		 1072 674 0 918 1073 0 1073 1072 0 916 1074 0 1074 1073 0 675 1074 0 1072 1075 0 1075 676 0
		 1073 1076 0 1076 1075 0 1074 1077 0 1077 1076 0 677 1077 0 1075 1078 0 1078 678 0
		 1076 1079 0 1079 1078 0 1077 1080 0 1080 1079 0 679 1080 0 1078 933 0 1079 931 0
		 1080 929 0 785 680 0 826 1081 0 1081 1082 0 1082 827 0 1082 1083 0 1083 1053 0 1083 1051 0
		 1050 1084 0 1084 1083 0 1057 1081 0 826 713 0 1059 1056 0 1056 1084 0 1085 828 0
		 831 1086 0 1086 1085 0 1084 830 0 829 1083 0 1085 1083 0 833 1065 0 1065 1086 0 832 1056 0
		 1056 1065 0 1065 834 0 837 1086 0 1087 836 0 835 1064 0 1064 1087 0 839 1085 0 838 1088 0
		 1088 1085 0 1087 1088 0 1089 1090 0 1090 1091 0 1091 1092 0 1092 1089 0 723 1092 0
		 1091 1064 0 1064 1062 0 1061 1087 0 1067 1093 0 1093 1090 0 1089 1067 0 1069 1088 0
		 1088 1093 0 1066 1088 0 967 811 0;
	setAttr ".ed[1992:2157]" 810 968 0 961 966 0 965 962 0 1092 1094 0 1094 806 0
		 806 1089 0 712 724 0 715 725 0 716 718 0 721 717 0 722 1094 0 719 1094 0 722 720 0
		 721 725 0 818 716 0 714 824 0 816 718 0 807 719 0 809 1067 0 1082 1052 0 1081 1049 0
		 1057 1058 0 1091 1063 0 1090 1060 0 1093 1068 0 1054 1085 0 1095 1096 0 1096 1097 0
		 1097 1098 0 1098 1095 0 1099 1100 0 1100 1096 0 1095 1099 0 1101 1102 0 1102 1100 0
		 1099 1101 0 1103 1104 0 1104 1102 0 1101 1103 0 1105 1106 0 1106 1104 0 1103 1105 0
		 1107 1108 0 1108 1106 0 1105 1107 0 1109 1110 0 1110 1108 0 1107 1109 0 1097 1110 0
		 1109 1098 0 811 1111 0 1111 1112 0 1112 812 0 967 1113 0 1113 1111 0 966 1114 0 1114 1113 0
		 961 1115 0 1115 1114 0 822 1116 0 1116 1115 0 820 1117 0 1117 1116 0 814 1118 0 1118 1117 0
		 1112 1118 0 1119 1120 0 1120 1121 0 1121 1122 0 1122 1119 0 1121 1123 0 1123 1124 0
		 1124 1122 0 1125 1126 0 1126 1127 0 1127 1128 0 1128 1125 0 1129 1130 0 1130 1131 0
		 1131 1132 0 1132 1129 0 1133 1134 0 1134 1037 0 1037 1034 0 1034 1133 0 1134 1135 0
		 1135 1038 0 1135 1136 0 1136 1041 0 1041 1038 0 1136 1137 0 1137 1042 0 1138 1045 0
		 1045 1042 0 1137 1138 0 1139 1140 0 1140 1141 0 1141 1142 0 1142 1139 0 1141 1143 0
		 1143 1144 0 1144 1142 0 1145 1146 0 1146 1147 0 1147 1148 0 1148 1145 0 1147 1149 0
		 1149 1150 0 1150 1148 0 1151 1152 0 1152 1153 0 1153 1154 0 1154 1151 0 1045 1155 0
		 1155 1156 0 1156 1046 0 1119 1157 0 1157 1158 0 1158 1120 0 1159 1160 0 1160 1152 0
		 1151 1159 0 1161 1162 0 1162 1163 0 1163 1164 0 1164 1161 0 1130 1165 0 1165 1166 0
		 1166 1131 0 1156 1167 0 1167 1033 0 1033 1046 0 1168 1169 0 1169 1162 0 1161 1168 0
		 1138 1170 0 1170 1171 0 1171 1045 0 1171 1172 0 1172 1155 0 1172 1153 0 1152 1173 0
		 1173 1172 0 1158 1170 0 1138 1120 0 1160 1157 0 1157 1173 0 1174 1139 0 1142 1175 0
		 1175 1174 0 1173 1141 0 1140 1172 0 1174 1172 0 1144 1166 0 1166 1175 0 1143 1157 0
		 1157 1166 0 1166 1145 0 1148 1175 0 1176 1147 0 1146 1165 0 1165 1176 0 1150 1174 0
		 1149 1177 0 1177 1174 0 1176 1177 0;
	setAttr ".ed[2158:2323]" 1178 1179 0 1179 1180 0 1180 1181 0 1181 1178 0 1130 1181 0
		 1180 1165 0 1165 1163 0 1162 1176 0 1033 1182 0 1182 1179 0 1178 1033 0 1169 1177 0
		 1177 1182 0 1167 1177 0 1181 1183 0 1183 1133 0 1133 1178 0 1119 1131 0 1122 1132 0
		 1123 1125 0 1128 1124 0 1129 1183 0 1126 1183 0 1129 1127 0 1128 1132 0 1136 1123 0
		 1121 1137 0 1135 1125 0 1134 1126 0 1171 1154 0 1170 1151 0 1158 1159 0 1180 1164 0
		 1179 1161 0 1182 1168 0 1156 1174 0 1036 1035 0 1032 1047 0 1044 1043 0 1040 1039 0
		 1184 1185 0 1185 1035 0 1036 1184 0 1039 1186 0 1186 1184 0 1187 1186 0 1040 1187 0
		 1043 1188 0 1188 1187 0 1189 1188 0 1044 1189 0 1047 1190 0 1190 1189 0 1191 1190 0
		 1032 1191 0 1185 1191 0 1192 1193 0 1193 1248 0 1193 1194 0 1194 1247 0 1194 1195 0
		 1195 1246 0 1195 1196 0 1196 1245 0 1196 1197 0 1197 1244 0 1197 1198 0 1198 1243 0
		 1198 1199 0 1199 1242 0 1199 1192 0 1192 1250 0 1184 1251 0 1186 1252 0 1187 1253 0
		 1188 1254 0 1189 1255 0 1190 1256 0 1191 1257 0 1355 1342 0 1098 1341 0 1109 1348 0
		 1107 1347 0 1105 1346 0 1103 1345 0 1101 1344 0 1099 1343 0 1096 810 0 813 1097 0
		 815 1110 0 821 1108 0 823 1106 0 962 1104 0 965 1102 0 968 1100 0 880 1241 0 1200 970 0
		 957 1201 0 1201 1200 0 958 1202 0 1202 1201 0 959 1203 0 1203 1202 0 960 1204 0 1204 1203 0
		 963 1205 0 1205 1204 0 964 1206 0 1206 1205 0 969 1207 0 1207 1206 0 1200 1207 0
		 978 1208 0 1208 1209 0 1209 979 0 980 1210 0 1210 1211 0 1211 981 0 982 1212 0 1212 1213 0
		 1213 983 0 984 1214 0 1214 1212 0 996 1215 0 1215 1214 0 998 1216 0 1216 1208 0 1000 1217 0
		 1217 1216 0 1213 1210 0 1209 1215 0 1211 1217 0 1007 977 0 1005 702 0 985 703 0 988 937 0
		 994 936 0 992 935 0 991 707 0 1004 708 0 1003 706 0 1115 827 0 1055 1114 0 1116 825 0
		 1117 819 0 1118 817 0 1112 808 0 1111 809 0 1113 1067 0 794 1272 0 1200 1271 0 793 1273 0
		 792 1274 0 799 1275 0 798 1276 0 803 1277 0 802 1278 0 1219 1384 0 1218 1219 0 1220 1391 0
		 1219 1220 0 1221 1390 0 1220 1221 0 1222 1389 0 1221 1222 0 1223 1388 0;
	setAttr ".ed[2324:2489]" 1222 1223 0 1224 1387 0 1223 1224 0 1225 1386 0 1224 1225 0
		 1225 1218 0 1226 1218 0 1227 1225 0 1226 1227 0 1228 1224 0 1227 1228 0 1229 1223 0
		 1228 1229 0 1230 1222 0 1229 1230 0 1231 1221 0 1230 1231 0 1232 861 0 1231 1232 0
		 1233 1219 0 1232 1233 0 1233 1226 0 1234 875 0 1235 874 0 1234 1235 0 1236 869 0
		 1235 1236 0 1237 868 0 1236 1237 0 1238 863 0 1237 1238 0 1239 862 0 1238 1239 0
		 1240 861 0 1239 1240 0 1241 1249 0 1240 1241 0 1241 1234 0 1242 1234 0 1243 1235 0
		 1242 1243 0 1244 1236 0 1243 1244 0 1245 1237 0 1244 1245 0 1246 1238 0 1245 1246 0
		 1247 1239 0 1246 1247 0 1248 1240 0 1247 1248 0 1249 1192 0 1248 1249 0 1249 1242 0
		 1250 1185 0 1251 1193 0 1250 1251 0 1252 1194 0 1251 1252 0 1253 1195 0 1252 1253 0
		 1254 1196 0 1253 1254 0 1255 1197 0 1254 1255 0 1256 1198 0 1255 1256 0 1257 1199 0
		 1256 1257 0 1257 1250 0 728 729 0 1258 727 0 728 1258 0 1258 681 0 791 1259 0 1260 726 0
		 1259 1260 0 1260 682 0 791 1330 0 1261 1262 0 800 1262 0 1263 1300 0 1264 774 0 1265 775 0
		 1264 1265 0 1266 776 0 1265 1266 0 1266 1302 0 1267 711 0 1268 733 0 1267 1268 0
		 1269 732 0 1268 1269 0 1269 683 0 1270 1358 0 1270 1301 0 1271 805 0 1272 1207 0
		 1271 1272 0 1273 1206 0 1272 1273 0 1274 1205 0 1273 1274 0 1275 1204 0 1274 1275 0
		 1276 1203 0 1275 1276 0 1277 1202 0 1276 1277 0 1278 1201 0 1277 1278 0 1278 1271 0
		 1279 1261 0 1280 768 0 684 1280 0 1281 765 0 1280 1281 0 1282 764 0 1281 1282 0 1283 761 0
		 1282 1291 0 1048 1308 0 804 1362 0 1284 1270 0 1265 1357 0 1285 1263 0 1284 1285 0
		 711 731 0 1279 709 0 1286 786 0 685 1286 0 1287 788 0 1286 1287 0 1288 750 0 1287 1288 0
		 1289 748 0 1288 1289 0 1290 752 0 1289 1304 0 1291 1283 0 1290 1312 0 1292 764 0
		 1291 1292 0 1293 763 0 1292 1293 0 1294 736 0 1293 1337 0 1295 1267 0 1294 1295 0
		 1296 805 0 1297 800 0 1296 1297 0 801 803 0 797 799 0 1298 793 0 791 1298 0 1299 795 0
		 1298 1299 0 1299 1296 0 1300 686 0 1301 630 0 1300 1301 0 1302 687 0 1301 1359 0
		 1302 777 0 1303 854 0;
	setAttr ".ed[2490:2655]" 845 1318 0 1304 1290 0 1303 1304 0 1305 751 0 1304 1305 0
		 1306 744 0 1305 1306 0 1307 742 0 1306 1307 0 1307 688 0 842 1317 0 843 1048 0 1308 760 0
		 1283 1308 0 1309 757 0 1308 1309 0 1310 756 0 1309 1310 0 1310 689 0 1311 1283 0
		 1048 1311 0 1312 1291 0 1311 1312 0 1313 1282 0 1312 1313 0 1314 1281 0 1313 1314 0
		 1315 1280 0 1314 1315 0 1315 690 0 1316 1048 0 1309 1316 0 1310 754 0 1317 854 0
		 1048 1317 0 1318 1303 0 1317 1318 0 1319 748 0 1318 1319 0 1320 749 0 1319 1320 0
		 1321 788 0 1320 1321 0 1322 785 0 1321 1322 0 753 785 0 1316 1323 0 1324 754 0 1323 1324 0
		 1324 691 0 1325 753 0 1322 1325 0 1325 1323 0 801 1326 0 1326 1261 0 800 1326 0 1326 1328 0
		 1297 801 0 1327 711 0 1261 1327 0 1328 1331 0 1327 1328 0 795 1329 0 1329 1330 0
		 1330 730 0 1327 1295 0 796 728 0 796 1332 0 796 1328 0 1331 1336 0 1295 1331 0 1331 1332 0
		 1333 737 0 1332 1333 0 1334 1258 0 1333 1334 0 1334 692 0 1335 1332 0 737 1335 0
		 1336 735 0 1335 1336 0 1336 1294 0 1337 1294 0 735 1337 0 1338 736 0 1337 1338 0
		 1339 733 0 1338 1339 0 1340 734 0 1339 1340 0 1340 693 0 1342 1095 0 1341 1342 0
		 1343 1354 0 1342 1343 0 1344 1353 0 1343 1344 0 1345 1352 0 1344 1345 0 1346 1351 0
		 1345 1346 0 1347 1350 0 1346 1347 0 1348 1349 0 1347 1348 0 1348 1341 0 1349 958 0
		 1350 959 0 1349 1350 0 1351 960 0 1350 1351 0 1352 963 0 1351 1352 0 1353 964 0 1352 1353 0
		 1354 969 0 1353 1354 0 1355 970 0 1354 1355 0 1356 1341 0 1355 1356 0 1356 1349 0
		 1285 1279 0 1263 709 0 1300 710 0 1357 1284 0 1358 1266 0 1357 1358 0 1359 1302 0
		 1358 1359 0 1359 694 0 1360 1284 0 1361 1357 0 1360 1361 0 1361 1264 0 1362 1365 0
		 1262 1362 0 1363 1264 0 773 1363 0 1364 1361 0 1363 1364 0 1365 1360 0 1364 1365 0
		 1366 1285 0 1261 1366 0 1366 1360 0 1362 1366 0 1365 795 0 1364 1329 0 1363 1330 0
		 773 730 0 1260 1367 0 727 1368 0 1368 1367 0 729 1369 0 1259 1370 0 1369 1370 0 1370 1367 0
		 1369 1368 0 791 1371 0 1371 1370 0 797 1372 0 1372 1369 0 1372 1371 0 799 1373 0
		 1372 1373 0;
	setAttr ".ed[2656:2821]" 792 1374 0 1374 1373 0 1374 1371 0 1367 695 0 1368 696 0
		 1275 1374 0 1330 1375 0 1375 771 0 1259 1375 0 726 1375 0 1376 845 0 1377 842 0 1376 1377 1
		 1378 840 0 1377 1378 1 1379 848 0 1378 1379 1 1380 846 0 1379 1380 1 1381 852 0 1380 1381 1
		 1382 850 0 1381 1382 1 1383 856 0 1382 1383 1 1383 1376 1 1384 879 0 1385 1218 0
		 1384 1385 1 1386 873 0 1385 1386 1 1387 870 0 1386 1387 1 1388 867 0 1387 1388 1
		 1389 864 0 1388 1389 1 1390 860 0 1389 1390 1 1391 859 0 1390 1391 1 1391 1384 1
		 1392 1401 0 1393 1402 0 1392 1393 1 1394 1403 0 1393 1394 1 1395 1404 0 1394 1395 1
		 1396 1405 0 1395 1396 1 1397 1406 0 1396 1397 1 1398 1407 0 1397 1398 1 1399 1408 0
		 1398 1399 1 1400 633 0 1399 1400 1 1401 1410 0 1402 1411 0 1401 1402 1 1403 1412 0
		 1402 1403 1 1404 1413 0 1403 1404 1 1405 1414 0 1404 1405 1 1406 1415 0 1405 1406 1
		 1407 1416 0 1406 1407 1 1408 1417 0 1407 1408 1 1409 1400 0 1408 1409 1 1410 1411 1
		 1411 1412 1 1412 1413 1 1413 1414 1 1414 1415 1 1415 1416 1 1416 1417 1 1418 1409 0
		 1417 1418 1 1410 628 0 1411 769 0 1412 772 0 1413 773 0 1414 774 0 1415 775 0 1416 776 0
		 1417 777 0 1008 1419 0 1420 669 0 1002 1420 0 1420 1431 0 986 1421 1 987 1422 1 1421 1422 0
		 989 1423 1 990 1424 1 1423 1424 0 993 1425 0 1422 1425 0 1001 1426 1 1002 1427 1
		 1426 1427 0 1424 1426 0 1006 1428 1 1428 1421 0 1008 1429 1 1429 1428 0 1425 1423 0
		 1419 1430 0 1429 1430 0 1427 1431 0 975 1432 0 971 1433 0 1432 1433 0 974 1434 0
		 1434 1433 0 976 1435 0 1434 1435 0 1435 1432 0 1436 901 0 1437 980 0 1436 1437 1
		 1438 944 0 1437 1438 1 1439 982 0 1438 1439 1 1440 984 0 1439 1440 0 1441 996 0 1440 1441 1
		 1442 940 0 1441 1442 1 1443 978 0 1442 1443 1 1444 998 0 1443 1444 1 1445 999 0 1444 1445 1
		 1445 1436 1 1446 1447 0 1447 1448 0 1448 1449 0 1449 1446 0 1448 608 0 609 1449 0
		 1450 1451 0 1451 1452 0 1452 1453 0 1453 1450 0 611 1454 0 1454 1455 0 1455 610 0
		 1454 1456 0 1456 1457 0 1457 1455 0 2019 2012 0 1458 1459 0 1459 612 0 1460 2028 0
		 1461 1462 0;
	setAttr ".ed[2822:2987]" 1462 1463 0 1463 1464 0 1464 1461 0 1463 1465 0 1465 1466 0
		 1466 1464 0 1467 1468 0 1468 1469 0 1469 1470 0 1470 1467 0 1471 1472 0 1472 1473 0
		 1473 1474 0 1474 1471 0 1475 613 0 614 1476 0 1478 1476 0 1458 1480 0 1480 1481 0
		 1481 1459 0 1480 2017 0 1482 1483 0 1483 2018 0 1483 615 0 616 1481 0 1485 2016 0
		 1485 1482 0 1477 2082 0 1486 1487 0 1487 1488 0 1488 2084 0 1488 1484 0 617 1489 0
		 1489 2083 0 618 1490 0 1490 1489 0 1490 1487 0 1486 1489 0 1491 1492 0 1492 2055 0
		 1493 1494 0 1494 2056 0 1493 1495 0 1495 1496 0 1496 1494 0 1496 619 0 620 1494 0
		 621 1491 0 1497 1498 0 1498 2037 0 1499 1500 0 1500 2038 0 1499 1495 0 1493 1500 0
		 1492 1501 0 1501 2054 0 1502 2073 0 1503 622 0 623 1502 0 624 1504 0 1504 1490 0
		 625 1505 0 1505 1504 0 1505 1506 0 1506 1507 0 1507 1504 0 1507 1487 0 1507 1508 0
		 1508 1488 0 1506 1509 0 1509 1508 0 1509 1510 0 1510 1511 0 1511 1508 0 1511 1484 0
		 1511 2042 0 1512 2087 0 1510 2041 0 1513 1512 0 1513 1514 0 1514 1515 0 1515 1512 0
		 1515 2088 0 1515 1516 0 1516 2089 0 1514 1517 0 1517 1516 0 1517 626 0 627 1516 0
		 1518 628 0 629 1519 0 1519 1518 0 1475 1519 0 1479 1520 0 1520 1519 0 1520 1521 0
		 1521 1518 0 1522 1521 0 1523 1522 0 1524 1523 0 1525 1524 0 1526 1525 0 631 1526 0
		 1527 632 0 1528 1527 0 1529 1528 0 1530 1529 0 1531 1530 0 1532 1531 0 1533 1532 0
		 633 1533 0 1534 2035 0 1535 1536 0 1536 2036 0 1537 1534 0 1536 1499 0 1498 1537 0
		 1538 1495 0 1536 1538 0 1538 1539 0 1539 1496 0 1539 634 0 1542 1541 0 1543 1542 0
		 1545 1546 0 1546 1478 0 1548 1547 0 1552 1551 0 1547 1552 0 1550 1545 0 1544 1553 0
		 1554 1543 0 1551 1554 0 1553 1549 0 1555 1556 0 1556 1557 0 1557 1558 0 1558 1555 0
		 1559 1560 0 1560 1561 0 1561 1562 0 1562 1559 0 1563 1564 0 1564 1562 0 1561 1563 0
		 1556 1565 0 1565 1566 0 1566 1557 0 1565 1567 0 1567 1568 0 1568 1566 0 1563 1569 0
		 1569 1570 0 1570 1564 0 1569 1571 0 1571 1572 0 1572 1570 0 1567 1573 0 1573 1574 0
		 1574 1568 0 1575 1576 0 1576 1574 0 1573 1575 0 1577 1578 0 1578 1579 0 1579 1580 0;
	setAttr ".ed[2988:3153]" 1580 1577 0 1579 1581 0 1581 1582 0 1582 1580 0 1583 1584 0
		 1584 1585 0 1585 1586 0 1586 1583 0 1585 1587 0 1587 1588 0 1588 1586 0 1589 1590 0
		 1590 2126 0 1591 1592 0 1592 2127 0 1593 2125 0 1594 1591 0 1590 1593 0 1595 1596 0
		 1596 2128 0 1597 1598 0 1598 2129 0 1592 1597 0 1596 1589 0 1599 1600 0 1600 2130 0
		 1601 1602 0 1602 2131 0 1598 1601 0 1600 1595 0 1497 2052 0 1594 1604 0 1604 2068 0
		 1602 1604 0 1604 2132 0 1605 1599 0 1606 1607 0 1607 1608 0 1608 1609 0 1609 1606 0
		 1610 1611 0 1611 1980 0 1611 1612 0 1612 1979 0 1613 1614 0 1614 1606 0 1609 1613 0
		 1615 1614 0 1613 1616 0 1616 1615 0 1612 1617 0 1617 1978 0 1617 1618 0 1618 1977 0
		 1619 1620 0 1620 1615 0 1616 1619 0 1621 1620 0 1619 1622 0 1622 1621 0 1618 1623 0
		 1623 1976 0 1623 1624 0 1624 1975 0 1622 1625 0 1625 1626 0 1626 1621 0 1627 1626 0
		 1625 1628 0 1628 1627 0 1624 1629 0 1629 1982 0 1629 1610 0 1607 1627 0 1628 1608 0
		 1630 635 0 636 1631 0 1631 1630 0 637 1632 0 1632 1631 0 1632 1633 0 1633 1634 0
		 1634 1631 0 1634 1635 0 1635 1630 0 1636 1635 0 1634 1637 0 1637 1636 0 1633 1638 0
		 1638 1637 0 1638 1639 0 1639 1640 0 1640 1637 0 1640 1641 0 1641 1636 0 1642 1641 0
		 1641 1643 0 1643 1644 0 1644 1642 0 1645 1646 0 1646 1647 0 1647 1648 0 1648 1645 0
		 1649 1650 0 1650 1647 0 1647 1651 0 1651 1649 0 1646 1652 0 1652 1651 0 1652 638 0
		 639 1651 0 640 1649 0 1653 1654 0 1654 641 0 642 1653 0 1655 1656 0 1656 1654 0 1653 1655 0
		 1657 1658 0 1658 1656 0 1655 1657 0 644 1658 0 1657 643 0 646 1659 0 1659 1660 0
		 1660 645 0 1659 1661 0 1661 1662 0 1662 1660 0 1661 1663 0 1663 1664 0 1664 1662 0
		 1663 647 0 648 1664 0 650 1665 0 1665 1666 0 1666 649 0 1665 1667 0 1667 1668 0 1668 1666 0
		 1667 1669 0 1669 1670 0 1670 1668 0 1669 651 0 652 1670 0 654 1671 0 1671 1672 0
		 1672 653 0 1671 1673 0 1673 1674 0 1674 1672 0 1673 1675 0 1675 1676 0 1676 1674 0
		 1675 655 0 656 1676 0 1672 1658 0 1674 1656 0 1676 1654 0 1660 1671 0 1662 1673 0
		 1664 1675 0 1666 1659 0 1668 1661 0 1670 1663 0 657 1677 0;
	setAttr ".ed[3154:3319]" 1677 1678 0 1678 658 0 1677 1679 0 1679 1680 0 1680 1678 0
		 1679 1681 0 1681 1682 0 1682 1680 0 1681 659 0 660 1682 0 661 1683 0 1683 1454 0
		 1630 1683 0 1635 1684 0 1684 1683 0 1684 1456 0 1636 1685 0 1685 1684 0 1641 1686 0
		 1686 1685 0 1642 1687 0 1687 1686 0 1642 1688 0 1688 1689 0 1689 1687 0 1690 1691 0
		 1691 1692 0 1692 1450 0 1450 1690 0 1693 662 0 663 1691 0 1691 1693 0 664 1692 0
		 665 1694 0 1694 1632 0 1527 1694 0 1528 1695 0 1695 1694 0 1695 1633 0 1695 1696 0
		 1696 1638 0 1529 1696 0 1530 1697 0 1697 1696 0 1697 1639 0 1698 1639 0 1697 1699 0
		 1699 1698 0 1531 1699 0 1700 1701 0 1701 1702 0 1702 1703 0 1703 1700 0 1704 1532 0
		 1533 1705 0 1705 1704 0 666 1705 0 1706 2105 0 1707 1706 0 1708 1707 0 1709 1708 0
		 1571 1710 0 1710 1711 0 1711 1572 0 1712 1709 0 1713 1712 0 1714 1715 0 1715 1716 0
		 1716 1717 0 1717 1714 0 1718 1713 0 1719 1718 0 1706 1719 0 1720 1721 0 1721 1722 0
		 1722 1723 0 1723 1720 0 1692 1448 0 1447 1450 0 1724 1720 0 1723 1725 0 1725 1724 0
		 667 1726 0 1726 1449 0 1688 2182 0 1727 1728 0 1728 2181 0 1649 2176 0 1729 1730 0
		 1730 2175 0 1691 2178 0 1731 1732 0 1732 2177 0 1690 2179 0 1733 1731 0 1734 1735 0
		 1735 1736 0 1736 1737 0 1737 1734 0 1738 1739 0 1739 1740 0 1740 1741 0 1741 1738 0
		 1736 1742 0 1742 1743 0 1743 1737 0 1744 1690 0 1453 1744 0 1744 2180 0 1745 1733 0
		 1644 1746 0 1746 1688 0 1746 2183 0 1747 1727 0 1650 1748 0 1748 1648 0 1749 2184 0
		 1730 1749 0 1649 1693 0 1732 1729 0 1450 1721 0 1720 1451 0 1447 1722 0 1446 1723 0
		 1726 1451 0 1724 1726 0 1449 1725 0 1452 1686 0 1687 1453 0 1689 1744 0 1728 1745 0
		 1750 1751 0 1751 1752 0 1752 1753 0 1753 1750 0 1753 1740 0 1739 1750 0 1754 1755 0
		 1755 1735 0 1734 1754 0 1754 1756 0 1756 1757 0 1757 1755 0 1756 668 0 669 1752 0
		 1758 1759 0 1759 1760 0 1760 1761 0 1761 1758 0 1759 1762 0 1762 1763 0 1763 1760 0
		 1764 1765 0 1765 1766 0 1766 1767 0 1767 1764 0 1699 1768 0 1768 1701 0 1701 1698 0
		 1762 1766 0 1765 1763 0 1769 1770 0 1770 1704 0 1705 1769 0 670 1769 0 1746 1748 0;
	setAttr ".ed[3320:3485]" 1749 1747 0 1644 1648 0 1643 1645 0 1532 1771 0 1771 1772 0
		 1772 1531 0 1773 1774 0 1774 1761 0 1760 1773 0 1704 1775 0 1775 1771 0 1776 1773 0
		 1763 1776 0 1772 1758 0 1758 1699 0 1774 1777 0 1777 1768 0 1768 1761 0 1770 1767 0
		 1766 1778 0 1778 1770 0 1764 1700 0 1700 1779 0 1779 1765 0 1778 1775 0 1779 1776 0
		 1762 1775 0 1759 1771 0 1679 671 0 1767 1645 0 1643 1780 0 1780 1767 0 1770 1646 0
		 1769 1652 0 1781 1782 0 1782 1783 0 1783 1784 0 1784 1781 0 1785 1786 0 1786 1787 0
		 1787 1788 0 1788 1785 0 1789 1790 0 1790 1791 0 1791 1792 0 1792 1789 0 1793 1794 0
		 1794 1795 0 1795 1796 0 1796 1793 0 1625 2134 0 1981 1969 0 1503 2065 0 1603 2060 0
		 1603 2039 0 1501 2062 0 1492 2063 0 1491 2064 0 1703 1776 0 1777 1702 0 1698 1780 0
		 1780 1640 0 1698 1764 0 1703 1774 0 1798 1799 0 1799 1800 0 1800 1801 0 1801 1798 0
		 1576 1802 0 1802 1803 0 1803 1804 0 1804 1576 0 1461 1805 0 1805 1806 0 1806 1462 0
		 1807 1808 0 1808 1799 0 1798 1807 0 1809 1810 0 1810 1811 0 1811 1812 0 1812 1809 0
		 1472 1813 0 1813 1814 0 1814 1473 0 1803 1815 0 1815 1816 0 1816 1804 0 1817 1818 0
		 1818 1810 0 1809 1817 0 1741 1743 0 1742 1738 0 1543 2048 0 2078 2047 0 1551 2046 0
		 1553 2045 0 1547 1545 0 1541 1540 0 1602 2069 0 1601 2070 0 1598 2071 0 1597 2074 0
		 1592 2072 0 1593 1626 0 1627 1605 0 1605 1593 0 1590 1621 0 1589 1620 0 1596 1615 0
		 1595 1614 0 1600 1606 0 1599 1607 0 1533 2147 0 1532 2146 0 1531 2145 0 1530 2144 0
		 1529 2143 0 1528 2142 0 1527 2141 0 672 1819 0 1819 1653 0 1819 1820 0 1820 1655 0
		 1820 1535 0 1535 1657 0 1535 673 0 1820 1538 0 1819 1539 0 1669 1821 0 1821 674 0
		 1667 1822 0 1822 1821 0 1665 1823 0 1823 1822 0 675 1823 0 1821 1824 0 1824 676 0
		 1822 1825 0 1825 1824 0 1823 1826 0 1826 1825 0 677 1826 0 1824 1827 0 1827 678 0
		 1825 1828 0 1828 1827 0 1826 1829 0 1829 1828 0 679 1829 0 1827 1682 0 1828 1680 0
		 1829 1678 0 1534 680 0 1575 1830 0 1830 1831 0 1831 1576 0 1831 1832 0 1832 1802 0
		 1832 1800 0 1799 1833 0 1833 1832 0 1806 1830 0 1575 1462 0 1808 1805 0 1805 1833 0;
	setAttr ".ed[3486:3651]" 1834 1577 0 1580 1835 0 1835 1834 0 1833 1579 0 1578 1832 0
		 1834 1832 0 1582 1814 0 1814 1835 0 1581 1805 0 1805 1814 0 1814 1583 0 1586 1835 0
		 1836 1585 0 1584 1813 0 1813 1836 0 1588 1834 0 1587 1837 0 1837 1834 0 1836 1837 0
		 1838 1839 0 1839 1840 0 1840 1841 0 1841 1838 0 1472 1841 0 1840 1813 0 1813 1811 0
		 1810 1836 0 1816 1842 0 1842 1839 0 1838 1816 0 1818 1837 0 1837 1842 0 1815 1837 0
		 1716 1560 0 1559 1717 0 1710 1715 0 1714 1711 0 1841 1843 0 1843 1555 0 1555 1838 0
		 1461 1473 0 1464 1474 0 1465 1467 0 1470 1466 0 1471 1843 0 1468 1843 0 1471 1469 0
		 1470 1474 0 1567 1465 0 1463 1573 0 1565 1467 0 1556 1468 0 1558 1816 0 1831 1801 0
		 1830 1798 0 1806 1807 0 1840 1812 0 1839 1809 0 1842 1817 0 1803 1834 0 1844 1845 0
		 1845 1846 0 1846 1847 0 1847 1844 0 1848 1849 0 1849 1845 0 1844 1848 0 1850 1851 0
		 1851 1849 0 1848 1850 0 1852 1853 0 1853 1851 0 1850 1852 0 1854 1855 0 1855 1853 0
		 1852 1854 0 1856 1857 0 1857 1855 0 1854 1856 0 1858 1859 0 1859 1857 0 1856 1858 0
		 1846 1859 0 1858 1847 0 1560 1860 0 1860 1861 0 1861 1561 0 1716 1862 0 1862 1860 0
		 1715 1863 0 1863 1862 0 1710 1864 0 1864 1863 0 1571 1865 0 1865 1864 0 1569 1866 0
		 1866 1865 0 1563 1867 0 1867 1866 0 1861 1867 0 1868 1869 0 1869 1870 0 1870 1871 0
		 1871 1868 0 1870 1872 0 1872 1873 0 1873 1871 0 1874 1875 0 1875 1876 0 1876 1877 0
		 1877 1874 0 1878 1879 0 1879 1880 0 1880 1881 0 1881 1878 0 1882 1883 0 1883 1786 0
		 1786 1783 0 1783 1882 0 1883 1884 0 1884 1787 0 1884 1885 0 1885 1790 0 1790 1787 0
		 1885 1886 0 1886 1791 0 1887 1794 0 1794 1791 0 1886 1887 0 1888 1889 0 1889 1890 0
		 1890 1891 0 1891 1888 0 1890 1892 0 1892 1893 0 1893 1891 0 1894 1895 0 1895 1896 0
		 1896 1897 0 1897 1894 0 1896 1898 0 1898 1899 0 1899 1897 0 1900 1901 0 1901 1902 0
		 1902 1903 0 1903 1900 0 1794 1904 0 1904 1905 0 1905 1795 0 1868 1906 0 1906 1907 0
		 1907 1869 0 1908 1909 0 1909 1901 0 1900 1908 0 1910 1911 0 1911 1912 0 1912 1913 0
		 1913 1910 0 1879 1914 0 1914 1915 0 1915 1880 0 1905 1916 0 1916 1782 0 1782 1795 0;
	setAttr ".ed[3652:3817]" 1917 1918 0 1918 1911 0 1910 1917 0 1887 1919 0 1919 1920 0
		 1920 1794 0 1920 1921 0 1921 1904 0 1921 1902 0 1901 1922 0 1922 1921 0 1907 1919 0
		 1887 1869 0 1909 1906 0 1906 1922 0 1923 1888 0 1891 1924 0 1924 1923 0 1922 1890 0
		 1889 1921 0 1923 1921 0 1893 1915 0 1915 1924 0 1892 1906 0 1906 1915 0 1915 1894 0
		 1897 1924 0 1925 1896 0 1895 1914 0 1914 1925 0 1899 1923 0 1898 1926 0 1926 1923 0
		 1925 1926 0 1927 1928 0 1928 1929 0 1929 1930 0 1930 1927 0 1879 1930 0 1929 1914 0
		 1914 1912 0 1911 1925 0 1782 1931 0 1931 1928 0 1927 1782 0 1918 1926 0 1926 1931 0
		 1916 1926 0 1930 1932 0 1932 1882 0 1882 1927 0 1868 1880 0 1871 1881 0 1872 1874 0
		 1877 1873 0 1878 1932 0 1875 1932 0 1878 1876 0 1877 1881 0 1885 1872 0 1870 1886 0
		 1884 1874 0 1883 1875 0 1920 1903 0 1919 1900 0 1907 1908 0 1929 1913 0 1928 1910 0
		 1931 1917 0 1905 1923 0 1785 1784 0 1781 1796 0 1793 1792 0 1789 1788 0 1933 1934 0
		 1934 1784 0 1785 1933 0 1788 1935 0 1935 1933 0 1936 1935 0 1789 1936 0 1792 1937 0
		 1937 1936 0 1938 1937 0 1793 1938 0 1796 1939 0 1939 1938 0 1940 1939 0 1781 1940 0
		 1934 1940 0 1941 1942 0 1942 1997 0 1942 1943 0 1943 1996 0 1943 1944 0 1944 1995 0
		 1944 1945 0 1945 1994 0 1945 1946 0 1946 1993 0 1946 1947 0 1947 1992 0 1947 1948 0
		 1948 1991 0 1948 1941 0 1941 1999 0 1933 2000 0 1935 2001 0 1936 2002 0 1937 2003 0
		 1938 2004 0 1939 2005 0 1940 2006 0 2104 2091 0 1847 2090 0 1858 2097 0 1856 2096 0
		 1854 2095 0 1852 2094 0 1850 2093 0 1848 2092 0 1845 1559 0 1562 1846 0 1564 1859 0
		 1570 1857 0 1572 1855 0 1711 1853 0 1714 1851 0 1717 1849 0 1629 1990 0 1949 1719 0
		 1706 1950 0 1950 1949 0 1707 1951 0 1951 1950 0 1708 1952 0 1952 1951 0 1709 1953 0
		 1953 1952 0 1712 1954 0 1954 1953 0 1713 1955 0 1955 1954 0 1718 1956 0 1956 1955 0
		 1949 1956 0 1727 1957 0 1957 1958 0 1958 1728 0 1729 1959 0 1959 1960 0 1960 1730 0
		 1731 1961 0 1961 1962 0 1962 1732 0 1733 1963 0 1963 1961 0 1745 1964 0 1964 1963 0
		 1747 1965 0 1965 1957 0 1749 1966 0 1966 1965 0 1962 1959 0 1958 1964 0 1960 1966 0;
	setAttr ".ed[3818:3983]" 1756 1726 0 1754 1451 0 1734 1452 0 1737 1686 0 1743 1685 0
		 1741 1684 0 1740 1456 0 1753 1457 0 1752 1455 0 1864 1576 0 1804 1863 0 1865 1574 0
		 1866 1568 0 1867 1566 0 1861 1557 0 1860 1558 0 1862 1816 0 1543 2021 0 1949 2020 0
		 1542 2022 0 1541 2023 0 1548 2024 0 1547 2025 0 1552 2026 0 1551 2027 0 1968 2133 0
		 1967 1968 0 1969 2140 0 1968 1969 0 1970 2139 0 1969 1970 0 1971 2138 0 1970 1971 0
		 1972 2137 0 1971 1972 0 1973 2136 0 1972 1973 0 1974 2135 0 1973 1974 0 1974 1967 0
		 1975 1967 0 1976 1974 0 1975 1976 0 1977 1973 0 1976 1977 0 1978 1972 0 1977 1978 0
		 1979 1971 0 1978 1979 0 1980 1970 0 1979 1980 0 1981 1610 0 1980 1981 0 1982 1968 0
		 1981 1982 0 1982 1975 0 1983 1624 0 1984 1623 0 1983 1984 0 1985 1618 0 1984 1985 0
		 1986 1617 0 1985 1986 0 1987 1612 0 1986 1987 0 1988 1611 0 1987 1988 0 1989 1610 0
		 1988 1989 0 1990 1998 0 1989 1990 0 1990 1983 0 1991 1983 0 1992 1984 0 1991 1992 0
		 1993 1985 0 1992 1993 0 1994 1986 0 1993 1994 0 1995 1987 0 1994 1995 0 1996 1988 0
		 1995 1996 0 1997 1989 0 1996 1997 0 1998 1941 0 1997 1998 0 1998 1991 0 1999 1934 0
		 2000 1942 0 1999 2000 0 2001 1943 0 2000 2001 0 2002 1944 0 2001 2002 0 2003 1945 0
		 2002 2003 0 2004 1946 0 2003 2004 0 2005 1947 0 2004 2005 0 2006 1948 0 2005 2006 0
		 2006 1999 0 1477 1478 0 2007 1476 0 1477 2007 0 2007 681 0 1540 2008 0 2009 1475 0
		 2008 2009 0 2009 682 0 1540 2079 0 2010 2011 0 1549 2011 0 2012 2049 0 2013 1523 0
		 2014 1524 0 2013 2014 0 2015 1525 0 2014 2015 0 2015 2051 0 2016 1460 0 2017 1482 0
		 2016 2017 0 2018 1481 0 2017 2018 0 2018 683 0 2019 2107 0 2019 2050 0 2020 1554 0
		 2021 1956 0 2020 2021 0 2022 1955 0 2021 2022 0 2023 1954 0 2022 2023 0 2024 1953 0
		 2023 2024 0 2025 1952 0 2024 2025 0 2026 1951 0 2025 2026 0 2027 1950 0 2026 2027 0
		 2027 2020 0 2028 2010 0 2029 1517 0 684 2029 0 2030 1514 0 2029 2030 0 2031 1513 0
		 2030 2031 0 2032 1510 0 2031 2040 0 1797 2057 0 1553 2111 0 2033 2019 0 2014 2106 0
		 2034 2012 0 2033 2034 0 1460 1480 0 2028 1458 0 2035 1535 0 685 2035 0 2036 1537 0;
	setAttr ".ed[3984:4149]" 2035 2036 0 2037 1499 0 2036 2037 0 2038 1497 0 2037 2038 0
		 2039 1501 0 2038 2053 0 2040 2032 0 2039 2061 0 2041 1513 0 2040 2041 0 2042 1512 0
		 2041 2042 0 2043 1485 0 2042 2086 0 2044 2016 0 2043 2044 0 2045 1554 0 2046 1549 0
		 2045 2046 0 1550 1552 0 1546 1548 0 2047 1542 0 1540 2047 0 2048 1544 0 2047 2048 0
		 2048 2045 0 2049 686 0 2050 630 0 2049 2050 0 2051 687 0 2050 2108 0 2051 1526 0
		 2052 1603 0 1594 2067 0 2053 2039 0 2052 2053 0 2054 1500 0 2053 2054 0 2055 1493 0
		 2054 2055 0 2056 1491 0 2055 2056 0 2056 688 0 1591 2066 0 1592 1797 0 2057 1509 0
		 2032 2057 0 2058 1506 0 2057 2058 0 2059 1505 0 2058 2059 0 2059 689 0 2060 2032 0
		 1797 2060 0 2061 2040 0 2060 2061 0 2062 2031 0 2061 2062 0 2063 2030 0 2062 2063 0
		 2064 2029 0 2063 2064 0 2064 690 0 2065 1797 0 2058 2065 0 2059 1503 0 2066 1603 0
		 1797 2066 0 2067 2052 0 2066 2067 0 2068 1497 0 2067 2068 0 2069 1498 0 2068 2069 0
		 2070 1537 0 2069 2070 0 2071 1534 0 2070 2071 0 1502 1534 0 2065 2072 0 2073 1503 0
		 2072 2073 0 2073 691 0 2074 1502 0 2071 2074 0 2074 2072 0 1550 2075 0 2075 2010 0
		 1549 2075 0 2075 2077 0 2046 1550 0 2076 1460 0 2010 2076 0 2077 2080 0 2076 2077 0
		 1544 2078 0 2078 2079 0 2079 1479 0 2076 2044 0 1545 1477 0 1545 2081 0 1545 2077 0
		 2080 2085 0 2044 2080 0 2080 2081 0 2082 1486 0 2081 2082 0 2083 2007 0 2082 2083 0
		 2083 692 0 2084 2081 0 1486 2084 0 2085 1484 0 2084 2085 0 2085 2043 0 2086 2043 0
		 1484 2086 0 2087 1485 0 2086 2087 0 2088 1482 0 2087 2088 0 2089 1483 0 2088 2089 0
		 2089 693 0 2091 1844 0 2090 2091 0 2092 2103 0 2091 2092 0 2093 2102 0 2092 2093 0
		 2094 2101 0 2093 2094 0 2095 2100 0 2094 2095 0 2096 2099 0 2095 2096 0 2097 2098 0
		 2096 2097 0 2097 2090 0 2098 1707 0 2099 1708 0 2098 2099 0 2100 1709 0 2099 2100 0
		 2101 1712 0 2100 2101 0 2102 1713 0 2101 2102 0 2103 1718 0 2102 2103 0 2104 1719 0
		 2103 2104 0 2105 2090 0 2104 2105 0 2105 2098 0 2034 2028 0 2012 1458 0 2049 1459 0
		 2106 2033 0 2107 2015 0 2106 2107 0 2108 2051 0 2107 2108 0 2108 694 0 2109 2033 0;
	setAttr ".ed[4150:4315]" 2110 2106 0 2109 2110 0 2110 2013 0 2111 2114 0 2011 2111 0
		 2112 2013 0 1522 2112 0 2113 2110 0 2112 2113 0 2114 2109 0 2113 2114 0 2115 2034 0
		 2010 2115 0 2115 2109 0 2111 2115 0 2114 1544 0 2113 2078 0 2112 2079 0 1522 1479 0
		 2009 2116 0 1476 2117 0 2117 2116 0 1478 2118 0 2008 2119 0 2118 2119 0 2119 2116 0
		 2118 2117 0 1540 2120 0 2120 2119 0 1546 2121 0 2121 2118 0 2121 2120 0 1548 2122 0
		 2121 2122 0 1541 2123 0 2123 2122 0 2123 2120 0 2116 695 0 2117 696 0 2024 2123 0
		 2079 2124 0 2124 1520 0 2008 2124 0 1475 2124 0 2125 1594 0 2126 1591 0 2125 2126 1
		 2127 1589 0 2126 2127 1 2128 1597 0 2127 2128 1 2129 1595 0 2128 2129 1 2130 1601 0
		 2129 2130 1 2131 1599 0 2130 2131 1 2132 1605 0 2131 2132 1 2132 2125 1 2133 1628 0
		 2134 1967 0 2133 2134 1 2135 1622 0 2134 2135 1 2136 1619 0 2135 2136 1 2137 1616 0
		 2136 2137 1 2138 1613 0 2137 2138 1 2139 1609 0 2138 2139 1 2140 1608 0 2139 2140 1
		 2140 2133 1 2141 2148 0 1392 2141 1 2142 2149 0 2141 2142 1 2143 2150 0 2142 2143 1
		 2144 2151 0 2143 2144 1 2145 2152 0 2144 2145 1 2146 2153 0 2145 2146 1 2147 2154 0
		 2146 2147 1 2147 1400 1 2148 2155 0 1401 2148 1 2149 2156 0 2148 2149 1 2150 2157 0
		 2149 2150 1 2151 2158 0 2150 2151 1 2152 2159 0 2151 2152 1 2153 2160 0 2152 2153 1
		 2154 2161 0 2153 2154 1 2154 1409 1 1410 2155 1 2155 2156 1 2156 2157 1 2157 2158 1
		 2158 2159 1 2159 2160 1 2160 2161 1 2161 1418 1 2155 1518 0 2156 1521 0 2157 1522 0
		 2158 1523 0 2159 1524 0 2160 1525 0 2161 1526 0 1757 1419 0 1751 1420 0 1735 2162 1
		 1736 2163 1 2162 2163 0 1738 2164 1 1739 2165 1 2164 2165 0 1742 2166 0 2163 2166 0
		 1750 2167 1 1751 2168 1 2167 2168 0 2165 2167 0 1755 2169 1 2169 2162 0 1757 2170 1
		 2170 2169 0 2166 2164 0 2170 1430 0 2168 1431 0 1724 2171 0 1720 2172 0 2171 2172 0
		 1723 2173 0 2173 2172 0 1725 2174 0 2173 2174 0 2174 2171 0 2175 1650 0 2176 1729 0
		 2175 2176 1 2177 1693 0 2176 2177 1 2178 1731 0 2177 2178 1 2179 1733 0 2178 2179 0
		 2180 1745 0 2179 2180 1 2181 1689 0 2180 2181 1 2182 1727 0 2181 2182 1 2183 1747 0;
	setAttr ".ed[4316:4319]" 2182 2183 1 2184 1748 0 2183 2184 1 2184 2175 1;
	setAttr -s 2166 -ch 8600 ".fc";
	setAttr ".fc[0:499]" -type "polyFaces" 
		f 4 0 1 2 3
		mu 0 4 0 1 2 3
		f 4 -3 4 5 6
		mu 0 4 4 5 6 7
		f 4 -6 7 8 9
		mu 0 4 8 9 10 11
		f 4 -9 10 11 12
		mu 0 4 11 10 12 13
		f 4 -12 13 14 15
		mu 0 4 14 15 16 17
		f 4 -15 16 17 18
		mu 0 4 18 19 20 21
		f 4 -18 19 20 21
		mu 0 4 22 23 24 25
		f 4 -21 22 -1 23
		mu 0 4 25 24 26 27
		f 4 24 25 26 -2
		mu 0 4 1 28 29 2
		f 4 -27 27 28 -5
		mu 0 4 5 30 31 6
		f 4 -29 29 30 -8
		mu 0 4 9 32 33 10
		f 4 -31 31 32 -11
		mu 0 4 10 33 34 12
		f 4 -33 33 34 -14
		mu 0 4 15 35 36 16
		f 4 -35 35 36 -17
		mu 0 4 19 37 38 20
		f 4 -37 37 38 -20
		mu 0 4 39 40 41 42
		f 4 -39 39 -25 -23
		mu 0 4 42 41 43 44
		f 4 40 41 42 -26
		mu 0 4 28 45 46 29
		f 4 -43 43 44 -28
		mu 0 4 30 47 48 31
		f 4 -45 45 46 -30
		mu 0 4 32 49 50 33
		f 4 -47 47 48 -32
		mu 0 4 33 50 51 34
		f 4 -49 49 50 -34
		mu 0 4 35 52 53 36
		f 4 -51 51 52 -36
		mu 0 4 37 54 55 38
		f 4 -53 53 54 -38
		mu 0 4 40 56 57 41
		f 4 -55 55 -41 -40
		mu 0 4 41 57 58 43
		f 8 -4 -7 -10 -13 -16 -19 -22 -24
		mu 0 8 59 60 61 62 63 64 65 66
		f 3 56 57 -42
		mu 0 3 45 67 46
		f 3 -58 58 -44
		mu 0 3 68 69 70
		f 3 -59 59 -46
		mu 0 3 70 69 71
		f 3 -60 60 -48
		mu 0 3 72 73 74
		f 3 -61 61 -50
		mu 0 3 74 73 75
		f 3 -62 62 -52
		mu 0 3 54 76 55
		f 3 -63 63 -54
		mu 0 3 56 77 57
		f 3 -64 -57 -56
		mu 0 3 57 77 58
		f 4 64 65 66 67
		mu 0 4 78 79 80 81
		f 4 -67 68 69 70
		mu 0 4 82 83 84 85
		f 4 -70 71 72 73
		mu 0 4 86 87 88 89
		f 4 -73 74 75 76
		mu 0 4 89 88 90 91
		f 4 -76 77 78 79
		mu 0 4 92 93 94 95
		f 4 -79 80 81 82
		mu 0 4 96 97 98 99
		f 4 -82 83 84 85
		mu 0 4 100 101 102 103
		f 4 -85 86 -65 87
		mu 0 4 103 102 104 105
		f 4 88 89 90 91
		mu 0 4 106 107 108 109
		f 4 -91 92 93 94
		mu 0 4 110 111 112 113
		f 4 -94 95 96 97
		mu 0 4 114 115 116 117
		f 4 -97 98 99 100
		mu 0 4 117 116 118 119
		f 4 -100 101 102 103
		mu 0 4 120 121 122 123
		f 4 -103 104 105 106
		mu 0 4 124 125 126 127
		f 4 -106 107 108 109
		mu 0 4 128 129 130 131
		f 4 -109 110 -89 111
		mu 0 4 131 130 132 133
		f 4 112 113 114 -90
		mu 0 4 107 134 135 108
		f 4 -115 115 116 -93
		mu 0 4 111 136 137 112
		f 4 -117 117 118 -96
		mu 0 4 115 138 139 116
		f 4 -119 119 120 -99
		mu 0 4 116 139 140 118
		f 4 -121 121 122 -102
		mu 0 4 121 141 142 122
		f 4 -123 123 124 -105
		mu 0 4 125 143 144 126
		f 4 -125 125 126 -108
		mu 0 4 129 145 146 130
		f 4 -127 127 -113 -111
		mu 0 4 130 146 147 132
		f 8 -68 -71 -74 -77 -80 -83 -86 -88
		mu 0 8 148 149 150 151 152 153 154 155
		f 3 128 129 -114
		mu 0 3 134 156 135
		f 3 -130 130 -116
		mu 0 3 157 158 159
		f 3 -131 131 -118
		mu 0 3 159 158 160
		f 3 -132 132 -120
		mu 0 3 161 162 163
		f 3 -133 133 -122
		mu 0 3 163 162 164
		f 3 -134 134 -124
		mu 0 3 143 165 144
		f 3 -135 135 -126
		mu 0 3 145 166 146
		f 3 -136 -129 -128
		mu 0 3 146 166 147
		f 4 136 -101 137 -75
		mu 0 4 88 117 119 90
		f 4 138 -98 -137 -72
		mu 0 4 87 114 117 88
		f 4 139 -95 -139 -69
		mu 0 4 83 110 113 84
		f 4 140 -92 -140 -66
		mu 0 4 79 106 109 80
		f 4 141 -112 -141 -87
		mu 0 4 102 167 168 104
		f 4 142 -110 -142 -84
		mu 0 4 101 169 167 102
		f 4 143 -107 -143 -81
		mu 0 4 97 124 127 98
		f 4 -138 -104 -144 -78
		mu 0 4 93 120 123 94
		f 4 144 145 146 147
		mu 0 4 170 171 172 173
		f 4 -147 148 149 150
		mu 0 4 174 175 176 177
		f 4 -150 151 152 153
		mu 0 4 178 179 180 181
		f 4 -153 154 155 156
		mu 0 4 181 180 182 183
		f 4 -156 157 158 159
		mu 0 4 184 185 186 187
		f 4 -159 160 161 162
		mu 0 4 188 189 190 191
		f 4 -162 163 164 165
		mu 0 4 192 193 194 195
		f 4 -165 166 -145 167
		mu 0 4 195 194 196 197
		f 4 168 169 170 171
		mu 0 4 198 199 200 201
		f 4 -171 172 173 174
		mu 0 4 202 203 204 205
		f 4 -174 175 176 177
		mu 0 4 206 207 208 209
		f 4 -177 178 179 180
		mu 0 4 209 208 210 211
		f 4 -180 181 182 183
		mu 0 4 212 213 214 215
		f 4 -183 184 185 186
		mu 0 4 216 217 218 219
		f 4 -186 187 188 189
		mu 0 4 220 221 222 223
		f 4 -189 190 -169 191
		mu 0 4 223 222 224 225
		f 4 192 193 194 -170
		mu 0 4 199 226 227 200
		f 4 -195 195 196 -173
		mu 0 4 203 228 229 204
		f 4 -197 197 198 -176
		mu 0 4 207 230 231 208
		f 4 -199 199 200 -179
		mu 0 4 208 231 232 210
		f 4 -201 201 202 -182
		mu 0 4 213 233 234 214
		f 4 -203 203 204 -185
		mu 0 4 217 235 236 218
		f 4 -205 205 206 -188
		mu 0 4 221 237 238 222
		f 4 -207 207 -193 -191
		mu 0 4 222 238 239 224
		f 8 -148 -151 -154 -157 -160 -163 -166 -168
		mu 0 8 240 241 242 243 244 245 246 247
		f 3 208 209 -194
		mu 0 3 226 248 227
		f 3 -210 210 -196
		mu 0 3 249 250 251
		f 3 -211 211 -198
		mu 0 3 251 250 252
		f 3 -212 212 -200
		mu 0 3 253 254 255
		f 3 -213 213 -202
		mu 0 3 255 254 256
		f 3 -214 214 -204
		mu 0 3 235 257 236
		f 3 -215 215 -206
		mu 0 3 237 258 238
		f 3 -216 -209 -208
		mu 0 3 238 258 239
		f 4 216 -181 217 -155
		mu 0 4 180 209 211 182
		f 4 218 -178 -217 -152
		mu 0 4 179 206 209 180
		f 4 219 -175 -219 -149
		mu 0 4 175 202 205 176
		f 4 220 -172 -220 -146
		mu 0 4 171 198 201 172
		f 4 221 -192 -221 -167
		mu 0 4 194 259 260 196
		f 4 222 -190 -222 -164
		mu 0 4 193 261 259 194
		f 4 223 -187 -223 -161
		mu 0 4 189 216 219 190
		f 4 -218 -184 -224 -158
		mu 0 4 185 212 215 186
		f 4 224 225 226 227
		mu 0 4 262 263 264 265
		f 4 -227 228 229 230
		mu 0 4 266 267 268 269
		f 4 -230 231 232 233
		mu 0 4 270 271 272 273
		f 4 -233 234 235 236
		mu 0 4 273 272 274 275
		f 4 -236 237 238 239
		mu 0 4 276 277 278 279
		f 4 -239 240 241 242
		mu 0 4 280 281 282 283
		f 4 -242 243 244 245
		mu 0 4 284 285 286 287
		f 4 -245 246 -225 247
		mu 0 4 287 286 288 289
		f 4 248 249 250 -226
		mu 0 4 263 290 291 264
		f 4 -251 251 252 -229
		mu 0 4 267 292 293 268
		f 4 -253 253 254 -232
		mu 0 4 271 294 295 272
		f 4 -255 255 256 -235
		mu 0 4 272 295 296 274
		f 4 -257 257 258 -238
		mu 0 4 277 297 298 278
		f 4 -259 259 260 -241
		mu 0 4 281 299 300 282
		f 4 -261 261 262 -244
		mu 0 4 285 301 302 286
		f 4 -263 263 -249 -247
		mu 0 4 286 302 303 288
		f 4 264 265 266 -250
		mu 0 4 290 304 305 291
		f 4 -267 267 268 -252
		mu 0 4 292 306 307 293
		f 4 -269 269 270 -254
		mu 0 4 294 308 309 295
		f 4 -271 271 272 -256
		mu 0 4 295 309 310 296
		f 4 -273 273 274 -258
		mu 0 4 297 311 312 298
		f 4 -275 275 276 -260
		mu 0 4 299 313 314 300
		f 4 -277 277 278 -262
		mu 0 4 315 316 317 318
		f 4 -279 279 -265 -264
		mu 0 4 318 317 319 320
		f 8 -228 -231 -234 -237 -240 -243 -246 -248
		mu 0 8 321 322 323 324 325 326 327 328
		f 3 280 281 -266
		mu 0 3 304 329 305
		f 3 -282 282 -268
		mu 0 3 330 331 332
		f 3 -283 283 -270
		mu 0 3 308 333 309
		f 3 -284 284 -272
		mu 0 3 309 333 310
		f 3 -285 285 -274
		mu 0 3 334 335 336
		f 3 -286 286 -276
		mu 0 3 313 337 314
		f 3 -287 287 -278
		mu 0 3 316 338 317
		f 3 -288 -281 -280
		mu 0 3 317 338 319
		f 4 288 289 290 291
		mu 0 4 339 340 341 342
		f 4 -291 292 293 294
		mu 0 4 343 344 345 346
		f 4 -294 295 296 297
		mu 0 4 347 348 349 350
		f 4 -297 298 299 300
		mu 0 4 350 349 351 352
		f 4 -300 301 302 303
		mu 0 4 353 354 355 356
		f 4 -303 304 305 306
		mu 0 4 357 358 359 360
		f 4 -306 307 308 309
		mu 0 4 361 362 363 364
		f 4 -309 310 -289 311
		mu 0 4 364 363 365 366
		f 4 312 313 314 315
		mu 0 4 367 368 369 370
		f 4 -315 316 317 318
		mu 0 4 371 372 373 374
		f 4 -318 319 320 321
		mu 0 4 375 376 377 378
		f 4 -321 322 323 324
		mu 0 4 378 377 379 380
		f 4 -324 325 326 327
		mu 0 4 381 382 383 384
		f 4 -327 328 329 330
		mu 0 4 385 386 387 388
		f 4 -330 331 332 333
		mu 0 4 389 390 391 392
		f 4 -333 334 -313 335
		mu 0 4 392 391 393 394
		f 4 336 337 338 -314
		mu 0 4 368 395 396 369
		f 4 -339 339 340 -317
		mu 0 4 372 397 398 373
		f 4 -341 341 342 -320
		mu 0 4 376 399 400 377
		f 4 -343 343 344 -323
		mu 0 4 377 400 401 379
		f 4 -345 345 346 -326
		mu 0 4 382 402 403 383
		f 4 -347 347 348 -329
		mu 0 4 386 404 405 387
		f 4 -349 349 350 -332
		mu 0 4 390 406 407 391
		f 4 -351 351 -337 -335
		mu 0 4 391 407 408 393
		f 8 -292 -295 -298 -301 -304 -307 -310 -312
		mu 0 8 409 410 411 412 413 414 415 416
		f 3 352 353 -338
		mu 0 3 395 417 396
		f 3 -354 354 -340
		mu 0 3 418 419 420
		f 3 -355 355 -342
		mu 0 3 420 419 421
		f 3 -356 356 -344
		mu 0 3 422 423 424
		f 3 -357 357 -346
		mu 0 3 424 423 425
		f 3 -358 358 -348
		mu 0 3 404 426 405
		f 3 -359 359 -350
		mu 0 3 406 427 407
		f 3 -360 -353 -352
		mu 0 3 407 427 408
		f 4 360 -322 361 -296
		mu 0 4 348 375 378 349
		f 4 362 -319 -361 -293
		mu 0 4 344 371 374 345
		f 4 363 -316 -363 -290
		mu 0 4 340 367 370 341
		f 4 364 -336 -364 -311
		mu 0 4 363 428 429 365
		f 4 365 -334 -365 -308
		mu 0 4 362 430 428 363
		f 4 366 -331 -366 -305
		mu 0 4 358 385 388 359
		f 4 367 -328 -367 -302
		mu 0 4 354 381 384 355
		f 4 -362 -325 -368 -299
		mu 0 4 349 378 380 351
		f 4 368 369 370 371
		mu 0 4 431 432 433 434
		f 4 -371 372 373 374
		mu 0 4 435 436 437 438
		f 4 -374 375 376 377
		mu 0 4 439 440 441 442
		f 4 -377 378 379 380
		mu 0 4 442 441 443 444
		f 4 -380 381 382 383
		mu 0 4 445 446 447 448
		f 4 -383 384 385 386
		mu 0 4 449 450 451 452
		f 4 -386 387 388 389
		mu 0 4 453 454 455 456
		f 4 -389 390 -369 391
		mu 0 4 456 455 457 458
		f 4 392 393 394 395
		mu 0 4 459 460 461 462
		f 4 -395 396 397 398
		mu 0 4 463 464 465 466
		f 4 -398 399 400 401
		mu 0 4 467 468 469 470
		f 4 -401 402 403 404
		mu 0 4 470 469 471 472
		f 4 -404 405 406 407
		mu 0 4 473 474 475 476
		f 4 -407 408 409 410
		mu 0 4 477 478 479 480
		f 4 -410 411 412 413
		mu 0 4 481 482 483 484
		f 4 -413 414 -393 415
		mu 0 4 484 483 485 486
		f 4 416 417 418 -394
		mu 0 4 460 487 488 461
		f 4 -419 419 420 -397
		mu 0 4 464 489 490 465
		f 4 -421 421 422 -400
		mu 0 4 468 491 492 469
		f 4 -423 423 424 -403
		mu 0 4 469 492 493 471
		f 4 -425 425 426 -406
		mu 0 4 474 494 495 475
		f 4 -427 427 428 -409
		mu 0 4 478 496 497 479
		f 4 -429 429 430 -412
		mu 0 4 482 498 499 483
		f 4 -431 431 -417 -415
		mu 0 4 483 499 500 485
		f 8 -372 -375 -378 -381 -384 -387 -390 -392
		mu 0 8 501 502 503 504 505 506 507 508
		f 3 432 433 -418
		mu 0 3 487 509 488
		f 3 -434 434 -420
		mu 0 3 510 511 512
		f 3 -435 435 -422
		mu 0 3 512 511 513
		f 3 -436 436 -424
		mu 0 3 514 515 516
		f 3 -437 437 -426
		mu 0 3 516 515 517
		f 3 -438 438 -428
		mu 0 3 496 518 497
		f 3 -439 439 -430
		mu 0 3 498 519 499
		f 3 -440 -433 -432
		mu 0 3 499 519 500
		f 4 440 -402 441 -376
		mu 0 4 440 467 470 441
		f 4 442 -399 -441 -373
		mu 0 4 436 463 466 437
		f 4 443 -396 -443 -370
		mu 0 4 432 459 462 433
		f 4 444 -416 -444 -391
		mu 0 4 455 520 521 457
		f 4 445 -414 -445 -388
		mu 0 4 454 522 520 455
		f 4 446 -411 -446 -385
		mu 0 4 450 477 480 451
		f 4 447 -408 -447 -382
		mu 0 4 446 473 476 447
		f 4 -442 -405 -448 -379
		mu 0 4 441 470 472 443
		f 4 448 449 450 451
		mu 0 4 523 524 525 526
		f 4 -451 452 453 454
		mu 0 4 527 528 529 530
		f 4 -454 455 456 457
		mu 0 4 531 532 533 534
		f 4 -457 458 459 460
		mu 0 4 534 533 535 536
		f 4 -460 461 462 463
		mu 0 4 537 538 539 540
		f 4 -463 464 465 466
		mu 0 4 541 542 543 544
		f 4 -466 467 468 469
		mu 0 4 545 546 547 548
		f 4 -469 470 -449 471
		mu 0 4 548 547 549 550
		f 4 472 473 474 475
		mu 0 4 551 552 553 554
		f 4 -475 476 477 478
		mu 0 4 555 556 557 558
		f 4 -478 479 480 481
		mu 0 4 559 560 561 562
		f 4 -481 482 483 484
		mu 0 4 562 561 563 564
		f 4 -484 485 486 487
		mu 0 4 565 566 567 568
		f 4 -487 488 489 490
		mu 0 4 569 570 571 572
		f 4 -490 491 492 493
		mu 0 4 573 574 575 576
		f 4 -493 494 -473 495
		mu 0 4 576 575 577 578
		f 4 496 497 498 -474
		mu 0 4 552 579 580 553
		f 4 -499 499 500 -477
		mu 0 4 556 581 582 557
		f 4 -501 501 502 -480
		mu 0 4 560 583 584 561
		f 4 -503 503 504 -483
		mu 0 4 561 584 585 563
		f 4 -505 505 506 -486
		mu 0 4 566 586 587 567
		f 4 -507 507 508 -489
		mu 0 4 570 588 589 571
		f 4 -509 509 510 -492
		mu 0 4 574 590 591 575
		f 4 -511 511 -497 -495
		mu 0 4 575 591 592 577
		f 8 -452 -455 -458 -461 -464 -467 -470 -472
		mu 0 8 593 594 595 596 597 598 599 600
		f 3 512 513 -498
		mu 0 3 579 601 580
		f 3 -514 514 -500
		mu 0 3 602 603 604
		f 3 -515 515 -502
		mu 0 3 604 603 605
		f 3 -516 516 -504
		mu 0 3 606 607 608
		f 3 -517 517 -506
		mu 0 3 608 607 609
		f 3 -518 518 -508
		mu 0 3 588 610 589
		f 3 -519 519 -510
		mu 0 3 590 611 591
		f 3 -520 -513 -512
		mu 0 3 591 611 592
		f 4 520 -485 521 -459
		mu 0 4 533 562 564 535
		f 4 522 -482 -521 -456
		mu 0 4 532 559 562 533
		f 4 523 -479 -523 -453
		mu 0 4 528 555 558 529
		f 4 524 -476 -524 -450
		mu 0 4 524 551 554 525
		f 4 525 -496 -525 -471
		mu 0 4 547 612 613 549
		f 4 526 -494 -526 -468
		mu 0 4 546 614 612 547
		f 4 527 -491 -527 -465
		mu 0 4 542 569 572 543
		f 4 -522 -488 -528 -462
		mu 0 4 538 565 568 539
		f 4 528 529 530 531
		mu 0 4 615 616 617 618
		f 4 -531 532 533 534
		mu 0 4 619 620 621 622
		f 4 -534 535 536 537
		mu 0 4 623 624 625 626
		f 4 -537 538 539 540
		mu 0 4 626 625 627 628
		f 4 -540 541 542 543
		mu 0 4 629 630 631 632
		f 4 -543 544 545 546
		mu 0 4 633 634 635 636
		f 4 -546 547 548 549
		mu 0 4 637 638 639 640
		f 4 -549 550 -529 551
		mu 0 4 640 639 641 642
		f 4 552 553 554 -530
		mu 0 4 616 643 644 617
		f 4 -555 555 556 -533
		mu 0 4 620 645 646 621
		f 4 -557 557 558 -536
		mu 0 4 624 647 648 625
		f 4 -559 559 560 -539
		mu 0 4 625 648 649 627
		f 4 -561 561 562 -542
		mu 0 4 630 650 651 631
		f 4 -563 563 564 -545
		mu 0 4 634 652 653 635
		f 4 -565 565 566 -548
		mu 0 4 638 654 655 639
		f 4 -567 567 -553 -551
		mu 0 4 639 655 656 641
		f 4 568 569 570 -554
		mu 0 4 643 657 658 644
		f 4 -571 571 572 -556
		mu 0 4 645 659 660 646
		f 4 -573 573 574 -558
		mu 0 4 647 661 662 648
		f 4 -575 575 576 -560
		mu 0 4 648 662 663 649
		f 4 -577 577 578 -562
		mu 0 4 650 664 665 651
		f 4 -579 579 580 -564
		mu 0 4 652 666 667 653
		f 4 -581 581 582 -566
		mu 0 4 668 669 670 671
		f 4 -583 583 -569 -568
		mu 0 4 671 670 672 673
		f 8 -532 -535 -538 -541 -544 -547 -550 -552
		mu 0 8 674 675 676 677 678 679 680 681
		f 3 584 585 -570
		mu 0 3 657 682 658
		f 3 -586 586 -572
		mu 0 3 683 684 685
		f 3 -587 587 -574
		mu 0 3 661 686 662
		f 3 -588 588 -576
		mu 0 3 662 686 663
		f 3 -589 589 -578
		mu 0 3 687 688 689
		f 3 -590 590 -580
		mu 0 3 666 690 667
		f 3 -591 591 -582
		mu 0 3 669 691 670
		f 3 -592 -585 -584
		mu 0 3 670 691 672
		f 4 -596 -595 -594 -593
		mu 0 4 692 693 694 695
		f 4 -599 -598 -597 594
		mu 0 4 696 697 698 699
		f 4 -602 -601 -600 597
		mu 0 4 700 701 702 703
		f 4 -605 -604 -603 600
		mu 0 4 701 704 705 702
		f 4 -608 -607 -606 603
		mu 0 4 706 707 708 709
		f 4 -611 -610 -609 606
		mu 0 4 710 711 712 713
		f 4 -614 -613 -612 609
		mu 0 4 714 715 716 717
		f 4 -616 592 -615 612
		mu 0 4 715 718 719 716
		f 4 593 -619 -618 -617
		mu 0 4 695 694 720 721
		f 4 596 -621 -620 618
		mu 0 4 699 698 722 723
		f 4 599 -623 -622 620
		mu 0 4 703 702 724 725
		f 4 602 -625 -624 622
		mu 0 4 702 705 726 724
		f 4 605 -627 -626 624
		mu 0 4 709 708 727 728
		f 4 608 -629 -628 626
		mu 0 4 713 712 729 730
		f 4 611 -631 -630 628
		mu 0 4 731 732 733 734
		f 4 614 616 -632 630
		mu 0 4 732 735 736 733
		f 4 617 -635 -634 -633
		mu 0 4 721 720 737 738
		f 4 619 -637 -636 634
		mu 0 4 723 722 739 740
		f 4 621 -639 -638 636
		mu 0 4 725 724 741 742
		f 4 623 -641 -640 638
		mu 0 4 724 726 743 741
		f 4 625 -643 -642 640
		mu 0 4 728 727 744 745
		f 4 627 -645 -644 642
		mu 0 4 730 729 746 747
		f 4 629 -647 -646 644
		mu 0 4 734 733 748 749
		f 4 631 632 -648 646
		mu 0 4 733 736 750 748
		f 8 615 613 610 607 604 601 598 595
		mu 0 8 751 752 753 754 755 756 757 758
		f 3 633 -650 -649
		mu 0 3 738 737 759
		f 3 635 -651 649
		mu 0 3 760 761 762
		f 3 637 -652 650
		mu 0 3 761 763 762
		f 3 639 -653 651
		mu 0 3 764 765 766
		f 3 641 -654 652
		mu 0 3 765 767 766
		f 3 643 -655 653
		mu 0 3 747 746 768
		f 3 645 -656 654
		mu 0 3 749 748 769
		f 3 647 648 655
		mu 0 3 748 750 769
		f 4 -660 -659 -658 -657
		mu 0 4 770 771 772 773
		f 4 -663 -662 -661 658
		mu 0 4 774 775 776 777
		f 4 -666 -665 -664 661
		mu 0 4 778 779 780 781
		f 4 -669 -668 -667 664
		mu 0 4 779 782 783 780
		f 4 -672 -671 -670 667
		mu 0 4 784 785 786 787
		f 4 -675 -674 -673 670
		mu 0 4 788 789 790 791
		f 4 -678 -677 -676 673
		mu 0 4 792 793 794 795
		f 4 -680 656 -679 676
		mu 0 4 793 796 797 794
		f 4 -684 -683 -682 -681
		mu 0 4 798 799 800 801
		f 4 -687 -686 -685 682
		mu 0 4 802 803 804 805
		f 4 -690 -689 -688 685
		mu 0 4 806 807 808 809
		f 4 -693 -692 -691 688
		mu 0 4 807 810 811 808
		f 4 -696 -695 -694 691
		mu 0 4 812 813 814 815
		f 4 -699 -698 -697 694
		mu 0 4 816 817 818 819
		f 4 -702 -701 -700 697
		mu 0 4 820 821 822 823
		f 4 -704 680 -703 700
		mu 0 4 821 824 825 822
		f 4 681 -707 -706 -705
		mu 0 4 801 800 826 827
		f 4 684 -709 -708 706
		mu 0 4 805 804 828 829
		f 4 687 -711 -710 708
		mu 0 4 809 808 830 831
		f 4 690 -713 -712 710
		mu 0 4 808 811 832 830
		f 4 693 -715 -714 712
		mu 0 4 815 814 833 834
		f 4 696 -717 -716 714
		mu 0 4 819 818 835 836
		f 4 699 -719 -718 716
		mu 0 4 823 822 837 838
		f 4 702 704 -720 718
		mu 0 4 822 825 839 837
		f 8 679 677 674 671 668 665 662 659
		mu 0 8 840 841 842 843 844 845 846 847
		f 3 705 -722 -721
		mu 0 3 827 826 848
		f 3 707 -723 721
		mu 0 3 849 850 851
		f 3 709 -724 722
		mu 0 3 850 852 851
		f 3 711 -725 723
		mu 0 3 853 854 855
		f 3 713 -726 724
		mu 0 3 854 856 855
		f 3 715 -727 725
		mu 0 3 836 835 857
		f 3 717 -728 726
		mu 0 3 838 837 858
		f 3 719 720 727
		mu 0 3 837 839 858
		f 4 666 -730 692 -729
		mu 0 4 780 783 810 807
		f 4 663 728 689 -731
		mu 0 4 781 780 807 806
		f 4 660 730 686 -732
		mu 0 4 777 776 803 802
		f 4 657 731 683 -733
		mu 0 4 773 772 799 798
		f 4 678 732 703 -734
		mu 0 4 794 797 859 860
		f 4 675 733 701 -735
		mu 0 4 795 794 860 861
		f 4 672 734 698 -736
		mu 0 4 791 790 817 816
		f 4 669 735 695 729
		mu 0 4 787 786 813 812
		f 4 -740 -739 -738 -737
		mu 0 4 862 863 864 865
		f 4 -743 -742 -741 738
		mu 0 4 866 867 868 869
		f 4 -746 -745 -744 741
		mu 0 4 870 871 872 873
		f 4 -749 -748 -747 744
		mu 0 4 871 874 875 872
		f 4 -752 -751 -750 747
		mu 0 4 876 877 878 879
		f 4 -755 -754 -753 750
		mu 0 4 880 881 882 883
		f 4 -758 -757 -756 753
		mu 0 4 884 885 886 887
		f 4 -760 736 -759 756
		mu 0 4 885 888 889 886
		f 4 -764 -763 -762 -761
		mu 0 4 890 891 892 893
		f 4 -767 -766 -765 762
		mu 0 4 894 895 896 897
		f 4 -770 -769 -768 765
		mu 0 4 898 899 900 901
		f 4 -773 -772 -771 768
		mu 0 4 899 902 903 900
		f 4 -776 -775 -774 771
		mu 0 4 904 905 906 907
		f 4 -779 -778 -777 774
		mu 0 4 908 909 910 911
		f 4 -782 -781 -780 777
		mu 0 4 912 913 914 915
		f 4 -784 760 -783 780
		mu 0 4 913 916 917 914
		f 4 761 -787 -786 -785
		mu 0 4 893 892 918 919
		f 4 764 -789 -788 786
		mu 0 4 897 896 920 921
		f 4 767 -791 -790 788
		mu 0 4 901 900 922 923
		f 4 770 -793 -792 790
		mu 0 4 900 903 924 922
		f 4 773 -795 -794 792
		mu 0 4 907 906 925 926
		f 4 776 -797 -796 794
		mu 0 4 911 910 927 928
		f 4 779 -799 -798 796
		mu 0 4 915 914 929 930
		f 4 782 784 -800 798
		mu 0 4 914 917 931 929
		f 8 759 757 754 751 748 745 742 739
		mu 0 8 932 933 934 935 936 937 938 939
		f 3 785 -802 -801
		mu 0 3 919 918 940
		f 3 787 -803 801
		mu 0 3 941 942 943
		f 3 789 -804 802
		mu 0 3 942 944 943
		f 3 791 -805 803
		mu 0 3 945 946 947
		f 3 793 -806 804
		mu 0 3 946 948 947
		f 3 795 -807 805
		mu 0 3 928 927 949
		f 3 797 -808 806
		mu 0 3 930 929 950
		f 3 799 800 807
		mu 0 3 929 931 950
		f 4 746 -810 772 -809
		mu 0 4 872 875 902 899
		f 4 743 808 769 -811
		mu 0 4 873 872 899 898
		f 4 740 810 766 -812
		mu 0 4 869 868 895 894
		f 4 737 811 763 -813
		mu 0 4 865 864 891 890
		f 4 758 812 783 -814
		mu 0 4 886 889 951 952
		f 4 755 813 781 -815
		mu 0 4 887 886 952 953
		f 4 752 814 778 -816
		mu 0 4 883 882 909 908
		f 4 749 815 775 809
		mu 0 4 879 878 905 904
		f 4 -820 -819 -818 -817
		mu 0 4 954 955 956 957
		f 4 -823 -822 -821 818
		mu 0 4 958 959 960 961
		f 4 -826 -825 -824 821
		mu 0 4 962 963 964 965
		f 4 -829 -828 -827 824
		mu 0 4 963 966 967 964
		f 4 -832 -831 -830 827
		mu 0 4 968 969 970 971
		f 4 -835 -834 -833 830
		mu 0 4 972 973 974 975
		f 4 -838 -837 -836 833
		mu 0 4 976 977 978 979
		f 4 -840 816 -839 836
		mu 0 4 977 980 981 978
		f 4 817 -843 -842 -841
		mu 0 4 957 956 982 983
		f 4 820 -845 -844 842
		mu 0 4 961 960 984 985
		f 4 823 -847 -846 844
		mu 0 4 965 964 986 987
		f 4 826 -849 -848 846
		mu 0 4 964 967 988 986
		f 4 829 -851 -850 848
		mu 0 4 971 970 989 990
		f 4 832 -853 -852 850
		mu 0 4 975 974 991 992
		f 4 835 -855 -854 852
		mu 0 4 979 978 993 994
		f 4 838 840 -856 854
		mu 0 4 978 981 995 993
		f 4 841 -859 -858 -857
		mu 0 4 983 982 996 997
		f 4 843 -861 -860 858
		mu 0 4 985 984 998 999
		f 4 845 -863 -862 860
		mu 0 4 987 986 1000 1001
		f 4 847 -865 -864 862
		mu 0 4 986 988 1002 1000
		f 4 849 -867 -866 864
		mu 0 4 990 989 1003 1004
		f 4 851 -869 -868 866
		mu 0 4 992 991 1005 1006
		f 4 853 -871 -870 868
		mu 0 4 1007 1008 1009 1010
		f 4 855 856 -872 870
		mu 0 4 1008 1011 1012 1009
		f 8 839 837 834 831 828 825 822 819
		mu 0 8 1013 1014 1015 1016 1017 1018 1019 1020
		f 3 857 -874 -873
		mu 0 3 997 996 1021
		f 3 859 -875 873
		mu 0 3 1022 1023 1024
		f 3 861 -876 874
		mu 0 3 1001 1000 1025
		f 3 863 -877 875
		mu 0 3 1000 1002 1025
		f 3 865 -878 876
		mu 0 3 1026 1027 1028
		f 3 867 -879 877
		mu 0 3 1006 1005 1029
		f 3 869 -880 878
		mu 0 3 1010 1009 1030
		f 3 871 872 879
		mu 0 3 1009 1012 1030
		f 4 -884 -883 -882 -881
		mu 0 4 1031 1032 1033 1034
		f 4 -887 -886 -885 882
		mu 0 4 1035 1036 1037 1038
		f 4 -890 -889 -888 885
		mu 0 4 1039 1040 1041 1042
		f 4 -893 -892 -891 888
		mu 0 4 1040 1043 1044 1041
		f 4 -896 -895 -894 891
		mu 0 4 1045 1046 1047 1048
		f 4 -899 -898 -897 894
		mu 0 4 1049 1050 1051 1052
		f 4 -902 -901 -900 897
		mu 0 4 1053 1054 1055 1056
		f 4 -904 880 -903 900
		mu 0 4 1054 1057 1058 1055
		f 4 -908 -907 -906 -905
		mu 0 4 1059 1060 1061 1062
		f 4 -911 -910 -909 906
		mu 0 4 1063 1064 1065 1066
		f 4 -914 -913 -912 909
		mu 0 4 1067 1068 1069 1070
		f 4 -917 -916 -915 912
		mu 0 4 1068 1071 1072 1069
		f 4 -920 -919 -918 915
		mu 0 4 1073 1074 1075 1076
		f 4 -923 -922 -921 918
		mu 0 4 1077 1078 1079 1080
		f 4 -926 -925 -924 921
		mu 0 4 1081 1082 1083 1084
		f 4 -928 904 -927 924
		mu 0 4 1082 1085 1086 1083
		f 4 905 -931 -930 -929
		mu 0 4 1062 1061 1087 1088
		f 4 908 -933 -932 930
		mu 0 4 1066 1065 1089 1090
		f 4 911 -935 -934 932
		mu 0 4 1070 1069 1091 1092
		f 4 914 -937 -936 934
		mu 0 4 1069 1072 1093 1091
		f 4 917 -939 -938 936
		mu 0 4 1076 1075 1094 1095
		f 4 920 -941 -940 938
		mu 0 4 1080 1079 1096 1097
		f 4 923 -943 -942 940
		mu 0 4 1084 1083 1098 1099
		f 4 926 928 -944 942
		mu 0 4 1083 1086 1100 1098
		f 8 903 901 898 895 892 889 886 883
		mu 0 8 1101 1102 1103 1104 1105 1106 1107 1108
		f 3 929 -946 -945
		mu 0 3 1088 1087 1109
		f 3 931 -947 945
		mu 0 3 1110 1111 1112
		f 3 933 -948 946
		mu 0 3 1111 1113 1112
		f 3 935 -949 947
		mu 0 3 1114 1115 1116
		f 3 937 -950 948
		mu 0 3 1115 1117 1116
		f 3 939 -951 949
		mu 0 3 1097 1096 1118
		f 3 941 -952 950
		mu 0 3 1099 1098 1119
		f 3 943 944 951
		mu 0 3 1098 1100 1119
		f 4 887 -954 913 -953
		mu 0 4 1042 1041 1068 1067
		f 4 884 952 910 -955
		mu 0 4 1038 1037 1064 1063
		f 4 881 954 907 -956
		mu 0 4 1034 1033 1060 1059
		f 4 902 955 927 -957
		mu 0 4 1055 1058 1120 1121
		f 4 899 956 925 -958
		mu 0 4 1056 1055 1121 1122
		f 4 896 957 922 -959
		mu 0 4 1052 1051 1078 1077
		f 4 893 958 919 -960
		mu 0 4 1048 1047 1074 1073
		f 4 890 959 916 953
		mu 0 4 1041 1044 1071 1068
		f 4 -964 -963 -962 -961
		mu 0 4 1123 1124 1125 1126
		f 4 -967 -966 -965 962
		mu 0 4 1127 1128 1129 1130
		f 4 -970 -969 -968 965
		mu 0 4 1131 1132 1133 1134
		f 4 -973 -972 -971 968
		mu 0 4 1132 1135 1136 1133
		f 4 -976 -975 -974 971
		mu 0 4 1137 1138 1139 1140
		f 4 -979 -978 -977 974
		mu 0 4 1141 1142 1143 1144
		f 4 -982 -981 -980 977
		mu 0 4 1145 1146 1147 1148;
	setAttr ".fc[500:999]"
		f 4 -984 960 -983 980
		mu 0 4 1146 1149 1150 1147
		f 4 -988 -987 -986 -985
		mu 0 4 1151 1152 1153 1154
		f 4 -991 -990 -989 986
		mu 0 4 1155 1156 1157 1158
		f 4 -994 -993 -992 989
		mu 0 4 1159 1160 1161 1162
		f 4 -997 -996 -995 992
		mu 0 4 1160 1163 1164 1161
		f 4 -1000 -999 -998 995
		mu 0 4 1165 1166 1167 1168
		f 4 -1003 -1002 -1001 998
		mu 0 4 1169 1170 1171 1172
		f 4 -1006 -1005 -1004 1001
		mu 0 4 1173 1174 1175 1176
		f 4 -1008 984 -1007 1004
		mu 0 4 1174 1177 1178 1175
		f 4 985 -1011 -1010 -1009
		mu 0 4 1154 1153 1179 1180
		f 4 988 -1013 -1012 1010
		mu 0 4 1158 1157 1181 1182
		f 4 991 -1015 -1014 1012
		mu 0 4 1162 1161 1183 1184
		f 4 994 -1017 -1016 1014
		mu 0 4 1161 1164 1185 1183
		f 4 997 -1019 -1018 1016
		mu 0 4 1168 1167 1186 1187
		f 4 1000 -1021 -1020 1018
		mu 0 4 1172 1171 1188 1189
		f 4 1003 -1023 -1022 1020
		mu 0 4 1176 1175 1190 1191
		f 4 1006 1008 -1024 1022
		mu 0 4 1175 1178 1192 1190
		f 8 983 981 978 975 972 969 966 963
		mu 0 8 1193 1194 1195 1196 1197 1198 1199 1200
		f 3 1009 -1026 -1025
		mu 0 3 1180 1179 1201
		f 3 1011 -1027 1025
		mu 0 3 1202 1203 1204
		f 3 1013 -1028 1026
		mu 0 3 1203 1205 1204
		f 3 1015 -1029 1027
		mu 0 3 1206 1207 1208
		f 3 1017 -1030 1028
		mu 0 3 1207 1209 1208
		f 3 1019 -1031 1029
		mu 0 3 1189 1188 1210
		f 3 1021 -1032 1030
		mu 0 3 1191 1190 1211
		f 3 1023 1024 1031
		mu 0 3 1190 1192 1211
		f 4 967 -1034 993 -1033
		mu 0 4 1134 1133 1160 1159
		f 4 964 1032 990 -1035
		mu 0 4 1130 1129 1156 1155
		f 4 961 1034 987 -1036
		mu 0 4 1126 1125 1152 1151
		f 4 982 1035 1007 -1037
		mu 0 4 1147 1150 1212 1213
		f 4 979 1036 1005 -1038
		mu 0 4 1148 1147 1213 1214
		f 4 976 1037 1002 -1039
		mu 0 4 1144 1143 1170 1169
		f 4 973 1038 999 -1040
		mu 0 4 1140 1139 1166 1165
		f 4 970 1039 996 1033
		mu 0 4 1133 1136 1163 1160
		f 4 -1044 -1043 -1042 -1041
		mu 0 4 1215 1216 1217 1218
		f 4 -1047 -1046 -1045 1042
		mu 0 4 1219 1220 1221 1222
		f 4 -1050 -1049 -1048 1045
		mu 0 4 1223 1224 1225 1226
		f 4 -1053 -1052 -1051 1048
		mu 0 4 1224 1227 1228 1225
		f 4 -1056 -1055 -1054 1051
		mu 0 4 1229 1230 1231 1232
		f 4 -1059 -1058 -1057 1054
		mu 0 4 1233 1234 1235 1236
		f 4 -1062 -1061 -1060 1057
		mu 0 4 1237 1238 1239 1240
		f 4 -1064 1040 -1063 1060
		mu 0 4 1238 1241 1242 1239
		f 4 -1068 -1067 -1066 -1065
		mu 0 4 1243 1244 1245 1246
		f 4 -1071 -1070 -1069 1066
		mu 0 4 1247 1248 1249 1250
		f 4 -1074 -1073 -1072 1069
		mu 0 4 1251 1252 1253 1254
		f 4 -1077 -1076 -1075 1072
		mu 0 4 1252 1255 1256 1253
		f 4 -1080 -1079 -1078 1075
		mu 0 4 1257 1258 1259 1260
		f 4 -1083 -1082 -1081 1078
		mu 0 4 1261 1262 1263 1264
		f 4 -1086 -1085 -1084 1081
		mu 0 4 1265 1266 1267 1268
		f 4 -1088 1064 -1087 1084
		mu 0 4 1266 1269 1270 1267
		f 4 1065 -1091 -1090 -1089
		mu 0 4 1246 1245 1271 1272
		f 4 1068 -1093 -1092 1090
		mu 0 4 1250 1249 1273 1274
		f 4 1071 -1095 -1094 1092
		mu 0 4 1254 1253 1275 1276
		f 4 1074 -1097 -1096 1094
		mu 0 4 1253 1256 1277 1275
		f 4 1077 -1099 -1098 1096
		mu 0 4 1260 1259 1278 1279
		f 4 1080 -1101 -1100 1098
		mu 0 4 1264 1263 1280 1281
		f 4 1083 -1103 -1102 1100
		mu 0 4 1268 1267 1282 1283
		f 4 1086 1088 -1104 1102
		mu 0 4 1267 1270 1284 1282
		f 8 1063 1061 1058 1055 1052 1049 1046 1043
		mu 0 8 1285 1286 1287 1288 1289 1290 1291 1292
		f 3 1089 -1106 -1105
		mu 0 3 1272 1271 1293
		f 3 1091 -1107 1105
		mu 0 3 1294 1295 1296
		f 3 1093 -1108 1106
		mu 0 3 1295 1297 1296
		f 3 1095 -1109 1107
		mu 0 3 1298 1299 1300
		f 3 1097 -1110 1108
		mu 0 3 1299 1301 1300
		f 3 1099 -1111 1109
		mu 0 3 1281 1280 1302
		f 3 1101 -1112 1110
		mu 0 3 1283 1282 1303
		f 3 1103 1104 1111
		mu 0 3 1282 1284 1303
		f 4 1050 -1114 1076 -1113
		mu 0 4 1225 1228 1255 1252
		f 4 1047 1112 1073 -1115
		mu 0 4 1226 1225 1252 1251
		f 4 1044 1114 1070 -1116
		mu 0 4 1222 1221 1248 1247
		f 4 1041 1115 1067 -1117
		mu 0 4 1218 1217 1244 1243
		f 4 1062 1116 1087 -1118
		mu 0 4 1239 1242 1304 1305
		f 4 1059 1117 1085 -1119
		mu 0 4 1240 1239 1305 1306
		f 4 1056 1118 1082 -1120
		mu 0 4 1236 1235 1262 1261
		f 4 1053 1119 1079 1113
		mu 0 4 1232 1231 1258 1257
		f 4 -1124 -1123 -1122 -1121
		mu 0 4 1307 1308 1309 1310
		f 4 -1127 -1126 -1125 1122
		mu 0 4 1311 1312 1313 1314
		f 4 -1130 -1129 -1128 1125
		mu 0 4 1315 1316 1317 1318
		f 4 -1133 -1132 -1131 1128
		mu 0 4 1316 1319 1320 1317
		f 4 -1136 -1135 -1134 1131
		mu 0 4 1321 1322 1323 1324
		f 4 -1139 -1138 -1137 1134
		mu 0 4 1325 1326 1327 1328
		f 4 -1142 -1141 -1140 1137
		mu 0 4 1329 1330 1331 1332
		f 4 -1144 1120 -1143 1140
		mu 0 4 1330 1333 1334 1331
		f 4 1121 -1147 -1146 -1145
		mu 0 4 1310 1309 1335 1336
		f 4 1124 -1149 -1148 1146
		mu 0 4 1314 1313 1337 1338
		f 4 1127 -1151 -1150 1148
		mu 0 4 1318 1317 1339 1340
		f 4 1130 -1153 -1152 1150
		mu 0 4 1317 1320 1341 1339
		f 4 1133 -1155 -1154 1152
		mu 0 4 1324 1323 1342 1343
		f 4 1136 -1157 -1156 1154
		mu 0 4 1328 1327 1344 1345
		f 4 1139 -1159 -1158 1156
		mu 0 4 1332 1331 1346 1347
		f 4 1142 1144 -1160 1158
		mu 0 4 1331 1334 1348 1346
		f 4 1145 -1163 -1162 -1161
		mu 0 4 1336 1335 1349 1350
		f 4 1147 -1165 -1164 1162
		mu 0 4 1338 1337 1351 1352
		f 4 1149 -1167 -1166 1164
		mu 0 4 1340 1339 1353 1354
		f 4 1151 -1169 -1168 1166
		mu 0 4 1339 1341 1355 1353
		f 4 1153 -1171 -1170 1168
		mu 0 4 1343 1342 1356 1357
		f 4 1155 -1173 -1172 1170
		mu 0 4 1345 1344 1358 1359
		f 4 1157 -1175 -1174 1172
		mu 0 4 1360 1361 1362 1363
		f 4 1159 1160 -1176 1174
		mu 0 4 1361 1364 1365 1362
		f 8 1143 1141 1138 1135 1132 1129 1126 1123
		mu 0 8 1366 1367 1368 1369 1370 1371 1372 1373
		f 3 1161 -1178 -1177
		mu 0 3 1350 1349 1374
		f 3 1163 -1179 1177
		mu 0 3 1375 1376 1377
		f 3 1165 -1180 1178
		mu 0 3 1354 1353 1378
		f 3 1167 -1181 1179
		mu 0 3 1353 1355 1378
		f 3 1169 -1182 1180
		mu 0 3 1379 1380 1381
		f 3 1171 -1183 1181
		mu 0 3 1359 1358 1382
		f 3 1173 -1184 1182
		mu 0 3 1363 1362 1383
		f 3 1175 1176 1183
		mu 0 3 1362 1365 1383
		f 4 1273 1274 1275 1276
		mu 0 4 1384 1385 1386 1387
		f 4 1277 1184 1278 -1276
		mu 0 4 1388 1389 1390 1391
		f 4 1279 1280 1281 1282
		mu 0 4 1392 1393 1394 1395
		f 4 1185 1283 1284 1285
		mu 0 4 1396 1397 1398 1399
		f 4 1286 1287 1288 -1285
		mu 0 4 1398 1400 1401 1399
		f 4 1289 2405 2485 -2420
		mu 0 4 1402 1403 1404 1405
		f 4 -2406 2613 1290 -2615
		mu 0 4 1404 1403 1406 1407
		f 4 1291 1200 -2484 2614
		mu 0 4 1408 1409 1410 1411
		f 4 2545 2544 2403 -2405
		mu 0 4 1412 1413 1414 1415
		f 4 -2450 2612 2452 -2614
		mu 0 4 1403 1416 1417 1406
		f 4 2450 2449 -1290 -2448
		mu 0 4 1418 1416 1403 1402
		f 4 1293 1294 1295 1296
		mu 0 4 1419 1420 1421 1422
		f 4 1297 1298 1299 -1296
		mu 0 4 1421 1423 1424 1422
		f 4 1300 1301 1302 1303
		mu 0 4 1425 1426 1427 1428
		f 4 1304 1305 1306 1307
		mu 0 4 1429 1430 1431 1432
		f 4 2643 2659 1271 -2661
		mu 0 4 1433 1434 1435 1436
		f 4 2566 1268 1326 1327
		mu 0 4 1437 1438 1439 1440
		f 4 2646 2647 -2644 -2649
		mu 0 4 1441 1442 1434 1433
		f 4 -1291 1311 1312 1313
		mu 0 4 1407 1406 1443 1444
		f 4 1314 2416 2415 -1313
		mu 0 4 1443 1445 1446 1444
		f 4 2417 1257 1318 -2416
		mu 0 4 1447 1448 1449 1450
		f 4 1188 -1292 -1314 -1319
		mu 0 4 1449 1409 1408 1450
		f 4 2555 2471 2412 -2549
		mu 0 4 1451 1452 1453 1454
		f 4 2563 2562 2568 2567
		mu 0 4 1455 1456 1457 1458
		f 4 1190 1328 1329 -1327
		mu 0 4 1439 1459 1460 1440
		f 4 1330 -1323 1331 -1330
		mu 0 4 1461 1462 1457 1463
		f 4 -1328 -1332 -2563 2565
		mu 0 4 1464 1463 1457 1456
		f 4 1332 1333 2498 2497
		mu 0 4 1465 1466 1467 1468
		f 4 1336 1337 1338 -1335
		mu 0 4 1469 1470 1471 1472
		f 4 1339 1191 1340 -1339
		mu 0 4 1473 1474 1475 1476
		f 4 1263 1341 -2498 2499
		mu 0 4 1477 1478 1479 1480
		f 4 1342 1343 2460 2459
		mu 0 4 1481 1482 1483 1484
		f 4 1346 -1337 1347 -1345
		mu 0 4 1485 1486 1487 1488
		f 4 -1334 1348 1349 2496
		mu 0 4 1467 1466 1489 1490
		f 4 1267 1352 1350 2539
		mu 0 4 1491 1492 1493 1494
		f 4 1266 -1946 -2536 -1353
		mu 0 4 1492 1495 1496 1493
		f 4 -1329 1194 1353 1354
		mu 0 4 1460 1459 1497 1498
		f 4 1195 1355 1356 -1354
		mu 0 4 1497 1499 1500 1498
		f 4 1357 1358 1359 -1357
		mu 0 4 1500 1501 1502 1498
		f 4 1360 -1331 -1355 -1360
		mu 0 4 1502 1503 1460 1498
		f 4 -1324 -1361 1361 1362
		mu 0 4 1504 1462 1505 1506
		f 4 -1359 1363 1364 -1362
		mu 0 4 1502 1501 1507 1508
		f 4 1365 1366 1367 -1365
		mu 0 4 1509 1510 1511 1506
		f 4 1368 -1326 -1363 -1368
		mu 0 4 1511 1512 1504 1506
		f 4 -1367 1371 2468 -1370
		mu 0 4 1511 1510 1513 1514
		f 4 1373 1374 1375 -1373
		mu 0 4 1515 1516 1517 1518
		f 4 2576 -1321 -2575 2577
		mu 0 4 1519 1520 1521 1522
		f 4 -1316 -2577 2579 2578
		mu 0 4 1523 1520 1519 1524
		f 4 -1375 1379 1380 -1378
		mu 0 4 1525 1526 1527 1528
		f 4 1381 1196 1382 -1381
		mu 0 4 1529 1530 1531 1532
		f 4 1269 -1318 -2579 2580
		mu 0 4 1533 1534 1535 1536
		f 4 1383 1198 1384 1385
		mu 0 4 1537 1538 1539 1540
		f 4 1199 -1309 1386 -1385
		mu 0 4 1539 1541 1542 1540
		f 4 1389 1390 -1386 -1389
		mu 0 4 1543 1544 1545 1546
		f 4 1391 -1390 -1388 -2641
		mu 0 4 1547 1544 1543 1548
		f 4 2640 -2555 -2640 -2629
		mu 0 4 1547 1548 1549 1550
		f 4 1393 -2407 2408 2407
		mu 0 4 1551 1552 1553 1554
		f 4 2617 2616 -2411 2448
		mu 0 4 1555 1556 1557 1554
		f 4 2409 1394 -2408 2410
		mu 0 4 1557 1558 1551 1554
		f 4 1395 -2410 2411 2488
		mu 0 4 1559 1558 1557 1560
		f 4 1262 1396 -2489 2486
		mu 0 4 1561 1562 1563 1564
		f 4 1405 2456 2455 1408
		mu 0 4 1565 1566 1567 1568
		f 4 2458 -1344 1410 -2456
		mu 0 4 1569 1570 1571 1572
		f 4 1411 -1347 -1410 1412
		mu 0 4 1573 1486 1485 1574
		f 4 -1338 -1412 1413 1414
		mu 0 4 1575 1486 1573 1576
		f 4 1203 -1340 -1415 1415
		mu 0 4 1577 1474 1473 1578
		f 4 2426 2425 -2267 -2424
		mu 0 4 1579 1580 1581 1582
		f 4 2424 2423 -2269 -2422
		mu 0 4 1583 1584 1585 1586
		f 4 2552 1886 2481 2480
		mu 0 4 1587 1588 1589 1590
		f 4 2430 2429 -2263 -2428
		mu 0 4 1591 1592 1593 1594
		f 4 2428 2427 -2265 -2426
		mu 0 4 1595 1596 1597 1598
		f 4 2650 -2647 -2653 2653
		mu 0 4 1599 1600 1601 1602
		f 4 2434 2433 -2259 -2432
		mu 0 4 1603 1604 1605 1606
		f 4 2432 2431 -2261 -2430
		mu 0 4 1607 1608 1609 1610
		f 4 2422 2421 -2270 2308
		mu 0 4 1611 1612 1613 1614
		f 4 2435 -2309 -2257 -2434
		mu 0 4 1615 1611 1614 1616
		f 4 1428 1429 1430 1431
		mu 0 4 1617 1618 1619 1620
		f 4 1432 1433 1434 1435
		mu 0 4 1621 1622 1623 1624
		f 4 1436 1437 -1435 1438
		mu 0 4 1625 1626 1627 1628
		f 4 -1430 1439 1440 1441
		mu 0 4 1619 1618 1629 1630
		f 4 1442 1443 1444 -1441
		mu 0 4 1631 1632 1633 1634
		f 4 -1437 1445 1446 1447
		mu 0 4 1635 1636 1637 1638
		f 4 -1447 1448 1449 1450
		mu 0 4 1639 1640 1641 1642
		f 4 -1444 1451 1452 1453
		mu 0 4 1643 1644 1645 1646
		f 4 1454 1455 -1453 1456
		mu 0 4 1647 1648 1649 1650
		f 4 1457 1458 1459 1460
		mu 0 4 1651 1652 1653 1654
		f 4 1461 1462 1463 -1460
		mu 0 4 1655 1656 1657 1658
		f 4 1464 1465 1466 1467
		mu 0 4 1659 1660 1661 1662
		f 4 1468 1469 1470 -1467
		mu 0 4 1663 1664 1665 1666
		f 4 1471 1472 2670 2669
		mu 0 4 1667 1668 1669 1670
		f 4 1475 2668 -1473 1477
		mu 0 4 1671 1672 1673 1674
		f 4 1478 1479 2674 2673
		mu 0 4 1675 1676 1677 1678
		f 4 -2670 2672 -1480 1483
		mu 0 4 1679 1680 1677 1676
		f 4 1484 1485 2678 2677
		mu 0 4 1681 1682 1683 1684
		f 4 -2674 2676 -1486 1489
		mu 0 4 1685 1686 1687 1688
		f 4 2525 2489 -2524 2526
		mu 0 4 1689 1690 1691 1692
		f 4 -2678 2680 2679 1495
		mu 0 4 1681 1684 1693 1694
		f 4 1496 1497 1498 1499
		mu 0 4 1695 1696 1697 1698
		f 4 2341 1500 1501 2342
		mu 0 4 1699 1700 1701 1702
		f 4 1502 1503 2340 -1502
		mu 0 4 1701 1703 1704 1702
		f 4 1504 1505 -1500 1506
		mu 0 4 1705 1706 1707 1708
		f 4 1507 -1505 1508 1509
		mu 0 4 1709 1706 1705 1710
		f 4 -1504 1510 1511 2338
		mu 0 4 1711 1712 1713 1714
		f 4 1512 1513 2336 -1512
		mu 0 4 1715 1716 1717 1718
		f 4 1514 1515 -1510 1516
		mu 0 4 1719 1720 1721 1722
		f 4 1517 -1515 1518 1519
		mu 0 4 1723 1724 1725 1726
		f 4 -1514 1520 1521 2334
		mu 0 4 1727 1728 1729 1730
		f 4 1522 1523 2332 -1522
		mu 0 4 1729 1731 1732 1730
		f 4 1524 1525 1526 -1520
		mu 0 4 1733 1734 1735 1736
		f 4 1527 -1526 1528 1529
		mu 0 4 1737 1735 1734 1738
		f 4 2345 -1524 1530 1531
		mu 0 4 1739 1740 1741 1742
		f 4 1532 -2342 2344 -1532
		mu 0 4 1743 1744 1745 1746
		f 4 -1498 1533 -1530 1534
		mu 0 4 1697 1696 1747 1748
		f 4 1535 1204 1536 1537
		mu 0 4 1749 1750 1751 1752
		f 4 1205 1538 1539 -1537
		mu 0 4 1753 1754 1755 1756
		f 4 1540 1541 1542 -1540
		mu 0 4 1757 1758 1759 1752
		f 4 1543 1544 -1538 -1543
		mu 0 4 1759 1760 1749 1752
		f 4 1545 -1544 1546 1547
		mu 0 4 1761 1762 1763 1764
		f 4 -1542 1548 1549 -1547
		mu 0 4 1763 1765 1766 1764
		f 4 1550 1551 1552 -1550
		mu 0 4 1766 1767 1768 1764
		f 4 1553 1554 -1548 -1553
		mu 0 4 1768 1769 1761 1764
		f 4 1555 1556 1557 1558
		mu 0 4 1770 1769 1771 1772
		f 4 1559 1560 1561 1562
		mu 0 4 1773 1774 1775 1776
		f 4 1563 1564 1565 1566
		mu 0 4 1777 1778 1779 1780
		f 4 -1561 1567 1568 -1566
		mu 0 4 1781 1782 1783 1784
		f 4 1569 1206 1570 -1569
		mu 0 4 1783 1785 1786 1784
		f 4 1207 1571 -1567 -1571
		mu 0 4 1786 1787 1788 1784
		f 4 1572 1573 1208 1574
		mu 0 4 1789 1790 1791 1792
		f 4 1575 1576 -1573 1577
		mu 0 4 1793 1794 1790 1789
		f 4 1578 1579 -1576 1580
		mu 0 4 1795 1796 1797 1798
		f 4 1209 1581 -1579 1582
		mu 0 4 1799 1800 1796 1795
		f 4 1210 1583 1584 1585
		mu 0 4 1801 1802 1803 1804
		f 4 -1585 1586 1587 1588
		mu 0 4 1804 1803 1805 1806
		f 4 -1588 1589 1590 1591
		mu 0 4 1807 1808 1809 1810
		f 4 -1591 1592 1211 1593
		mu 0 4 1810 1809 1811 1812
		f 4 1212 1594 1595 1596
		mu 0 4 1813 1814 1815 1816
		f 4 -1596 1597 1598 1599
		mu 0 4 1816 1815 1817 1818
		f 4 -1599 1600 1601 1602
		mu 0 4 1819 1820 1821 1822
		f 4 -1602 1603 1213 1604
		mu 0 4 1822 1821 1823 1824
		f 4 1214 1605 1606 1607
		mu 0 4 1825 1826 1827 1828
		f 4 -1607 1608 1609 1610
		mu 0 4 1828 1827 1829 1830
		f 4 -1610 1611 1612 1613
		mu 0 4 1831 1832 1833 1834
		f 4 -1613 1614 1215 1615
		mu 0 4 1834 1833 1835 1836
		f 4 -1608 1616 -1582 1216
		mu 0 4 1825 1828 1796 1800
		f 4 -1611 1617 -1580 -1617
		mu 0 4 1828 1830 1797 1796
		f 4 -1614 1618 -1577 -1618
		mu 0 4 1831 1834 1790 1794
		f 4 -1616 1217 -1574 -1619
		mu 0 4 1834 1836 1791 1790
		f 4 -1586 1619 -1606 1218
		mu 0 4 1801 1804 1827 1826
		f 4 -1589 1620 -1609 -1620
		mu 0 4 1804 1806 1829 1827
		f 4 -1592 1621 -1612 -1621
		mu 0 4 1807 1810 1833 1832
		f 4 -1594 1219 -1615 -1622
		mu 0 4 1810 1812 1835 1833
		f 4 -1597 1622 -1584 1220
		mu 0 4 1813 1816 1803 1802
		f 4 -1600 1623 -1587 -1623
		mu 0 4 1816 1818 1805 1803
		f 4 -1603 1624 -1590 -1624
		mu 0 4 1819 1822 1809 1808
		f 4 -1605 1221 -1593 -1625
		mu 0 4 1822 1824 1811 1809
		f 4 1625 1626 1627 1222
		mu 0 4 1837 1838 1839 1840
		f 4 1628 1629 1630 -1627
		mu 0 4 1841 1842 1843 1844
		f 4 1631 1632 1633 -1630
		mu 0 4 1845 1846 1847 1848
		f 4 1634 1223 1635 -1633
		mu 0 4 1849 1850 1851 1852
		f 4 -1284 1224 1636 1637
		mu 0 4 1853 1854 1855 1856
		f 4 1225 -1536 1638 -1637
		mu 0 4 1855 1750 1749 1856
		f 4 -1545 1639 1640 -1639
		mu 0 4 1749 1760 1857 1856
		f 4 1641 -1287 -1638 -1641
		mu 0 4 1858 1859 1860 1861
		f 4 -1640 -1546 1642 1643
		mu 0 4 1858 1762 1761 1862
		f 4 -1555 1644 1645 -1643
		mu 0 4 1761 1769 1863 1862
		f 4 -1645 -1556 1646 1647
		mu 0 4 1864 1865 1866 1867
		f 4 1648 1649 1650 -1647
		mu 0 4 1866 1868 1869 1867
		f 4 1651 1652 1653 1654
		mu 0 4 1870 1871 1872 1392
		f 4 1655 1226 1656 1657
		mu 0 4 1873 1874 1875 1876
		f 4 1227 1658 -1653 -1657
		mu 0 4 1877 1878 1879 1880
		f 4 -1912 1397 1228 2700
		mu 0 4 1881 1882 1883 1884
		f 4 2702 -1911 1398 1911
		mu 0 4 1885 1886 1887 1888
		f 4 -1910 1399 1910 2704
		mu 0 4 1889 1890 1887 1886
		f 4 2706 -1909 1400 1909
		mu 0 4 1889 1891 1892 1890
		f 4 -1908 1401 1908 2708
		mu 0 4 1893 1894 1895 1896
		f 4 2710 -1907 1402 1907
		mu 0 4 1893 1897 1898 1894
		f 4 -1906 1403 1906 2712
		mu 0 4 1899 1900 1901 1902
		f 4 2714 2713 1404 1905
		mu 0 4 1899 1903 1904 1900
		f 4 -1539 1229 1659 1660
		mu 0 4 1755 1754 1905 1906
		f 4 1230 -1398 1661 -1660
		mu 0 4 1905 1883 1882 1906
		f 4 -1399 1662 1663 -1662
		mu 0 4 1888 1887 1907 1908
		f 4 1664 -1541 -1661 -1664
		mu 0 4 1907 1765 1909 1908
		f 4 -1549 -1665 1665 1666
		mu 0 4 1766 1765 1907 1910
		f 4 -1663 -1400 1667 -1666
		mu 0 4 1907 1887 1890 1910
		f 4 -1401 1668 1669 -1668
		mu 0 4 1890 1892 1911 1910
		f 4 1670 -1551 -1667 -1670
		mu 0 4 1911 1767 1766 1910
		f 4 1671 -1671 1672 1673
		mu 0 4 1912 1913 1914 1915
		f 4 -1669 -1402 1674 -1673
		mu 0 4 1914 1895 1894 1915
		f 4 1675 1676 1677 1678
		mu 0 4 1916 1917 1918 1919
		f 4 1679 -1404 1680 1681
		mu 0 4 1920 1921 1922 1923
		f 4 -1405 1231 1682 -1681
		mu 0 4 1900 1904 1924 1925
		f 4 1683 2611 2596 1684
		mu 0 4 1926 1927 1928 1929
		f 4 -2597 2598 2597 1685
		mu 0 4 1930 1931 1932 1933
		f 4 -2598 2600 2599 1686
		mu 0 4 1934 1935 1936 1937
		f 4 -1450 1687 1688 1689
		mu 0 4 1938 1939 1940 1941
		f 4 -2600 2602 2601 1690
		mu 0 4 1937 1936 1942 1943
		f 4 -2602 2604 2603 1691
		mu 0 4 1944 1945 1946 1947
		f 4 1692 1693 1694 1695
		mu 0 4 1948 1949 1950 1951
		f 4 -2604 2606 2605 1696
		mu 0 4 1952 1953 1954 1955
		f 4 -2606 2608 2607 1697
		mu 0 4 1956 1957 1958 1959
		f 4 -2608 2610 -1684 1698
		mu 0 4 1959 1958 1960 1961
		f 4 1699 1700 1701 1702
		mu 0 4 1962 1963 1964 1965
		f 4 -1654 1703 -1275 1704
		mu 0 4 1392 1872 1386 1385
		f 4 2775 -2778 2779 2780
		mu 0 4 1966 1967 1968 1969
		f 4 -1659 1232 -1278 -1704
		mu 0 4 1879 1878 1389 1388
		f 4 1708 1709 -1279 1233
		mu 0 4 1970 1971 1972 1973
		f 4 2795 2794 1711 1712
		mu 0 4 1974 1975 1976 1977
		f 4 2783 2782 1714 1715
		mu 0 4 1978 1979 1980 1981
		f 4 2787 2786 1717 1718
		mu 0 4 1982 1983 1984 1985
		f 4 2789 2788 1720 -2787
		mu 0 4 1986 1987 1988 1989
		f 4 1721 1722 1723 1724
		mu 0 4 1990 1991 1992 1993
		f 4 1725 1726 1727 1728
		mu 0 4 1994 1995 1996 1997
		f 4 1729 1730 1731 -1724
		mu 0 4 1998 1999 2000 2001
		f 4 1732 -1655 -1283 1733
		mu 0 4 2002 2003 2004 2005
		f 4 -2789 2791 2790 1735
		mu 0 4 1988 1987 2006 2007
		f 4 1736 1737 -1649 -1559
		mu 0 4 2008 2009 1868 1866
		f 4 -2795 2797 2796 1739
		mu 0 4 1976 1975 2010 2011
		f 4 -1565 1740 1741 -1562
		mu 0 4 1779 1778 2012 2013
		f 4 1742 2800 -1716 1743
		mu 0 4 2014 2015 1978 1981
		f 4 2785 -1719 1745 -2783
		mu 0 4 2016 1982 1985 2017
		f 4 -1572 1234 -1656 -1745
		mu 0 4 2018 2019 1874 1873
		f 4 -1280 1746 -1700 1747
		mu 0 4 1393 1392 1963 1962
		f 4 -1705 1748 -1701 -1747
		mu 0 4 1392 1385 1964 1963
		f 4 -1274 1749 -1702 -1749
		mu 0 4 1385 1384 1965 1964
		f 4 1750 -1748 -1706 1751
		mu 0 4 2020 2021 2022 2023
		f 4 -1277 1752 -1707 -1750
		mu 0 4 2024 2025 2026 2027
		f 4 -1710 -1752 -1708 -1753
		mu 0 4 2025 2028 2029 2026
		f 4 -1282 1753 -1648 1754
		mu 0 4 2005 2030 1864 1867
		f 4 1755 -1734 -1755 -1651
		mu 0 4 1869 2002 2005 1867
		f 4 -2791 2793 -1713 1756
		mu 0 4 2007 2006 1974 1977
		f 4 1757 1758 1759 1760
		mu 0 4 2031 2032 2033 2034
		f 4 -1761 1761 -1727 1762
		mu 0 4 2035 2036 1996 1995
		f 4 1763 1764 -1722 1765
		mu 0 4 2037 2038 2039 2040
		f 4 -1764 1766 1767 1768
		mu 0 4 2041 2042 2043 2044
		f 4 -1759 2751 2750 1770
		mu 0 4 2033 2032 2045 2046
		f 4 1771 1772 1773 1774
		mu 0 4 2047 2048 2049 2050
		f 4 1775 1776 1777 -1773
		mu 0 4 2051 2052 2053 2054
		f 4 1778 1779 1780 1781
		mu 0 4 2055 2056 2057 2058
		f 4 -1674 1782 1783 1784
		mu 0 4 1912 1915 2059 1917
		f 4 1785 -1780 1786 -1777
		mu 0 4 2060 2057 2056 2061
		f 4 1787 1788 -1682 1789
		mu 0 4 2062 2063 2064 2065
		f 4 1236 1790 -1790 -1683
		mu 0 4 2066 2067 2068 2069
		f 4 -2797 2799 -1743 1792
		mu 0 4 2011 2010 2070 2071
		f 4 -1742 -1792 -1737 1793
		mu 0 4 2013 2012 2009 2008
		f 4 1794 -1563 -1794 -1558
		mu 0 4 2072 1773 1776 2073
		f 4 -1403 1795 1796 1797
		mu 0 4 2074 2075 2076 2077
		f 4 1798 1799 -1774 1800
		mu 0 4 2078 2079 2080 2081
		f 4 -1680 1801 1802 -1796
		mu 0 4 2082 2083 2084 2085
		f 4 1803 -1801 -1778 1804
		mu 0 4 2086 2087 2088 2089
		f 4 -1675 -1798 1805 1806
		mu 0 4 2090 2091 2092 2093
		f 4 1807 1808 1809 -1800
		mu 0 4 2094 2095 2096 2097
		f 4 -1783 -1807 -1775 -1810
		mu 0 4 2098 2099 2047 2050
		f 4 1810 -1781 1811 1812
		mu 0 4 2100 2101 2102 2103
		f 4 1813 1814 1815 -1779
		mu 0 4 2104 2105 2106 2107
		f 4 -1789 -1813 1816 -1802
		mu 0 4 2083 2108 2109 2084
		f 4 1817 -1805 -1787 -1816
		mu 0 4 2110 2111 2112 2113
		f 4 -1817 -1812 -1786 1818
		mu 0 4 2114 2103 2102 2115
		f 4 -1803 -1819 -1776 1819
		mu 0 4 2085 2084 2116 2117
		f 4 -1797 -1820 -1772 -1806
		mu 0 4 2118 2119 2120 2121
		f 4 -1635 -1632 1820 1237
		mu 0 4 2122 2123 2124 2125
		f 4 -1821 -1629 -1626 1238
		mu 0 4 2125 2124 2126 2127
		f 4 1821 -1795 1822 1823
		mu 0 4 2128 1773 2072 2129
		f 4 -1811 1824 -1560 -1822
		mu 0 4 2128 2063 1774 1773
		f 4 -1568 -1825 -1788 1825
		mu 0 4 2130 1774 2063 2062
		f 4 -1791 1239 -1570 -1826
		mu 0 4 2068 2067 1785 1783
		f 4 1826 1827 1828 1829
		mu 0 4 2131 2132 2133 2134
		f 4 1830 1831 1832 1833
		mu 0 4 2135 2136 2137 2138
		f 4 1834 1835 1836 1837
		mu 0 4 2139 2140 2141 2142
		f 4 1838 1839 1840 1841
		mu 0 4 2143 2144 2145 2146
		f 4 2684 2683 2316 2315
		mu 0 4 2147 2148 2149 2150
		f 4 2317 2697 -2316 2318
		mu 0 4 2151 2152 2153 2154
		f 4 2696 -2318 2320 2319
		mu 0 4 2155 2156 2157 2158
		f 4 2321 2694 -2320 2322
		mu 0 4 2159 2160 2161 2162
		f 4 2692 -2322 2324 2323
		mu 0 4 2163 2160 2159 2164
		f 4 2325 2690 -2324 2326
		mu 0 4 2165 2166 2167 2168
		f 4 2688 -2326 2328 2327
		mu 0 4 2169 2170 2171 2172
		f 4 2329 -2684 2686 -2328
		mu 0 4 2173 2149 2148 2174
		f 4 2507 2522 1844 -2522
		mu 0 4 2175 2176 2177 2178
		f 4 2520 2445 2505 2521
		mu 0 4 2179 2180 2181 2182
		f 4 2463 -2510 2512 2511
		mu 0 4 2183 2184 2185 2186
		f 4 2516 2515 2442 -2514
		mu 0 4 2187 2188 2189 2190
		f 4 2440 -2516 2518 2517
		mu 0 4 2191 2189 2188 2192
		f 4 2519 1265 2438 -2518
		mu 0 4 2193 2194 2195 2196
		f 4 -1818 -1815 -1679 1850
		mu 0 4 2197 2198 1916 1919
		f 4 -1677 -1784 -1809 1851
		mu 0 4 2199 2200 2096 2095
		f 4 -1672 1852 1853 -1552
		mu 0 4 1767 2201 2202 1768
		f 4 -1823 -1557 -1554 -1854
		mu 0 4 2202 1771 1769 1768
		f 4 -1824 -1853 1854 -1782
		mu 0 4 2128 2129 1912 2203
		f 4 -1855 -1785 -1676 -1814
		mu 0 4 2203 1912 1917 1916
		f 4 -1851 1855 -1799 -1804
		mu 0 4 2197 1919 2204 2205
		f 4 -1678 -1852 -1808 -1856
		mu 0 4 1919 1918 2206 2204
		f 4 1856 1857 1858 1859
		mu 0 4 2207 2208 2209 2210
		f 4 1860 1861 1862 1863
		mu 0 4 2211 2212 2213 2214
		f 4 1864 1865 1866 -1294
		mu 0 4 1419 2215 2216 1420
		f 4 1867 1868 -1857 1869
		mu 0 4 2217 2218 2208 2207
		f 4 1870 1871 1872 1873
		mu 0 4 2219 2220 2221 2222
		f 4 1874 1875 1876 -1306
		mu 0 4 1430 2223 2224 1431
		f 4 -1863 1877 1878 1879
		mu 0 4 2225 2226 2227 2228
		f 4 1880 1881 -1871 1882
		mu 0 4 2229 2230 2220 2219
		f 4 -1729 1883 -1731 1884
		mu 0 4 1994 1997 2000 1999
		f 4 2474 -1428 1888 2475
		mu 0 4 2231 2232 2233 2234
		f 4 -1424 2476 -1423 1889
		mu 0 4 2235 2236 2237 2238
		f 4 -2654 2655 -2658 2658
		mu 0 4 2239 2240 2241 2242
		f 4 -1419 -1890 -1421 -2478
		mu 0 4 2243 2244 2245 2246
		f 4 2482 -1889 -1425 -2481
		mu 0 4 2247 2234 2233 2248
		f 4 2529 -1343 -2528 2530
		mu 0 4 2249 2250 2251 2252
		f 4 -1411 -2530 2532 2531
		mu 0 4 1572 1571 2253 2254
		f 4 2533 -1409 -2532 2534
		mu 0 4 2255 1565 1568 2256
		f 4 2540 2535 -2534 2541
		mu 0 4 2257 1493 1496 2258
		f 4 2542 2538 -1351 -2541
		mu 0 4 2257 2259 1494 1493
		f 4 -2521 2536 -1896 2501
		mu 0 4 2260 2261 2262 2263
		f 4 1896 -1528 1897 1898
		mu 0 4 2264 1735 1737 2265
		f 4 -1527 -1897 -1478 1899
		mu 0 4 1736 1735 2264 2266
		f 4 1900 -1518 -1900 -1472
		mu 0 4 1679 1720 2267 2268
		f 4 -1516 -1901 -1484 1901
		mu 0 4 1721 1720 1679 1676
		f 4 1902 -1508 -1902 -1479
		mu 0 4 1675 2269 1721 1676
		f 4 -1506 -1903 -1490 1903
		mu 0 4 2270 2271 1685 1688
		f 4 1904 -1497 -1904 -1485
		mu 0 4 1681 1696 1695 1682
		f 4 -1534 -1905 -1496 -1898
		mu 0 4 1747 1696 1681 1694
		f 4 2492 2491 -1847 -2490
		mu 0 4 1690 2272 2273 1691
		f 4 2681 -1476 -1899 -2680
		mu 0 4 2274 2275 2264 2265
		f 4 1241 1912 1913 -1575
		mu 0 4 2276 2277 2278 2279
		f 4 -1914 1914 1915 -1578
		mu 0 4 1789 2280 2281 1793
		f 4 -1581 -1916 1916 1917
		mu 0 4 1795 1798 2282 2283
		f 4 1242 -1583 -1918 1918
		mu 0 4 2284 1799 1795 2283
		f 4 1919 -1413 -1407 -1917
		mu 0 4 2285 1573 1574 2286
		f 4 1920 -1414 -1920 -1915
		mu 0 4 2287 1576 1573 2285
		f 4 1243 -1416 -1921 -1913
		mu 0 4 2277 1577 1578 2278
		f 4 1921 1922 1244 -1604
		mu 0 4 1821 2288 2289 1823
		f 4 1923 1924 -1922 -1601
		mu 0 4 1820 2290 2288 1821
		f 4 1925 1926 -1924 -1598
		mu 0 4 1815 2291 2292 1817
		f 4 1245 1927 -1926 -1595
		mu 0 4 1814 2293 2291 1815
		f 4 1928 1929 1246 -1923
		mu 0 4 2288 2294 2295 2289
		f 4 1930 1931 -1929 -1925
		mu 0 4 2290 2296 2294 2288
		f 4 1932 1933 -1931 -1927
		mu 0 4 2291 2297 2298 2292
		f 4 1247 1934 -1933 -1928
		mu 0 4 2293 2299 2297 2291
		f 4 1935 1936 1248 -1930
		mu 0 4 2294 2300 2301 2295
		f 4 1937 1938 -1936 -1932
		mu 0 4 2296 2302 2300 2294
		f 4 1939 1940 -1938 -1934
		mu 0 4 2297 2303 2304 2298
		f 4 1249 1941 -1940 -1935
		mu 0 4 2299 2305 2303 2297
		f 4 1942 -1636 1250 -1937
		mu 0 4 2300 1847 2306 2301
		f 4 1943 -1634 -1943 -1939
		mu 0 4 2302 1848 1847 2300
		f 4 1944 -1631 -1944 -1941
		mu 0 4 2303 1844 1843 2304
		f 4 1251 -1628 -1945 -1942
		mu 0 4 2305 2307 1844 2303
		f 4 -1406 1945 1252 2454
		mu 0 4 2308 2309 2310 2311
		f 4 1946 1947 1948 -1455
		mu 0 4 1647 2312 2313 1648
		f 4 -1949 1949 1950 -1861
		mu 0 4 1648 2313 2314 2315
		f 4 1951 -1858 1952 1953
		mu 0 4 2316 2317 2318 2319
		f 4 -1867 1954 -1947 1955
		mu 0 4 2320 2321 2322 2323
		f 4 -1953 -1869 1956 1957
		mu 0 4 2324 2325 2326 2327
		f 4 1958 -1461 1959 1960
		mu 0 4 2328 2329 2330 2331
		f 4 1961 -1459 1962 -1954
		mu 0 4 2332 2333 2334 2335
		f 4 -1963 -1458 -1959 1963
		mu 0 4 2336 1652 1651 2337
		f 4 -1960 -1464 1964 1965
		mu 0 4 2338 2339 2340 2341
		f 4 -1965 -1463 1966 1967
		mu 0 4 2224 2342 2343 2215
		f 4 -1462 -1962 -1958 -1967
		mu 0 4 2344 2345 2346 2347
		f 4 1968 -1468 1969 -1966
		mu 0 4 2348 2349 2350 2351
		f 4 1970 -1466 1971 1972
		mu 0 4 2352 2353 2354 2355
		f 4 -1465 -1969 -1876 -1972
		mu 0 4 2356 2357 2358 2359
		f 4 -1970 -1471 1973 -1961
		mu 0 4 2351 2350 2360 2361
		f 4 -1974 -1470 1974 1975
		mu 0 4 2337 2362 2363 2364
		f 4 -1975 -1469 -1971 1976
		mu 0 4 2365 2366 2353 2352
		f 4 1977 1978 1979 1980
		mu 0 4 2367 2368 2369 2370
		f 4 1981 -1980 1982 -1875
		mu 0 4 1430 2371 2372 2223
		f 4 1983 -1872 1984 -1973
		mu 0 4 2373 2374 2375 2376
		f 4 1985 1986 -1978 1987
		mu 0 4 2228 2377 2378 2379
		f 4 -1985 -1882 1988 -1977
		mu 0 4 2380 2381 2382 2383
		f 4 1989 -1986 -1879 1990
		mu 0 4 2384 2377 2228 2227
		f 4 -1695 1991 -1433 1992
		mu 0 4 2385 2386 1622 1621
		f 4 -1689 1993 -1693 1994
		mu 0 4 2387 2388 2389 2390
		f 4 -1981 1995 1996 1997
		mu 0 4 2367 2370 2391 2392
		f 4 -1877 -1968 -1865 1998
		mu 0 4 1431 2224 2215 1419
		f 4 -1999 -1297 1999 -1307
		mu 0 4 1431 1419 1422 1432
		f 4 2000 -1304 2001 -1299
		mu 0 4 1423 1425 1428 1424
		f 4 -1996 -1982 -1305 2002
		mu 0 4 2393 2371 1430 1429
		f 4 2003 -2003 2004 -1302
		mu 0 4 1426 2393 1429 1427
		f 4 -2002 2005 -2000 -1300
		mu 0 4 1424 1428 1432 1422
		f 4 -2005 -1308 -2006 -1303
		mu 0 4 1427 1429 1432 1428
		f 4 2006 -1298 2007 -1452
		mu 0 4 1644 2394 2395 1645
		f 4 -2001 -2007 -1443 2008
		mu 0 4 1425 1423 2396 2397
		f 4 2009 -1301 -2009 -1440
		mu 0 4 2398 1426 1425 2397
		f 4 -2004 -2010 -1429 -1997
		mu 0 4 2391 2399 2400 2392
		f 4 -1998 -1432 2010 -1988
		mu 0 4 2379 2401 2402 2228
		f 4 -1457 -2008 -1295 -1956
		mu 0 4 2323 1645 2395 2320
		f 4 -1859 -1952 -1950 2011
		mu 0 4 2403 2404 2405 2406
		f 4 -1860 -2012 -1948 2012
		mu 0 4 2407 2408 2313 2312
		f 4 -1870 -2013 -1955 2013
		mu 0 4 2409 2410 2322 2321
		f 4 -1957 -1868 -2014 -1866
		mu 0 4 2411 2412 2413 2414
		f 4 -1873 -1984 -1983 2014
		mu 0 4 2415 2416 2417 2418
		f 4 -1874 -2015 -1979 2015
		mu 0 4 2419 2420 2369 2368
		f 4 -1883 -2016 -1987 2016
		mu 0 4 2421 2422 2378 2377
		f 4 -1989 -1881 -2017 -1990
		mu 0 4 2423 2230 2229 2424;
	setAttr ".fc[1000:1499]"
		f 4 2017 -1976 -1991 -1878
		mu 0 4 2213 2337 2364 2425
		f 4 -1951 -1964 -2018 -1862
		mu 0 4 2212 2336 2337 2213
		f 4 2018 2019 2020 2021
		mu 0 4 2426 2427 2428 2429
		f 4 2022 2023 -2019 2024
		mu 0 4 2430 2431 2427 2426
		f 4 2025 2026 -2023 2027
		mu 0 4 2432 2433 2434 2435
		f 4 2028 2029 -2026 2030
		mu 0 4 2436 2437 2438 2439
		f 4 2031 2032 -2029 2033
		mu 0 4 2440 2441 2442 2443
		f 4 2034 2035 -2032 2036
		mu 0 4 2444 2445 2441 2440
		f 4 2037 2038 -2035 2039
		mu 0 4 2446 2447 2448 2449
		f 4 -2021 2040 -2038 2041
		mu 0 4 2450 2451 2452 2453
		f 4 2042 2043 2044 -1434
		mu 0 4 2454 2455 2456 2457
		f 4 2045 2046 -2043 -1992
		mu 0 4 2458 2459 2455 2454
		f 4 2047 2048 -2046 -1694
		mu 0 4 1949 2460 2461 1950
		f 4 2049 2050 -2048 -1994
		mu 0 4 2388 2462 2463 2389
		f 4 2051 2052 -2050 -1688
		mu 0 4 1641 2464 2465 2466
		f 4 2053 2054 -2052 -1449
		mu 0 4 1640 2467 2464 1641
		f 4 2055 2056 -2054 -1446
		mu 0 4 1636 2468 2469 1637
		f 4 2057 -2056 -1439 -2045
		mu 0 4 2470 2471 1625 1628
		f 4 2058 2059 2060 2061
		mu 0 4 2472 2473 2474 2475
		f 4 2062 2063 2064 -2061
		mu 0 4 2474 2476 2477 2475
		f 4 2065 2066 2067 2068
		mu 0 4 2478 2479 2480 2481
		f 4 2069 2070 2071 2072
		mu 0 4 2482 2483 2484 2485
		f 4 2073 2074 2075 2076
		mu 0 4 2486 2487 2136 2488
		f 4 -2075 2077 2078 -1832
		mu 0 4 2136 2487 2489 2137
		f 4 2079 2080 2081 -2079
		mu 0 4 2490 2491 2492 2493
		f 4 -2081 2082 2083 -1836
		mu 0 4 2494 2495 2496 2497
		f 4 2084 2085 -2084 2086
		mu 0 4 2498 2499 2500 2501
		f 4 2087 2088 2089 2090
		mu 0 4 2502 2503 2504 2505
		f 4 2091 2092 2093 -2090
		mu 0 4 2506 2507 2508 2509
		f 4 2094 2095 2096 2097
		mu 0 4 2510 2511 2512 2513
		f 4 2098 2099 2100 -2097
		mu 0 4 2514 2515 2516 2517
		f 4 2101 2102 2103 2104
		mu 0 4 2518 2519 2520 2521
		f 4 2105 2106 2107 -1840
		mu 0 4 2522 2523 2524 2525
		f 4 2108 2109 2110 -2059
		mu 0 4 2526 2527 2528 2529
		f 4 2111 2112 -2102 2113
		mu 0 4 2530 2531 2532 2533
		f 4 2114 2115 2116 2117
		mu 0 4 2534 2535 2536 2537
		f 4 2118 2119 2120 -2071
		mu 0 4 2538 2539 2540 2541
		f 4 -2108 2121 2122 2123
		mu 0 4 2525 2524 2542 2543
		f 4 2124 2125 -2115 2126
		mu 0 4 2544 2545 2546 2547
		f 4 2127 2128 2129 -2085
		mu 0 4 2498 2548 2549 2499
		f 4 -2130 2130 2131 -2106
		mu 0 4 2499 2549 2550 2551
		f 4 2132 -2103 2133 2134
		mu 0 4 2552 2553 2554 2555
		f 4 -2111 2135 -2128 2136
		mu 0 4 2556 2557 2558 2559
		f 4 -2134 -2113 2137 2138
		mu 0 4 2560 2561 2562 2563
		f 4 2139 -2091 2140 2141
		mu 0 4 2564 2565 2566 2567
		f 4 2142 -2089 2143 -2135
		mu 0 4 2568 2569 2570 2571
		f 4 -2144 -2088 -2140 2144
		mu 0 4 2572 2503 2502 2573
		f 4 -2141 -2094 2145 2146
		mu 0 4 2574 2575 2576 2577
		f 4 -2146 -2093 2147 2148
		mu 0 4 2578 2579 2580 2581
		f 4 -2092 -2143 -2139 -2148
		mu 0 4 2582 2583 2584 2585
		f 4 2149 -2098 2150 -2147
		mu 0 4 2586 2587 2588 2589
		f 4 2151 -2096 2152 2153
		mu 0 4 2590 2591 2592 2593
		f 4 -2095 -2150 -2120 -2153
		mu 0 4 2594 2595 2596 2597
		f 4 -2151 -2101 2154 -2142
		mu 0 4 2589 2588 2598 2599
		f 4 -2155 -2100 2155 2156
		mu 0 4 2600 2516 2515 2601
		f 4 -2156 -2099 -2152 2157
		mu 0 4 2602 2603 2591 2590
		f 4 2158 2159 2160 2161
		mu 0 4 2604 2605 2606 2607
		f 4 2162 -2161 2163 -2119
		mu 0 4 2538 2608 2609 2539
		f 4 2164 -2116 2165 -2154
		mu 0 4 2610 2611 2612 2613
		f 4 2166 2167 -2159 2168
		mu 0 4 2132 2614 2615 2616
		f 4 -2166 -2126 2169 -2158
		mu 0 4 2617 2618 2619 2620
		f 4 2170 -2167 -2123 2171
		mu 0 4 2621 2614 2132 2622
		f 4 -2162 2172 2173 2174
		mu 0 4 2604 2607 2623 2624
		f 4 -2121 -2149 -2109 2175
		mu 0 4 2541 2540 2527 2526
		f 4 -2176 -2062 2176 -2072
		mu 0 4 2541 2526 2625 2626
		f 4 2177 -2069 2178 -2064
		mu 0 4 2476 2478 2481 2477
		f 4 -2173 -2163 -2070 2179
		mu 0 4 2627 2628 2483 2482
		f 4 2180 -2180 2181 -2067
		mu 0 4 2479 2627 2482 2480
		f 4 -2179 2182 -2177 -2065
		mu 0 4 2629 2630 2626 2625
		f 4 -2182 -2073 -2183 -2068
		mu 0 4 2631 2632 2626 2630
		f 4 2183 -2063 2184 -2083
		mu 0 4 2633 2634 2635 2636
		f 4 -2178 -2184 -2080 2185
		mu 0 4 2478 2476 2637 2638
		f 4 2186 -2066 -2186 -2078
		mu 0 4 2639 2479 2478 2638
		f 4 -2181 -2187 -2074 -2174
		mu 0 4 2623 2640 2641 2624
		f 4 -2175 -2077 -1828 -2169
		mu 0 4 2616 2642 2133 2132
		f 4 -2087 -2185 -2060 -2137
		mu 0 4 2559 2643 2644 2556
		f 4 -2104 -2133 -2131 2187
		mu 0 4 2645 2646 2647 2648
		f 4 -2105 -2188 -2129 2188
		mu 0 4 2649 2650 2549 2548
		f 4 -2114 -2189 -2136 2189
		mu 0 4 2651 2652 2558 2557
		f 4 -2138 -2112 -2190 -2110
		mu 0 4 2653 2654 2655 2656
		f 4 -2117 -2165 -2164 2190
		mu 0 4 2657 2658 2659 2660
		f 4 -2118 -2191 -2160 2191
		mu 0 4 2661 2662 2606 2605
		f 4 -2127 -2192 -2168 2192
		mu 0 4 2663 2664 2615 2614
		f 4 -2170 -2125 -2193 -2171
		mu 0 4 2665 2545 2544 2666
		f 4 2193 -2157 -2172 -2122
		mu 0 4 2524 2573 2667 2542
		f 4 -2132 -2145 -2194 -2107
		mu 0 4 2523 2572 2573 2524
		f 4 2194 -1829 -2076 -1831
		mu 0 4 2135 2668 2488 2136
		f 4 2195 -1841 -2124 -1827
		mu 0 4 2669 2670 2671 2672
		f 4 2196 -1837 -2086 -1839
		mu 0 4 2143 2673 2674 2144
		f 4 2197 -1833 -2082 -1835
		mu 0 4 2675 2676 2493 2492
		f 4 2198 2199 -2195 2200
		mu 0 4 2677 2678 2668 2135
		f 4 -2201 -1834 2201 2202
		mu 0 4 2677 2135 2138 2679
		f 4 2203 -2202 -2198 2204
		mu 0 4 2680 2681 2676 2675
		f 4 -2205 -1838 2205 2206
		mu 0 4 2682 2139 2142 2683
		f 4 2207 -2206 -2197 2208
		mu 0 4 2684 2685 2673 2143
		f 4 -2209 -1842 2209 2210
		mu 0 4 2684 2143 2146 2686
		f 4 2211 -2210 -2196 2212
		mu 0 4 2687 2688 2670 2669
		f 4 -2213 -1830 -2200 2213
		mu 0 4 2689 2690 2691 2692
		f 4 2376 2375 2214 2215
		mu 0 4 2693 2694 2695 2696
		f 4 -2216 2216 2217 2374
		mu 0 4 2693 2696 2697 2698
		f 4 2372 -2218 2218 2219
		mu 0 4 2699 2700 2701 2702
		f 4 -2220 2220 2221 2370
		mu 0 4 2703 2704 2705 2706
		f 4 2368 -2222 2222 2223
		mu 0 4 2707 2706 2705 2708
		f 4 -2224 2224 2225 2366
		mu 0 4 2709 2710 2711 2712
		f 4 2364 -2226 2226 2227
		mu 0 4 2713 2714 2715 2716
		f 4 2377 -2228 2228 -2376
		mu 0 4 2717 2718 2719 2720
		f 4 -2215 2229 2380 2379
		mu 0 4 2696 2695 2721 2722
		f 4 -2380 2382 2381 -2217
		mu 0 4 2696 2722 2723 2697
		f 4 -2219 -2382 2384 2383
		mu 0 4 2702 2701 2724 2725
		f 4 -2384 2386 2385 -2221
		mu 0 4 2704 2726 2727 2705
		f 4 -2223 -2386 2388 2387
		mu 0 4 2708 2705 2727 2728
		f 4 -2388 2390 2389 -2225
		mu 0 4 2710 2729 2730 2711
		f 4 -2227 -2390 2392 2391
		mu 0 4 2716 2715 2731 2732
		f 4 -2392 2393 -2230 -2229
		mu 0 4 2719 2733 2734 2720
		f 4 2581 -2022 2238 2582
		mu 0 4 2735 2426 2429 2736
		f 4 2595 -2239 -2042 2239
		mu 0 4 2737 2738 2450 2453
		f 4 -2240 -2040 2240 2594
		mu 0 4 2739 2446 2449 2740
		f 4 -2241 -2037 2241 2592
		mu 0 4 2741 2444 2440 2742
		f 4 -2242 -2034 2242 2590
		mu 0 4 2742 2440 2443 2743
		f 4 -2243 -2031 2243 2588
		mu 0 4 2744 2436 2439 2745
		f 4 -2244 -2028 2244 2586
		mu 0 4 2746 2432 2435 2747
		f 4 -2245 -2025 -2582 2584
		mu 0 4 2748 2430 2426 2735
		f 4 2245 -1436 2246 -2020
		mu 0 4 2427 1621 1624 2428
		f 4 2247 -2041 -2247 -1438
		mu 0 4 1626 2452 2451 1627
		f 4 -2248 -1448 2248 -2039
		mu 0 4 2447 1635 1638 2448
		f 4 -2249 -1451 2249 -2036
		mu 0 4 2445 2749 2750 2441
		f 4 -2250 -1690 2250 -2033
		mu 0 4 2751 2752 2753 2754
		f 4 -2251 -1995 2251 -2030
		mu 0 4 2437 2387 2390 2438
		f 4 -2252 -1696 2252 -2027
		mu 0 4 2433 1948 1951 2434
		f 4 -2253 -1993 -2246 -2024
		mu 0 4 2431 2385 1621 2427
		f 4 2254 -1699 2255 2256
		mu 0 4 1614 1959 1961 1616
		f 4 -2256 -1685 2257 2258
		mu 0 4 1605 1926 1929 1606
		f 4 -2258 -1686 2259 2260
		mu 0 4 1609 1930 1933 1610
		f 4 -2260 -1687 2261 2262
		mu 0 4 2755 1934 1937 1597
		f 4 -2262 -1691 2263 2264
		mu 0 4 1597 1937 1943 1598
		f 4 -2264 -1692 2265 2266
		mu 0 4 2756 1944 1947 2757
		f 4 -2266 -1697 2267 2268
		mu 0 4 1585 1952 1955 1586
		f 4 -2268 -1698 -2255 2269
		mu 0 4 1613 1956 1959 1614
		f 4 2270 2271 2272 -1712
		mu 0 4 2758 2759 2760 2761
		f 4 2273 2274 2275 -1715
		mu 0 4 2762 2763 2764 2765
		f 4 2276 2277 2278 -1718
		mu 0 4 1984 2766 2767 1985
		f 4 2279 2280 -2277 -1721
		mu 0 4 2768 2769 2770 2771
		f 4 2281 2282 -2280 -1736
		mu 0 4 2772 2773 2769 2768
		f 4 2283 2284 -2271 -1740
		mu 0 4 2774 2775 2776 2777
		f 4 2285 2286 -2284 -1793
		mu 0 4 2778 2779 2775 2774
		f 4 -2279 2287 -2274 -1746
		mu 0 4 1985 2767 2780 2017
		f 4 -2273 2288 -2282 -1757
		mu 0 4 2781 2782 2773 2772
		f 4 -2276 2289 -2286 -1744
		mu 0 4 2765 2764 2783 2784
		f 4 2290 -1709 1253 -1770
		mu 0 4 2043 2020 2785 2786
		f 4 2291 -1751 -2291 -1767
		mu 0 4 2042 2021 2020 2043
		f 4 -2292 -1766 2292 -1281
		mu 0 4 2787 2037 2040 2788
		f 4 -2293 -1725 2293 -1754
		mu 0 4 2030 1990 1993 1864
		f 4 2294 -1646 -2294 -1732
		mu 0 4 2000 1862 1863 2001
		f 4 2295 -1644 -2295 -1884
		mu 0 4 1997 1858 1862 2000
		f 4 2296 -1642 -2296 -1728
		mu 0 4 1996 1859 1858 1997
		f 4 2297 -1288 -2297 -1762
		mu 0 4 2036 2789 1859 1996
		f 4 2298 -1289 -2298 -1760
		mu 0 4 2790 1399 1401 2791
		f 4 -2299 -1771 1254 -1286
		mu 0 4 1399 2790 2792 1396
		f 4 2299 -1864 2300 -2051
		mu 0 4 2462 2793 2794 2463
		f 4 2301 -1456 -2300 -2053
		mu 0 4 2464 1649 1648 2465
		f 4 2302 -1454 -2302 -2055
		mu 0 4 2795 1643 1646 2796
		f 4 2303 -1445 -2303 -2057
		mu 0 4 2468 1634 1633 2469
		f 4 -1442 -2304 -2058 2304
		mu 0 4 1619 1630 2471 2470
		f 4 2305 -1431 -2305 -2044
		mu 0 4 2797 2798 2799 2800
		f 4 2306 -2011 -2306 -2047
		mu 0 4 2459 2228 2402 2455
		f 4 -2301 -1880 -2307 -2049
		mu 0 4 2460 2801 2802 2461
		f 4 -2332 -2333 2330 -2330
		mu 0 4 2173 2803 1740 2149
		f 4 -2334 -2335 2331 -2329
		mu 0 4 2171 1727 1730 2172
		f 4 -2336 -2337 2333 -2327
		mu 0 4 2168 1718 1717 2165
		f 4 -2338 -2339 2335 -2325
		mu 0 4 2159 1711 1714 2164
		f 4 -2340 -2341 2337 -2323
		mu 0 4 2162 2804 1711 2159
		f 4 -2343 2339 -2321 -1844
		mu 0 4 1745 2805 2158 2157
		f 4 -2344 -2345 1843 -2319
		mu 0 4 2806 1746 1745 2157
		f 4 -2331 -2346 2343 -2317
		mu 0 4 2149 1740 1739 2150
		f 4 -1523 -2348 -2349 2346
		mu 0 4 2807 2808 2809 2810
		f 4 -2350 -2351 2347 -1521
		mu 0 4 2811 2812 2813 2814
		f 4 -1513 -2352 -2353 2349
		mu 0 4 1716 1715 2815 2816
		f 4 -2354 -2355 2351 -1511
		mu 0 4 2817 2818 2815 1715
		f 4 -1503 -2356 -2357 2353
		mu 0 4 2819 2820 2821 2822
		f 4 -2358 -2359 2355 -1501
		mu 0 4 2823 2824 2825 2826
		f 4 -1533 2253 -2361 2357
		mu 0 4 2827 1742 2828 2829
		f 4 -2347 -2362 -2254 -1531
		mu 0 4 1741 2830 2828 1742
		f 4 -2364 -2365 2362 2348
		mu 0 4 2809 2714 2713 2810
		f 4 -2366 -2367 2363 2350
		mu 0 4 2812 2709 2712 2813
		f 4 -2368 -2369 2365 2352
		mu 0 4 2815 2831 2832 2816
		f 4 -2370 -2371 2367 2354
		mu 0 4 2818 2833 2831 2815
		f 4 -2372 -2373 2369 2356
		mu 0 4 2821 2700 2699 2822
		f 4 -2374 -2375 2371 2358
		mu 0 4 2824 2693 2698 2825
		f 4 -2377 2373 2360 2359
		mu 0 4 2717 2834 2829 2828
		f 4 -2363 -2378 -2360 2361
		mu 0 4 2830 2718 2717 2828
		f 4 -2381 2378 -2199 2230
		mu 0 4 2722 2721 2678 2677
		f 4 -2383 -2231 -2203 2231
		mu 0 4 2723 2722 2677 2679
		f 4 -2385 -2232 -2204 2232
		mu 0 4 2725 2724 2681 2680
		f 4 -2387 -2233 -2207 2233
		mu 0 4 2835 2836 2837 2838
		f 4 -2389 -2234 -2208 2234
		mu 0 4 2728 2727 2839 2840
		f 4 -2391 -2235 -2211 2235
		mu 0 4 2730 2729 2684 2686
		f 4 -2393 -2236 -2212 2236
		mu 0 4 2732 2731 2688 2687
		f 4 -2394 -2237 -2214 -2379
		mu 0 4 2734 2733 2689 2692
		f 4 -2396 -2397 2394 1310
		mu 0 4 2841 2842 2843 2844
		f 4 1255 -2398 2395 -1310
		mu 0 4 2845 2846 2842 2841
		f 4 1308 1186 -2402 2399
		mu 0 4 2847 2848 2849 2850
		f 4 2553 -2403 2479 -1887
		mu 0 4 1588 1549 2851 1589
		f 4 2406 1392 2628 2627
		mu 0 4 2852 2853 1547 1550
		f 4 2549 2548 1292 2436
		mu 0 4 1414 2854 2855 1417
		f 4 2618 -2412 -2617 2619
		mu 0 4 2856 1560 1557 1556
		f 4 -2415 -1320 1320 -2414
		mu 0 4 1445 2857 1521 1520
		f 4 -2417 2413 1315 1316
		mu 0 4 1446 1445 1520 1523
		f 4 1317 1187 -2418 -1317
		mu 0 4 2858 2859 1448 1447
		f 4 1427 2404 2626 -2447
		mu 0 4 2860 1412 1415 2861
		f 4 1425 2307 -2423 2420
		mu 0 4 2862 2863 1612 1611
		f 4 1417 2309 -2425 -2308
		mu 0 4 2864 2865 1584 1583
		f 4 1416 2310 -2427 -2310
		mu 0 4 2866 2867 2868 2869
		f 4 2311 2661 2657 -2655
		mu 0 4 2870 1596 2871 2872
		f 4 1420 2312 -2431 -2312
		mu 0 4 2873 2874 1592 1591
		f 4 1422 2313 -2433 -2313
		mu 0 4 2875 2876 1608 1607
		f 4 1421 2314 -2435 -2314
		mu 0 4 2237 2877 1604 1603
		f 4 1426 -2421 -2436 -2315
		mu 0 4 2878 2879 2880 2881
		f 4 -2439 1258 -1382 -2438
		mu 0 4 2196 2195 1530 1529
		f 4 -1380 -2440 -2441 2437
		mu 0 4 1527 1526 2189 2191
		f 4 -2443 2439 -1374 -2442
		mu 0 4 2882 2883 1516 1515
		f 4 -1372 -2444 -2464 2466
		mu 0 4 1513 1510 2184 2183
		f 4 -2452 -2413 2414 -1315
		mu 0 4 1443 2855 2857 1445
		f 4 -2453 -1293 2451 -1312
		mu 0 4 1406 1417 2855 1443
		f 4 -2454 -2455 1260 -1919
		mu 0 4 2884 1566 2885 2886
		f 4 -2457 2453 1406 1407
		mu 0 4 1567 1566 2884 2887
		f 4 1409 -2458 -2459 -1408
		mu 0 4 1574 1485 1570 1569
		f 4 -2461 2457 1344 1345
		mu 0 4 2888 1570 1485 1488
		f 4 -2492 2494 -1350 -2462
		mu 0 4 2889 2890 1490 1489
		f 4 2444 -2512 2514 2513
		mu 0 4 2882 2183 2186 2891
		f 4 -2466 -2467 -2445 2441
		mu 0 4 1515 1513 2183 2882
		f 4 -2469 2465 1372 -2468
		mu 0 4 1514 1513 1515 1518
		f 4 -2470 -2573 2575 2574
		mu 0 4 2892 2893 2894 2895
		f 4 -2472 -2473 2469 1319
		mu 0 4 1453 1452 2893 2892
		f 4 1887 -2476 2473 -1427
		mu 0 4 2896 2231 2234 2897
		f 4 -1417 -2479 -2480 -1891
		mu 0 4 2898 2899 2900 2901
		f 4 1885 -2482 2478 -1418
		mu 0 4 2864 1590 1589 2865
		f 4 -1426 -2474 -2483 -1886
		mu 0 4 2902 2897 2234 2247
		f 4 -2485 -2486 2483 1261
		mu 0 4 2903 2904 1411 1410
		f 4 -2487 -2619 2620 1270
		mu 0 4 1561 1564 2905 2906
		f 4 1490 -2526 2528 2527
		mu 0 4 2251 2907 2908 2252
		f 4 -2460 2462 -2493 -1491
		mu 0 4 2251 2909 2890 2907
		f 4 -2495 -2463 -1346 -2494
		mu 0 4 1490 2890 2909 2910
		f 4 -2496 -2497 2493 -1348
		mu 0 4 1469 1467 1490 2910
		f 4 -2499 2495 1334 1335
		mu 0 4 1468 1467 1469 1472
		f 4 1192 -2500 -1336 -1341
		mu 0 4 1475 1477 1480 1476
		f 4 2503 -2446 2510 2509
		mu 0 4 2184 2911 2912 2185
		f 4 -2504 2443 -1366 -2503
		mu 0 4 2911 2184 1510 1509
		f 4 -2506 2502 -1364 -2505
		mu 0 4 2182 2181 2913 2914
		f 4 -2508 2504 -1358 -2507
		mu 0 4 2915 2916 1501 1500
		f 4 1259 -2509 2506 -1356
		mu 0 4 1499 2917 2915 1500
		f 4 2524 2523 1845 -2511
		mu 0 4 2918 1692 1691 2919
		f 4 -2513 -1846 1846 2464
		mu 0 4 2920 2919 1691 2273
		f 4 -2515 -2465 2461 1847
		mu 0 4 2921 2920 2273 2922
		f 4 -1349 1848 -2517 -1848
		mu 0 4 1489 1466 2188 2187
		f 4 -2519 -1849 -1333 1849
		mu 0 4 2192 2188 1466 1465
		f 4 -1342 1240 -2520 -1850
		mu 0 4 2923 2924 2194 2193
		f 4 2508 1264 -1352 -2523
		mu 0 4 2176 2925 2926 2177
		f 4 -2502 -1474 2500 -2525
		mu 0 4 2260 2263 2927 2928
		f 4 2490 -2527 -2501 -1477
		mu 0 4 2929 1689 1692 2930
		f 4 -2529 -2491 1491 1492
		mu 0 4 2252 2908 2931 2932
		f 4 1891 -2531 -1493 -1494
		mu 0 4 2933 2249 2252 2932
		f 4 -2533 -1892 -1487 1892
		mu 0 4 2254 2253 2934 2935
		f 4 1893 -2535 -1893 -1489
		mu 0 4 2936 2255 2256 2937
		f 4 -2538 -2539 -2537 -1845
		mu 0 4 2177 2938 2939 2178
		f 4 1193 -2540 2537 1351
		mu 0 4 2926 2940 2938 2177
		f 4 1894 -2542 -1894 -1481
		mu 0 4 2941 2257 2258 2942
		f 4 1895 -2543 -1895 -1483
		mu 0 4 2943 2259 2257 2941
		f 4 2543 -2546 -2475 2547
		mu 0 4 2944 2945 2232 2231
		f 4 -2560 2561 -2568 2570
		mu 0 4 2946 2947 1455 1458
		f 4 -2548 -1888 -1422 -2477
		mu 0 4 2236 2948 2877 2237
		f 4 -2545 2546 -2552 -2550
		mu 0 4 2949 2945 2950 1451
		f 4 2558 -2547 -2544 1423
		mu 0 4 2951 2950 2945 2944
		f 4 2560 2559 2571 2472
		mu 0 4 1452 2947 2946 2893
		f 4 -2557 1418 1419 -2395
		mu 0 4 2952 2951 2953 2954
		f 4 2551 2550 -2561 -2556
		mu 0 4 1451 2950 2947 1452
		f 4 -2562 -2551 -2559 2557
		mu 0 4 1455 2947 2950 2951
		f 4 -2564 -2558 2556 1321
		mu 0 4 1456 1455 2951 2952
		f 4 -2565 -2566 -1322 2396
		mu 0 4 2955 1464 1456 2952
		f 4 2397 1189 -2567 2564
		mu 0 4 2842 2846 2956 2957
		f 4 1322 1323 1324 -2569
		mu 0 4 1457 1462 1504 1458
		f 4 1325 -2570 -2571 -1325
		mu 0 4 1504 1512 2946 1458
		f 4 -2572 2569 2573 2572
		mu 0 4 2893 2946 1512 2894
		f 4 -2574 -1369 1369 2470
		mu 0 4 2894 1512 1511 1514
		f 4 -2576 -2471 2467 1370
		mu 0 4 2895 2894 1514 1518
		f 4 1376 -2578 -1371 -1376
		mu 0 4 1525 1519 1522 2958
		f 4 -2580 -1377 1377 1378
		mu 0 4 1524 1519 1525 1528
		f 4 1197 -2581 -1379 -1383
		mu 0 4 1531 1533 1536 1532
		f 4 -2599 -2594 -2595 2591
		mu 0 4 1932 1931 2739 2740
		f 4 -2601 -2592 -2593 2589
		mu 0 4 1936 1935 2741 2742
		f 4 -2603 -2590 -2591 2587
		mu 0 4 1942 1936 2742 2743
		f 4 -2605 -2588 -2589 2585
		mu 0 4 1946 1945 2744 2745
		f 4 -2607 -2586 -2587 2583
		mu 0 4 1954 1953 2746 2747
		f 4 -2609 -2584 -2585 -2238
		mu 0 4 1958 1957 2748 2735
		f 4 -2610 -2611 2237 -2583
		mu 0 4 2736 1960 1958 2735
		f 4 -2612 2609 -2596 2593
		mu 0 4 1928 1927 2738 2737
		f 4 2637 1424 2446 2625
		mu 0 4 2959 2248 2233 2960
		f 4 2447 2418 -2618 2615
		mu 0 4 1418 1402 1556 1555
		f 4 2487 -2620 -2419 2419
		mu 0 4 1405 2856 1556 1402
		f 4 -2621 -2488 2484 1201
		mu 0 4 2961 2962 2904 2903
		f 4 -2624 2621 -2616 -2623
		mu 0 4 2963 2964 1418 1555
		f 4 -2625 2622 -2449 -2409
		mu 0 4 2852 2965 2966 2967
		f 4 -2632 -2626 2636 2635
		mu 0 4 2964 2968 2861 2969
		f 4 2632 2631 2623 -2630
		mu 0 4 2970 2971 2972 2965
		f 4 2630 2629 2624 -2628
		mu 0 4 1550 2970 2965 2852
		f 4 2639 -2554 -2639 -2631
		mu 0 4 1550 1549 1588 2970
		f 4 2638 -2553 -2638 -2633
		mu 0 4 2973 2974 2248 2959
		f 4 -2634 -2635 -2437 -2613
		mu 0 4 1416 2969 1414 1417
		f 4 -2636 2633 -2451 -2622
		mu 0 4 2964 2969 1416 1418
		f 4 -2637 -2627 -2404 2634
		mu 0 4 2969 2861 1415 1414
		f 4 -2642 2401 1256 -2660
		mu 0 4 1434 2850 2849 1435
		f 4 2660 1272 1309 2642
		mu 0 4 1433 1436 2845 2841
		f 4 2400 2641 -2648 -2646
		mu 0 4 2975 2850 1434 1442
		f 4 -1311 2644 2648 -2643
		mu 0 4 2841 2844 1441 1433
		f 4 2398 2645 -2651 -2650
		mu 0 4 2976 2977 1600 1599
		f 4 -1420 2651 2652 -2645
		mu 0 4 2954 2953 1602 1601
		f 4 2477 2654 -2656 -2652
		mu 0 4 2978 2979 2241 2240
		f 4 1890 2649 -2659 -2657
		mu 0 4 2980 2981 2982 2983
		f 4 -2429 -2311 2656 -2662
		mu 0 4 1596 1595 2984 2871
		f 4 2554 1387 -2664 -2663
		mu 0 4 1549 1548 1543 2985
		f 4 -2665 -2399 2402 2662
		mu 0 4 2985 2986 2851 1549
		f 4 2665 2663 1388 -1387
		mu 0 4 2987 2985 1543 1546
		f 4 -2401 2664 -2666 -2400
		mu 0 4 2850 2975 2988 2847
		f 4 2666 1476 -2668 -2669
		mu 0 4 1672 2929 2930 1673
		f 4 -2671 2667 1473 1474
		mu 0 4 1670 1669 2927 2263
		f 4 -2673 -1475 1482 -2672
		mu 0 4 1677 1680 2943 2941
		f 4 -2675 2671 1480 1481
		mu 0 4 1678 1677 2941 2942
		f 4 -2677 -1482 1488 -2676
		mu 0 4 1687 1686 2936 2937
		f 4 -2679 2675 1486 1487
		mu 0 4 1684 1683 2935 2934
		f 4 -2681 -1488 1493 1494
		mu 0 4 1693 1684 2934 2989
		f 4 -1492 -2667 -2682 -1495
		mu 0 4 2990 2991 2275 2274
		f 4 -1529 1842 -2685 2682
		mu 0 4 1738 1734 2148 2147
		f 4 -2687 -1843 -1525 -2686
		mu 0 4 2174 2148 1734 1733
		f 4 -1519 -2688 -2689 2685
		mu 0 4 1726 1725 2170 2169
		f 4 -2691 2687 -1517 -2690
		mu 0 4 2167 2166 1719 1722
		f 4 -1509 -2692 -2693 2689
		mu 0 4 1710 1705 2160 2163
		f 4 -2695 2691 -1507 -2694
		mu 0 4 2161 2160 1705 1708
		f 4 -1499 -2696 -2697 2693
		mu 0 4 1698 1697 2152 2992
		f 4 -2698 2695 -1535 -2683
		mu 0 4 2153 2152 1697 1748
		f 4 -2700 -2701 2698 2717
		mu 0 4 2993 1881 1884 2994
		f 4 2719 -2702 -2703 2699
		mu 0 4 2995 2996 1886 1885
		f 4 -2704 -2705 2701 2721
		mu 0 4 2997 1889 1886 2996
		f 4 2723 -2706 -2707 2703
		mu 0 4 2997 2998 1891 1889
		f 4 -2708 -2709 2705 2725
		mu 0 4 2999 3000 1891 2998
		f 4 2727 -2710 -2711 2707
		mu 0 4 3001 3002 1897 1893
		f 4 -2712 -2713 2709 2729
		mu 0 4 3003 1899 1902 3004
		f 4 2731 2730 -2715 2711
		mu 0 4 3003 3005 1903 1899
		f 4 -2717 -2718 2715 2732
		mu 0 4 3006 2993 2994 3007
		f 4 2733 -2719 -2720 2716
		mu 0 4 3006 3008 3009 2993
		f 4 -2721 -2722 2718 2734
		mu 0 4 3010 2997 2996 3011
		f 4 2735 -2723 -2724 2720
		mu 0 4 3010 3012 2998 2997
		f 4 -2725 -2726 2722 2736
		mu 0 4 3013 2999 2998 3012
		f 4 2737 -2727 -2728 2724
		mu 0 4 3014 3015 3002 3001
		f 4 -2729 -2730 2726 2738
		mu 0 4 3016 3003 3004 3017
		f 4 2740 2739 -2732 2728
		mu 0 4 3016 3018 3005 3003
		f 4 -2743 -2733 2741 -1384
		mu 0 4 3019 3006 3007 3020
		f 4 -1391 -2744 -2734 2742
		mu 0 4 3019 3021 3008 3006
		f 4 -2745 -2735 2743 -1392
		mu 0 4 3022 3010 3011 3023
		f 4 -1393 -2746 -2736 2744
		mu 0 4 3022 3024 3012 3010
		f 4 -2747 -2737 2745 -1394
		mu 0 4 1551 3014 3025 1552
		f 4 -1395 -2748 -2738 2746
		mu 0 4 1551 1558 3015 3014
		f 4 -2749 -2739 2747 -1396
		mu 0 4 1559 3026 3015 1558
		f 4 -1397 1202 -2741 2748
		mu 0 4 3027 3028 3018 3016
		f 4 -1768 1769 1235 -2750
		mu 0 4 3029 3030 3031 3032
		f 4 -1723 2753 2755 -2755
		mu 0 4 3033 2039 3034 3035
		f 4 -1726 2756 2758 -2758
		mu 0 4 3036 3037 3038 3039
		f 4 -1730 2754 2760 -2760
		mu 0 4 3040 3041 3042 3043
		f 4 -1758 2761 2763 -2763
		mu 0 4 3044 3045 3046 3047
		f 4 -1763 2757 2764 -2762
		mu 0 4 3048 3036 3039 3049
		f 4 -1765 2765 2766 -2754
		mu 0 4 2039 2038 3050 3034
		f 4 -1769 2767 2768 -2766
		mu 0 4 3051 3029 3052 3053
		f 4 -1885 2759 2769 -2757
		mu 0 4 3054 3055 3056 3057
		f 4 -2753 -2752 2762 2772
		mu 0 4 3058 3059 3060 3061
		f 4 2770 -2772 -2768 2749
		mu 0 4 3032 3062 3052 3029
		f 4 1705 2774 -2776 -2774
		mu 0 4 2029 3063 1967 1966
		f 4 -1703 2776 2777 -2775
		mu 0 4 3063 2027 1968 1967
		f 4 1706 2778 -2780 -2777
		mu 0 4 2027 2026 1969 1968
		f 4 1707 2773 -2781 -2779
		mu 0 4 2026 2029 1966 1969
		f 4 -1564 1713 -2784 2781
		mu 0 4 3064 3065 1979 1978
		f 4 1744 -2785 -2786 -1714
		mu 0 4 3066 3067 1982 2016
		f 4 -1658 1716 -2788 2784
		mu 0 4 3067 3068 1983 1982
		f 4 -1652 1719 -2790 -1717
		mu 0 4 3069 2003 1987 1986
		f 4 -2792 -1720 -1733 1734
		mu 0 4 2006 1987 2003 2002
		f 4 -2794 -1735 -1756 -2793
		mu 0 4 1974 2006 2002 1869
		f 4 -1650 1710 -2796 2792
		mu 0 4 1869 1868 1975 1974
		f 4 -2798 -1711 -1738 1738
		mu 0 4 2010 1975 1868 2009
		f 4 -2800 -1739 1791 -2799
		mu 0 4 2070 2010 2009 2012
		f 4 -2801 2798 -1741 -2782
		mu 0 4 1978 2015 3070 3064
		f 4 -2805 -2804 -2803 -2802
		mu 0 4 3071 3072 3073 3074
		f 4 2803 -2807 -1185 -2806
		mu 0 4 3075 3076 3077 3078
		f 4 -2811 -2810 -2809 -2808
		mu 0 4 3079 3080 3081 3082
		f 4 -2814 -2813 -2812 -1186
		mu 0 4 3083 3084 3085 3086
		f 4 2812 -2817 -2816 -2815
		mu 0 4 3085 3084 3087 3088
		f 4 3947 -4014 -3934 -2818
		mu 0 4 3089 3090 3091 3092
		f 4 4142 -2819 -4142 3933
		mu 0 4 3091 3093 3094 3092
		f 4 -4143 4011 -1201 -2820
		mu 0 4 3095 3096 3097 3098
		f 4 3932 -3932 -4073 -4074
		mu 0 4 3099 3100 3101 3102
		f 4 4141 -3981 -4141 3977
		mu 0 4 3092 3094 3103 3104
		f 4 3975 2817 -3978 -3979
		mu 0 4 3105 3089 3092 3104
		f 4 -2825 -2824 -2823 -2822
		mu 0 4 3106 3107 3108 3109
		f 4 2823 -2828 -2827 -2826
		mu 0 4 3108 3107 3110 3111
		f 4 -2832 -2831 -2830 -2829
		mu 0 4 3112 3113 3114 3115
		f 4 -2836 -2835 -2834 -2833
		mu 0 4 3116 3117 3118 3119
		f 4 4188 -1272 -4188 -4172
		mu 0 4 3120 3121 3122 3123
		f 4 -2856 -2855 -1269 -4095
		mu 0 4 3124 3125 3126 3127
		f 4 4176 4171 -4176 -4175
		mu 0 4 3128 3120 3123 3129
		f 4 -2842 -2841 -2840 2818
		mu 0 4 3093 3130 3131 3094
		f 4 2840 -3944 -3945 -2843
		mu 0 4 3131 3130 3132 3133
		f 4 3943 -2847 -1258 -3946
		mu 0 4 3134 3135 3136 3137
		f 4 2846 2841 2819 -1189
		mu 0 4 3136 3135 3095 3098
		f 4 4076 -3941 -4000 -4084
		mu 0 4 3138 3139 3140 3141
		f 4 -4096 -4097 -4091 -4092
		mu 0 4 3142 3143 3144 3145
		f 4 2854 -2858 -2857 -1191
		mu 0 4 3126 3125 3146 3147
		f 4 2857 -2860 2850 -2859
		mu 0 4 3148 3149 3144 3150
		f 4 -4094 4090 2859 2855
		mu 0 4 3151 3145 3144 3149
		f 4 -4026 -4027 -2862 -2861
		mu 0 4 3152 3153 3154 3155
		f 4 2862 -2867 -2866 -2865
		mu 0 4 3156 3157 3158 3159
		f 4 2866 -2869 -1192 -2868
		mu 0 4 3160 3161 3162 3163
		f 4 -4028 4025 -2870 -1264
		mu 0 4 3164 3165 3166 3167
		f 4 -3988 -3989 -2872 -2871
		mu 0 4 3168 3169 3170 3171
		f 4 2872 -2876 2864 -2875
		mu 0 4 3172 3173 3174 3175
		f 4 -4025 -2878 -2877 2861
		mu 0 4 3154 3176 3177 3155
		f 4 -4068 -2879 -2881 -1268
		mu 0 4 3178 3179 3180 3181
		f 4 2880 4063 3473 -1267
		mu 0 4 3181 3180 3182 3183
		f 4 -2883 -2882 -1195 2856
		mu 0 4 3146 3184 3185 3147
		f 4 2881 -2885 -2884 -1196
		mu 0 4 3185 3184 3186 3187
		f 4 2884 -2888 -2887 -2886
		mu 0 4 3186 3184 3188 3189
		f 4 2887 2882 2858 -2889
		mu 0 4 3188 3184 3146 3190
		f 4 -2891 -2890 2888 2851
		mu 0 4 3191 3192 3193 3150
		f 4 2889 -2893 -2892 2886
		mu 0 4 3188 3194 3195 3189
		f 4 2892 -2896 -2895 -2894
		mu 0 4 3196 3192 3197 3198
		f 4 2895 2890 2853 -2897
		mu 0 4 3197 3192 3191 3199
		f 4 2897 -3997 -2900 2894
		mu 0 4 3197 3200 3201 3198
		f 4 2900 -2904 -2903 -2902
		mu 0 4 3202 3203 3204 3205
		f 4 -4106 4102 2848 -4105
		mu 0 4 3206 3207 3208 3209
		f 4 -4107 -4108 4104 2843
		mu 0 4 3210 3211 3206 3209
		f 4 2905 -2909 -2908 2902
		mu 0 4 3212 3213 3214 3215
		f 4 2908 -2911 -1197 -2910
		mu 0 4 3216 3217 3218 3219
		f 4 -4109 4106 2845 -1270
		mu 0 4 3220 3221 3222 3223
		f 4 -2914 -2913 -1199 -2912
		mu 0 4 3224 3225 3226 3227
		f 4 2912 -2915 2836 -1200
		mu 0 4 3226 3225 3228 3229
		f 4 2916 2913 -2919 -2918
		mu 0 4 3230 3231 3232 3233
		f 4 4168 2915 2917 -2920
		mu 0 4 3234 3235 3230 3233
		f 4 4156 4167 4082 -4169
		mu 0 4 3234 3236 3237 3235
		f 4 -3936 -3937 3934 -2922
		mu 0 4 3238 3239 3240 3241
		f 4 -3977 3938 -4145 -4146
		mu 0 4 3242 3239 3243 3244
		f 4 -3939 3935 -2923 -3938
		mu 0 4 3243 3239 3238 3245
		f 4 -4017 -3940 3937 -2924
		mu 0 4 3246 3247 3243 3245
		f 4 -4015 4016 -2925 -1263
		mu 0 4 3248 3249 3250 3251
		f 4 -2937 -3984 -3985 -2934
		mu 0 4 3252 3253 3254 3255
		f 4 3983 -2939 2871 -3987
		mu 0 4 3256 3257 3258 3259
		f 4 -2941 2937 2874 -2940
		mu 0 4 3260 3261 3172 3175
		f 4 -2943 -2942 2939 2865
		mu 0 4 3262 3263 3260 3175
		f 4 -2944 2942 2867 -1204
		mu 0 4 3264 3265 3160 3163
		f 4 3951 3794 -3954 -3955
		mu 0 4 3266 3267 3268 3269
		f 4 3949 3796 -3952 -3953
		mu 0 4 3270 3271 3272 3273
		f 4 -4009 -4010 -3415 -4081
		mu 0 4 3274 3275 3276 3277
		f 4 3955 3790 -3958 -3959
		mu 0 4 3278 3279 3280 3281
		f 4 3953 3792 -3956 -3957
		mu 0 4 3282 3283 3284 3285
		f 4 -4182 4180 4174 -4179
		mu 0 4 3286 3287 3288 3289
		f 4 3959 3786 -3962 -3963
		mu 0 4 3290 3291 3292 3293
		f 4 3957 3788 -3960 -3961
		mu 0 4 3294 3295 3296 3297
		f 4 -3837 3797 -3950 -3951
		mu 0 4 3298 3299 3300 3301
		f 4 3961 3784 3836 -3964
		mu 0 4 3302 3303 3299 3298
		f 4 -2960 -2959 -2958 -2957
		mu 0 4 3304 3305 3306 3307
		f 4 -2964 -2963 -2962 -2961
		mu 0 4 3308 3309 3310 3311
		f 4 -2967 2962 -2966 -2965
		mu 0 4 3312 3313 3314 3315
		f 4 -2970 -2969 -2968 2957
		mu 0 4 3306 3316 3317 3307
		f 4 2968 -2973 -2972 -2971
		mu 0 4 3318 3319 3320 3321
		f 4 -2976 -2975 -2974 2964
		mu 0 4 3322 3323 3324 3325
		f 4 -2979 -2978 -2977 2974
		mu 0 4 3326 3327 3328 3329
		f 4 -2982 -2981 -2980 2971
		mu 0 4 3330 3331 3332 3333
		f 4 -2985 2980 -2984 -2983
		mu 0 4 3334 3335 3336 3337
		f 4 -2989 -2988 -2987 -2986
		mu 0 4 3338 3339 3340 3341
		f 4 2987 -2992 -2991 -2990
		mu 0 4 3342 3343 3344 3345
		f 4 -2996 -2995 -2994 -2993
		mu 0 4 3346 3347 3348 3349
		f 4 2994 -2999 -2998 -2997
		mu 0 4 3350 3351 3352 3353
		f 4 -4198 -4199 -3001 -3000
		mu 0 4 3354 3355 3356 3357
		f 4 -3006 3000 -4197 -3004
		mu 0 4 3358 3359 3360 3361
		f 4 -4202 -4203 -3008 -3007
		mu 0 4 3362 3363 3364 3365
		f 4 -3012 3007 -4201 4197
		mu 0 4 3366 3365 3364 3367
		f 4 -4206 -4207 -3014 -3013
		mu 0 4 3368 3369 3370 3371
		f 4 -3018 3013 -4205 4201
		mu 0 4 3372 3373 3374 3375
		f 4 -4055 4051 -4018 -4054
		mu 0 4 3376 3377 3378 3379
		f 4 -3024 -4208 -4209 4205
		mu 0 4 3368 3380 3381 3369
		f 4 -3028 -3027 -3026 -3025
		mu 0 4 3382 3383 3384 3385
		f 4 -3871 -3030 -3029 -3870
		mu 0 4 3386 3387 3388 3389
		f 4 3029 -3869 -3032 -3031
		mu 0 4 3388 3387 3390 3391
		f 4 -3035 3027 -3034 -3033
		mu 0 4 3392 3393 3394 3395
		f 4 -3038 -3037 3032 -3036
		mu 0 4 3396 3397 3392 3395
		f 4 -3867 -3040 -3039 3031
		mu 0 4 3398 3399 3400 3401
		f 4 3039 -3865 -3042 -3041
		mu 0 4 3402 3403 3404 3405
		f 4 -3045 3037 -3044 -3043
		mu 0 4 3406 3407 3408 3409
		f 4 -3048 -3047 3042 -3046
		mu 0 4 3410 3411 3412 3413
		f 4 -3863 -3050 -3049 3041
		mu 0 4 3414 3415 3416 3417
		f 4 3049 -3861 -3052 -3051
		mu 0 4 3416 3415 3418 3419
		f 4 3047 -3055 -3054 -3053
		mu 0 4 3420 3421 3422 3423
		f 4 -3058 -3057 3053 -3056
		mu 0 4 3424 3425 3423 3422
		f 4 -3060 -3059 3051 -3874
		mu 0 4 3426 3427 3428 3429
		f 4 3059 -3873 3869 -3061
		mu 0 4 3430 3431 3432 3433
		f 4 -3063 3057 -3062 3025
		mu 0 4 3384 3434 3435 3385;
	setAttr ".fc[1500:1999]"
		f 4 -3066 -3065 -1205 -3064
		mu 0 4 3436 3437 3438 3439
		f 4 3064 -3068 -3067 -1206
		mu 0 4 3440 3441 3442 3443
		f 4 3067 -3071 -3070 -3069
		mu 0 4 3444 3437 3445 3446
		f 4 3070 3065 -3073 -3072
		mu 0 4 3445 3437 3436 3447
		f 4 -3076 -3075 3071 -3074
		mu 0 4 3448 3449 3450 3451
		f 4 3074 -3078 -3077 3069
		mu 0 4 3450 3449 3452 3453
		f 4 3077 -3081 -3080 -3079
		mu 0 4 3452 3449 3454 3455
		f 4 3080 3075 -3083 -3082
		mu 0 4 3454 3449 3448 3456
		f 4 -3087 -3086 -3085 -3084
		mu 0 4 3457 3458 3459 3456
		f 4 -3091 -3090 -3089 -3088
		mu 0 4 3460 3461 3462 3463
		f 4 -3095 -3094 -3093 -3092
		mu 0 4 3464 3465 3466 3467
		f 4 3093 -3097 -3096 3088
		mu 0 4 3468 3469 3470 3471
		f 4 3096 -3099 -1207 -3098
		mu 0 4 3470 3469 3472 3473
		f 4 3098 3094 -3100 -1208
		mu 0 4 3472 3469 3474 3475
		f 4 -3103 -1209 -3102 -3101
		mu 0 4 3476 3477 3478 3479
		f 4 -3106 3100 -3105 -3104
		mu 0 4 3480 3476 3479 3481
		f 4 -3109 3103 -3108 -3107
		mu 0 4 3482 3483 3484 3485
		f 4 -3111 3106 -3110 -1210
		mu 0 4 3486 3482 3485 3487
		f 4 -3114 -3113 -3112 -1211
		mu 0 4 3488 3489 3490 3491
		f 4 -3117 -3116 -3115 3112
		mu 0 4 3489 3492 3493 3490
		f 4 -3120 -3119 -3118 3115
		mu 0 4 3494 3495 3496 3497
		f 4 -3122 -1212 -3121 3118
		mu 0 4 3495 3498 3499 3496
		f 4 -3125 -3124 -3123 -1213
		mu 0 4 3500 3501 3502 3503
		f 4 -3128 -3127 -3126 3123
		mu 0 4 3501 3504 3505 3502
		f 4 -3131 -3130 -3129 3126
		mu 0 4 3506 3507 3508 3509
		f 4 -3133 -1214 -3132 3129
		mu 0 4 3507 3510 3511 3508
		f 4 -3136 -3135 -3134 -1215
		mu 0 4 3512 3513 3514 3515
		f 4 -3139 -3138 -3137 3134
		mu 0 4 3513 3516 3517 3514
		f 4 -3142 -3141 -3140 3137
		mu 0 4 3518 3519 3520 3521
		f 4 -3144 -1216 -3143 3140
		mu 0 4 3519 3522 3523 3520
		f 4 -1217 3109 -3145 3135
		mu 0 4 3512 3487 3485 3513
		f 4 3144 3107 -3146 3138
		mu 0 4 3513 3485 3484 3516
		f 4 3145 3104 -3147 3141
		mu 0 4 3518 3481 3479 3519
		f 4 3146 3101 -1218 3143
		mu 0 4 3519 3479 3478 3522
		f 4 -1219 3133 -3148 3113
		mu 0 4 3488 3515 3514 3489
		f 4 3147 3136 -3149 3116
		mu 0 4 3489 3514 3517 3492
		f 4 3148 3139 -3150 3119
		mu 0 4 3494 3521 3520 3495
		f 4 3149 3142 -1220 3121
		mu 0 4 3495 3520 3523 3498
		f 4 -1221 3111 -3151 3124
		mu 0 4 3500 3491 3490 3501
		f 4 3150 3114 -3152 3127
		mu 0 4 3501 3490 3493 3504
		f 4 3151 3117 -3153 3130
		mu 0 4 3506 3497 3496 3507
		f 4 3152 3120 -1222 3132
		mu 0 4 3507 3496 3499 3510
		f 4 -1223 -3156 -3155 -3154
		mu 0 4 3524 3525 3526 3527
		f 4 3154 -3159 -3158 -3157
		mu 0 4 3528 3529 3530 3531
		f 4 3157 -3162 -3161 -3160
		mu 0 4 3532 3533 3534 3535
		f 4 3160 -3164 -1224 -3163
		mu 0 4 3536 3537 3538 3539
		f 4 -3166 -3165 -1225 2811
		mu 0 4 3540 3541 3542 3543
		f 4 3164 -3167 3063 -1226
		mu 0 4 3542 3541 3436 3439
		f 4 3166 -3169 -3168 3072
		mu 0 4 3436 3541 3544 3447
		f 4 3168 3165 2814 -3170
		mu 0 4 3545 3546 3547 3548
		f 4 -3172 -3171 3073 3167
		mu 0 4 3545 3549 3448 3451
		f 4 3170 -3174 -3173 3082
		mu 0 4 3448 3549 3550 3456
		f 4 -3176 -3175 3083 3172
		mu 0 4 3551 3552 3553 3554
		f 4 3174 -3179 -3178 -3177
		mu 0 4 3553 3552 3555 3556
		f 4 -3183 -3182 -3181 -3180
		mu 0 4 3557 3079 3558 3559
		f 4 -3186 -3185 -1227 -3184
		mu 0 4 3560 3561 3562 3563
		f 4 3184 3180 -3187 -1228
		mu 0 4 3564 3565 3566 3567
		f 4 -4228 -1229 -2926 3439
		mu 0 4 3568 3569 3570 3571
		f 4 -3440 -2927 3438 -4230
		mu 0 4 3572 3573 3574 3575
		f 4 -4232 -3439 -2928 3437
		mu 0 4 3576 3575 3574 3577
		f 4 -3438 -2929 3436 -4234
		mu 0 4 3576 3577 3578 3579
		f 4 -4236 -3437 -2930 3435
		mu 0 4 3580 3581 3582 3583
		f 4 -3436 -2931 3434 -4238
		mu 0 4 3580 3583 3584 3585
		f 4 -4240 -3435 -2932 3433
		mu 0 4 3586 3587 3588 3589
		f 4 -3434 -2933 -2714 -4241
		mu 0 4 3586 3589 3590 3591
		f 4 -3189 -3188 -1230 3066
		mu 0 4 3442 3592 3593 3443
		f 4 3187 -3190 2925 -1231
		mu 0 4 3593 3592 3571 3570
		f 4 3189 -3192 -3191 2926
		mu 0 4 3573 3594 3595 3574
		f 4 3191 3188 3068 -3193
		mu 0 4 3595 3594 3596 3453
		f 4 -3195 -3194 3192 3076
		mu 0 4 3452 3597 3595 3453
		f 4 3193 -3196 2927 3190
		mu 0 4 3595 3597 3577 3574
		f 4 3195 -3198 -3197 2928
		mu 0 4 3577 3597 3598 3578
		f 4 3197 3194 3078 -3199
		mu 0 4 3598 3597 3452 3455
		f 4 -3202 -3201 3198 -3200
		mu 0 4 3599 3600 3601 3602
		f 4 3200 -3203 2929 3196
		mu 0 4 3601 3600 3583 3582
		f 4 -3207 -3206 -3205 -3204
		mu 0 4 3603 3604 3605 3606
		f 4 -3210 -3209 2931 -3208
		mu 0 4 3607 3608 3609 3610
		f 4 3208 -3211 -1232 2932
		mu 0 4 3589 3611 3612 3590
		f 4 -3213 -4125 -4140 -3212
		mu 0 4 3613 3614 3615 3616
		f 4 -3214 -4126 -4127 4124
		mu 0 4 3617 3618 3619 3620
		f 4 -3215 -4128 -4129 4125
		mu 0 4 3621 3622 3623 3624
		f 4 -3218 -3217 -3216 2977
		mu 0 4 3625 3626 3627 3628
		f 4 -3219 -4130 -4131 4127
		mu 0 4 3622 3629 3630 3623
		f 4 -3220 -4132 -4133 4129
		mu 0 4 3631 3632 3633 3634
		f 4 -3224 -3223 -3222 -3221
		mu 0 4 3635 3636 3637 3638
		f 4 -3225 -4134 -4135 4131
		mu 0 4 3639 3640 3641 3642
		f 4 -3226 -4136 -4137 4133
		mu 0 4 3643 3644 3645 3646
		f 4 -3227 3211 -4139 4135
		mu 0 4 3644 3647 3648 3645
		f 4 -3231 -3230 -3229 -3228
		mu 0 4 3649 3650 3651 3652
		f 4 -3233 2802 -3232 3181
		mu 0 4 3079 3074 3073 3558
		f 4 -4300 -4299 4296 -4295
		mu 0 4 3653 3654 3655 3656
		f 4 3231 2805 -1233 3186
		mu 0 4 3566 3075 3078 3567
		f 4 -1234 2806 -3238 -3237
		mu 0 4 3657 3658 3659 3660
		f 4 -3241 -3240 -4314 -4315
		mu 0 4 3661 3662 3663 3664
		f 4 -3244 -3243 -4302 -4303
		mu 0 4 3665 3666 3667 3668
		f 4 -3247 -3246 -4306 -4307
		mu 0 4 3669 3670 3671 3672
		f 4 4305 -3249 -4308 -4309
		mu 0 4 3673 3674 3675 3676
		f 4 -3253 -3252 -3251 -3250
		mu 0 4 3677 3678 3679 3680
		f 4 -3257 -3256 -3255 -3254
		mu 0 4 3681 3682 3683 3684
		f 4 3251 -3260 -3259 -3258
		mu 0 4 3685 3686 3687 3688
		f 4 -3262 2810 3182 -3261
		mu 0 4 3689 3690 3691 3692
		f 4 -3264 -4310 -4311 4307
		mu 0 4 3675 3693 3694 3676
		f 4 3086 3176 -3266 -3265
		mu 0 4 3695 3553 3556 3696
		f 4 -3268 -4316 -4317 4313
		mu 0 4 3663 3697 3698 3664
		f 4 3089 -3270 -3269 3092
		mu 0 4 3466 3699 3700 3467
		f 4 -3272 3243 -4320 -3271
		mu 0 4 3701 3666 3665 3702
		f 4 4301 -3274 3246 -4305
		mu 0 4 3703 3704 3670 3669
		f 4 3272 3183 -1235 3099
		mu 0 4 3705 3560 3563 3706
		f 4 -3276 3227 -3275 2807
		mu 0 4 3082 3649 3652 3079
		f 4 3274 3228 -3277 3232
		mu 0 4 3079 3652 3651 3074
		f 4 3276 3229 -3278 2801
		mu 0 4 3074 3651 3650 3071
		f 4 -3280 3233 3275 -3279
		mu 0 4 3707 3708 3709 3710
		f 4 3277 3234 -3281 2804
		mu 0 4 3711 3712 3713 3714
		f 4 3280 3235 3279 3237
		mu 0 4 3714 3713 3715 3716
		f 4 -3283 3175 -3282 2809
		mu 0 4 3690 3552 3551 3717
		f 4 3178 3282 3261 -3284
		mu 0 4 3555 3552 3690 3689
		f 4 -3285 3240 -4313 4309
		mu 0 4 3693 3662 3661 3694
		f 4 -3289 -3288 -3287 -3286
		mu 0 4 3718 3719 3720 3721
		f 4 -3291 3254 -3290 3288
		mu 0 4 3722 3684 3683 3723
		f 4 -3294 3249 -3293 -3292
		mu 0 4 3724 3725 3726 3727
		f 4 -3297 -3296 -3295 3291
		mu 0 4 3728 3729 3730 3731
		f 4 -3299 -2751 -4273 3286
		mu 0 4 3720 3732 3733 3721
		f 4 -3303 -3302 -3301 -3300
		mu 0 4 3734 3735 3736 3737
		f 4 3300 -3306 -3305 -3304
		mu 0 4 3738 3739 3740 3741
		f 4 -3310 -3309 -3308 -3307
		mu 0 4 3742 3743 3744 3745
		f 4 -3313 -3312 -3311 3201
		mu 0 4 3599 3606 3746 3600
		f 4 3304 -3315 3307 -3314
		mu 0 4 3747 3748 3745 3744
		f 4 -3318 3209 -3317 -3316
		mu 0 4 3749 3750 3751 3752
		f 4 3210 3317 -3319 -1237
		mu 0 4 3753 3754 3755 3756
		f 4 -3321 3270 -4319 4315
		mu 0 4 3697 3757 3758 3698
		f 4 -3322 3264 3319 3269
		mu 0 4 3699 3695 3696 3700
		f 4 3085 3321 3090 -3323
		mu 0 4 3759 3760 3461 3460
		f 4 -3326 -3325 -3324 2930
		mu 0 4 3761 3762 3763 3764
		f 4 -3329 3301 -3328 -3327
		mu 0 4 3765 3766 3767 3768
		f 4 3323 -3331 -3330 3207
		mu 0 4 3769 3770 3771 3772
		f 4 -3333 3305 3328 -3332
		mu 0 4 3773 3774 3775 3776
		f 4 -3335 -3334 3325 3202
		mu 0 4 3777 3778 3779 3780
		f 4 3327 -3338 -3337 -3336
		mu 0 4 3781 3782 3783 3784
		f 4 3337 3302 3334 3310
		mu 0 4 3785 3735 3734 3786
		f 4 -3341 -3340 3308 -3339
		mu 0 4 3787 3788 3789 3790
		f 4 3306 -3344 -3343 -3342
		mu 0 4 3791 3792 3793 3794
		f 4 3329 -3345 3340 3316
		mu 0 4 3772 3771 3795 3796
		f 4 3343 3314 3332 -3346
		mu 0 4 3797 3798 3799 3800
		f 4 -3347 3313 3339 3344
		mu 0 4 3801 3802 3789 3788
		f 4 -3348 3303 3346 3330
		mu 0 4 3770 3803 3804 3771
		f 4 3333 3299 3347 3324
		mu 0 4 3805 3806 3807 3808
		f 4 -1238 -3349 3159 3162
		mu 0 4 3809 3810 3811 3812
		f 4 -1239 3153 3156 3348
		mu 0 4 3810 3813 3814 3811
		f 4 -3352 -3351 3322 -3350
		mu 0 4 3815 3816 3759 3460
		f 4 3349 3087 -3353 3338
		mu 0 4 3815 3460 3463 3752
		f 4 -3354 3315 3352 3095
		mu 0 4 3817 3749 3752 3463
		f 4 3353 3097 -1240 3318
		mu 0 4 3755 3470 3473 3756
		f 4 -3358 -3357 -3356 -3355
		mu 0 4 3818 3819 3820 3821
		f 4 -3362 -3361 -3360 -3359
		mu 0 4 3822 3823 3824 3825
		f 4 -3366 -3365 -3364 -3363
		mu 0 4 3826 3827 3828 3829
		f 4 -3370 -3369 -3368 -3367
		mu 0 4 3830 3831 3832 3833
		f 4 -3844 -3845 -4212 -4213
		mu 0 4 3834 3835 3836 3837
		f 4 -3847 3843 -4226 -3846
		mu 0 4 3838 3839 3840 3841
		f 4 -3848 -3849 3845 -4225
		mu 0 4 3842 3843 3844 3845
		f 4 -3851 3847 -4223 -3850
		mu 0 4 3846 3847 3848 3849
		f 4 -3852 -3853 3849 -4221
		mu 0 4 3850 3851 3846 3849
		f 4 -3855 3851 -4219 -3854
		mu 0 4 3852 3853 3854 3855
		f 4 -3856 -3857 3853 -4217
		mu 0 4 3856 3857 3858 3859
		f 4 3855 -4215 4211 -3858
		mu 0 4 3860 3861 3837 3836
		f 4 4049 -3373 -4051 -4036
		mu 0 4 3862 3863 3864 3865
		f 4 -4050 -4034 -3974 -4049
		mu 0 4 3866 3867 3868 3869
		f 4 -4040 -4041 4037 -3992
		mu 0 4 3870 3871 3872 3873
		f 4 4041 -3971 -4044 -4045
		mu 0 4 3874 3875 3876 3877
		f 4 -4046 -4047 4043 -3969
		mu 0 4 3878 3879 3877 3876
		f 4 4045 -3967 -1266 -4048
		mu 0 4 3880 3881 3882 3883
		f 4 -3379 3206 3342 3345
		mu 0 4 3884 3604 3603 3885
		f 4 -3380 3336 3311 3204
		mu 0 4 3886 3784 3783 3887
		f 4 3079 -3382 -3381 3199
		mu 0 4 3455 3454 3888 3889
		f 4 3381 3081 3084 3350
		mu 0 4 3888 3454 3456 3459
		f 4 3309 -3383 3380 3351
		mu 0 4 3815 3890 3599 3816
		f 4 3341 3203 3312 3382
		mu 0 4 3890 3603 3606 3599
		f 4 3331 3326 -3384 3378
		mu 0 4 3884 3891 3892 3604
		f 4 3383 3335 3379 3205
		mu 0 4 3604 3892 3893 3605
		f 4 -3388 -3387 -3386 -3385
		mu 0 4 3894 3895 3896 3897
		f 4 -3392 -3391 -3390 -3389
		mu 0 4 3898 3899 3900 3901
		f 4 2821 -3395 -3394 -3393
		mu 0 4 3106 3109 3902 3903
		f 4 -3398 3384 -3397 -3396
		mu 0 4 3904 3894 3897 3905
		f 4 -3402 -3401 -3400 -3399
		mu 0 4 3906 3907 3908 3909
		f 4 2833 -3405 -3404 -3403
		mu 0 4 3119 3118 3910 3911
		f 4 -3408 -3407 -3406 3390
		mu 0 4 3912 3913 3914 3915
		f 4 -3411 3398 -3410 -3409
		mu 0 4 3916 3906 3909 3917
		f 4 -3413 3258 -3412 3256
		mu 0 4 3681 3688 3687 3682
		f 4 -4004 -3417 2955 -4003
		mu 0 4 3918 3919 3920 3921
		f 4 -3418 2950 -4005 2951
		mu 0 4 3922 3923 3924 3925
		f 4 -4187 4185 -4184 4181
		mu 0 4 3926 3927 3928 3929
		f 4 4005 2948 3417 2946
		mu 0 4 3930 3931 3932 3933
		f 4 4008 2952 3416 -4011
		mu 0 4 3934 3935 3920 3919
		f 4 -4059 4055 2870 -4058
		mu 0 4 3936 3937 3938 3939
		f 4 -4060 -4061 4057 2938
		mu 0 4 3257 3940 3941 3258
		f 4 -4063 4059 2936 -4062
		mu 0 4 3942 3943 3253 3252
		f 4 -4070 4061 -4064 -4069
		mu 0 4 3944 3945 3182 3180
		f 4 4068 2878 -4067 -4071
		mu 0 4 3944 3180 3179 3946
		f 4 -4030 3423 -4065 4048
		mu 0 4 3947 3948 3949 3950
		f 4 -3427 -3426 3055 -3425
		mu 0 4 3951 3952 3424 3422
		f 4 -3428 3005 3424 3054
		mu 0 4 3421 3953 3951 3422
		f 4 2999 3427 3045 -3429
		mu 0 4 3366 3954 3955 3409
		f 4 -3430 3011 3428 3043
		mu 0 4 3408 3365 3366 3409
		f 4 3006 3429 3035 -3431
		mu 0 4 3362 3365 3408 3956
		f 4 -3432 3017 3430 3033
		mu 0 4 3957 3373 3372 3958
		f 4 3012 3431 3024 -3433
		mu 0 4 3368 3371 3382 3385
		f 4 3425 3023 3432 3061
		mu 0 4 3435 3380 3368 3385
		f 4 4017 3374 -4020 -4021
		mu 0 4 3379 3378 3959 3960
		f 4 4207 3426 3003 -4210
		mu 0 4 3961 3952 3951 3962
		f 4 3102 -3442 -3441 -1242
		mu 0 4 3963 3964 3965 3966
		f 4 3105 -3444 -3443 3441
		mu 0 4 3476 3480 3967 3968
		f 4 -3446 -3445 3443 3108
		mu 0 4 3482 3969 3970 3483
		f 4 -3447 3445 3110 -1243
		mu 0 4 3971 3969 3482 3486
		f 4 3444 2934 2940 -3448
		mu 0 4 3972 3973 3261 3260
		f 4 3442 3447 2941 -3449
		mu 0 4 3974 3972 3260 3263
		f 4 3440 3448 2943 -1244
		mu 0 4 3966 3965 3265 3264
		f 4 3131 -1245 -3451 -3450
		mu 0 4 3508 3511 3975 3976
		f 4 3128 3449 -3453 -3452
		mu 0 4 3509 3508 3976 3977
		f 4 3125 3451 -3455 -3454
		mu 0 4 3502 3505 3978 3979
		f 4 3122 3453 -3456 -1246
		mu 0 4 3503 3502 3979 3980
		f 4 3450 -1247 -3458 -3457
		mu 0 4 3976 3975 3981 3982
		f 4 3452 3456 -3460 -3459
		mu 0 4 3977 3976 3982 3983
		f 4 3454 3458 -3462 -3461
		mu 0 4 3979 3978 3984 3985
		f 4 3455 3460 -3463 -1248
		mu 0 4 3980 3979 3985 3986
		f 4 3457 -1249 -3465 -3464
		mu 0 4 3982 3981 3987 3988
		f 4 3459 3463 -3467 -3466
		mu 0 4 3983 3982 3988 3989
		f 4 3461 3465 -3469 -3468
		mu 0 4 3985 3984 3990 3991
		f 4 3462 3467 -3470 -1250
		mu 0 4 3986 3985 3991 3992
		f 4 3464 -1251 3163 -3471
		mu 0 4 3988 3987 3993 3534
		f 4 3466 3470 3161 -3472
		mu 0 4 3989 3988 3534 3533
		f 4 3468 3471 3158 -3473
		mu 0 4 3991 3990 3530 3529
		f 4 3469 3472 3155 -1252
		mu 0 4 3992 3991 3529 3994
		f 4 -3983 -1253 -3474 2933
		mu 0 4 3995 3996 3997 3998
		f 4 2982 -3477 -3476 -3475
		mu 0 4 3334 3337 3999 4000
		f 4 3388 -3479 -3478 3476
		mu 0 4 3337 4001 4002 3999
		f 4 -3482 -3481 3385 -3480
		mu 0 4 4003 4004 4005 4006
		f 4 -3484 3474 -3483 3394
		mu 0 4 4007 4008 4009 4010
		f 4 -3486 -3485 3396 3480
		mu 0 4 4011 4012 4013 4014
		f 4 -3489 -3488 2988 -3487
		mu 0 4 4015 4016 4017 4018
		f 4 3481 -3491 2986 -3490
		mu 0 4 4019 4020 4021 4022
		f 4 -3492 3486 2985 3490
		mu 0 4 4023 4024 3338 3341
		f 4 -3494 -3493 2991 3487
		mu 0 4 4025 4026 4027 4028
		f 4 -3496 -3495 2990 3492
		mu 0 4 3910 3903 4029 4030
		f 4 3494 3485 3489 2989
		mu 0 4 4031 4032 4033 4034
		f 4 3493 -3498 2995 -3497
		mu 0 4 4035 4036 4037 4038
		f 4 -3501 -3500 2993 -3499
		mu 0 4 4039 4040 4041 4042
		f 4 3499 3403 3496 2992
		mu 0 4 4043 4044 4045 4046
		f 4 3488 -3502 2998 3497
		mu 0 4 4036 4047 4048 4037
		f 4 -3504 -3503 2997 3501
		mu 0 4 4024 4049 4050 4051
		f 4 -3505 3498 2996 3502
		mu 0 4 4052 4039 4042 4053
		f 4 -3509 -3508 -3507 -3506
		mu 0 4 4054 4055 4056 4057
		f 4 3402 -3511 3507 -3510
		mu 0 4 3119 3911 4058 4059
		f 4 3500 -3513 3399 -3512
		mu 0 4 4060 4061 4062 4063
		f 4 -3516 3505 -3515 -3514
		mu 0 4 3913 4064 4065 4066
		f 4 3504 -3517 3409 3512
		mu 0 4 4067 4068 4069 4070
		f 4 -3519 3406 3513 -3518
		mu 0 4 4071 3914 3913 4066
		f 4 -3521 2960 -3520 3222
		mu 0 4 4072 3308 3311 4073
		f 4 -3523 3220 -3522 3216
		mu 0 4 4074 4075 4076 4077
		f 4 -3526 -3525 -3524 3508
		mu 0 4 4054 4078 4079 4055
		f 4 -3527 3392 3495 3404
		mu 0 4 3118 3106 3903 3910
		f 4 2834 -3528 2824 3526
		mu 0 4 3118 3117 3107 3106
		f 4 2826 -3530 2831 -3529
		mu 0 4 3111 3110 3113 3112
		f 4 -3531 2832 3509 3523
		mu 0 4 4080 3116 3119 4059
		f 4 2829 -3533 3530 -3532
		mu 0 4 3115 3114 3116 4080
		f 4 2827 3527 -3534 3529
		mu 0 4 3110 3107 3117 3113
		f 4 2830 3533 2835 3532
		mu 0 4 3114 3113 3117 3116
		f 4 2979 -3536 2825 -3535
		mu 0 4 3333 3332 4081 4082
		f 4 -3537 2970 3534 3528
		mu 0 4 3112 4083 4084 3111
		f 4 2967 3536 2828 -3538
		mu 0 4 4085 4083 3112 3115
		f 4 3524 2956 3537 3531
		mu 0 4 4079 4078 4086 4087
		f 4 3515 -3539 2959 3525
		mu 0 4 4064 3913 4088 4089
		f 4 3483 2822 3535 2984
		mu 0 4 4008 4007 4081 3332
		f 4 -3540 3477 3479 3386
		mu 0 4 4090 4091 4092 4093
		f 4 -3541 3475 3539 3387
		mu 0 4 4094 4000 3999 4095
		f 4 -3542 3482 3540 3397
		mu 0 4 4096 4010 4009 4097
		f 4 3393 3541 3395 3484
		mu 0 4 4098 4099 4100 4101
		f 4 -3543 3510 3511 3400
		mu 0 4 4102 4103 4104 4105
		f 4 -3544 3506 3542 3401
		mu 0 4 4106 4057 4056 4107
		f 4 -3545 3514 3543 3410
		mu 0 4 4108 4066 4065 4109
		f 4 3517 3544 3408 3516
		mu 0 4 4110 4111 3916 3917
		f 4 3405 3518 3503 -3546
		mu 0 4 3900 4112 4049 4024
		f 4 3389 3545 3491 3478
		mu 0 4 3901 3900 4024 4023
		f 4 -3550 -3549 -3548 -3547
		mu 0 4 4113 4114 4115 4116
		f 4 -3553 3546 -3552 -3551
		mu 0 4 4117 4113 4116 4118
		f 4 -3556 3550 -3555 -3554
		mu 0 4 4119 4120 4121 4122
		f 4 -3559 3553 -3558 -3557
		mu 0 4 4123 4124 4125 4126
		f 4 -3562 3556 -3561 -3560
		mu 0 4 4127 4128 4129 4130
		f 4 -3565 3559 -3564 -3563
		mu 0 4 4131 4127 4130 4132
		f 4 -3568 3562 -3567 -3566
		mu 0 4 4133 4134 4135 4136
		f 4 -3570 3565 -3569 3548
		mu 0 4 4137 4138 4139 4140
		f 4 2961 -3573 -3572 -3571
		mu 0 4 4141 4142 4143 4144
		f 4 3519 3570 -3575 -3574
		mu 0 4 4145 4141 4144 4146
		f 4 3221 3573 -3577 -3576
		mu 0 4 3638 3637 4147 4148
		f 4 3521 3575 -3579 -3578
		mu 0 4 4077 4076 4149 4150
		f 4 3215 3577 -3581 -3580
		mu 0 4 3328 4151 4152 4153
		f 4 2976 3579 -3583 -3582
		mu 0 4 3329 3328 4153 4154
		f 4 2973 3581 -3585 -3584
		mu 0 4 3325 3324 4155 4156
		f 4 3572 2966 3583 -3586
		mu 0 4 4157 3313 3312 4158
		f 4 -3590 -3589 -3588 -3587
		mu 0 4 4159 4160 4161 4162
		f 4 3588 -3593 -3592 -3591
		mu 0 4 4161 4160 4163 4164
		f 4 -3597 -3596 -3595 -3594
		mu 0 4 4165 4166 4167 4168
		f 4 -3601 -3600 -3599 -3598
		mu 0 4 4169 4170 4171 4172
		f 4 -3605 -3604 -3603 -3602
		mu 0 4 4173 4174 3825 4175
		f 4 3359 -3607 -3606 3602
		mu 0 4 3825 3824 4176 4175
		f 4 3606 -3610 -3609 -3608
		mu 0 4 4177 4178 4179 4180
		f 4 3363 -3612 -3611 3608
		mu 0 4 4181 4182 4183 4184
		f 4 -3615 3611 -3614 -3613
		mu 0 4 4185 4186 4187 4188
		f 4 -3619 -3618 -3617 -3616
		mu 0 4 4189 4190 4191 4192
		f 4 3617 -3622 -3621 -3620
		mu 0 4 4193 4194 4195 4196
		f 4 -3626 -3625 -3624 -3623
		mu 0 4 4197 4198 4199 4200
		f 4 3624 -3629 -3628 -3627
		mu 0 4 4201 4202 4203 4204
		f 4 -3633 -3632 -3631 -3630
		mu 0 4 4205 4206 4207 4208
		f 4 3367 -3636 -3635 -3634
		mu 0 4 4209 4210 4211 4212
		f 4 3586 -3639 -3638 -3637
		mu 0 4 4213 4214 4215 4216
		f 4 -3642 3629 -3641 -3640
		mu 0 4 4217 4218 4219 4220
		f 4 -3646 -3645 -3644 -3643
		mu 0 4 4221 4222 4223 4224
		f 4 3598 -3649 -3648 -3647
		mu 0 4 4225 4226 4227 4228
		f 4 -3652 -3651 -3650 3635
		mu 0 4 4210 4229 4230 4211
		f 4 -3655 3642 -3654 -3653
		mu 0 4 4231 4232 4233 4234
		f 4 3612 -3658 -3657 -3656
		mu 0 4 4185 4188 4235 4236
		f 4 3633 -3660 -3659 3657
		mu 0 4 4188 4237 4238 4235
		f 4 -3663 -3662 3630 -3661
		mu 0 4 4239 4240 4241 4242
		f 4 -3665 3655 -3664 3638
		mu 0 4 4243 4244 4245 4246
		f 4 -3667 -3666 3640 3661
		mu 0 4 4247 4248 4249 4250
		f 4 -3670 -3669 3618 -3668
		mu 0 4 4251 4252 4253 4254
		f 4 3662 -3672 3616 -3671
		mu 0 4 4255 4256 4257 4258
		f 4 -3673 3667 3615 3671
		mu 0 4 4259 4260 4189 4192
		f 4 -3675 -3674 3621 3668
		mu 0 4 4261 4262 4263 4264
		f 4 -3677 -3676 3620 3673
		mu 0 4 4265 4266 4267 4268
		f 4 3675 3666 3670 3619
		mu 0 4 4269 4270 4271 4272
		f 4 3674 -3679 3625 -3678
		mu 0 4 4273 4274 4275 4276
		f 4 -3682 -3681 3623 -3680
		mu 0 4 4277 4278 4279 4280
		f 4 3680 3647 3677 3622
		mu 0 4 4281 4282 4283 4284
		f 4 3669 -3683 3628 3678
		mu 0 4 4274 4285 4286 4275
		f 4 -3685 -3684 3627 3682
		mu 0 4 4287 4288 4204 4203
		f 4 -3686 3679 3626 3683
		mu 0 4 4289 4277 4280 4290
		f 4 -3690 -3689 -3688 -3687
		mu 0 4 4291 4292 4293 4294
		f 4 3646 -3692 3688 -3691
		mu 0 4 4225 4228 4295 4296
		f 4 3681 -3694 3643 -3693
		mu 0 4 4297 4298 4299 4300
		f 4 -3697 3686 -3696 -3695
		mu 0 4 3821 4301 4302 4303
		f 4 3685 -3698 3653 3693
		mu 0 4 4304 4305 4306 4307
		f 4 -3700 3650 3694 -3699
		mu 0 4 4308 4309 3821 4303
		f 4 -3703 -3702 -3701 3689
		mu 0 4 4291 4310 4311 4292
		f 4 -3704 3636 3676 3648
		mu 0 4 4226 4213 4216 4227
		f 4 3599 -3705 3589 3703
		mu 0 4 4226 4312 4313 4213
		f 4 3591 -3707 3596 -3706
		mu 0 4 4164 4163 4166 4165
		f 4 -3708 3597 3690 3700
		mu 0 4 4314 4169 4172 4315
		f 4 3594 -3710 3707 -3709
		mu 0 4 4168 4167 4169 4314
		f 4 3592 3704 -3711 3706
		mu 0 4 4316 4313 4312 4317
		f 4 3595 3710 3600 3709
		mu 0 4 4318 4317 4312 4319
		f 4 3610 -3713 3590 -3712
		mu 0 4 4320 4321 4322 4323
		f 4 -3714 3607 3711 3705
		mu 0 4 4165 4324 4325 4164
		f 4 3605 3713 3593 -3715
		mu 0 4 4326 4324 4165 4168
		f 4 3701 3601 3714 3708
		mu 0 4 4311 4310 4327 4328
		f 4 3696 3355 3604 3702
		mu 0 4 4301 3821 3820 4329
		f 4 3664 3587 3712 3614
		mu 0 4 4244 4243 4330 4331
		f 4 -3716 3658 3660 3631
		mu 0 4 4332 4333 4334 4335
		f 4 -3717 3656 3715 3632
		mu 0 4 4336 4236 4235 4337
		f 4 -3718 3663 3716 3641
		mu 0 4 4338 4246 4245 4339
		f 4 3637 3717 3639 3665
		mu 0 4 4340 4341 4342 4343
		f 4 -3719 3691 3692 3644
		mu 0 4 4344 4345 4346 4347
		f 4 -3720 3687 3718 3645
		mu 0 4 4348 4294 4293 4349
		f 4 -3721 3695 3719 3654
		mu 0 4 4350 4303 4302 4351
		f 4 3698 3720 3652 3697
		mu 0 4 4352 4353 4231 4234
		f 4 3649 3699 3684 -3722
		mu 0 4 4211 4230 4354 4260
		f 4 3634 3721 3672 3659
		mu 0 4 4212 4211 4260 4259
		f 4 3358 3603 3356 -3723
		mu 0 4 3822 3825 4174 4355
		f 4 3354 3651 3368 -3724
		mu 0 4 4356 4357 4358 4359
		f 4 3366 3613 3364 -3725
		mu 0 4 3830 3833 4360 4361
		f 4 3362 3609 3360 -3726
		mu 0 4 4362 4179 4178 4363
		f 4 -3729 3722 -3728 -3727
		mu 0 4 4364 3822 4355 4365
		f 4 -3731 -3730 3361 3728
		mu 0 4 4364 4366 3823 3822
		f 4 -3733 3725 3729 -3732
		mu 0 4 4367 4362 4363 4368
		f 4 -3735 -3734 3365 3732
		mu 0 4 4369 4370 3827 3826
		f 4 -3737 3724 3733 -3736
		mu 0 4 4371 3830 4361 4372
		f 4 -3739 -3738 3369 3736
		mu 0 4 4371 4373 3831 3830
		f 4 -3741 3723 3737 -3740
		mu 0 4 4374 4356 4359 4375
		f 4 -3742 3727 3357 3740
		mu 0 4 4376 4377 4378 4379
		f 4 -3744 -3743 -3904 -3905
		mu 0 4 4380 4381 4382 4383
		f 4 -3903 -3746 -3745 3743
		mu 0 4 4380 4384 4385 4381
		f 4 -3748 -3747 3745 -3901
		mu 0 4 4386 4387 4388 4389
		f 4 -3899 -3750 -3749 3747
		mu 0 4 4390 4391 4392 4393
		f 4 -3752 -3751 3749 -3897
		mu 0 4 4394 4395 4392 4391
		f 4 -3895 -3754 -3753 3751
		mu 0 4 4396 4397 4398 4399
		f 4 -3756 -3755 3753 -3893
		mu 0 4 4400 4401 4402 4403
		f 4 3903 -3757 3755 -3906
		mu 0 4 4404 4405 4406 4407
		f 4 -3908 -3909 -3758 3742
		mu 0 4 4381 4408 4409 4382
		f 4 3744 -3910 -3911 3907
		mu 0 4 4381 4385 4410 4408
		f 4 -3912 -3913 3909 3746
		mu 0 4 4387 4411 4412 4388
		f 4 3748 -3914 -3915 3911
		mu 0 4 4393 4392 4413 4414
		f 4 -3916 -3917 3913 3750
		mu 0 4 4395 4415 4413 4392
		f 4 3752 -3918 -3919 3915
		mu 0 4 4399 4398 4416 4417
		f 4 -3920 -3921 3917 3754
		mu 0 4 4401 4418 4419 4402
		f 4 3756 3757 -3922 3919
		mu 0 4 4406 4405 4420 4421
		f 4 -4111 -3767 3549 -4110
		mu 0 4 4422 4423 4114 4113
		f 4 -3768 3569 3766 -4124
		mu 0 4 4424 4138 4137 4425
		f 4 -4123 -3769 3567 3767
		mu 0 4 4426 4427 4134 4133
		f 4 -4121 -3770 3564 3768
		mu 0 4 4428 4429 4127 4131
		f 4 -4119 -3771 3561 3769
		mu 0 4 4429 4430 4128 4127
		f 4 -4117 -3772 3558 3770
		mu 0 4 4431 4432 4124 4123
		f 4 -4115 -3773 3555 3771
		mu 0 4 4433 4434 4120 4119
		f 4 -4113 4109 3552 3772
		mu 0 4 4435 4422 4113 4117
		f 4 3547 -3775 2963 -3774
		mu 0 4 4116 4115 3309 3308
		f 4 2965 3774 3568 -3776
		mu 0 4 3315 3314 4140 4139
		f 4 3566 -3777 2975 3775
		mu 0 4 4136 4135 3323 3322
		f 4 3563 -3778 2978 3776
		mu 0 4 4132 4130 4436 4437
		f 4 3560 -3779 3217 3777
		mu 0 4 4438 4439 4440 4441
		f 4 3557 -3780 3522 3778
		mu 0 4 4126 4125 4075 4074
		f 4 3554 -3781 3223 3779
		mu 0 4 4122 4121 3636 3635
		f 4 3551 3773 3520 3780
		mu 0 4 4118 4116 3308 4072
		f 4 -3785 -3784 3226 -3783
		mu 0 4 3299 3303 3647 3644
		f 4 -3787 -3786 3212 3783
		mu 0 4 3292 3291 3614 3613
		f 4 -3789 -3788 3213 3785
		mu 0 4 3296 3295 3618 3617
		f 4 -3791 -3790 3214 3787
		mu 0 4 4442 3284 3622 3621
		f 4 -3793 -3792 3218 3789
		mu 0 4 3284 3283 3629 3622
		f 4 -3795 -3794 3219 3791
		mu 0 4 4443 4444 3632 3631
		f 4 -3797 -3796 3224 3793
		mu 0 4 3272 3271 3640 3639
		f 4 -3798 3782 3225 3795
		mu 0 4 3300 3299 3644 3643
		f 4 3239 -3801 -3800 -3799
		mu 0 4 4445 4446 4447 4448
		f 4 3242 -3804 -3803 -3802
		mu 0 4 4449 4450 4451 4452
		f 4 3245 -3807 -3806 -3805
		mu 0 4 3671 3670 4453 4454
		f 4 3248 3804 -3809 -3808
		mu 0 4 4455 4456 4457 4458
		f 4 3263 3807 -3811 -3810
		mu 0 4 4459 4455 4458 4460
		f 4 3267 3798 -3813 -3812
		mu 0 4 4461 4462 4463 4464
		f 4 3320 3811 -3815 -3814
		mu 0 4 4465 4461 4464 4466
		f 4 3273 3801 -3816 3806
		mu 0 4 3670 3704 4467 4453
		f 4 3284 3809 -3817 3800
		mu 0 4 4468 4459 4460 4469
		f 4 3271 3813 -3818 3803
		mu 0 4 4450 4470 4471 4451
		f 4 3297 -1254 3236 -3819
		mu 0 4 3730 4472 4473 3707
		f 4 3294 3818 3278 -3820
		mu 0 4 3731 3730 3707 3710
		f 4 2808 -3821 3293 3819
		mu 0 4 4474 4475 3725 3724
		f 4 3281 -3822 3252 3820
		mu 0 4 3717 3551 3678 3677
		f 4 3259 3821 3173 -3823
		mu 0 4 3687 3686 3550 3549
		f 4 3411 3822 3171 -3824
		mu 0 4 3682 3687 3549 3545
		f 4 3255 3823 3169 -3825
		mu 0 4 3683 3682 3545 3548
		f 4 3289 3824 2815 -3826
		mu 0 4 3723 3683 3548 4476
		f 4 3287 3825 2816 -3827
		mu 0 4 4477 4478 3087 3084
		f 4 2813 -1255 3298 3826
		mu 0 4 3084 3083 4479 4477
		f 4 3578 -3829 3391 -3828
		mu 0 4 4150 4149 4480 4481
		f 4 3580 3827 2983 -3830
		mu 0 4 4153 4152 3337 3336
		f 4 3582 3829 2981 -3831
		mu 0 4 4482 4483 3331 3330
		f 4 3584 3830 2972 -3832
		mu 0 4 4156 4155 3320 3319
		f 4 -3833 3585 3831 2969
		mu 0 4 3306 4157 4158 3316
		f 4 3571 3832 2958 -3834
		mu 0 4 4484 4485 4486 4487
		f 4 3574 3833 3538 -3835
		mu 0 4 4146 4144 4088 3913
		f 4 3576 3834 3407 3828
		mu 0 4 4148 4147 4488 4489
		f 4 3857 -3859 3860 3859
		mu 0 4 3860 3836 3429 4490
		f 4 3856 -3860 3862 3861
		mu 0 4 3858 3857 3415 3414
		f 4 3854 -3862 3864 3863
		mu 0 4 3853 3852 3404 3403
		f 4 3852 -3864 3866 3865
		mu 0 4 3846 3851 3399 3398
		f 4 3850 -3866 3868 3867
		mu 0 4 3847 3846 3398 4491
		f 4 3371 3848 -3868 3870
		mu 0 4 3432 3844 3843 4492
		f 4 3846 -3372 3872 3871
		mu 0 4 4493 3844 3432 3431
		f 4 3844 -3872 3873 3858
		mu 0 4 3836 3835 3426 3429
		f 4 -3875 3876 3875 3050
		mu 0 4 4494 4495 4496 4497
		f 4 3048 -3876 3878 3877
		mu 0 4 4498 4499 4500 4501
		f 4 -3878 3880 3879 3040
		mu 0 4 3405 4502 4503 3402
		f 4 3038 -3880 3882 3881
		mu 0 4 4504 3402 4503 4505
		f 4 -3882 3884 3883 3030
		mu 0 4 4506 4507 4508 4509
		f 4 3028 -3884 3886 3885
		mu 0 4 4510 4511 4512 4513
		f 4 -3886 3888 -3782 3060
		mu 0 4 4514 4515 4516 3427
		f 4 3058 3781 3889 3874
		mu 0 4 3428 3427 4516 4517
		f 4 -3877 -3891 3892 3891
		mu 0 4 4496 4495 4400 4403
		f 4 -3879 -3892 3894 3893
		mu 0 4 4501 4500 4397 4396
		f 4 -3881 -3894 3896 3895
		mu 0 4 4503 4502 4518 4519
		f 4 -3883 -3896 3898 3897
		mu 0 4 4505 4503 4519 4520
		f 4 -3885 -3898 3900 3899
		mu 0 4 4508 4507 4386 4389
		f 4 -3887 -3900 3902 3901
		mu 0 4 4513 4512 4384 4380
		f 4 -3888 -3889 -3902 3904
		mu 0 4 4404 4516 4515 4521
		f 4 -3890 3887 3905 3890
		mu 0 4 4517 4516 4404 4407
		f 4 -3759 3726 -3907 3908
		mu 0 4 4408 4364 4365 4409
		f 4 -3760 3730 3758 3910
		mu 0 4 4410 4366 4364 4408
		f 4 -3761 3731 3759 3912
		mu 0 4 4411 4367 4368 4412
		f 4 -3762 3734 3760 3914
		mu 0 4 4522 4523 4524 4525
		f 4 -3763 3735 3761 3916
		mu 0 4 4415 4526 4527 4413
		f 4 -3764 3738 3762 3918
		mu 0 4 4416 4373 4371 4417
		f 4 -3765 3739 3763 3920
		mu 0 4 4418 4374 4375 4419
		f 4 3906 3741 3764 3921
		mu 0 4 4420 4377 4376 4421
		f 4 -2839 -3923 3924 3923
		mu 0 4 4528 4529 4530 4531
		f 4 2837 -3924 3925 -1256
		mu 0 4 4532 4528 4531 4533
		f 4 -3928 3929 -1187 -2837
		mu 0 4 4534 4535 4536 4537
		f 4 3414 -4008 3930 -4082
		mu 0 4 3277 3276 4538 3237
		f 4 -4156 -4157 -2921 -3935
		mu 0 4 4539 3236 3234 4540
		f 4 -3965 -2821 -4077 -4078
		mu 0 4 3101 3103 4541 4542
		f 4 -4148 4144 3939 -4147
		mu 0 4 4543 3244 3243 3247
		f 4 3941 -2849 2847 3942
		mu 0 4 3133 3209 3208 4544
		f 4 -2845 -2844 -3942 3944
		mu 0 4 3132 3210 3209 3133
		f 4 2844 3945 -1188 -2846
		mu 0 4 4545 3134 3137 4546
		f 4 3974 -4155 -3933 -2956
		mu 0 4 4547 4548 3100 3099
		f 4 -3949 3950 -3836 -2954
		mu 0 4 4549 3298 3301 4550
		f 4 3835 3952 -3838 -2946
		mu 0 4 4551 3270 3273 4552
		f 4 3837 3954 -3839 -2945
		mu 0 4 4553 4554 4555 4556
		f 4 4182 -4186 -4190 -3840
		mu 0 4 4557 4558 4559 3285
		f 4 3839 3958 -3841 -2949
		mu 0 4 4560 3278 3281 4561
		f 4 3840 3960 -3842 -2951
		mu 0 4 4562 3294 3297 4563
		f 4 3841 3962 -3843 -2950
		mu 0 4 3924 3290 3293 4564
		f 4 3842 3963 3948 -2955
		mu 0 4 4565 4566 4567 4568
		f 4 3965 2909 -1259 3966
		mu 0 4 3881 3216 3219 3882
		f 4 -3966 3968 3967 2907
		mu 0 4 3214 3878 3876 3215
		f 4 3969 2901 -3968 3970
		mu 0 4 4569 3202 3205 4570
		f 4 -3995 3991 3971 2899
		mu 0 4 3201 3870 3873 3198;
	setAttr ".fc[2000:2165]"
		f 4 2842 -3943 3940 3979
		mu 0 4 3131 3133 4544 4541
		f 4 2839 -3980 2820 3980
		mu 0 4 3094 3131 4541 3103
		f 4 3446 -1261 3982 3981
		mu 0 4 4571 4572 4573 3255
		f 4 -2936 -2935 -3982 3984
		mu 0 4 3254 4574 4571 3255
		f 4 2935 3986 3985 -2938
		mu 0 4 3261 3256 3259 3172
		f 4 -2874 -2873 -3986 3988
		mu 0 4 4575 3173 3172 3259
		f 4 3989 2877 -4023 4019
		mu 0 4 4576 3177 3176 4577
		f 4 -4042 -4043 4039 -3973
		mu 0 4 4569 4578 3871 3870
		f 4 -3970 3972 3994 3993
		mu 0 4 3202 4569 3870 3201
		f 4 3995 -2901 -3994 3996
		mu 0 4 3200 3203 3202 3201
		f 4 -4103 -4104 4100 3997
		mu 0 4 4579 4580 4581 4582
		f 4 -2848 -3998 4000 3999
		mu 0 4 3140 4579 4582 3141
		f 4 2954 -4002 4003 -3416
		mu 0 4 4583 4584 3919 3918
		f 4 3418 4007 4006 2944
		mu 0 4 4585 4586 4587 4588
		f 4 2945 -4007 4009 -3414
		mu 0 4 4551 4552 3276 3275
		f 4 3413 4010 4001 2953
		mu 0 4 4589 3934 3919 4584
		f 4 -1262 -4012 4013 4012
		mu 0 4 4590 3097 3096 4591
		f 4 -1271 -4149 4146 4014
		mu 0 4 3248 4592 4593 3249
		f 4 -4056 -4057 4053 -3019
		mu 0 4 3938 3937 4594 4595
		f 4 3018 4020 -3991 3987
		mu 0 4 3938 4595 4577 4596
		f 4 4021 2873 3990 4022
		mu 0 4 3176 4597 4596 4577
		f 4 2875 -4022 4024 4023
		mu 0 4 3156 4597 3176 3154
		f 4 -2864 -2863 -4024 4026
		mu 0 4 3153 3157 3156 3154
		f 4 2868 2863 4027 -1193
		mu 0 4 3162 3161 3165 3164
		f 4 -4038 -4039 3973 -4032
		mu 0 4 3873 3872 4598 4599
		f 4 4030 2893 -3972 4031
		mu 0 4 4599 3196 3198 3873
		f 4 4032 2891 -4031 4033
		mu 0 4 3867 4600 4601 3868
		f 4 4034 2885 -4033 4035
		mu 0 4 4602 3186 3189 4603
		f 4 2883 -4035 4036 -1260
		mu 0 4 3187 3186 4602 4604
		f 4 4038 -3374 -4052 -4053
		mu 0 4 4605 4606 3378 3377
		f 4 -3993 -3375 3373 4040
		mu 0 4 4607 3959 3378 4606
		f 4 -3376 -3990 3992 4042
		mu 0 4 4608 4609 3959 4607
		f 4 3375 4044 -3377 2876
		mu 0 4 3177 3874 3877 3155
		f 4 -3378 2860 3376 4046
		mu 0 4 3879 3152 3155 3877
		f 4 3377 4047 -1241 2869
		mu 0 4 4610 3880 3883 4611
		f 4 4050 2879 -1265 -4037
		mu 0 4 3865 3864 4612 4613
		f 4 4052 -4029 3001 4029
		mu 0 4 3947 4614 4615 3948
		f 4 3004 4028 4054 -4019
		mu 0 4 4616 4617 3377 3376
		f 4 -3021 -3020 4018 4056
		mu 0 4 3937 4618 4619 4594
		f 4 3021 3020 4058 -3420
		mu 0 4 4620 4618 3937 3936
		f 4 -3421 3014 3419 4060
		mu 0 4 3940 4621 4622 3941
		f 4 3016 3420 4062 -3422
		mu 0 4 4623 4624 3943 3942
		f 4 3372 4064 4066 4065
		mu 0 4 3864 3863 4625 4626
		f 4 -2880 -4066 4067 -1194
		mu 0 4 4612 3864 4626 4627
		f 4 3008 3421 4069 -3423
		mu 0 4 4628 4629 3945 3944
		f 4 3010 3422 4070 -3424
		mu 0 4 4630 4628 3944 3946
		f 4 -4076 4002 4073 -4072
		mu 0 4 4631 3918 3921 4632
		f 4 -4099 4095 -4090 4087
		mu 0 4 4633 3143 3142 4634
		f 4 4004 2949 3415 4075
		mu 0 4 3925 3924 4564 4635
		f 4 4077 4079 -4075 4072
		mu 0 4 4636 3138 4637 4632
		f 4 -2952 4071 4074 -4087
		mu 0 4 4638 4631 4632 4637
		f 4 -4001 -4100 -4088 -4089
		mu 0 4 3141 4582 4633 4634
		f 4 3922 -2948 -2947 4084
		mu 0 4 4639 4640 4641 4638
		f 4 4083 4088 -4079 -4080
		mu 0 4 3138 3141 4634 4637
		f 4 -4086 4086 4078 4089
		mu 0 4 3142 4638 4637 4634
		f 4 -2850 -4085 4085 4091
		mu 0 4 3145 4639 4638 3142
		f 4 -3925 2849 4093 4092
		mu 0 4 4642 4639 3145 3151
		f 4 -4093 4094 -1190 -3926
		mu 0 4 4531 4643 4644 4533
		f 4 4096 -2853 -2852 -2851
		mu 0 4 3144 3143 3191 3150
		f 4 2852 4098 4097 -2854
		mu 0 4 3191 3143 4633 3199
		f 4 -4101 -4102 -4098 4099
		mu 0 4 4582 4581 3199 4633
		f 4 -3999 -2898 2896 4101
		mu 0 4 4581 3200 3197 3199
		f 4 -2899 -3996 3998 4103
		mu 0 4 4580 3203 3200 4581
		f 4 2903 2898 4105 -2905
		mu 0 4 3212 4645 3207 3206
		f 4 -2907 -2906 2904 4107
		mu 0 4 3211 3213 3212 3206
		f 4 2910 2906 4108 -1198
		mu 0 4 3218 3217 3221 3220
		f 4 -4120 4122 4121 4126
		mu 0 4 3619 4427 4426 3620
		f 4 -4118 4120 4119 4128
		mu 0 4 3623 4429 4428 3624
		f 4 -4116 4118 4117 4130
		mu 0 4 3630 4430 4429 3623
		f 4 -4114 4116 4115 4132
		mu 0 4 3633 4432 4431 3634
		f 4 -4112 4114 4113 4134
		mu 0 4 3641 4434 4433 3642
		f 4 3765 4112 4111 4136
		mu 0 4 3645 4422 4435 3646
		f 4 4110 -3766 4138 4137
		mu 0 4 4423 4422 3645 3648
		f 4 -4122 4123 -4138 4139
		mu 0 4 3615 4424 4425 3616
		f 4 -4154 -3975 -2953 -4166
		mu 0 4 4646 4647 3920 3935
		f 4 -4144 4145 -3947 -3976
		mu 0 4 3105 3242 3244 3089
		f 4 -3948 3946 4147 -4016
		mu 0 4 3090 3089 3244 4543
		f 4 -1202 -4013 4015 4148
		mu 0 4 4648 4590 4591 4649
		f 4 4150 4143 -4150 4151
		mu 0 4 4650 3242 3105 4651
		f 4 3936 3976 -4151 4152
		mu 0 4 4539 4652 4653 4654
		f 4 -4164 -4165 4153 4159
		mu 0 4 4651 4655 4548 4656
		f 4 4157 -4152 -4160 -4161
		mu 0 4 4657 4654 4658 4659
		f 4 4155 -4153 -4158 -4159
		mu 0 4 3236 4539 4654 4657
		f 4 4158 4166 4081 -4168
		mu 0 4 3236 4657 3277 3237
		f 4 4160 4165 4080 -4167
		mu 0 4 4660 4646 3935 4661
		f 4 4140 3964 4162 4161
		mu 0 4 3104 3103 3101 4655
		f 4 4149 3978 -4162 4163
		mu 0 4 4651 3105 3104 4655
		f 4 -4163 3931 4154 4164
		mu 0 4 4655 3101 3100 4548
		f 4 4187 -1257 -3930 4169
		mu 0 4 3123 3122 4536 4535
		f 4 -4171 -2838 -1273 -4189
		mu 0 4 3120 4528 4532 3121
		f 4 4173 4175 -4170 -3929
		mu 0 4 4662 3129 3123 4535
		f 4 4170 -4177 -4173 2838
		mu 0 4 4528 3120 3128 4529
		f 4 4177 4178 -4174 -3927
		mu 0 4 4663 3286 3289 4664
		f 4 4172 -4181 -4180 2947
		mu 0 4 4640 3288 3287 4641
		f 4 4179 4183 -4183 -4006
		mu 0 4 4665 3929 3928 4666
		f 4 4184 4186 -4178 -3419
		mu 0 4 4667 4668 4669 4670
		f 4 4189 -4185 3838 3956
		mu 0 4 3285 4559 4671 3282
		f 4 4190 4191 -2916 -4083
		mu 0 4 3237 4672 3230 3235
		f 4 -4191 -3931 3926 4192
		mu 0 4 4672 3237 4538 4673
		f 4 2914 -2917 -4192 -4194
		mu 0 4 4674 3231 3230 4672
		f 4 3927 4193 -4193 3928
		mu 0 4 4535 4534 4675 4662
		f 4 4196 4195 -3005 -4195
		mu 0 4 3361 3360 4617 4616
		f 4 -3003 -3002 -4196 4198
		mu 0 4 3355 3948 4615 3356
		f 4 4199 -3011 3002 4200
		mu 0 4 3364 4628 4630 3367
		f 4 -3010 -3009 -4200 4202
		mu 0 4 3363 4629 4628 3364
		f 4 4203 -3017 3009 4204
		mu 0 4 3374 4624 4623 3375
		f 4 -3016 -3015 -4204 4206
		mu 0 4 3369 4622 4621 3370
		f 4 -3023 -3022 3015 4208
		mu 0 4 3381 4676 4622 3369
		f 4 3022 4209 4194 3019
		mu 0 4 4677 3961 3962 4678
		f 4 -4211 4212 -3371 3056
		mu 0 4 3425 3834 3837 3423
		f 4 4213 3052 3370 4214
		mu 0 4 3861 3420 3423 3837
		f 4 -4214 4216 4215 3046
		mu 0 4 3411 3856 3859 3412
		f 4 4217 3044 -4216 4218
		mu 0 4 3854 3407 3406 3855
		f 4 -4218 4220 4219 3036
		mu 0 4 3397 3850 3849 3392
		f 4 4221 3034 -4220 4222
		mu 0 4 3848 3393 3392 3849
		f 4 -4222 4224 4223 3026
		mu 0 4 3383 4679 3841 3384
		f 4 4210 3062 -4224 4225
		mu 0 4 3840 3434 3384 3841
		f 4 -4243 -2699 4227 4226
		mu 0 4 4680 4681 3569 3568
		f 4 -4227 4229 4228 -4245
		mu 0 4 4682 3572 3575 4683
		f 4 -4247 -4229 4231 4230
		mu 0 4 4684 4683 3575 3576
		f 4 -4231 4233 4232 -4249
		mu 0 4 4684 3576 3579 4685
		f 4 -4251 -4233 4235 4234
		mu 0 4 4686 4685 3579 4687
		f 4 -4235 4237 4236 -4253
		mu 0 4 4688 3580 3585 4689
		f 4 -4255 -4237 4239 4238
		mu 0 4 4690 4691 3587 3586
		f 4 -4239 4240 -2731 -4256
		mu 0 4 4690 3586 3591 4692
		f 4 -4257 -2716 4242 4241
		mu 0 4 4693 4694 4681 4680
		f 4 -4242 4244 4243 -4258
		mu 0 4 4693 4680 4695 4696
		f 4 -4259 -4244 4246 4245
		mu 0 4 4697 4698 4683 4684
		f 4 -4246 4248 4247 -4260
		mu 0 4 4697 4684 4685 4699
		f 4 -4261 -4248 4250 4249
		mu 0 4 4700 4699 4685 4686
		f 4 -4250 4252 4251 -4262
		mu 0 4 4701 4688 4689 4702
		f 4 -4263 -4252 4254 4253
		mu 0 4 4703 4704 4691 4690
		f 4 -4254 4255 -2740 -4264
		mu 0 4 4703 4690 4692 4705
		f 4 2911 -2742 4256 4264
		mu 0 4 4706 4707 4694 4693
		f 4 -4265 4257 4265 2918
		mu 0 4 4706 4693 4696 4708
		f 4 2919 -4266 4258 4266
		mu 0 4 4709 4710 4698 4697
		f 4 -4267 4259 4267 2920
		mu 0 4 4709 4697 4699 4711
		f 4 2921 -4268 4260 4268
		mu 0 4 3238 3241 4712 4701
		f 4 -4269 4261 4269 2922
		mu 0 4 3238 4701 4702 3245
		f 4 2923 -4270 4262 4270
		mu 0 4 3246 3245 4702 4713
		f 4 -4271 4263 -1203 2924
		mu 0 4 4714 4703 4705 4715
		f 4 4271 -1236 -3298 3295
		mu 0 4 4716 4717 4718 4719
		f 4 4274 -4276 -4274 3250
		mu 0 4 4720 4721 4722 3726
		f 4 4277 -4279 -4277 3253
		mu 0 4 4723 4724 4725 4726
		f 4 4279 -4281 -4275 3257
		mu 0 4 4727 4728 4729 4730
		f 4 4282 -4284 -4282 3285
		mu 0 4 4731 4732 4733 4734
		f 4 4281 -4285 -4278 3290
		mu 0 4 4735 4736 4724 4723
		f 4 4273 -4287 -4286 3292
		mu 0 4 3726 4722 4737 3727
		f 4 4285 -4289 -4288 3296
		mu 0 4 4738 4739 4740 4716
		f 4 4276 -4290 -4280 3412
		mu 0 4 4741 4742 4743 4744
		f 4 -4292 -4283 4272 2752
		mu 0 4 4745 4746 4747 4748
		f 4 -4272 4287 4290 -2771
		mu 0 4 4717 4716 4740 4749
		f 4 4292 4294 -4294 -3234
		mu 0 4 3715 3653 3656 4750
		f 4 4293 -4297 -4296 3230
		mu 0 4 4750 3656 3655 3712
		f 4 4295 4298 -4298 -3235
		mu 0 4 3712 3655 3654 3713
		f 4 4297 4299 -4293 -3236
		mu 0 4 3713 3654 3653 3715
		f 4 -4301 4302 -3242 3091
		mu 0 4 4751 3665 3668 4752
		f 4 3241 4304 4303 -3273
		mu 0 4 4753 3703 3669 4754
		f 4 -4304 4306 -3245 3185
		mu 0 4 4754 3669 3672 4755
		f 4 3244 4308 -3248 3179
		mu 0 4 4756 3673 3676 3692
		f 4 -3263 3260 3247 4310
		mu 0 4 3694 3689 3692 3676
		f 4 4311 3283 3262 4312
		mu 0 4 3661 3555 3689 3694
		f 4 -4312 4314 -3239 3177
		mu 0 4 3555 3661 3664 3556
		f 4 -3267 3265 3238 4316
		mu 0 4 3698 3696 3556 3664
		f 4 4317 -3320 3266 4318
		mu 0 4 3758 3700 3696 3698
		f 4 4300 3268 -4318 4319
		mu 0 4 3665 4751 4757 3702;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "pSphere2" -p "Cheetah_Mesh";
	rename -uid "B1686F58-4583-623F-06B3-05AAC8546915";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" -8.8817841970012504e-16 87.984886169433594 70.347801208496108 ;
	setAttr ".sp" -type "double3" 0 87.984886169433594 70.347801208496108 ;
createNode mesh -n "pSphereShape2" -p "pSphere2";
	rename -uid "E76CBCD8-47D7-FEAD-2827-2DA1702A3B3D";
	addAttr -ci true -h true -sn "sref" -ln "surfaceReference" -min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "reff" -ln "referenceFile" -dt "string";
	addAttr -ci true -h true -sn "fns" -ln "furNameSpace" -dt "string";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".vcs" 2;
createNode mesh -n "pSphereShape2Orig" -p "pSphere2";
	rename -uid "5D5E35C1-4D7D-7610-729C-10B5F967CDBF";
	addAttr -ci true -h true -sn "sref" -ln "surfaceReference" -min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "reff" -ln "referenceFile" -dt "string";
	addAttr -ci true -h true -sn "fns" -ln "furNameSpace" -dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 439 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0.050000001 0.050000001 0.050000001
		 0.1 0.050000001 0.15000001 0.050000001 0.2 0.050000001 0.25 0.050000001 0.30000001
		 0.050000001 0.35000002 0.050000001 0.40000004 0.050000001 0.45000005 0.050000001
		 0.50000006 0.050000001 0.55000007 0.050000001 0.60000008 0.050000001 0.6500001 0.050000001
		 0.70000011 0.050000001 0.75000012 0.050000001 0.80000013 0.050000001 0.85000014 0.050000001
		 0.90000015 0.050000001 0.95000017 0.050000001 1.000000119209 0.050000001 0 0.1 0.050000001
		 0.1 0.1 0.1 0.15000001 0.1 0.2 0.1 0.25 0.1 0.30000001 0.1 0.35000002 0.1 0.40000004
		 0.1 0.45000005 0.1 0.50000006 0.1 0.55000007 0.1 0.60000008 0.1 0.6500001 0.1 0.70000011
		 0.1 0.75000012 0.1 0.80000013 0.1 0.85000014 0.1 0.90000015 0.1 0.95000017 0.1 1.000000119209
		 0.1 0 0.15000001 0.050000001 0.15000001 0.1 0.15000001 0.15000001 0.15000001 0.2
		 0.15000001 0.25 0.15000001 0.30000001 0.15000001 0.35000002 0.15000001 0.40000004
		 0.15000001 0.45000005 0.15000001 0.50000006 0.15000001 0.55000007 0.15000001 0.60000008
		 0.15000001 0.6500001 0.15000001 0.70000011 0.15000001 0.75000012 0.15000001 0.80000013
		 0.15000001 0.85000014 0.15000001 0.90000015 0.15000001 0.95000017 0.15000001 1.000000119209
		 0.15000001 0 0.2 0.050000001 0.2 0.1 0.2 0.15000001 0.2 0.2 0.2 0.25 0.2 0.30000001
		 0.2 0.35000002 0.2 0.40000004 0.2 0.45000005 0.2 0.50000006 0.2 0.55000007 0.2 0.60000008
		 0.2 0.6500001 0.2 0.70000011 0.2 0.75000012 0.2 0.80000013 0.2 0.85000014 0.2 0.90000015
		 0.2 0.95000017 0.2 1.000000119209 0.2 0 0.25 0.050000001 0.25 0.1 0.25 0.15000001
		 0.25 0.2 0.25 0.25 0.25 0.30000001 0.25 0.35000002 0.25 0.40000004 0.25 0.45000005
		 0.25 0.50000006 0.25 0.55000007 0.25 0.60000008 0.25 0.6500001 0.25 0.70000011 0.25
		 0.75000012 0.25 0.80000013 0.25 0.85000014 0.25 0.90000015 0.25 0.95000017 0.25 1.000000119209
		 0.25 0 0.30000001 0.050000001 0.30000001 0.1 0.30000001 0.15000001 0.30000001 0.2
		 0.30000001 0.25 0.30000001 0.30000001 0.30000001 0.35000002 0.30000001 0.40000004
		 0.30000001 0.45000005 0.30000001 0.50000006 0.30000001 0.55000007 0.30000001 0.60000008
		 0.30000001 0.6500001 0.30000001 0.70000011 0.30000001 0.75000012 0.30000001 0.80000013
		 0.30000001 0.85000014 0.30000001 0.90000015 0.30000001 0.95000017 0.30000001 1.000000119209
		 0.30000001 0 0.35000002 0.050000001 0.35000002 0.1 0.35000002 0.15000001 0.35000002
		 0.2 0.35000002 0.25 0.35000002 0.30000001 0.35000002 0.35000002 0.35000002 0.40000004
		 0.35000002 0.45000005 0.35000002 0.50000006 0.35000002 0.55000007 0.35000002 0.60000008
		 0.35000002 0.6500001 0.35000002 0.70000011 0.35000002 0.75000012 0.35000002 0.80000013
		 0.35000002 0.85000014 0.35000002 0.90000015 0.35000002 0.95000017 0.35000002 1.000000119209
		 0.35000002 0 0.40000004 0.050000001 0.40000004 0.1 0.40000004 0.15000001 0.40000004
		 0.2 0.40000004 0.25 0.40000004 0.30000001 0.40000004 0.35000002 0.40000004 0.40000004
		 0.40000004 0.45000005 0.40000004 0.50000006 0.40000004 0.55000007 0.40000004 0.60000008
		 0.40000004 0.6500001 0.40000004 0.70000011 0.40000004 0.75000012 0.40000004 0.80000013
		 0.40000004 0.85000014 0.40000004 0.90000015 0.40000004 0.95000017 0.40000004 1.000000119209
		 0.40000004 0 0.45000005 0.050000001 0.45000005 0.1 0.45000005 0.15000001 0.45000005
		 0.2 0.45000005 0.25 0.45000005 0.30000001 0.45000005 0.35000002 0.45000005 0.40000004
		 0.45000005 0.45000005 0.45000005 0.50000006 0.45000005 0.55000007 0.45000005 0.60000008
		 0.45000005 0.6500001 0.45000005 0.70000011 0.45000005 0.75000012 0.45000005 0.80000013
		 0.45000005 0.85000014 0.45000005 0.90000015 0.45000005 0.95000017 0.45000005 1.000000119209
		 0.45000005 0 0.50000006 0.050000001 0.50000006 0.1 0.50000006 0.15000001 0.50000006
		 0.2 0.50000006 0.25 0.50000006 0.30000001 0.50000006 0.35000002 0.50000006 0.40000004
		 0.50000006 0.45000005 0.50000006 0.50000006 0.50000006 0.55000007 0.50000006 0.60000008
		 0.50000006 0.6500001 0.50000006 0.70000011 0.50000006 0.75000012 0.50000006 0.80000013
		 0.50000006 0.85000014 0.50000006 0.90000015 0.50000006 0.95000017 0.50000006 1.000000119209
		 0.50000006 0 0.55000007 0.050000001 0.55000007 0.1 0.55000007 0.15000001 0.55000007
		 0.2 0.55000007 0.25 0.55000007 0.30000001 0.55000007 0.35000002 0.55000007 0.40000004
		 0.55000007 0.45000005 0.55000007 0.50000006 0.55000007 0.55000007 0.55000007 0.60000008
		 0.55000007 0.6500001 0.55000007 0.70000011 0.55000007 0.75000012 0.55000007 0.80000013
		 0.55000007 0.85000014 0.55000007 0.90000015 0.55000007 0.95000017 0.55000007 1.000000119209
		 0.55000007 0 0.60000008 0.050000001 0.60000008 0.1 0.60000008 0.15000001 0.60000008
		 0.2 0.60000008 0.25 0.60000008 0.30000001 0.60000008 0.35000002 0.60000008 0.40000004
		 0.60000008 0.45000005 0.60000008 0.50000006 0.60000008 0.55000007 0.60000008 0.60000008
		 0.60000008 0.6500001 0.60000008 0.70000011 0.60000008 0.75000012 0.60000008 0.80000013
		 0.60000008 0.85000014 0.60000008 0.90000015 0.60000008;
	setAttr ".uvst[0].uvsp[250:438]" 0.95000017 0.60000008 1.000000119209 0.60000008
		 0 0.6500001 0.050000001 0.6500001 0.1 0.6500001 0.15000001 0.6500001 0.2 0.6500001
		 0.25 0.6500001 0.30000001 0.6500001 0.35000002 0.6500001 0.40000004 0.6500001 0.45000005
		 0.6500001 0.50000006 0.6500001 0.55000007 0.6500001 0.60000008 0.6500001 0.6500001
		 0.6500001 0.70000011 0.6500001 0.75000012 0.6500001 0.80000013 0.6500001 0.85000014
		 0.6500001 0.90000015 0.6500001 0.95000017 0.6500001 1.000000119209 0.6500001 0 0.70000011
		 0.050000001 0.70000011 0.1 0.70000011 0.15000001 0.70000011 0.2 0.70000011 0.25 0.70000011
		 0.30000001 0.70000011 0.35000002 0.70000011 0.40000004 0.70000011 0.45000005 0.70000011
		 0.50000006 0.70000011 0.55000007 0.70000011 0.60000008 0.70000011 0.6500001 0.70000011
		 0.70000011 0.70000011 0.75000012 0.70000011 0.80000013 0.70000011 0.85000014 0.70000011
		 0.90000015 0.70000011 0.95000017 0.70000011 1.000000119209 0.70000011 0 0.75000012
		 0.050000001 0.75000012 0.1 0.75000012 0.15000001 0.75000012 0.2 0.75000012 0.25 0.75000012
		 0.30000001 0.75000012 0.35000002 0.75000012 0.40000004 0.75000012 0.45000005 0.75000012
		 0.50000006 0.75000012 0.55000007 0.75000012 0.60000008 0.75000012 0.6500001 0.75000012
		 0.70000011 0.75000012 0.75000012 0.75000012 0.80000013 0.75000012 0.85000014 0.75000012
		 0.90000015 0.75000012 0.95000017 0.75000012 1.000000119209 0.75000012 0 0.80000013
		 0.050000001 0.80000013 0.1 0.80000013 0.15000001 0.80000013 0.2 0.80000013 0.25 0.80000013
		 0.30000001 0.80000013 0.35000002 0.80000013 0.40000004 0.80000013 0.45000005 0.80000013
		 0.50000006 0.80000013 0.55000007 0.80000013 0.60000008 0.80000013 0.6500001 0.80000013
		 0.70000011 0.80000013 0.75000012 0.80000013 0.80000013 0.80000013 0.85000014 0.80000013
		 0.90000015 0.80000013 0.95000017 0.80000013 1.000000119209 0.80000013 0 0.85000014
		 0.050000001 0.85000014 0.1 0.85000014 0.15000001 0.85000014 0.2 0.85000014 0.25 0.85000014
		 0.30000001 0.85000014 0.35000002 0.85000014 0.40000004 0.85000014 0.45000005 0.85000014
		 0.50000006 0.85000014 0.55000007 0.85000014 0.60000008 0.85000014 0.6500001 0.85000014
		 0.70000011 0.85000014 0.75000012 0.85000014 0.80000013 0.85000014 0.85000014 0.85000014
		 0.90000015 0.85000014 0.95000017 0.85000014 1.000000119209 0.85000014 0 0.90000015
		 0.050000001 0.90000015 0.1 0.90000015 0.15000001 0.90000015 0.2 0.90000015 0.25 0.90000015
		 0.30000001 0.90000015 0.35000002 0.90000015 0.40000004 0.90000015 0.45000005 0.90000015
		 0.50000006 0.90000015 0.55000007 0.90000015 0.60000008 0.90000015 0.6500001 0.90000015
		 0.70000011 0.90000015 0.75000012 0.90000015 0.80000013 0.90000015 0.85000014 0.90000015
		 0.90000015 0.90000015 0.95000017 0.90000015 1.000000119209 0.90000015 0 0.95000017
		 0.050000001 0.95000017 0.1 0.95000017 0.15000001 0.95000017 0.2 0.95000017 0.25 0.95000017
		 0.30000001 0.95000017 0.35000002 0.95000017 0.40000004 0.95000017 0.45000005 0.95000017
		 0.50000006 0.95000017 0.55000007 0.95000017 0.60000008 0.95000017 0.6500001 0.95000017
		 0.70000011 0.95000017 0.75000012 0.95000017 0.80000013 0.95000017 0.85000014 0.95000017
		 0.90000015 0.95000017 0.95000017 0.95000017 1.000000119209 0.95000017 0.025 0 0.075000003
		 0 0.125 0 0.17500001 0 0.22500001 0 0.27500001 0 0.32500002 0 0.375 0 0.42500001
		 0 0.47500002 0 0.52499998 0 0.57499999 0 0.625 0 0.67500001 0 0.72499996 0 0.77499998
		 0 0.82499999 0 0.875 0 0.92500001 0 0.97499996 0 0.025 1 0.075000003 1 0.125 1 0.17500001
		 1 0.22500001 1 0.27500001 1 0.32500002 1 0.375 1 0.42500001 1 0.47500002 1 0.52499998
		 1 0.57499999 1 0.625 1 0.67500001 1 0.72499996 1 0.77499998 1 0.82499999 1 0.875
		 1 0.92500001 1 0.97499996 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".op" yes;
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 382 ".pt";
	setAttr ".pt[0:165]" -type "float3"  -4.7598162 87.10437 67.573845 -4.6512852 
		87.079742 67.573845 -4.4822435 87.060196 67.573845 -4.2692389 87.047661 67.573845 
		-4.0331216 87.043327 67.573845 -3.7970042 87.047661 67.573845 -3.5839996 87.060196 
		67.573845 -3.4149585 87.079742 67.573845 -3.3064272 87.10437 67.573845 -3.2690299 
		87.13166 67.573845 -3.3064272 87.158966 67.573845 -3.4149585 87.183571 67.573845 
		-3.5839999 87.203117 67.573845 -3.7970042 87.215668 67.573845 -4.0331216 87.219986 
		67.573845 -4.2692389 87.215668 67.573845 -4.4822431 87.203117 67.573845 -4.6512847 
		87.183571 67.573845 -4.7598157 87.158966 67.573845 -4.7972131 87.13166 67.573845 
		-5.4686165 87.077744 67.553162 -5.2542267 87.029106 67.553162 -4.9203067 86.990517 
		67.553162 -4.4995422 86.965721 67.553162 -4.0331216 86.957184 67.553162 -3.5667009 
		86.965721 67.553162 -3.145937 86.990517 67.553162 -2.8120165 87.029106 67.553162 
		-2.5976267 87.077744 67.553162 -2.5237529 87.13166 67.553162 -2.5976267 87.185577 
		67.553162 -2.8120167 87.234207 67.553162 -3.145937 87.27282 67.553162 -3.5667009 
		87.2976 67.553162 -4.0331216 87.306137 67.553162 -4.4995422 87.2976 67.553162 -4.9203062 
		87.27282 67.553162 -5.2542262 87.234207 67.553162 -5.468616 87.185577 67.553162 -5.54249 
		87.13166 67.553162 -6.1420717 87.052444 67.519257 -5.8271017 86.980995 67.519257 
		-5.336524 86.924286 67.519257 -4.7183609 86.887878 67.519257 -4.0331216 86.875328 
		67.519257 -3.3478823 86.887878 67.519257 -2.7297192 86.924286 67.519257 -2.2391422 
		86.980995 67.519257 -1.9241724 87.052444 67.519257 -1.8156414 87.13166 67.519257 
		-1.9241724 87.210876 67.519257 -2.2391424 87.282333 67.519257 -2.7297196 87.339043 
		67.519257 -3.3478825 87.37545 67.519257 -4.0331216 87.387993 67.519257 -4.7183604 
		87.37545 67.519257 -5.336524 87.339043 67.519257 -5.8271003 87.282333 67.519257 -6.1420708 
		87.210876 67.519257 -6.2506013 87.13166 67.519257 -6.7635956 87.029106 67.472961 
		-6.3558021 86.936592 67.472961 -5.7206469 86.863167 67.472961 -4.9203062 86.816025 
		67.472961 -4.0331216 86.799782 67.472961 -3.145937 86.816025 67.472961 -2.3455958 
		86.863167 67.472961 -1.7104421 86.936592 67.472961 -1.3026481 87.029106 67.472961 
		-1.1621319 87.13166 67.472961 -1.3026481 87.234207 67.472961 -1.7104422 87.326736 
		67.472961 -2.3455963 87.400146 67.472961 -3.145937 87.447296 67.472961 -4.0331216 
		87.463539 67.472961 -4.9203057 87.447296 67.472961 -5.7206464 87.400146 67.472961 
		-6.3558011 87.326736 67.472961 -6.7635946 87.234207 67.472961 -6.9041104 87.13166 
		67.472961 -7.3178878 87.008286 67.415421 -6.8273106 86.896996 67.415421 -6.0632186 
		86.808662 67.415421 -5.1004071 86.751953 67.415421 -4.0331216 86.732407 67.415421 
		-2.9658365 86.751953 67.415421 -2.0030251 86.808662 67.415421 -1.2389336 86.896996 
		67.415421 -0.74835664 87.008286 67.415421 -0.57931536 87.13166 67.415421 -0.74835664 
		87.255035 67.415421 -1.2389338 87.366333 67.415421 -2.0030253 87.454659 67.415421 
		-2.9658368 87.51136 67.415421 -4.0331216 87.530914 67.415421 -5.1004062 87.51136 
		67.415421 -6.0632172 87.454659 67.415421 -6.8273087 87.366333 67.415421 -7.3178854 
		87.255035 67.415421 -7.4869275 87.13166 67.415421 -7.7912979 86.990517 67.348045 
		-7.2300172 86.863167 67.348045 -6.3558021 86.762108 67.348045 -5.2542267 86.697227 
		67.348045 -4.0331216 86.674873 67.348045 -2.8120162 86.697227 67.348045 -1.7104417 
		86.762108 67.348045 -0.83622718 86.863167 67.348045 -0.27494705 86.990517 67.348045 
		-0.081543215 87.13166 67.348045 -0.27494705 87.27282 67.348045 -0.8362276 87.400146 
		67.348045 -1.7104422 87.501213 67.348045 -2.8120167 87.566086 67.348045 -4.0331216 
		87.588455 67.348045 -5.2542262 87.566086 67.348045 -6.3558011 87.501213 67.348045 
		-7.2300148 87.400146 67.348045 -7.7912951 87.27282 67.348045 -7.9846992 87.13166 
		67.348045 -8.1721687 86.976204 67.272507 -7.5540051 86.83596 67.272507 -6.5911937 
		86.724655 67.272507 -5.3779788 86.653198 67.272507 -4.0331216 86.628578 67.272507 
		-2.6882641 86.653198 67.272507 -1.4750503 86.724655 67.272507 -0.51223898 86.83596 
		67.272507 0.10592414 86.976204 67.272507 0.31892812 87.13166 67.272507 0.10592414 
		87.287125 67.272507 -0.51223922 87.427368 67.272507 -1.475051 87.538666 67.272507 
		-2.6882644 87.61013 67.272507 -4.0331216 87.634735 67.272507 -5.3779783 87.61013 
		67.272507 -6.5911918 87.538666 67.272507 -7.5540028 87.427368 67.272507 -8.1721659 
		87.287125 67.272507 -8.38517 87.13166 67.272507 -8.4511223 86.965721 67.190651 -7.7912979 
		86.816025 67.190651 -6.7635956 86.697227 67.190651 -5.4686165 86.620956 67.190651 
		-4.0331216 86.594673 67.190651 -2.597626 86.620956 67.190651 -1.3026476 86.697227 
		67.190651 -0.27494705 86.816025 67.190651 0.38487744 86.965721 67.190651 0.61223763 
		87.13166 67.190651 0.38487744 87.2976 67.190651 -0.27494705 87.447296 67.190651 -1.3026482 
		87.566086 67.190651 -2.5976267 87.642372 67.190651 -4.0331216 87.668648 67.190651 
		-5.468616 87.642372 67.190651 -6.7635946 87.566086 67.190651 -7.7912951 87.447296 
		67.190651 -8.4511194 87.2976 67.190651 -8.6784792 87.13166 67.190651 -8.6212902 86.959335 
		67.1045 -7.9360514 86.803871 67.1045 -6.8687654 86.680496 67.1045 -5.5239077 86.60128 
		67.1045 -4.0331216 86.57399 67.1045 -2.542335 86.60128 67.1045;
	setAttr ".pt[166:331]" -1.1974778 86.680496 67.1045 -0.13019308 86.803871 
		67.1045 0.55504578 86.959335 67.1045 0.79116303 87.13166 67.1045 0.55504578 87.303993 
		67.1045 -0.13019352 87.459457 67.1045 -1.1974785 87.582832 67.1045 -2.5423357 87.662041 
		67.1045 -4.0331216 87.689331 67.1045 -5.5239072 87.662041 67.1045 -6.8687639 87.582832 
		67.1045 -7.9360485 87.459457 67.1045 -8.6212873 87.303993 67.1045 -8.8574047 87.13166 
		67.1045 -8.6784821 86.957184 67.016174 -7.9847016 86.799782 67.016174 -6.9041123 
		86.674873 67.016174 -5.5424905 86.594673 67.016174 -4.0331216 86.567039 67.016174 
		-2.5237525 86.594673 67.016174 -1.1621313 86.674873 67.016174 -0.081542782 86.799782 
		67.016174 0.61223763 86.957184 67.016174 0.85129809 87.13166 67.016174 0.61223763 
		87.306137 67.016174 -0.081543215 87.463539 67.016174 -1.1621319 87.588455 67.016174 
		-2.5237529 87.668648 67.016174 -4.0331216 87.696281 67.016174 -5.5424895 87.668648 
		67.016174 -6.9041104 87.588455 67.016174 -7.9846992 87.463539 67.016174 -8.6784792 
		87.306137 67.016174 -8.9175396 87.13166 67.016174 -8.6212902 86.959335 66.927841 
		-7.9360514 86.803871 66.927841 -6.8687654 86.680496 66.927841 -5.5239077 86.60128 
		66.927841 -4.0331216 86.57399 66.927841 -2.542335 86.60128 66.927841 -1.1974778 86.680496 
		66.927841 -0.13019308 86.803871 66.927841 0.55504578 86.959335 66.927841 0.79116303 
		87.13166 66.927841 0.55504578 87.303993 66.927841 -0.13019352 87.459457 66.927841 
		-1.1974785 87.582832 66.927841 -2.5423357 87.662041 66.927841 -4.0331216 87.689331 
		66.927841 -5.5239072 87.662041 66.927841 -6.8687639 87.582832 66.927841 -7.9360485 
		87.459457 66.927841 -8.6212873 87.303993 66.927841 -8.8574047 87.13166 66.927841 
		-8.4511223 86.965721 66.84169 -7.7912979 86.816025 66.84169 -6.7635956 86.697227 
		66.84169 -5.4686165 86.620956 66.84169 -4.0331216 86.594673 66.84169 -2.597626 86.620956 
		66.84169 -1.3026476 86.697227 66.84169 -0.27494705 86.816025 66.84169 0.38487744 
		86.965721 66.84169 0.61223763 87.13166 66.84169 0.38487744 87.2976 66.84169 -0.27494705 
		87.447296 66.84169 -1.3026482 87.566086 66.84169 -2.5976267 87.642372 66.84169 -4.0331216 
		87.668648 66.84169 -5.468616 87.642372 66.84169 -6.7635946 87.566086 66.84169 -7.7912951 
		87.447296 66.84169 -8.4511194 87.2976 66.84169 -8.6784792 87.13166 66.84169 -8.1721687 
		86.976204 66.759834 -7.5540051 86.83596 66.759834 -6.5911937 86.724655 66.759834 
		-5.3779788 86.653198 66.759834 -4.0331216 86.628578 66.759834 -2.6882641 86.653198 
		66.759834 -1.4750503 86.724655 66.759834 -0.51223898 86.83596 66.759834 0.10592414 
		86.976204 66.759834 0.31892812 87.13166 66.759834 0.10592414 87.287125 66.759834 
		-0.51223922 87.427368 66.759834 -1.475051 87.538666 66.759834 -2.6882644 87.61013 
		66.759834 -4.0331216 87.634735 66.759834 -5.3779783 87.61013 66.759834 -6.5911918 
		87.538666 66.759834 -7.5540028 87.427368 66.759834 -8.1721659 87.287125 66.759834 
		-8.38517 87.13166 66.759834 -7.7912979 86.990517 66.684296 -7.2300172 86.863167 66.684296 
		-6.3558021 86.762108 66.684296 -5.2542267 86.697227 66.684296 -4.0331216 86.674873 
		66.684296 -2.8120162 86.697227 66.684296 -1.7104417 86.762108 66.684296 -0.83622718 
		86.863167 66.684296 -0.27494705 86.990517 66.684296 -0.081543215 87.13166 66.684296 
		-0.27494705 87.27282 66.684296 -0.8362276 87.400146 66.684296 -1.7104422 87.501213 
		66.684296 -2.8120167 87.566086 66.684296 -4.0331216 87.588455 66.684296 -5.2542262 
		87.566086 66.684296 -6.3558011 87.501213 66.684296 -7.2300148 87.400146 66.684296 
		-7.7912951 87.27282 66.684296 -7.9846992 87.13166 66.684296 -7.3178878 87.008286 
		66.61692 -6.8273106 86.896996 66.61692 -6.0632186 86.808662 66.61692 -5.1004071 86.751953 
		66.61692 -4.0331216 86.732407 66.61692 -2.9658365 86.751953 66.61692 -2.0030251 86.808662 
		66.61692 -1.2389336 86.896996 66.61692 -0.74835664 87.008286 66.61692 -0.57931536 
		87.13166 66.61692 -0.74835664 87.255035 66.61692 -1.2389338 87.366333 66.61692 -2.0030253 
		87.454659 66.61692 -2.9658368 87.51136 66.61692 -4.0331216 87.530914 66.61692 -5.1004062 
		87.51136 66.61692 -6.0632172 87.454659 66.61692 -6.8273087 87.366333 66.61692 -7.3178854 
		87.255035 66.61692 -7.4869275 87.13166 66.61692 -6.7635956 87.029106 66.55938 -6.3558021 
		86.936592 66.55938 -5.7206469 86.863167 66.55938 -4.9203062 86.816025 66.55938 -4.0331216 
		86.799782 66.55938 -3.145937 86.816025 66.55938 -2.3455958 86.863167 66.55938 -1.7104421 
		86.936592 66.55938 -1.3026481 87.029106 66.55938 -1.1621319 87.13166 66.55938 -1.3026481 
		87.234207 66.55938 -1.7104422 87.326736 66.55938 -2.3455963 87.400146 66.55938 -3.145937 
		87.447296 66.55938 -4.0331216 87.463539 66.55938 -4.9203057 87.447296 66.55938 -5.7206464 
		87.400146 66.55938 -6.3558011 87.326736 66.55938 -6.7635946 87.234207 66.55938 -6.9041104 
		87.13166 66.55938 -6.1420717 87.052444 66.513084 -5.8271017 86.980995 66.513084 -5.336524 
		86.924286 66.513084 -4.7183609 86.887878 66.513084 -4.0331216 86.875328 66.513084 
		-3.3478823 86.887878 66.513084 -2.7297192 86.924286 66.513084 -2.2391422 86.980995 
		66.513084 -1.9241724 87.052444 66.513084 -1.8156414 87.13166 66.513084 -1.9241724 
		87.210876 66.513084 -2.2391424 87.282333 66.513084;
	setAttr ".pt[332:381]" -2.7297196 87.339043 66.513084 -3.3478825 87.37545 
		66.513084 -4.0331216 87.387993 66.513084 -4.7183604 87.37545 66.513084 -5.336524 
		87.339043 66.513084 -5.8271003 87.282333 66.513084 -6.1420708 87.210876 66.513084 
		-6.2506013 87.13166 66.513084 -5.4686165 87.077744 66.479179 -5.2542267 87.029106 
		66.479179 -4.9203067 86.990517 66.479179 -4.4995422 86.965721 66.479179 -4.0331216 
		86.957184 66.479179 -3.5667009 86.965721 66.479179 -3.145937 86.990517 66.479179 
		-2.8120165 87.029106 66.479179 -2.5976267 87.077744 66.479179 -2.5237529 87.13166 
		66.479179 -2.5976267 87.185577 66.479179 -2.8120167 87.234207 66.479179 -3.145937 
		87.27282 66.479179 -3.5667009 87.2976 66.479179 -4.0331216 87.306137 66.479179 -4.4995422 
		87.2976 66.479179 -4.9203062 87.27282 66.479179 -5.2542262 87.234207 66.479179 -5.468616 
		87.185577 66.479179 -5.54249 87.13166 66.479179 -4.7598162 87.10437 66.458496 -4.6512852 
		87.079742 66.458496 -4.4822435 87.060196 66.458496 -4.2692389 87.047661 66.458496 
		-4.0331216 87.043327 66.458496 -3.7970042 87.047661 66.458496 -3.5839996 87.060196 
		66.458496 -3.4149585 87.079742 66.458496 -3.3064272 87.10437 66.458496 -3.2690299 
		87.13166 66.458496 -3.3064272 87.158966 66.458496 -3.4149585 87.183571 66.458496 
		-3.5839999 87.203117 66.458496 -3.7970042 87.215668 66.458496 -4.0331216 87.219986 
		66.458496 -4.2692389 87.215668 66.458496 -4.4822431 87.203117 66.458496 -4.6512847 
		87.183571 66.458496 -4.7598157 87.158966 66.458496 -4.7972131 87.13166 66.458496 
		-4.0331216 87.13166 67.580795 -4.0331216 87.13166 66.451546;
	setAttr -s 382 ".vt";
	setAttr ".vt[0:165]"  0.40529537 0.13168845 -2.6906209 0.34476486 0.25048631 -2.6906209
		 0.25048631 0.34476483 -2.6906209 0.13168843 0.40529531 -2.6906209 0 0.42615271 -2.6906209
		 -0.13168843 0.40529531 -2.6906209 -0.25048625 0.34476477 -2.6906209 -0.34476471 0.25048622 -2.6906209
		 -0.40529522 0.13168839 -2.6906209 -0.42615259 -5.9743785e-16 -2.6906209 -0.40529522 -0.13168839 -2.6906209
		 -0.34476468 -0.2504862 -2.6906209 -0.2504862 -0.34476468 -2.6906209 -0.13168839 -0.40529516 -2.6906209
		 -1.2700334e-08 -0.42615256 -2.6906209 0.13168836 -0.40529516 -2.6906209 0.25048614 -0.34476465 -2.6906209
		 0.34476462 -0.25048617 -2.6906209 0.40529516 -0.13168837 -2.6906209 0.4261525 -5.9743785e-16 -2.6906209
		 0.80061096 0.26013428 -2.59083033 0.68104035 0.49480477 -2.59083033 0.49480477 0.68104035 -2.59083033
		 0.26013425 0.8006109 -2.59083033 0 0.84181213 -2.59083033 -0.26013425 0.80061078 -2.59083033
		 -0.49480474 0.68104017 -2.59083033 -0.68104017 0.49480462 -2.59083033 -0.80061066 0.26013419 -2.59083033
		 -0.84181178 -5.7527979e-16 -2.59083033 -0.80061066 -0.26013419 -2.59083033 -0.68104017 -0.49480456 -2.59083033
		 -0.49480456 -0.68104005 -2.59083033 -0.26013419 -0.80061054 -2.59083033 -2.5087942e-08 -0.84181178 -2.59083033
		 0.2601341 -0.80061054 -2.59083033 0.49480447 -0.68103999 -2.59083033 0.68103993 -0.49480456 -2.59083033
		 0.80061048 -0.2601341 -2.59083033 0.84181166 -5.7527979e-16 -2.59083033 1.17621303 0.38217479 -2.42724419
		 1.00054657459 0.72693956 -2.42724419 0.72693956 1.00054645538 -2.42724419 0.38217473 1.17621291 -2.42724419
		 0 1.23674333 -2.42724419 -0.38217473 1.17621279 -2.42724419 -0.72693944 1.00054621696 -2.42724419
		 -1.00054621696 0.72693944 -2.42724419 -1.17621255 0.38217461 -2.42724419 -1.23674297 -5.3895648e-16 -2.42724419
		 -1.17621255 -0.38217461 -2.42724419 -1.00054609776 -0.72693926 -2.42724419 -0.72693926 -1.00054609776 -2.42724419
		 -0.38217461 -1.17621243 -2.42724419 -3.6857806e-08 -1.23674285 -2.42724419 0.38217449 -1.17621231 -2.42724419
		 0.72693908 -1.00054597855 -2.42724419 1.00054585934 -0.7269392 -2.42724419 1.17621231 -0.38217449 -2.42724419
		 1.23674273 -5.3895648e-16 -2.42724419 1.52285242 0.49480474 -2.20389152 1.29541576 0.94117457 -2.20389152
		 0.94117457 1.29541552 -2.20389152 0.49480474 1.5228523 -2.20389152 0 1.60122156 -2.20389152
		 -0.49480474 1.52285218 -2.20389152 -0.94117439 1.2954154 -2.20389152 -1.29541528 0.94117427 -2.20389152
		 -1.52285182 0.49480456 -2.20389152 -1.6012212 -4.8936222e-16 -2.20389152 -1.52285182 -0.49480456 -2.20389152
		 -1.29541516 -0.94117415 -2.20389152 -0.94117415 -1.29541516 -2.20389152 -0.49480456 -1.52285171 -2.20389152
		 -4.77201e-08 -1.6012212 -2.20389152 0.49480441 -1.52285171 -2.20389152 0.94117403 -1.29541516 -2.20389152
		 1.29541492 -0.94117409 -2.20389152 1.52285159 -0.49480447 -2.20389152 1.60122085 -4.8936222e-16 -2.20389152
		 1.83199453 0.59525108 -1.92627192 1.55838764 1.13223481 -1.92627192 1.13223481 1.55838752 -1.92627192
		 0.59525102 1.83199418 -1.92627192 0 1.92627275 -1.92627192 -0.59525102 1.83199418 -1.92627192
		 -1.13223457 1.55838716 -1.92627192 -1.55838704 1.13223445 -1.92627192 -1.83199382 0.59525084 -1.92627192
		 -1.92627227 -4.2771826e-16 -1.92627192 -1.83199382 -0.59525084 -1.92627192 -1.55838692 -1.13223433 -1.92627192
		 -1.13223433 -1.55838692 -1.92627192 -0.59525084 -1.83199358 -1.92627192 -5.7407377e-08 -1.92627203 -1.92627192
		 0.59525067 -1.83199346 -1.92627192 1.1322341 -1.5583868 -1.92627192 1.5583868 -1.13223422 -1.92627192
		 1.83199334 -0.59525073 -1.92627192 1.92627192 -4.2771826e-16 -1.92627192 2.096026659 0.68104035 -1.60122085
		 1.782987 1.29541576 -1.60122085 1.29541576 1.78298676 -1.60122085 0.68104029 2.096026421 -1.60122085
		 0 2.20389247 -1.60122085 -0.68104029 2.096026421 -1.60122085 -1.2954154 1.7829864 -1.60122085
		 -1.7829864 1.29541528 -1.60122085 -2.096025944 0.68104017 -1.60122085 -2.20389199 -3.5554245e-16 -1.60122085
		 -2.096025944 -0.68104017 -1.60122085 -1.78298604 -1.29541516 -1.60122085 -1.29541516 -1.78298593 -1.60122085
		 -0.68104017 -2.096025705 -1.60122085 -6.5681085e-08 -2.20389175 -1.60122085 0.68103981 -2.096025467 -1.60122085
		 1.29541492 -1.78298569 -1.60122085 1.78298569 -1.29541516 -1.60122085 2.096025467 -0.68103993 -1.60122085
		 2.20389152 -3.5554245e-16 -1.60122085 2.30844784 0.75006014 -1.23674273 1.96368313 1.42669916 -1.23674273
		 1.42669916 1.96368301 -1.23674273 0.75006002 2.3084476 -1.23674273 0 2.42724538 -1.23674273
		 -0.75006002 2.30844736 -1.23674273 -1.42669892 1.96368253 -1.23674273 -1.96368241 1.4266988 -1.23674273
		 -2.30844712 0.75005984 -1.23674273 -2.42724466 -2.7461205e-16 -1.23674273 -2.30844712 -0.75005984 -1.23674273
		 -1.96368217 -1.42669857 -1.23674273 -1.42669857 -1.96368206 -1.23674273 -0.75005984 -2.30844665 -1.23674273
		 -7.2337514e-08 -2.42724442 -1.23674273 0.75005966 -2.30844665 -1.23674273 1.42669833 -1.96368194 -1.23674273
		 1.96368182 -1.42669845 -1.23674273 2.30844641 -0.75005972 -1.23674273 2.42724419 -2.7461205e-16 -1.23674273
		 2.46402717 0.80061096 -0.8418116 2.096026897 1.52285242 -0.8418116 1.52285242 2.096026659 -0.8418116
		 0.80061078 2.46402693 -0.8418116 0 2.59083128 -0.8418116 -0.80061078 2.46402669 -0.8418116
		 -1.52285218 2.096026182 -0.8418116 -2.096025944 1.52285206 -0.8418116 -2.46402621 0.80061054 -0.8418116
		 -2.59083056 -1.8691972e-16 -0.8418116 -2.46402621 -0.80061054 -0.8418116 -2.096025944 -1.52285182 -0.8418116
		 -1.52285182 -2.096025705 -0.8418116 -0.80061054 -2.46402597 -0.8418116 -7.7212746e-08 -2.59083033 -0.8418116
		 0.80061042 -2.46402574 -0.8418116 1.52285159 -2.096025467 -0.8418116 2.096025467 -1.52285171 -0.8418116
		 2.46402574 -0.80061048 -0.8418116 2.59083033 -1.8691972e-16 -0.8418116 2.55893421 0.83144808 -0.42615223
		 2.17675948 1.58150816 -0.42615223 1.58150816 2.17675924 -0.42615223 0.83144802 2.55893397 -0.42615223
		 0 2.69062257 -0.42615223 -0.83144802 2.55893397 -0.42615223;
	setAttr ".vt[166:331]" -1.58150792 2.17675877 -0.42615223 -2.17675877 1.5815078 -0.42615223
		 -2.55893326 0.83144778 -0.42615223 -2.69062114 -9.4624803e-17 -0.42615223 -2.55893326 -0.83144778 -0.42615223
		 -2.17675853 -1.58150756 -0.42615223 -1.58150756 -2.17675829 -0.42615223 -0.83144778 -2.55893302 -0.42615223
		 -8.0186751e-08 -2.69062114 -0.42615223 0.83144754 -2.55893254 -0.42615223 1.58150721 -2.17675829 -0.42615223
		 2.17675805 -1.58150744 -0.42615223 2.55893254 -0.83144766 -0.42615223 2.6906209 -9.4624803e-17 -0.42615223
		 2.59083152 0.84181213 -1.8691984e-16 2.20389295 1.6012218 -3.5554261e-16 1.6012218 2.20389295 -4.8936254e-16
		 0.84181213 2.59083128 -5.7528006e-16 0 2.72416091 -6.0488523e-16 -0.84181213 2.59083128 -5.7528006e-16
		 -1.60122156 2.20389223 -4.8936238e-16 -2.20389223 1.60122132 -3.5554256e-16 -2.59083056 0.84181178 -1.8691978e-16
		 -2.72416067 0 0 -2.59083056 -0.84181178 1.8691978e-16 -2.20389199 -1.6012212 3.5554253e-16
		 -1.6012212 -2.20389175 4.8936227e-16 -0.84181178 -2.59083033 5.752799e-16 -8.1186286e-08 -2.72415996 6.0488502e-16
		 0.8418116 -2.59083033 5.752799e-16 1.60122085 -2.20389175 4.8936227e-16 2.20389152 -1.6012212 3.5554253e-16
		 2.59083033 -0.84181166 1.8691974e-16 2.72415972 0 0 2.55893421 0.83144808 0.42615223
		 2.17675948 1.58150816 0.42615223 1.58150816 2.17675924 0.42615223 0.83144802 2.55893397 0.42615223
		 0 2.69062257 0.42615223 -0.83144802 2.55893397 0.42615223 -1.58150792 2.17675877 0.42615223
		 -2.17675877 1.5815078 0.42615223 -2.55893326 0.83144778 0.42615223 -2.69062114 9.4624803e-17 0.42615223
		 -2.55893326 -0.83144778 0.42615223 -2.17675853 -1.58150756 0.42615223 -1.58150756 -2.17675829 0.42615223
		 -0.83144778 -2.55893302 0.42615223 -8.0186751e-08 -2.69062114 0.42615223 0.83144754 -2.55893254 0.42615223
		 1.58150721 -2.17675829 0.42615223 2.17675805 -1.58150744 0.42615223 2.55893254 -0.83144766 0.42615223
		 2.6906209 9.4624803e-17 0.42615223 2.46402717 0.80061096 0.8418116 2.096026897 1.52285242 0.8418116
		 1.52285242 2.096026659 0.8418116 0.80061078 2.46402693 0.8418116 0 2.59083128 0.8418116
		 -0.80061078 2.46402669 0.8418116 -1.52285218 2.096026182 0.8418116 -2.096025944 1.52285206 0.8418116
		 -2.46402621 0.80061054 0.8418116 -2.59083056 1.8691972e-16 0.8418116 -2.46402621 -0.80061054 0.8418116
		 -2.096025944 -1.52285182 0.8418116 -1.52285182 -2.096025705 0.8418116 -0.80061054 -2.46402597 0.8418116
		 -7.7212746e-08 -2.59083033 0.8418116 0.80061042 -2.46402574 0.8418116 1.52285159 -2.096025467 0.8418116
		 2.096025467 -1.52285171 0.8418116 2.46402574 -0.80061048 0.8418116 2.59083033 1.8691972e-16 0.8418116
		 2.30844784 0.75006014 1.23674273 1.96368313 1.42669916 1.23674273 1.42669916 1.96368301 1.23674273
		 0.75006002 2.3084476 1.23674273 0 2.42724538 1.23674273 -0.75006002 2.30844736 1.23674273
		 -1.42669892 1.96368253 1.23674273 -1.96368241 1.4266988 1.23674273 -2.30844712 0.75005984 1.23674273
		 -2.42724466 2.7461205e-16 1.23674273 -2.30844712 -0.75005984 1.23674273 -1.96368217 -1.42669857 1.23674273
		 -1.42669857 -1.96368206 1.23674273 -0.75005984 -2.30844665 1.23674273 -7.2337514e-08 -2.42724442 1.23674273
		 0.75005966 -2.30844665 1.23674273 1.42669833 -1.96368194 1.23674273 1.96368182 -1.42669845 1.23674273
		 2.30844641 -0.75005972 1.23674273 2.42724419 2.7461205e-16 1.23674273 2.096026659 0.68104035 1.60122085
		 1.782987 1.29541576 1.60122085 1.29541576 1.78298676 1.60122085 0.68104029 2.096026421 1.60122085
		 0 2.20389247 1.60122085 -0.68104029 2.096026421 1.60122085 -1.2954154 1.7829864 1.60122085
		 -1.7829864 1.29541528 1.60122085 -2.096025944 0.68104017 1.60122085 -2.20389199 3.5554245e-16 1.60122085
		 -2.096025944 -0.68104017 1.60122085 -1.78298604 -1.29541516 1.60122085 -1.29541516 -1.78298593 1.60122085
		 -0.68104017 -2.096025705 1.60122085 -6.5681085e-08 -2.20389175 1.60122085 0.68103981 -2.096025467 1.60122085
		 1.29541492 -1.78298569 1.60122085 1.78298569 -1.29541516 1.60122085 2.096025467 -0.68103993 1.60122085
		 2.20389152 3.5554245e-16 1.60122085 1.83199453 0.59525108 1.92627192 1.55838764 1.13223481 1.92627192
		 1.13223481 1.55838752 1.92627192 0.59525102 1.83199418 1.92627192 0 1.92627275 1.92627192
		 -0.59525102 1.83199418 1.92627192 -1.13223457 1.55838716 1.92627192 -1.55838704 1.13223445 1.92627192
		 -1.83199382 0.59525084 1.92627192 -1.92627227 4.2771826e-16 1.92627192 -1.83199382 -0.59525084 1.92627192
		 -1.55838692 -1.13223433 1.92627192 -1.13223433 -1.55838692 1.92627192 -0.59525084 -1.83199358 1.92627192
		 -5.7407377e-08 -1.92627203 1.92627192 0.59525067 -1.83199346 1.92627192 1.1322341 -1.5583868 1.92627192
		 1.5583868 -1.13223422 1.92627192 1.83199334 -0.59525073 1.92627192 1.92627192 4.2771826e-16 1.92627192
		 1.52285242 0.49480474 2.20389152 1.29541576 0.94117457 2.20389152 0.94117457 1.29541552 2.20389152
		 0.49480474 1.5228523 2.20389152 0 1.60122156 2.20389152 -0.49480474 1.52285218 2.20389152
		 -0.94117439 1.2954154 2.20389152 -1.29541528 0.94117427 2.20389152 -1.52285182 0.49480456 2.20389152
		 -1.6012212 4.8936222e-16 2.20389152 -1.52285182 -0.49480456 2.20389152 -1.29541516 -0.94117415 2.20389152
		 -0.94117415 -1.29541516 2.20389152 -0.49480456 -1.52285171 2.20389152 -4.77201e-08 -1.6012212 2.20389152
		 0.49480441 -1.52285171 2.20389152 0.94117403 -1.29541516 2.20389152 1.29541492 -0.94117409 2.20389152
		 1.52285159 -0.49480447 2.20389152 1.60122085 4.8936222e-16 2.20389152 1.17621303 0.38217479 2.42724419
		 1.00054657459 0.72693956 2.42724419 0.72693956 1.00054645538 2.42724419 0.38217473 1.17621291 2.42724419
		 0 1.23674333 2.42724419 -0.38217473 1.17621279 2.42724419 -0.72693944 1.00054621696 2.42724419
		 -1.00054621696 0.72693944 2.42724419 -1.17621255 0.38217461 2.42724419 -1.23674297 5.3895648e-16 2.42724419
		 -1.17621255 -0.38217461 2.42724419 -1.00054609776 -0.72693926 2.42724419;
	setAttr ".vt[332:381]" -0.72693926 -1.00054609776 2.42724419 -0.38217461 -1.17621243 2.42724419
		 -3.6857806e-08 -1.23674285 2.42724419 0.38217449 -1.17621231 2.42724419 0.72693908 -1.00054597855 2.42724419
		 1.00054585934 -0.7269392 2.42724419 1.17621231 -0.38217449 2.42724419 1.23674273 5.3895648e-16 2.42724419
		 0.80061096 0.26013428 2.59083033 0.68104035 0.49480477 2.59083033 0.49480477 0.68104035 2.59083033
		 0.26013425 0.8006109 2.59083033 0 0.84181213 2.59083033 -0.26013425 0.80061078 2.59083033
		 -0.49480474 0.68104017 2.59083033 -0.68104017 0.49480462 2.59083033 -0.80061066 0.26013419 2.59083033
		 -0.84181178 5.7527979e-16 2.59083033 -0.80061066 -0.26013419 2.59083033 -0.68104017 -0.49480456 2.59083033
		 -0.49480456 -0.68104005 2.59083033 -0.26013419 -0.80061054 2.59083033 -2.5087942e-08 -0.84181178 2.59083033
		 0.2601341 -0.80061054 2.59083033 0.49480447 -0.68103999 2.59083033 0.68103993 -0.49480456 2.59083033
		 0.80061048 -0.2601341 2.59083033 0.84181166 5.7527979e-16 2.59083033 0.40529537 0.13168845 2.6906209
		 0.34476486 0.25048631 2.6906209 0.25048631 0.34476483 2.6906209 0.13168843 0.40529531 2.6906209
		 0 0.42615271 2.6906209 -0.13168843 0.40529531 2.6906209 -0.25048625 0.34476477 2.6906209
		 -0.34476471 0.25048622 2.6906209 -0.40529522 0.13168839 2.6906209 -0.42615259 5.9743785e-16 2.6906209
		 -0.40529522 -0.13168839 2.6906209 -0.34476468 -0.2504862 2.6906209 -0.2504862 -0.34476468 2.6906209
		 -0.13168839 -0.40529516 2.6906209 -1.2700334e-08 -0.42615256 2.6906209 0.13168836 -0.40529516 2.6906209
		 0.25048614 -0.34476465 2.6906209 0.34476462 -0.25048617 2.6906209 0.40529516 -0.13168837 2.6906209
		 0.4261525 5.9743785e-16 2.6906209 0 -6.0488497e-16 -2.72415972 0 6.0488497e-16 2.72415972;
	setAttr -s 780 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 4 1 4 5 1 5 6 1 6 7 1 7 8 1 8 9 1
		 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 0 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 30 31 1
		 31 32 1 32 33 1 33 34 1 34 35 1 35 36 1 36 37 1 37 38 1 38 39 1 39 20 1 40 41 1 41 42 1
		 42 43 1 43 44 1 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 49 50 1 50 51 1 51 52 1 52 53 1
		 53 54 1 54 55 1 55 56 1 56 57 1 57 58 1 58 59 1 59 40 1 60 61 1 61 62 1 62 63 1 63 64 1
		 64 65 1 65 66 1 66 67 1 67 68 1 68 69 1 69 70 1 70 71 1 71 72 1 72 73 1 73 74 1 74 75 1
		 75 76 1 76 77 1 77 78 1 78 79 1 79 60 1 80 81 1 81 82 1 82 83 1 83 84 1 84 85 1 85 86 1
		 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1 94 95 1 95 96 1 96 97 1
		 97 98 1 98 99 1 99 80 1 100 101 1 101 102 1 102 103 1 103 104 1 104 105 1 105 106 1
		 106 107 1 107 108 1 108 109 1 109 110 1 110 111 1 111 112 1 112 113 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 100 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 127 128 1 128 129 1 129 130 1 130 131 1 131 132 1 132 133 1
		 133 134 1 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 120 1 140 141 1 141 142 1
		 142 143 1 143 144 1 144 145 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1
		 151 152 1 152 153 1 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 159 140 1
		 160 161 1 161 162 1 162 163 1 163 164 1 164 165 1 165 166 1;
	setAttr ".ed[166:331]" 166 167 1 167 168 1 168 169 1 169 170 1 170 171 1 171 172 1
		 172 173 1 173 174 1 174 175 1 175 176 1 176 177 1 177 178 1 178 179 1 179 160 1 180 181 1
		 181 182 1 182 183 1 183 184 1 184 185 1 185 186 1 186 187 1 187 188 1 188 189 1 189 190 1
		 190 191 1 191 192 1 192 193 1 193 194 1 194 195 1 195 196 1 196 197 1 197 198 1 198 199 1
		 199 180 1 200 201 1 201 202 1 202 203 1 203 204 1 204 205 1 205 206 1 206 207 1 207 208 1
		 208 209 1 209 210 1 210 211 1 211 212 1 212 213 1 213 214 1 214 215 1 215 216 1 216 217 1
		 217 218 1 218 219 1 219 200 1 220 221 1 221 222 1 222 223 1 223 224 1 224 225 1 225 226 1
		 226 227 1 227 228 1 228 229 1 229 230 1 230 231 1 231 232 1 232 233 1 233 234 1 234 235 1
		 235 236 1 236 237 1 237 238 1 238 239 1 239 220 1 240 241 1 241 242 1 242 243 1 243 244 1
		 244 245 1 245 246 1 246 247 1 247 248 1 248 249 1 249 250 1 250 251 1 251 252 1 252 253 1
		 253 254 1 254 255 1 255 256 1 256 257 1 257 258 1 258 259 1 259 240 1 260 261 1 261 262 1
		 262 263 1 263 264 1 264 265 1 265 266 1 266 267 1 267 268 1 268 269 1 269 270 1 270 271 1
		 271 272 1 272 273 1 273 274 1 274 275 1 275 276 1 276 277 1 277 278 1 278 279 1 279 260 1
		 280 281 1 281 282 1 282 283 1 283 284 1 284 285 1 285 286 1 286 287 1 287 288 1 288 289 1
		 289 290 1 290 291 1 291 292 1 292 293 1 293 294 1 294 295 1 295 296 1 296 297 1 297 298 1
		 298 299 1 299 280 1 300 301 1 301 302 1 302 303 1 303 304 1 304 305 1 305 306 1 306 307 1
		 307 308 1 308 309 1 309 310 1 310 311 1 311 312 1 312 313 1 313 314 1 314 315 1 315 316 1
		 316 317 1 317 318 1 318 319 1 319 300 1 320 321 1 321 322 1 322 323 1 323 324 1 324 325 1
		 325 326 1 326 327 1 327 328 1 328 329 1 329 330 1 330 331 1 331 332 1;
	setAttr ".ed[332:497]" 332 333 1 333 334 1 334 335 1 335 336 1 336 337 1 337 338 1
		 338 339 1 339 320 1 340 341 1 341 342 1 342 343 1 343 344 1 344 345 1 345 346 1 346 347 1
		 347 348 1 348 349 1 349 350 1 350 351 1 351 352 1 352 353 1 353 354 1 354 355 1 355 356 1
		 356 357 1 357 358 1 358 359 1 359 340 1 360 361 1 361 362 1 362 363 1 363 364 1 364 365 1
		 365 366 1 366 367 1 367 368 1 368 369 1 369 370 1 370 371 1 371 372 1 372 373 1 373 374 1
		 374 375 1 375 376 1 376 377 1 377 378 1 378 379 1 379 360 1 0 20 1 1 21 1 2 22 1
		 3 23 1 4 24 1 5 25 1 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1 13 33 1
		 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 20 40 1 21 41 1 22 42 1 23 43 1 24 44 1
		 25 45 1 26 46 1 27 47 1 28 48 1 29 49 1 30 50 1 31 51 1 32 52 1 33 53 1 34 54 1 35 55 1
		 36 56 1 37 57 1 38 58 1 39 59 1 40 60 1 41 61 1 42 62 1 43 63 1 44 64 1 45 65 1 46 66 1
		 47 67 1 48 68 1 49 69 1 50 70 1 51 71 1 52 72 1 53 73 1 54 74 1 55 75 1 56 76 1 57 77 1
		 58 78 1 59 79 1 60 80 1 61 81 1 62 82 1 63 83 1 64 84 1 65 85 1 66 86 1 67 87 1 68 88 1
		 69 89 1 70 90 1 71 91 1 72 92 1 73 93 1 74 94 1 75 95 1 76 96 1 77 97 1 78 98 1 79 99 1
		 80 100 1 81 101 1 82 102 1 83 103 1 84 104 1 85 105 1 86 106 1 87 107 1 88 108 1
		 89 109 1 90 110 1 91 111 1 92 112 1 93 113 1 94 114 1 95 115 1 96 116 1 97 117 1
		 98 118 1 99 119 1 100 120 1 101 121 1 102 122 1 103 123 1 104 124 1 105 125 1 106 126 1
		 107 127 1 108 128 1 109 129 1 110 130 1 111 131 1 112 132 1 113 133 1 114 134 1 115 135 1
		 116 136 1 117 137 1;
	setAttr ".ed[498:663]" 118 138 1 119 139 1 120 140 1 121 141 1 122 142 1 123 143 1
		 124 144 1 125 145 1 126 146 1 127 147 1 128 148 1 129 149 1 130 150 1 131 151 1 132 152 1
		 133 153 1 134 154 1 135 155 1 136 156 1 137 157 1 138 158 1 139 159 1 140 160 1 141 161 1
		 142 162 1 143 163 1 144 164 1 145 165 1 146 166 1 147 167 1 148 168 1 149 169 1 150 170 1
		 151 171 1 152 172 1 153 173 1 154 174 1 155 175 1 156 176 1 157 177 1 158 178 1 159 179 1
		 160 180 1 161 181 1 162 182 1 163 183 1 164 184 1 165 185 1 166 186 1 167 187 1 168 188 1
		 169 189 1 170 190 1 171 191 1 172 192 1 173 193 1 174 194 1 175 195 1 176 196 1 177 197 1
		 178 198 1 179 199 1 180 200 1 181 201 1 182 202 1 183 203 1 184 204 1 185 205 1 186 206 1
		 187 207 1 188 208 1 189 209 1 190 210 1 191 211 1 192 212 1 193 213 1 194 214 1 195 215 1
		 196 216 1 197 217 1 198 218 1 199 219 1 200 220 1 201 221 1 202 222 1 203 223 1 204 224 1
		 205 225 1 206 226 1 207 227 1 208 228 1 209 229 1 210 230 1 211 231 1 212 232 1 213 233 1
		 214 234 1 215 235 1 216 236 1 217 237 1 218 238 1 219 239 1 220 240 1 221 241 1 222 242 1
		 223 243 1 224 244 1 225 245 1 226 246 1 227 247 1 228 248 1 229 249 1 230 250 1 231 251 1
		 232 252 1 233 253 1 234 254 1 235 255 1 236 256 1 237 257 1 238 258 1 239 259 1 240 260 1
		 241 261 1 242 262 1 243 263 1 244 264 1 245 265 1 246 266 1 247 267 1 248 268 1 249 269 1
		 250 270 1 251 271 1 252 272 1 253 273 1 254 274 1 255 275 1 256 276 1 257 277 1 258 278 1
		 259 279 1 260 280 1 261 281 1 262 282 1 263 283 1 264 284 1 265 285 1 266 286 1 267 287 1
		 268 288 1 269 289 1 270 290 1 271 291 1 272 292 1 273 293 1 274 294 1 275 295 1 276 296 1
		 277 297 1 278 298 1 279 299 1 280 300 1 281 301 1 282 302 1 283 303 1;
	setAttr ".ed[664:779]" 284 304 1 285 305 1 286 306 1 287 307 1 288 308 1 289 309 1
		 290 310 1 291 311 1 292 312 1 293 313 1 294 314 1 295 315 1 296 316 1 297 317 1 298 318 1
		 299 319 1 300 320 1 301 321 1 302 322 1 303 323 1 304 324 1 305 325 1 306 326 1 307 327 1
		 308 328 1 309 329 1 310 330 1 311 331 1 312 332 1 313 333 1 314 334 1 315 335 1 316 336 1
		 317 337 1 318 338 1 319 339 1 320 340 1 321 341 1 322 342 1 323 343 1 324 344 1 325 345 1
		 326 346 1 327 347 1 328 348 1 329 349 1 330 350 1 331 351 1 332 352 1 333 353 1 334 354 1
		 335 355 1 336 356 1 337 357 1 338 358 1 339 359 1 340 360 1 341 361 1 342 362 1 343 363 1
		 344 364 1 345 365 1 346 366 1 347 367 1 348 368 1 349 369 1 350 370 1 351 371 1 352 372 1
		 353 373 1 354 374 1 355 375 1 356 376 1 357 377 1 358 378 1 359 379 1 380 0 1 380 1 1
		 380 2 1 380 3 1 380 4 1 380 5 1 380 6 1 380 7 1 380 8 1 380 9 1 380 10 1 380 11 1
		 380 12 1 380 13 1 380 14 1 380 15 1 380 16 1 380 17 1 380 18 1 380 19 1 360 381 1
		 361 381 1 362 381 1 363 381 1 364 381 1 365 381 1 366 381 1 367 381 1 368 381 1 369 381 1
		 370 381 1 371 381 1 372 381 1 373 381 1 374 381 1 375 381 1 376 381 1 377 381 1 378 381 1
		 379 381 1;
	setAttr -s 400 -ch 1560 ".fc[0:399]" -type "polyFaces" 
		f 4 0 381 -21 -381
		mu 0 4 0 1 22 21
		f 4 1 382 -22 -382
		mu 0 4 1 2 23 22
		f 4 2 383 -23 -383
		mu 0 4 2 3 24 23
		f 4 3 384 -24 -384
		mu 0 4 3 4 25 24
		f 4 4 385 -25 -385
		mu 0 4 4 5 26 25
		f 4 5 386 -26 -386
		mu 0 4 5 6 27 26
		f 4 6 387 -27 -387
		mu 0 4 6 7 28 27
		f 4 7 388 -28 -388
		mu 0 4 7 8 29 28
		f 4 8 389 -29 -389
		mu 0 4 8 9 30 29
		f 4 9 390 -30 -390
		mu 0 4 9 10 31 30
		f 4 10 391 -31 -391
		mu 0 4 10 11 32 31
		f 4 11 392 -32 -392
		mu 0 4 11 12 33 32
		f 4 12 393 -33 -393
		mu 0 4 12 13 34 33
		f 4 13 394 -34 -394
		mu 0 4 13 14 35 34
		f 4 14 395 -35 -395
		mu 0 4 14 15 36 35
		f 4 15 396 -36 -396
		mu 0 4 15 16 37 36
		f 4 16 397 -37 -397
		mu 0 4 16 17 38 37
		f 4 17 398 -38 -398
		mu 0 4 17 18 39 38
		f 4 18 399 -39 -399
		mu 0 4 18 19 40 39
		f 4 19 380 -40 -400
		mu 0 4 19 20 41 40
		f 4 20 401 -41 -401
		mu 0 4 21 22 43 42
		f 4 21 402 -42 -402
		mu 0 4 22 23 44 43
		f 4 22 403 -43 -403
		mu 0 4 23 24 45 44
		f 4 23 404 -44 -404
		mu 0 4 24 25 46 45
		f 4 24 405 -45 -405
		mu 0 4 25 26 47 46
		f 4 25 406 -46 -406
		mu 0 4 26 27 48 47
		f 4 26 407 -47 -407
		mu 0 4 27 28 49 48
		f 4 27 408 -48 -408
		mu 0 4 28 29 50 49
		f 4 28 409 -49 -409
		mu 0 4 29 30 51 50
		f 4 29 410 -50 -410
		mu 0 4 30 31 52 51
		f 4 30 411 -51 -411
		mu 0 4 31 32 53 52
		f 4 31 412 -52 -412
		mu 0 4 32 33 54 53
		f 4 32 413 -53 -413
		mu 0 4 33 34 55 54
		f 4 33 414 -54 -414
		mu 0 4 34 35 56 55
		f 4 34 415 -55 -415
		mu 0 4 35 36 57 56
		f 4 35 416 -56 -416
		mu 0 4 36 37 58 57
		f 4 36 417 -57 -417
		mu 0 4 37 38 59 58
		f 4 37 418 -58 -418
		mu 0 4 38 39 60 59
		f 4 38 419 -59 -419
		mu 0 4 39 40 61 60
		f 4 39 400 -60 -420
		mu 0 4 40 41 62 61
		f 4 40 421 -61 -421
		mu 0 4 42 43 64 63
		f 4 41 422 -62 -422
		mu 0 4 43 44 65 64
		f 4 42 423 -63 -423
		mu 0 4 44 45 66 65
		f 4 43 424 -64 -424
		mu 0 4 45 46 67 66
		f 4 44 425 -65 -425
		mu 0 4 46 47 68 67
		f 4 45 426 -66 -426
		mu 0 4 47 48 69 68
		f 4 46 427 -67 -427
		mu 0 4 48 49 70 69
		f 4 47 428 -68 -428
		mu 0 4 49 50 71 70
		f 4 48 429 -69 -429
		mu 0 4 50 51 72 71
		f 4 49 430 -70 -430
		mu 0 4 51 52 73 72
		f 4 50 431 -71 -431
		mu 0 4 52 53 74 73
		f 4 51 432 -72 -432
		mu 0 4 53 54 75 74
		f 4 52 433 -73 -433
		mu 0 4 54 55 76 75
		f 4 53 434 -74 -434
		mu 0 4 55 56 77 76
		f 4 54 435 -75 -435
		mu 0 4 56 57 78 77
		f 4 55 436 -76 -436
		mu 0 4 57 58 79 78
		f 4 56 437 -77 -437
		mu 0 4 58 59 80 79
		f 4 57 438 -78 -438
		mu 0 4 59 60 81 80
		f 4 58 439 -79 -439
		mu 0 4 60 61 82 81
		f 4 59 420 -80 -440
		mu 0 4 61 62 83 82
		f 4 60 441 -81 -441
		mu 0 4 63 64 85 84
		f 4 61 442 -82 -442
		mu 0 4 64 65 86 85
		f 4 62 443 -83 -443
		mu 0 4 65 66 87 86
		f 4 63 444 -84 -444
		mu 0 4 66 67 88 87
		f 4 64 445 -85 -445
		mu 0 4 67 68 89 88
		f 4 65 446 -86 -446
		mu 0 4 68 69 90 89
		f 4 66 447 -87 -447
		mu 0 4 69 70 91 90
		f 4 67 448 -88 -448
		mu 0 4 70 71 92 91
		f 4 68 449 -89 -449
		mu 0 4 71 72 93 92
		f 4 69 450 -90 -450
		mu 0 4 72 73 94 93
		f 4 70 451 -91 -451
		mu 0 4 73 74 95 94
		f 4 71 452 -92 -452
		mu 0 4 74 75 96 95
		f 4 72 453 -93 -453
		mu 0 4 75 76 97 96
		f 4 73 454 -94 -454
		mu 0 4 76 77 98 97
		f 4 74 455 -95 -455
		mu 0 4 77 78 99 98
		f 4 75 456 -96 -456
		mu 0 4 78 79 100 99
		f 4 76 457 -97 -457
		mu 0 4 79 80 101 100
		f 4 77 458 -98 -458
		mu 0 4 80 81 102 101
		f 4 78 459 -99 -459
		mu 0 4 81 82 103 102
		f 4 79 440 -100 -460
		mu 0 4 82 83 104 103
		f 4 80 461 -101 -461
		mu 0 4 84 85 106 105
		f 4 81 462 -102 -462
		mu 0 4 85 86 107 106
		f 4 82 463 -103 -463
		mu 0 4 86 87 108 107
		f 4 83 464 -104 -464
		mu 0 4 87 88 109 108
		f 4 84 465 -105 -465
		mu 0 4 88 89 110 109
		f 4 85 466 -106 -466
		mu 0 4 89 90 111 110
		f 4 86 467 -107 -467
		mu 0 4 90 91 112 111
		f 4 87 468 -108 -468
		mu 0 4 91 92 113 112
		f 4 88 469 -109 -469
		mu 0 4 92 93 114 113
		f 4 89 470 -110 -470
		mu 0 4 93 94 115 114
		f 4 90 471 -111 -471
		mu 0 4 94 95 116 115
		f 4 91 472 -112 -472
		mu 0 4 95 96 117 116
		f 4 92 473 -113 -473
		mu 0 4 96 97 118 117
		f 4 93 474 -114 -474
		mu 0 4 97 98 119 118
		f 4 94 475 -115 -475
		mu 0 4 98 99 120 119
		f 4 95 476 -116 -476
		mu 0 4 99 100 121 120
		f 4 96 477 -117 -477
		mu 0 4 100 101 122 121
		f 4 97 478 -118 -478
		mu 0 4 101 102 123 122
		f 4 98 479 -119 -479
		mu 0 4 102 103 124 123
		f 4 99 460 -120 -480
		mu 0 4 103 104 125 124
		f 4 100 481 -121 -481
		mu 0 4 105 106 127 126
		f 4 101 482 -122 -482
		mu 0 4 106 107 128 127
		f 4 102 483 -123 -483
		mu 0 4 107 108 129 128
		f 4 103 484 -124 -484
		mu 0 4 108 109 130 129
		f 4 104 485 -125 -485
		mu 0 4 109 110 131 130
		f 4 105 486 -126 -486
		mu 0 4 110 111 132 131
		f 4 106 487 -127 -487
		mu 0 4 111 112 133 132
		f 4 107 488 -128 -488
		mu 0 4 112 113 134 133
		f 4 108 489 -129 -489
		mu 0 4 113 114 135 134
		f 4 109 490 -130 -490
		mu 0 4 114 115 136 135
		f 4 110 491 -131 -491
		mu 0 4 115 116 137 136
		f 4 111 492 -132 -492
		mu 0 4 116 117 138 137
		f 4 112 493 -133 -493
		mu 0 4 117 118 139 138
		f 4 113 494 -134 -494
		mu 0 4 118 119 140 139
		f 4 114 495 -135 -495
		mu 0 4 119 120 141 140
		f 4 115 496 -136 -496
		mu 0 4 120 121 142 141
		f 4 116 497 -137 -497
		mu 0 4 121 122 143 142
		f 4 117 498 -138 -498
		mu 0 4 122 123 144 143
		f 4 118 499 -139 -499
		mu 0 4 123 124 145 144
		f 4 119 480 -140 -500
		mu 0 4 124 125 146 145
		f 4 120 501 -141 -501
		mu 0 4 126 127 148 147
		f 4 121 502 -142 -502
		mu 0 4 127 128 149 148
		f 4 122 503 -143 -503
		mu 0 4 128 129 150 149
		f 4 123 504 -144 -504
		mu 0 4 129 130 151 150
		f 4 124 505 -145 -505
		mu 0 4 130 131 152 151
		f 4 125 506 -146 -506
		mu 0 4 131 132 153 152
		f 4 126 507 -147 -507
		mu 0 4 132 133 154 153
		f 4 127 508 -148 -508
		mu 0 4 133 134 155 154
		f 4 128 509 -149 -509
		mu 0 4 134 135 156 155
		f 4 129 510 -150 -510
		mu 0 4 135 136 157 156
		f 4 130 511 -151 -511
		mu 0 4 136 137 158 157
		f 4 131 512 -152 -512
		mu 0 4 137 138 159 158
		f 4 132 513 -153 -513
		mu 0 4 138 139 160 159
		f 4 133 514 -154 -514
		mu 0 4 139 140 161 160
		f 4 134 515 -155 -515
		mu 0 4 140 141 162 161
		f 4 135 516 -156 -516
		mu 0 4 141 142 163 162
		f 4 136 517 -157 -517
		mu 0 4 142 143 164 163
		f 4 137 518 -158 -518
		mu 0 4 143 144 165 164
		f 4 138 519 -159 -519
		mu 0 4 144 145 166 165
		f 4 139 500 -160 -520
		mu 0 4 145 146 167 166
		f 4 140 521 -161 -521
		mu 0 4 147 148 169 168
		f 4 141 522 -162 -522
		mu 0 4 148 149 170 169
		f 4 142 523 -163 -523
		mu 0 4 149 150 171 170
		f 4 143 524 -164 -524
		mu 0 4 150 151 172 171
		f 4 144 525 -165 -525
		mu 0 4 151 152 173 172
		f 4 145 526 -166 -526
		mu 0 4 152 153 174 173
		f 4 146 527 -167 -527
		mu 0 4 153 154 175 174
		f 4 147 528 -168 -528
		mu 0 4 154 155 176 175
		f 4 148 529 -169 -529
		mu 0 4 155 156 177 176
		f 4 149 530 -170 -530
		mu 0 4 156 157 178 177
		f 4 150 531 -171 -531
		mu 0 4 157 158 179 178
		f 4 151 532 -172 -532
		mu 0 4 158 159 180 179
		f 4 152 533 -173 -533
		mu 0 4 159 160 181 180
		f 4 153 534 -174 -534
		mu 0 4 160 161 182 181
		f 4 154 535 -175 -535
		mu 0 4 161 162 183 182
		f 4 155 536 -176 -536
		mu 0 4 162 163 184 183
		f 4 156 537 -177 -537
		mu 0 4 163 164 185 184
		f 4 157 538 -178 -538
		mu 0 4 164 165 186 185
		f 4 158 539 -179 -539
		mu 0 4 165 166 187 186
		f 4 159 520 -180 -540
		mu 0 4 166 167 188 187
		f 4 160 541 -181 -541
		mu 0 4 168 169 190 189
		f 4 161 542 -182 -542
		mu 0 4 169 170 191 190
		f 4 162 543 -183 -543
		mu 0 4 170 171 192 191
		f 4 163 544 -184 -544
		mu 0 4 171 172 193 192
		f 4 164 545 -185 -545
		mu 0 4 172 173 194 193
		f 4 165 546 -186 -546
		mu 0 4 173 174 195 194
		f 4 166 547 -187 -547
		mu 0 4 174 175 196 195
		f 4 167 548 -188 -548
		mu 0 4 175 176 197 196
		f 4 168 549 -189 -549
		mu 0 4 176 177 198 197
		f 4 169 550 -190 -550
		mu 0 4 177 178 199 198
		f 4 170 551 -191 -551
		mu 0 4 178 179 200 199
		f 4 171 552 -192 -552
		mu 0 4 179 180 201 200
		f 4 172 553 -193 -553
		mu 0 4 180 181 202 201
		f 4 173 554 -194 -554
		mu 0 4 181 182 203 202
		f 4 174 555 -195 -555
		mu 0 4 182 183 204 203
		f 4 175 556 -196 -556
		mu 0 4 183 184 205 204
		f 4 176 557 -197 -557
		mu 0 4 184 185 206 205
		f 4 177 558 -198 -558
		mu 0 4 185 186 207 206
		f 4 178 559 -199 -559
		mu 0 4 186 187 208 207
		f 4 179 540 -200 -560
		mu 0 4 187 188 209 208
		f 4 180 561 -201 -561
		mu 0 4 189 190 211 210
		f 4 181 562 -202 -562
		mu 0 4 190 191 212 211
		f 4 182 563 -203 -563
		mu 0 4 191 192 213 212
		f 4 183 564 -204 -564
		mu 0 4 192 193 214 213
		f 4 184 565 -205 -565
		mu 0 4 193 194 215 214
		f 4 185 566 -206 -566
		mu 0 4 194 195 216 215
		f 4 186 567 -207 -567
		mu 0 4 195 196 217 216
		f 4 187 568 -208 -568
		mu 0 4 196 197 218 217
		f 4 188 569 -209 -569
		mu 0 4 197 198 219 218
		f 4 189 570 -210 -570
		mu 0 4 198 199 220 219
		f 4 190 571 -211 -571
		mu 0 4 199 200 221 220
		f 4 191 572 -212 -572
		mu 0 4 200 201 222 221
		f 4 192 573 -213 -573
		mu 0 4 201 202 223 222
		f 4 193 574 -214 -574
		mu 0 4 202 203 224 223
		f 4 194 575 -215 -575
		mu 0 4 203 204 225 224
		f 4 195 576 -216 -576
		mu 0 4 204 205 226 225
		f 4 196 577 -217 -577
		mu 0 4 205 206 227 226
		f 4 197 578 -218 -578
		mu 0 4 206 207 228 227
		f 4 198 579 -219 -579
		mu 0 4 207 208 229 228
		f 4 199 560 -220 -580
		mu 0 4 208 209 230 229
		f 4 200 581 -221 -581
		mu 0 4 210 211 232 231
		f 4 201 582 -222 -582
		mu 0 4 211 212 233 232
		f 4 202 583 -223 -583
		mu 0 4 212 213 234 233
		f 4 203 584 -224 -584
		mu 0 4 213 214 235 234
		f 4 204 585 -225 -585
		mu 0 4 214 215 236 235
		f 4 205 586 -226 -586
		mu 0 4 215 216 237 236
		f 4 206 587 -227 -587
		mu 0 4 216 217 238 237
		f 4 207 588 -228 -588
		mu 0 4 217 218 239 238
		f 4 208 589 -229 -589
		mu 0 4 218 219 240 239
		f 4 209 590 -230 -590
		mu 0 4 219 220 241 240
		f 4 210 591 -231 -591
		mu 0 4 220 221 242 241
		f 4 211 592 -232 -592
		mu 0 4 221 222 243 242
		f 4 212 593 -233 -593
		mu 0 4 222 223 244 243
		f 4 213 594 -234 -594
		mu 0 4 223 224 245 244
		f 4 214 595 -235 -595
		mu 0 4 224 225 246 245
		f 4 215 596 -236 -596
		mu 0 4 225 226 247 246
		f 4 216 597 -237 -597
		mu 0 4 226 227 248 247
		f 4 217 598 -238 -598
		mu 0 4 227 228 249 248
		f 4 218 599 -239 -599
		mu 0 4 228 229 250 249
		f 4 219 580 -240 -600
		mu 0 4 229 230 251 250
		f 4 220 601 -241 -601
		mu 0 4 231 232 253 252
		f 4 221 602 -242 -602
		mu 0 4 232 233 254 253
		f 4 222 603 -243 -603
		mu 0 4 233 234 255 254
		f 4 223 604 -244 -604
		mu 0 4 234 235 256 255
		f 4 224 605 -245 -605
		mu 0 4 235 236 257 256
		f 4 225 606 -246 -606
		mu 0 4 236 237 258 257
		f 4 226 607 -247 -607
		mu 0 4 237 238 259 258
		f 4 227 608 -248 -608
		mu 0 4 238 239 260 259
		f 4 228 609 -249 -609
		mu 0 4 239 240 261 260
		f 4 229 610 -250 -610
		mu 0 4 240 241 262 261
		f 4 230 611 -251 -611
		mu 0 4 241 242 263 262
		f 4 231 612 -252 -612
		mu 0 4 242 243 264 263
		f 4 232 613 -253 -613
		mu 0 4 243 244 265 264
		f 4 233 614 -254 -614
		mu 0 4 244 245 266 265
		f 4 234 615 -255 -615
		mu 0 4 245 246 267 266
		f 4 235 616 -256 -616
		mu 0 4 246 247 268 267
		f 4 236 617 -257 -617
		mu 0 4 247 248 269 268
		f 4 237 618 -258 -618
		mu 0 4 248 249 270 269
		f 4 238 619 -259 -619
		mu 0 4 249 250 271 270
		f 4 239 600 -260 -620
		mu 0 4 250 251 272 271
		f 4 240 621 -261 -621
		mu 0 4 252 253 274 273
		f 4 241 622 -262 -622
		mu 0 4 253 254 275 274
		f 4 242 623 -263 -623
		mu 0 4 254 255 276 275
		f 4 243 624 -264 -624
		mu 0 4 255 256 277 276
		f 4 244 625 -265 -625
		mu 0 4 256 257 278 277
		f 4 245 626 -266 -626
		mu 0 4 257 258 279 278
		f 4 246 627 -267 -627
		mu 0 4 258 259 280 279
		f 4 247 628 -268 -628
		mu 0 4 259 260 281 280
		f 4 248 629 -269 -629
		mu 0 4 260 261 282 281
		f 4 249 630 -270 -630
		mu 0 4 261 262 283 282
		f 4 250 631 -271 -631
		mu 0 4 262 263 284 283
		f 4 251 632 -272 -632
		mu 0 4 263 264 285 284
		f 4 252 633 -273 -633
		mu 0 4 264 265 286 285
		f 4 253 634 -274 -634
		mu 0 4 265 266 287 286
		f 4 254 635 -275 -635
		mu 0 4 266 267 288 287
		f 4 255 636 -276 -636
		mu 0 4 267 268 289 288
		f 4 256 637 -277 -637
		mu 0 4 268 269 290 289
		f 4 257 638 -278 -638
		mu 0 4 269 270 291 290
		f 4 258 639 -279 -639
		mu 0 4 270 271 292 291
		f 4 259 620 -280 -640
		mu 0 4 271 272 293 292
		f 4 260 641 -281 -641
		mu 0 4 273 274 295 294
		f 4 261 642 -282 -642
		mu 0 4 274 275 296 295
		f 4 262 643 -283 -643
		mu 0 4 275 276 297 296
		f 4 263 644 -284 -644
		mu 0 4 276 277 298 297
		f 4 264 645 -285 -645
		mu 0 4 277 278 299 298
		f 4 265 646 -286 -646
		mu 0 4 278 279 300 299
		f 4 266 647 -287 -647
		mu 0 4 279 280 301 300
		f 4 267 648 -288 -648
		mu 0 4 280 281 302 301
		f 4 268 649 -289 -649
		mu 0 4 281 282 303 302
		f 4 269 650 -290 -650
		mu 0 4 282 283 304 303
		f 4 270 651 -291 -651
		mu 0 4 283 284 305 304
		f 4 271 652 -292 -652
		mu 0 4 284 285 306 305
		f 4 272 653 -293 -653
		mu 0 4 285 286 307 306
		f 4 273 654 -294 -654
		mu 0 4 286 287 308 307
		f 4 274 655 -295 -655
		mu 0 4 287 288 309 308
		f 4 275 656 -296 -656
		mu 0 4 288 289 310 309
		f 4 276 657 -297 -657
		mu 0 4 289 290 311 310
		f 4 277 658 -298 -658
		mu 0 4 290 291 312 311
		f 4 278 659 -299 -659
		mu 0 4 291 292 313 312
		f 4 279 640 -300 -660
		mu 0 4 292 293 314 313
		f 4 280 661 -301 -661
		mu 0 4 294 295 316 315
		f 4 281 662 -302 -662
		mu 0 4 295 296 317 316
		f 4 282 663 -303 -663
		mu 0 4 296 297 318 317
		f 4 283 664 -304 -664
		mu 0 4 297 298 319 318
		f 4 284 665 -305 -665
		mu 0 4 298 299 320 319
		f 4 285 666 -306 -666
		mu 0 4 299 300 321 320
		f 4 286 667 -307 -667
		mu 0 4 300 301 322 321
		f 4 287 668 -308 -668
		mu 0 4 301 302 323 322
		f 4 288 669 -309 -669
		mu 0 4 302 303 324 323
		f 4 289 670 -310 -670
		mu 0 4 303 304 325 324
		f 4 290 671 -311 -671
		mu 0 4 304 305 326 325
		f 4 291 672 -312 -672
		mu 0 4 305 306 327 326
		f 4 292 673 -313 -673
		mu 0 4 306 307 328 327
		f 4 293 674 -314 -674
		mu 0 4 307 308 329 328
		f 4 294 675 -315 -675
		mu 0 4 308 309 330 329
		f 4 295 676 -316 -676
		mu 0 4 309 310 331 330
		f 4 296 677 -317 -677
		mu 0 4 310 311 332 331
		f 4 297 678 -318 -678
		mu 0 4 311 312 333 332
		f 4 298 679 -319 -679
		mu 0 4 312 313 334 333
		f 4 299 660 -320 -680
		mu 0 4 313 314 335 334
		f 4 300 681 -321 -681
		mu 0 4 315 316 337 336
		f 4 301 682 -322 -682
		mu 0 4 316 317 338 337
		f 4 302 683 -323 -683
		mu 0 4 317 318 339 338
		f 4 303 684 -324 -684
		mu 0 4 318 319 340 339
		f 4 304 685 -325 -685
		mu 0 4 319 320 341 340
		f 4 305 686 -326 -686
		mu 0 4 320 321 342 341
		f 4 306 687 -327 -687
		mu 0 4 321 322 343 342
		f 4 307 688 -328 -688
		mu 0 4 322 323 344 343
		f 4 308 689 -329 -689
		mu 0 4 323 324 345 344
		f 4 309 690 -330 -690
		mu 0 4 324 325 346 345
		f 4 310 691 -331 -691
		mu 0 4 325 326 347 346
		f 4 311 692 -332 -692
		mu 0 4 326 327 348 347
		f 4 312 693 -333 -693
		mu 0 4 327 328 349 348
		f 4 313 694 -334 -694
		mu 0 4 328 329 350 349
		f 4 314 695 -335 -695
		mu 0 4 329 330 351 350
		f 4 315 696 -336 -696
		mu 0 4 330 331 352 351
		f 4 316 697 -337 -697
		mu 0 4 331 332 353 352
		f 4 317 698 -338 -698
		mu 0 4 332 333 354 353
		f 4 318 699 -339 -699
		mu 0 4 333 334 355 354
		f 4 319 680 -340 -700
		mu 0 4 334 335 356 355
		f 4 320 701 -341 -701
		mu 0 4 336 337 358 357
		f 4 321 702 -342 -702
		mu 0 4 337 338 359 358
		f 4 322 703 -343 -703
		mu 0 4 338 339 360 359
		f 4 323 704 -344 -704
		mu 0 4 339 340 361 360
		f 4 324 705 -345 -705
		mu 0 4 340 341 362 361
		f 4 325 706 -346 -706
		mu 0 4 341 342 363 362
		f 4 326 707 -347 -707
		mu 0 4 342 343 364 363
		f 4 327 708 -348 -708
		mu 0 4 343 344 365 364
		f 4 328 709 -349 -709
		mu 0 4 344 345 366 365
		f 4 329 710 -350 -710
		mu 0 4 345 346 367 366
		f 4 330 711 -351 -711
		mu 0 4 346 347 368 367
		f 4 331 712 -352 -712
		mu 0 4 347 348 369 368
		f 4 332 713 -353 -713
		mu 0 4 348 349 370 369
		f 4 333 714 -354 -714
		mu 0 4 349 350 371 370
		f 4 334 715 -355 -715
		mu 0 4 350 351 372 371
		f 4 335 716 -356 -716
		mu 0 4 351 352 373 372
		f 4 336 717 -357 -717
		mu 0 4 352 353 374 373
		f 4 337 718 -358 -718
		mu 0 4 353 354 375 374
		f 4 338 719 -359 -719
		mu 0 4 354 355 376 375
		f 4 339 700 -360 -720
		mu 0 4 355 356 377 376
		f 4 340 721 -361 -721
		mu 0 4 357 358 379 378
		f 4 341 722 -362 -722
		mu 0 4 358 359 380 379
		f 4 342 723 -363 -723
		mu 0 4 359 360 381 380
		f 4 343 724 -364 -724
		mu 0 4 360 361 382 381
		f 4 344 725 -365 -725
		mu 0 4 361 362 383 382
		f 4 345 726 -366 -726
		mu 0 4 362 363 384 383
		f 4 346 727 -367 -727
		mu 0 4 363 364 385 384
		f 4 347 728 -368 -728
		mu 0 4 364 365 386 385
		f 4 348 729 -369 -729
		mu 0 4 365 366 387 386
		f 4 349 730 -370 -730
		mu 0 4 366 367 388 387
		f 4 350 731 -371 -731
		mu 0 4 367 368 389 388
		f 4 351 732 -372 -732
		mu 0 4 368 369 390 389
		f 4 352 733 -373 -733
		mu 0 4 369 370 391 390
		f 4 353 734 -374 -734
		mu 0 4 370 371 392 391
		f 4 354 735 -375 -735
		mu 0 4 371 372 393 392
		f 4 355 736 -376 -736
		mu 0 4 372 373 394 393
		f 4 356 737 -377 -737
		mu 0 4 373 374 395 394
		f 4 357 738 -378 -738
		mu 0 4 374 375 396 395
		f 4 358 739 -379 -739
		mu 0 4 375 376 397 396
		f 4 359 720 -380 -740
		mu 0 4 376 377 398 397
		f 3 -1 -741 741
		mu 0 3 1 0 399
		f 3 -2 -742 742
		mu 0 3 2 1 400
		f 3 -3 -743 743
		mu 0 3 3 2 401
		f 3 -4 -744 744
		mu 0 3 4 3 402
		f 3 -5 -745 745
		mu 0 3 5 4 403
		f 3 -6 -746 746
		mu 0 3 6 5 404
		f 3 -7 -747 747
		mu 0 3 7 6 405
		f 3 -8 -748 748
		mu 0 3 8 7 406
		f 3 -9 -749 749
		mu 0 3 9 8 407
		f 3 -10 -750 750
		mu 0 3 10 9 408
		f 3 -11 -751 751
		mu 0 3 11 10 409
		f 3 -12 -752 752
		mu 0 3 12 11 410
		f 3 -13 -753 753
		mu 0 3 13 12 411
		f 3 -14 -754 754
		mu 0 3 14 13 412
		f 3 -15 -755 755
		mu 0 3 15 14 413
		f 3 -16 -756 756
		mu 0 3 16 15 414
		f 3 -17 -757 757
		mu 0 3 17 16 415
		f 3 -18 -758 758
		mu 0 3 18 17 416
		f 3 -19 -759 759
		mu 0 3 19 18 417
		f 3 -20 -760 740
		mu 0 3 20 19 418
		f 3 360 761 -761
		mu 0 3 378 379 419
		f 3 361 762 -762
		mu 0 3 379 380 420
		f 3 362 763 -763
		mu 0 3 380 381 421
		f 3 363 764 -764
		mu 0 3 381 382 422
		f 3 364 765 -765
		mu 0 3 382 383 423
		f 3 365 766 -766
		mu 0 3 383 384 424
		f 3 366 767 -767
		mu 0 3 384 385 425
		f 3 367 768 -768
		mu 0 3 385 386 426
		f 3 368 769 -769
		mu 0 3 386 387 427
		f 3 369 770 -770
		mu 0 3 387 388 428
		f 3 370 771 -771
		mu 0 3 388 389 429
		f 3 371 772 -772
		mu 0 3 389 390 430
		f 3 372 773 -773
		mu 0 3 390 391 431
		f 3 373 774 -774
		mu 0 3 391 392 432
		f 3 374 775 -775
		mu 0 3 392 393 433
		f 3 375 776 -776
		mu 0 3 393 394 434
		f 3 376 777 -777
		mu 0 3 394 395 435
		f 3 377 778 -778
		mu 0 3 395 396 436
		f 3 378 779 -779
		mu 0 3 396 397 437
		f 3 379 760 -780
		mu 0 3 397 398 438;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode transform -n "pSphere1" -p "Cheetah_Mesh";
	rename -uid "55B1945E-489A-E868-5679-A8A70A77190C";
	setAttr -l on ".tx";
	setAttr -l on ".ty";
	setAttr -l on ".tz";
	setAttr -l on ".rx";
	setAttr -l on ".ry";
	setAttr -l on ".rz";
	setAttr -l on ".sx";
	setAttr -l on ".sy";
	setAttr -l on ".sz";
	setAttr ".rp" -type "double3" 0 87.984886169433594 70.347801208496108 ;
	setAttr ".sp" -type "double3" 0 87.984886169433594 70.347801208496108 ;
createNode mesh -n "pSphereShape1" -p "pSphere1";
	rename -uid "4CB76F1E-4BDA-9187-5393-EAB8DD8AD48D";
	addAttr -ci true -h true -sn "sref" -ln "surfaceReference" -min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "reff" -ln "referenceFile" -dt "string";
	addAttr -ci true -h true -sn "fns" -ln "furNameSpace" -dt "string";
	setAttr -k off ".v";
	setAttr -s 4 ".iog[0].og";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr ".dr" 1;
	setAttr ".vnm" 0;
	setAttr ".vcs" 2;
createNode mesh -n "pSphereShape1Orig" -p "pSphere1";
	rename -uid "352ABF88-48B7-C8F0-AC0E-5F8663F667F9";
	addAttr -ci true -h true -sn "sref" -ln "surfaceReference" -min 0 -max 1 -at "bool";
	addAttr -ci true -h true -sn "reff" -ln "referenceFile" -dt "string";
	addAttr -ci true -h true -sn "fns" -ln "furNameSpace" -dt "string";
	setAttr -k off ".v";
	setAttr ".io" yes;
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".uvst[0].uvsn" -type "string" "map1";
	setAttr -s 439 ".uvst[0].uvsp";
	setAttr ".uvst[0].uvsp[0:249]" -type "float2" 0 0.050000001 0.050000001 0.050000001
		 0.1 0.050000001 0.15000001 0.050000001 0.2 0.050000001 0.25 0.050000001 0.30000001
		 0.050000001 0.35000002 0.050000001 0.40000004 0.050000001 0.45000005 0.050000001
		 0.50000006 0.050000001 0.55000007 0.050000001 0.60000008 0.050000001 0.6500001 0.050000001
		 0.70000011 0.050000001 0.75000012 0.050000001 0.80000013 0.050000001 0.85000014 0.050000001
		 0.90000015 0.050000001 0.95000017 0.050000001 1.000000119209 0.050000001 0 0.1 0.050000001
		 0.1 0.1 0.1 0.15000001 0.1 0.2 0.1 0.25 0.1 0.30000001 0.1 0.35000002 0.1 0.40000004
		 0.1 0.45000005 0.1 0.50000006 0.1 0.55000007 0.1 0.60000008 0.1 0.6500001 0.1 0.70000011
		 0.1 0.75000012 0.1 0.80000013 0.1 0.85000014 0.1 0.90000015 0.1 0.95000017 0.1 1.000000119209
		 0.1 0 0.15000001 0.050000001 0.15000001 0.1 0.15000001 0.15000001 0.15000001 0.2
		 0.15000001 0.25 0.15000001 0.30000001 0.15000001 0.35000002 0.15000001 0.40000004
		 0.15000001 0.45000005 0.15000001 0.50000006 0.15000001 0.55000007 0.15000001 0.60000008
		 0.15000001 0.6500001 0.15000001 0.70000011 0.15000001 0.75000012 0.15000001 0.80000013
		 0.15000001 0.85000014 0.15000001 0.90000015 0.15000001 0.95000017 0.15000001 1.000000119209
		 0.15000001 0 0.2 0.050000001 0.2 0.1 0.2 0.15000001 0.2 0.2 0.2 0.25 0.2 0.30000001
		 0.2 0.35000002 0.2 0.40000004 0.2 0.45000005 0.2 0.50000006 0.2 0.55000007 0.2 0.60000008
		 0.2 0.6500001 0.2 0.70000011 0.2 0.75000012 0.2 0.80000013 0.2 0.85000014 0.2 0.90000015
		 0.2 0.95000017 0.2 1.000000119209 0.2 0 0.25 0.050000001 0.25 0.1 0.25 0.15000001
		 0.25 0.2 0.25 0.25 0.25 0.30000001 0.25 0.35000002 0.25 0.40000004 0.25 0.45000005
		 0.25 0.50000006 0.25 0.55000007 0.25 0.60000008 0.25 0.6500001 0.25 0.70000011 0.25
		 0.75000012 0.25 0.80000013 0.25 0.85000014 0.25 0.90000015 0.25 0.95000017 0.25 1.000000119209
		 0.25 0 0.30000001 0.050000001 0.30000001 0.1 0.30000001 0.15000001 0.30000001 0.2
		 0.30000001 0.25 0.30000001 0.30000001 0.30000001 0.35000002 0.30000001 0.40000004
		 0.30000001 0.45000005 0.30000001 0.50000006 0.30000001 0.55000007 0.30000001 0.60000008
		 0.30000001 0.6500001 0.30000001 0.70000011 0.30000001 0.75000012 0.30000001 0.80000013
		 0.30000001 0.85000014 0.30000001 0.90000015 0.30000001 0.95000017 0.30000001 1.000000119209
		 0.30000001 0 0.35000002 0.050000001 0.35000002 0.1 0.35000002 0.15000001 0.35000002
		 0.2 0.35000002 0.25 0.35000002 0.30000001 0.35000002 0.35000002 0.35000002 0.40000004
		 0.35000002 0.45000005 0.35000002 0.50000006 0.35000002 0.55000007 0.35000002 0.60000008
		 0.35000002 0.6500001 0.35000002 0.70000011 0.35000002 0.75000012 0.35000002 0.80000013
		 0.35000002 0.85000014 0.35000002 0.90000015 0.35000002 0.95000017 0.35000002 1.000000119209
		 0.35000002 0 0.40000004 0.050000001 0.40000004 0.1 0.40000004 0.15000001 0.40000004
		 0.2 0.40000004 0.25 0.40000004 0.30000001 0.40000004 0.35000002 0.40000004 0.40000004
		 0.40000004 0.45000005 0.40000004 0.50000006 0.40000004 0.55000007 0.40000004 0.60000008
		 0.40000004 0.6500001 0.40000004 0.70000011 0.40000004 0.75000012 0.40000004 0.80000013
		 0.40000004 0.85000014 0.40000004 0.90000015 0.40000004 0.95000017 0.40000004 1.000000119209
		 0.40000004 0 0.45000005 0.050000001 0.45000005 0.1 0.45000005 0.15000001 0.45000005
		 0.2 0.45000005 0.25 0.45000005 0.30000001 0.45000005 0.35000002 0.45000005 0.40000004
		 0.45000005 0.45000005 0.45000005 0.50000006 0.45000005 0.55000007 0.45000005 0.60000008
		 0.45000005 0.6500001 0.45000005 0.70000011 0.45000005 0.75000012 0.45000005 0.80000013
		 0.45000005 0.85000014 0.45000005 0.90000015 0.45000005 0.95000017 0.45000005 1.000000119209
		 0.45000005 0 0.50000006 0.050000001 0.50000006 0.1 0.50000006 0.15000001 0.50000006
		 0.2 0.50000006 0.25 0.50000006 0.30000001 0.50000006 0.35000002 0.50000006 0.40000004
		 0.50000006 0.45000005 0.50000006 0.50000006 0.50000006 0.55000007 0.50000006 0.60000008
		 0.50000006 0.6500001 0.50000006 0.70000011 0.50000006 0.75000012 0.50000006 0.80000013
		 0.50000006 0.85000014 0.50000006 0.90000015 0.50000006 0.95000017 0.50000006 1.000000119209
		 0.50000006 0 0.55000007 0.050000001 0.55000007 0.1 0.55000007 0.15000001 0.55000007
		 0.2 0.55000007 0.25 0.55000007 0.30000001 0.55000007 0.35000002 0.55000007 0.40000004
		 0.55000007 0.45000005 0.55000007 0.50000006 0.55000007 0.55000007 0.55000007 0.60000008
		 0.55000007 0.6500001 0.55000007 0.70000011 0.55000007 0.75000012 0.55000007 0.80000013
		 0.55000007 0.85000014 0.55000007 0.90000015 0.55000007 0.95000017 0.55000007 1.000000119209
		 0.55000007 0 0.60000008 0.050000001 0.60000008 0.1 0.60000008 0.15000001 0.60000008
		 0.2 0.60000008 0.25 0.60000008 0.30000001 0.60000008 0.35000002 0.60000008 0.40000004
		 0.60000008 0.45000005 0.60000008 0.50000006 0.60000008 0.55000007 0.60000008 0.60000008
		 0.60000008 0.6500001 0.60000008 0.70000011 0.60000008 0.75000012 0.60000008 0.80000013
		 0.60000008 0.85000014 0.60000008 0.90000015 0.60000008;
	setAttr ".uvst[0].uvsp[250:438]" 0.95000017 0.60000008 1.000000119209 0.60000008
		 0 0.6500001 0.050000001 0.6500001 0.1 0.6500001 0.15000001 0.6500001 0.2 0.6500001
		 0.25 0.6500001 0.30000001 0.6500001 0.35000002 0.6500001 0.40000004 0.6500001 0.45000005
		 0.6500001 0.50000006 0.6500001 0.55000007 0.6500001 0.60000008 0.6500001 0.6500001
		 0.6500001 0.70000011 0.6500001 0.75000012 0.6500001 0.80000013 0.6500001 0.85000014
		 0.6500001 0.90000015 0.6500001 0.95000017 0.6500001 1.000000119209 0.6500001 0 0.70000011
		 0.050000001 0.70000011 0.1 0.70000011 0.15000001 0.70000011 0.2 0.70000011 0.25 0.70000011
		 0.30000001 0.70000011 0.35000002 0.70000011 0.40000004 0.70000011 0.45000005 0.70000011
		 0.50000006 0.70000011 0.55000007 0.70000011 0.60000008 0.70000011 0.6500001 0.70000011
		 0.70000011 0.70000011 0.75000012 0.70000011 0.80000013 0.70000011 0.85000014 0.70000011
		 0.90000015 0.70000011 0.95000017 0.70000011 1.000000119209 0.70000011 0 0.75000012
		 0.050000001 0.75000012 0.1 0.75000012 0.15000001 0.75000012 0.2 0.75000012 0.25 0.75000012
		 0.30000001 0.75000012 0.35000002 0.75000012 0.40000004 0.75000012 0.45000005 0.75000012
		 0.50000006 0.75000012 0.55000007 0.75000012 0.60000008 0.75000012 0.6500001 0.75000012
		 0.70000011 0.75000012 0.75000012 0.75000012 0.80000013 0.75000012 0.85000014 0.75000012
		 0.90000015 0.75000012 0.95000017 0.75000012 1.000000119209 0.75000012 0 0.80000013
		 0.050000001 0.80000013 0.1 0.80000013 0.15000001 0.80000013 0.2 0.80000013 0.25 0.80000013
		 0.30000001 0.80000013 0.35000002 0.80000013 0.40000004 0.80000013 0.45000005 0.80000013
		 0.50000006 0.80000013 0.55000007 0.80000013 0.60000008 0.80000013 0.6500001 0.80000013
		 0.70000011 0.80000013 0.75000012 0.80000013 0.80000013 0.80000013 0.85000014 0.80000013
		 0.90000015 0.80000013 0.95000017 0.80000013 1.000000119209 0.80000013 0 0.85000014
		 0.050000001 0.85000014 0.1 0.85000014 0.15000001 0.85000014 0.2 0.85000014 0.25 0.85000014
		 0.30000001 0.85000014 0.35000002 0.85000014 0.40000004 0.85000014 0.45000005 0.85000014
		 0.50000006 0.85000014 0.55000007 0.85000014 0.60000008 0.85000014 0.6500001 0.85000014
		 0.70000011 0.85000014 0.75000012 0.85000014 0.80000013 0.85000014 0.85000014 0.85000014
		 0.90000015 0.85000014 0.95000017 0.85000014 1.000000119209 0.85000014 0 0.90000015
		 0.050000001 0.90000015 0.1 0.90000015 0.15000001 0.90000015 0.2 0.90000015 0.25 0.90000015
		 0.30000001 0.90000015 0.35000002 0.90000015 0.40000004 0.90000015 0.45000005 0.90000015
		 0.50000006 0.90000015 0.55000007 0.90000015 0.60000008 0.90000015 0.6500001 0.90000015
		 0.70000011 0.90000015 0.75000012 0.90000015 0.80000013 0.90000015 0.85000014 0.90000015
		 0.90000015 0.90000015 0.95000017 0.90000015 1.000000119209 0.90000015 0 0.95000017
		 0.050000001 0.95000017 0.1 0.95000017 0.15000001 0.95000017 0.2 0.95000017 0.25 0.95000017
		 0.30000001 0.95000017 0.35000002 0.95000017 0.40000004 0.95000017 0.45000005 0.95000017
		 0.50000006 0.95000017 0.55000007 0.95000017 0.60000008 0.95000017 0.6500001 0.95000017
		 0.70000011 0.95000017 0.75000012 0.95000017 0.80000013 0.95000017 0.85000014 0.95000017
		 0.90000015 0.95000017 0.95000017 0.95000017 1.000000119209 0.95000017 0.025 0 0.075000003
		 0 0.125 0 0.17500001 0 0.22500001 0 0.27500001 0 0.32500002 0 0.375 0 0.42500001
		 0 0.47500002 0 0.52499998 0 0.57499999 0 0.625 0 0.67500001 0 0.72499996 0 0.77499998
		 0 0.82499999 0 0.875 0 0.92500001 0 0.97499996 0 0.025 1 0.075000003 1 0.125 1 0.17500001
		 1 0.22500001 1 0.27500001 1 0.32500002 1 0.375 1 0.42500001 1 0.47500002 1 0.52499998
		 1 0.57499999 1 0.625 1 0.67500001 1 0.72499996 1 0.77499998 1 0.82499999 1 0.875
		 1 0.92500001 1 0.97499996 1;
	setAttr ".cuvs" -type "string" "map1";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr ".ugsdt" no;
	setAttr ".bnr" 0;
	setAttr -s 382 ".vt";
	setAttr ".vt[0:165]"  4.35306454 87.23605347 64.88322449 4.30507946 87.33023071 64.88322449
		 4.23034191 87.40496826 64.88322449 4.13616657 87.45294952 64.88322449 4.031772614 87.46949005 64.88322449
		 3.92737865 87.45294952 64.88322449 3.83320308 87.40496826 64.88322449 3.75846577 87.33023071 64.88322449
		 3.71048045 87.23605347 64.88322449 3.6939466 87.13166046 64.88322449 3.71048045 87.027267456 64.88322449
		 3.75846577 86.93309784 64.88322449 3.83320308 86.85835266 64.88322449 3.92737865 86.8103714 64.88322449
		 4.031772614 86.79383087 64.88322449 4.13616657 86.8103714 64.88322449 4.23034191 86.85835266 64.88322449
		 4.30507946 86.93309784 64.88322449 4.35306406 87.027267456 64.88322449 4.36959839 87.13166046 64.88322449
		 4.66644478 87.33787537 64.96233368 4.57165718 87.52391052 64.96233368 4.42402172 87.67154694 64.96233368
		 4.2379899 87.76634216 64.96233368 4.031772614 87.79898834 64.96233368 3.82555461 87.76634216 64.96233368
		 3.63952374 87.67154694 64.96233368 3.49188852 87.52391052 64.96233368 3.39710069 87.33787537 64.96233368
		 3.36443901 87.13166046 64.96233368 3.39710069 86.92545319 64.96233368 3.49188852 86.73941803 64.96233368
		 3.63952374 86.59177399 64.96233368 3.82555532 86.49698639 64.96233368 4.031772614 86.46432495 64.96233368
		 4.2379899 86.49698639 64.96233368 4.42402124 86.59177399 64.96233368 4.5716567 86.73941803 64.96233368
		 4.6664443 86.92545319 64.96233368 4.69910574 87.13166046 64.96233368 4.96419764 87.43462372 65.092010498
		 4.82494068 87.70793152 65.092010498 4.60804272 87.92482758 65.092010498 4.33473587 88.064094543 65.092010498
		 4.031772614 88.11206055 65.092010498 3.72880936 88.064094543 65.092010498 3.45550251 87.92482758 65.092010498
		 3.23860431 87.70793152 65.092010498 3.099348068 87.43462372 65.092010498 3.051363468 87.13166046 65.092010498
		 3.099348068 86.82870483 65.092010498 3.23860455 86.55538177 65.092010498 3.45550251 86.33848572 65.092010498
		 3.72880936 86.19923401 65.092010498 4.031772614 86.15125275 65.092010498 4.33473539 86.19923401 65.092010498
		 4.60804272 86.33848572 65.092010498 4.8249402 86.55538177 65.092010498 4.96419716 86.82870483 65.092010498
		 5.012181759 87.13166046 65.092010498 5.23899126 87.52391052 65.26907349 5.058693886 87.87776947 65.26907349
		 4.77787447 88.15858459 65.26907349 4.42402172 88.33886719 65.26907349 4.031772614 88.40100098 65.26907349
		 3.63952374 88.33886719 65.26907349 3.28567052 88.15858459 65.26907349 3.0048518181 87.87776947 65.26907349
		 2.82455516 87.52391052 65.26907349 2.76242876 87.13166046 65.26907349 2.82455516 86.73941803 65.26907349
		 3.0048520565 86.38555908 65.26907349 3.28567171 86.10473633 65.26907349 3.63952374 85.92444611 65.26907349
		 4.031772614 85.86231995 65.26907349 4.42402124 85.92444611 65.26907349 4.77787399 86.10473633 65.26907349
		 5.058692932 86.38555908 65.26907349 5.23898983 86.73941803 65.26907349 5.30111599 87.13166046 65.26907349
		 5.48405838 87.60353851 65.489151 5.26716042 88.029220581 65.489151 4.92933464 88.36705017 65.489151
		 4.50364876 88.58394623 65.489151 4.031772614 88.65868378 65.489151 3.55989671 88.58394623 65.489151
		 3.13421082 88.36705017 65.489151 2.79638505 88.029220581 65.489151 2.57948756 87.60353851 65.489151
		 2.50474977 87.13166046 65.489151 2.57948756 86.65977478 65.489151 2.79638505 86.23410034 65.489151
		 3.13421082 85.89627075 65.489151 3.55989671 85.67937469 65.489151 4.031772614 85.60463715 65.489151
		 4.50364828 85.67937469 65.489151 4.92933369 85.89627075 65.489151 5.26715946 86.23410034 65.489151
		 5.48405695 86.65977478 65.489151 5.55879545 87.13166046 65.489151 5.69336557 87.67154694 65.7468338
		 5.4452076 88.15858459 65.7468338 5.058693886 88.54509735 65.7468338 4.5716567 88.79325104 65.7468338
		 4.031772614 88.87876129 65.7468338 3.49188828 88.79325104 65.7468338 3.0048518181 88.54509735 65.7468338
		 2.61833739 88.15858459 65.7468338 2.37018013 87.67154694 65.7468338 2.28467083 87.13166046 65.7468338
		 2.37018013 86.59177399 65.7468338 2.61833763 86.10473633 65.7468338 3.0048520565 85.7182312 65.7468338
		 3.49188852 85.47006989 65.7468338 4.031772614 85.38455963 65.7468338 4.5716567 85.47006989 65.7468338
		 5.058692932 85.7182312 65.7468338 5.44520712 86.10473633 65.7468338 5.69336414 86.59177399 65.7468338
		 5.77887392 87.13166046 65.7468338 5.86175919 87.72624969 66.035766602 5.58845234 88.26265717 66.035766602
		 5.16276598 88.68833923 66.035766602 4.62637138 88.96164703 66.035766602 4.031772614 89.05582428 66.035766602
		 3.43717432 88.96164703 66.035766602 2.90077877 88.68833923 66.035766602 2.47509336 88.26265717 66.035766602
		 2.20178628 87.72624969 66.035766602 2.10761142 87.13166046 66.035766602 2.20178628 86.5370636 66.035766602
		 2.47509336 86.00066375732 66.035766602 2.90077877 85.57498169 66.035766602 3.43717432 85.30167389 66.035766602
		 4.031772614 85.20748901 66.035766602 4.62637091 85.30167389 66.035766602 5.16276598 85.57498169 66.035766602
		 5.58845139 86.00066375732 66.035766602 5.86175823 86.5370636 66.035766602 5.95593357 87.13166046 66.035766602
		 5.98509264 87.76634216 66.34883881 5.69336605 88.33886719 66.34883881 5.23899126 88.79325104 66.34883881
		 4.66644478 89.084976196 66.34883881 4.031772614 89.18550873 66.34883881 3.39710069 89.084976196 66.34883881
		 2.82455468 88.79325104 66.34883881 2.37018013 88.33886719 66.34883881 2.078453541 87.76634216 66.34883881
		 1.97793126 87.13166046 66.34883881 2.078453541 86.49698639 66.34883881 2.37018013 85.92444611 66.34883881
		 2.82455516 85.47006989 66.34883881 3.39710069 85.17834473 66.34883881 4.031772614 85.077819824 66.34883881
		 4.6664443 85.17834473 66.34883881 5.23898983 85.47006989 66.34883881 5.69336414 85.92444611 66.34883881
		 5.98509121 86.49698639 66.34883881 6.085613251 87.13166046 66.34883881 6.06032753 87.79077148 66.67835236
		 5.7573657 88.38538361 66.67835236 5.28548813 88.85725403 66.67835236 4.69089031 89.16021729 66.67835236
		 4.031772614 89.26461029 66.67835236 3.37265468 89.16021729 66.67835236;
	setAttr ".vt[166:331]" 2.77805614 88.85725403 66.67835236 2.30618024 88.38538361 66.67835236
		 2.0032172203 87.79077148 66.67835236 1.89882338 87.13166046 66.67835236 2.0032172203 86.47254181 66.67835236
		 2.30618048 85.87794495 66.67835236 2.77805662 85.40606689 66.67835236 3.37265515 85.10309601 66.67835236
		 4.031772614 84.99871063 66.67835236 4.69088984 85.10309601 66.67835236 5.28548813 85.40606689 66.67835236
		 5.75736427 85.87794495 66.67835236 6.06032753 86.47254181 66.67835236 6.16472101 87.13166046 66.67835236
		 6.085614681 87.79898834 67.016174316 5.77887535 88.40100098 67.016174316 5.30111694 88.87876129 67.016174316
		 4.69910622 89.18550873 67.016174316 4.031772614 89.29119873 67.016174316 3.36443901 89.18550873 67.016174316
		 2.76242876 88.87876129 67.016174316 2.28467059 88.40100098 67.016174316 1.97793126 87.79898834 67.016174316
		 1.87223601 87.13166046 67.016174316 1.97793126 86.46432495 67.016174316 2.28467083 85.86231995 67.016174316
		 2.76242876 85.38455963 67.016174316 3.36443901 85.077819824 67.016174316 4.031772614 84.97212219 67.016174316
		 4.69910574 85.077819824 67.016174316 5.30111599 85.38455963 67.016174316 5.77887392 85.86231995 67.016174316
		 6.085613251 86.46432495 67.016174316 6.1913085 87.13166046 67.016174316 6.06032753 87.79077148 67.35399628
		 5.7573657 88.38538361 67.35399628 5.28548813 88.85725403 67.35399628 4.69089031 89.16021729 67.35399628
		 4.031772614 89.26461029 67.35399628 3.37265468 89.16021729 67.35399628 2.77805614 88.85725403 67.35399628
		 2.30618024 88.38538361 67.35399628 2.0032172203 87.79077148 67.35399628 1.89882338 87.13166046 67.35399628
		 2.0032172203 86.47254181 67.35399628 2.30618048 85.87794495 67.35399628 2.77805662 85.40606689 67.35399628
		 3.37265515 85.10309601 67.35399628 4.031772614 84.99871063 67.35399628 4.69088984 85.10309601 67.35399628
		 5.28548813 85.40606689 67.35399628 5.75736427 85.87794495 67.35399628 6.06032753 86.47254181 67.35399628
		 6.16472101 87.13166046 67.35399628 5.98509264 87.76634216 67.68350983 5.69336605 88.33886719 67.68350983
		 5.23899126 88.79325104 67.68350983 4.66644478 89.084976196 67.68350983 4.031772614 89.18550873 67.68350983
		 3.39710069 89.084976196 67.68350983 2.82455468 88.79325104 67.68350983 2.37018013 88.33886719 67.68350983
		 2.078453541 87.76634216 67.68350983 1.97793126 87.13166046 67.68350983 2.078453541 86.49698639 67.68350983
		 2.37018013 85.92444611 67.68350983 2.82455516 85.47006989 67.68350983 3.39710069 85.17834473 67.68350983
		 4.031772614 85.077819824 67.68350983 4.6664443 85.17834473 67.68350983 5.23898983 85.47006989 67.68350983
		 5.69336414 85.92444611 67.68350983 5.98509121 86.49698639 67.68350983 6.085613251 87.13166046 67.68350983
		 5.86175919 87.72624969 67.99658203 5.58845234 88.26265717 67.99658203 5.16276598 88.68833923 67.99658203
		 4.62637138 88.96164703 67.99658203 4.031772614 89.05582428 67.99658203 3.43717432 88.96164703 67.99658203
		 2.90077877 88.68833923 67.99658203 2.47509336 88.26265717 67.99658203 2.20178628 87.72624969 67.99658203
		 2.10761142 87.13166046 67.99658203 2.20178628 86.5370636 67.99658203 2.47509336 86.00066375732 67.99658203
		 2.90077877 85.57498169 67.99658203 3.43717432 85.30167389 67.99658203 4.031772614 85.20748901 67.99658203
		 4.62637091 85.30167389 67.99658203 5.16276598 85.57498169 67.99658203 5.58845139 86.00066375732 67.99658203
		 5.86175823 86.5370636 67.99658203 5.95593357 87.13166046 67.99658203 5.69336557 87.67154694 68.28551483
		 5.4452076 88.15858459 68.28551483 5.058693886 88.54509735 68.28551483 4.5716567 88.79325104 68.28551483
		 4.031772614 88.87876129 68.28551483 3.49188828 88.79325104 68.28551483 3.0048518181 88.54509735 68.28551483
		 2.61833739 88.15858459 68.28551483 2.37018013 87.67154694 68.28551483 2.28467083 87.13166046 68.28551483
		 2.37018013 86.59177399 68.28551483 2.61833763 86.10473633 68.28551483 3.0048520565 85.7182312 68.28551483
		 3.49188852 85.47006989 68.28551483 4.031772614 85.38455963 68.28551483 4.5716567 85.47006989 68.28551483
		 5.058692932 85.7182312 68.28551483 5.44520712 86.10473633 68.28551483 5.69336414 86.59177399 68.28551483
		 5.77887392 87.13166046 68.28551483 5.48405838 87.60353851 68.54319763 5.26716042 88.029220581 68.54319763
		 4.92933464 88.36705017 68.54319763 4.50364876 88.58394623 68.54319763 4.031772614 88.65868378 68.54319763
		 3.55989671 88.58394623 68.54319763 3.13421082 88.36705017 68.54319763 2.79638505 88.029220581 68.54319763
		 2.57948756 87.60353851 68.54319763 2.50474977 87.13166046 68.54319763 2.57948756 86.65977478 68.54319763
		 2.79638505 86.23410034 68.54319763 3.13421082 85.89627075 68.54319763 3.55989671 85.67937469 68.54319763
		 4.031772614 85.60463715 68.54319763 4.50364828 85.67937469 68.54319763 4.92933369 85.89627075 68.54319763
		 5.26715946 86.23410034 68.54319763 5.48405695 86.65977478 68.54319763 5.55879545 87.13166046 68.54319763
		 5.23899126 87.52391052 68.76327515 5.058693886 87.87776947 68.76327515 4.77787447 88.15858459 68.76327515
		 4.42402172 88.33886719 68.76327515 4.031772614 88.40100098 68.76327515 3.63952374 88.33886719 68.76327515
		 3.28567052 88.15858459 68.76327515 3.0048518181 87.87776947 68.76327515 2.82455516 87.52391052 68.76327515
		 2.76242876 87.13166046 68.76327515 2.82455516 86.73941803 68.76327515 3.0048520565 86.38555908 68.76327515
		 3.28567171 86.10473633 68.76327515 3.63952374 85.92444611 68.76327515 4.031772614 85.86231995 68.76327515
		 4.42402124 85.92444611 68.76327515 4.77787399 86.10473633 68.76327515 5.058692932 86.38555908 68.76327515
		 5.23898983 86.73941803 68.76327515 5.30111599 87.13166046 68.76327515 4.96419764 87.43462372 68.94033813
		 4.82494068 87.70793152 68.94033813 4.60804272 87.92482758 68.94033813 4.33473587 88.064094543 68.94033813
		 4.031772614 88.11206055 68.94033813 3.72880936 88.064094543 68.94033813 3.45550251 87.92482758 68.94033813
		 3.23860431 87.70793152 68.94033813 3.099348068 87.43462372 68.94033813 3.051363468 87.13166046 68.94033813
		 3.099348068 86.82870483 68.94033813 3.23860455 86.55538177 68.94033813;
	setAttr ".vt[332:381]" 3.45550251 86.33848572 68.94033813 3.72880936 86.19923401 68.94033813
		 4.031772614 86.15125275 68.94033813 4.33473539 86.19923401 68.94033813 4.60804272 86.33848572 68.94033813
		 4.8249402 86.55538177 68.94033813 4.96419716 86.82870483 68.94033813 5.012181759 87.13166046 68.94033813
		 4.66644478 87.33787537 69.070014954 4.57165718 87.52391052 69.070014954 4.42402172 87.67154694 69.070014954
		 4.2379899 87.76634216 69.070014954 4.031772614 87.79898834 69.070014954 3.82555461 87.76634216 69.070014954
		 3.63952374 87.67154694 69.070014954 3.49188852 87.52391052 69.070014954 3.39710069 87.33787537 69.070014954
		 3.36443901 87.13166046 69.070014954 3.39710069 86.92545319 69.070014954 3.49188852 86.73941803 69.070014954
		 3.63952374 86.59177399 69.070014954 3.82555532 86.49698639 69.070014954 4.031772614 86.46432495 69.070014954
		 4.2379899 86.49698639 69.070014954 4.42402124 86.59177399 69.070014954 4.5716567 86.73941803 69.070014954
		 4.6664443 86.92545319 69.070014954 4.69910574 87.13166046 69.070014954 4.35306454 87.23605347 69.14912415
		 4.30507946 87.33023071 69.14912415 4.23034191 87.40496826 69.14912415 4.13616657 87.45294952 69.14912415
		 4.031772614 87.46949005 69.14912415 3.92737865 87.45294952 69.14912415 3.83320308 87.40496826 69.14912415
		 3.75846577 87.33023071 69.14912415 3.71048045 87.23605347 69.14912415 3.6939466 87.13166046 69.14912415
		 3.71048045 87.027267456 69.14912415 3.75846577 86.93309784 69.14912415 3.83320308 86.85835266 69.14912415
		 3.92737865 86.8103714 69.14912415 4.031772614 86.79383087 69.14912415 4.13616657 86.8103714 69.14912415
		 4.23034191 86.85835266 69.14912415 4.30507946 86.93309784 69.14912415 4.35306406 87.027267456 69.14912415
		 4.36959839 87.13166046 69.14912415 4.031772614 87.13166046 64.85663605 4.031772614 87.13166046 69.17571259;
	setAttr -s 780 ".ed";
	setAttr ".ed[0:165]"  0 1 1 1 2 1 2 3 1 3 4 1 4 5 1 5 6 1 6 7 1 7 8 1 8 9 1
		 9 10 1 10 11 1 11 12 1 12 13 1 13 14 1 14 15 1 15 16 1 16 17 1 17 18 1 18 19 1 19 0 1
		 20 21 1 21 22 1 22 23 1 23 24 1 24 25 1 25 26 1 26 27 1 27 28 1 28 29 1 29 30 1 30 31 1
		 31 32 1 32 33 1 33 34 1 34 35 1 35 36 1 36 37 1 37 38 1 38 39 1 39 20 1 40 41 1 41 42 1
		 42 43 1 43 44 1 44 45 1 45 46 1 46 47 1 47 48 1 48 49 1 49 50 1 50 51 1 51 52 1 52 53 1
		 53 54 1 54 55 1 55 56 1 56 57 1 57 58 1 58 59 1 59 40 1 60 61 1 61 62 1 62 63 1 63 64 1
		 64 65 1 65 66 1 66 67 1 67 68 1 68 69 1 69 70 1 70 71 1 71 72 1 72 73 1 73 74 1 74 75 1
		 75 76 1 76 77 1 77 78 1 78 79 1 79 60 1 80 81 1 81 82 1 82 83 1 83 84 1 84 85 1 85 86 1
		 86 87 1 87 88 1 88 89 1 89 90 1 90 91 1 91 92 1 92 93 1 93 94 1 94 95 1 95 96 1 96 97 1
		 97 98 1 98 99 1 99 80 1 100 101 1 101 102 1 102 103 1 103 104 1 104 105 1 105 106 1
		 106 107 1 107 108 1 108 109 1 109 110 1 110 111 1 111 112 1 112 113 1 113 114 1 114 115 1
		 115 116 1 116 117 1 117 118 1 118 119 1 119 100 1 120 121 1 121 122 1 122 123 1 123 124 1
		 124 125 1 125 126 1 126 127 1 127 128 1 128 129 1 129 130 1 130 131 1 131 132 1 132 133 1
		 133 134 1 134 135 1 135 136 1 136 137 1 137 138 1 138 139 1 139 120 1 140 141 1 141 142 1
		 142 143 1 143 144 1 144 145 1 145 146 1 146 147 1 147 148 1 148 149 1 149 150 1 150 151 1
		 151 152 1 152 153 1 153 154 1 154 155 1 155 156 1 156 157 1 157 158 1 158 159 1 159 140 1
		 160 161 1 161 162 1 162 163 1 163 164 1 164 165 1 165 166 1;
	setAttr ".ed[166:331]" 166 167 1 167 168 1 168 169 1 169 170 1 170 171 1 171 172 1
		 172 173 1 173 174 1 174 175 1 175 176 1 176 177 1 177 178 1 178 179 1 179 160 1 180 181 1
		 181 182 1 182 183 1 183 184 1 184 185 1 185 186 1 186 187 1 187 188 1 188 189 1 189 190 1
		 190 191 1 191 192 1 192 193 1 193 194 1 194 195 1 195 196 1 196 197 1 197 198 1 198 199 1
		 199 180 1 200 201 1 201 202 1 202 203 1 203 204 1 204 205 1 205 206 1 206 207 1 207 208 1
		 208 209 1 209 210 1 210 211 1 211 212 1 212 213 1 213 214 1 214 215 1 215 216 1 216 217 1
		 217 218 1 218 219 1 219 200 1 220 221 1 221 222 1 222 223 1 223 224 1 224 225 1 225 226 1
		 226 227 1 227 228 1 228 229 1 229 230 1 230 231 1 231 232 1 232 233 1 233 234 1 234 235 1
		 235 236 1 236 237 1 237 238 1 238 239 1 239 220 1 240 241 1 241 242 1 242 243 1 243 244 1
		 244 245 1 245 246 1 246 247 1 247 248 1 248 249 1 249 250 1 250 251 1 251 252 1 252 253 1
		 253 254 1 254 255 1 255 256 1 256 257 1 257 258 1 258 259 1 259 240 1 260 261 1 261 262 1
		 262 263 1 263 264 1 264 265 1 265 266 1 266 267 1 267 268 1 268 269 1 269 270 1 270 271 1
		 271 272 1 272 273 1 273 274 1 274 275 1 275 276 1 276 277 1 277 278 1 278 279 1 279 260 1
		 280 281 1 281 282 1 282 283 1 283 284 1 284 285 1 285 286 1 286 287 1 287 288 1 288 289 1
		 289 290 1 290 291 1 291 292 1 292 293 1 293 294 1 294 295 1 295 296 1 296 297 1 297 298 1
		 298 299 1 299 280 1 300 301 1 301 302 1 302 303 1 303 304 1 304 305 1 305 306 1 306 307 1
		 307 308 1 308 309 1 309 310 1 310 311 1 311 312 1 312 313 1 313 314 1 314 315 1 315 316 1
		 316 317 1 317 318 1 318 319 1 319 300 1 320 321 1 321 322 1 322 323 1 323 324 1 324 325 1
		 325 326 1 326 327 1 327 328 1 328 329 1 329 330 1 330 331 1 331 332 1;
	setAttr ".ed[332:497]" 332 333 1 333 334 1 334 335 1 335 336 1 336 337 1 337 338 1
		 338 339 1 339 320 1 340 341 1 341 342 1 342 343 1 343 344 1 344 345 1 345 346 1 346 347 1
		 347 348 1 348 349 1 349 350 1 350 351 1 351 352 1 352 353 1 353 354 1 354 355 1 355 356 1
		 356 357 1 357 358 1 358 359 1 359 340 1 360 361 1 361 362 1 362 363 1 363 364 1 364 365 1
		 365 366 1 366 367 1 367 368 1 368 369 1 369 370 1 370 371 1 371 372 1 372 373 1 373 374 1
		 374 375 1 375 376 1 376 377 1 377 378 1 378 379 1 379 360 1 0 20 1 1 21 1 2 22 1
		 3 23 1 4 24 1 5 25 1 6 26 1 7 27 1 8 28 1 9 29 1 10 30 1 11 31 1 12 32 1 13 33 1
		 14 34 1 15 35 1 16 36 1 17 37 1 18 38 1 19 39 1 20 40 1 21 41 1 22 42 1 23 43 1 24 44 1
		 25 45 1 26 46 1 27 47 1 28 48 1 29 49 1 30 50 1 31 51 1 32 52 1 33 53 1 34 54 1 35 55 1
		 36 56 1 37 57 1 38 58 1 39 59 1 40 60 1 41 61 1 42 62 1 43 63 1 44 64 1 45 65 1 46 66 1
		 47 67 1 48 68 1 49 69 1 50 70 1 51 71 1 52 72 1 53 73 1 54 74 1 55 75 1 56 76 1 57 77 1
		 58 78 1 59 79 1 60 80 1 61 81 1 62 82 1 63 83 1 64 84 1 65 85 1 66 86 1 67 87 1 68 88 1
		 69 89 1 70 90 1 71 91 1 72 92 1 73 93 1 74 94 1 75 95 1 76 96 1 77 97 1 78 98 1 79 99 1
		 80 100 1 81 101 1 82 102 1 83 103 1 84 104 1 85 105 1 86 106 1 87 107 1 88 108 1
		 89 109 1 90 110 1 91 111 1 92 112 1 93 113 1 94 114 1 95 115 1 96 116 1 97 117 1
		 98 118 1 99 119 1 100 120 1 101 121 1 102 122 1 103 123 1 104 124 1 105 125 1 106 126 1
		 107 127 1 108 128 1 109 129 1 110 130 1 111 131 1 112 132 1 113 133 1 114 134 1 115 135 1
		 116 136 1 117 137 1;
	setAttr ".ed[498:663]" 118 138 1 119 139 1 120 140 1 121 141 1 122 142 1 123 143 1
		 124 144 1 125 145 1 126 146 1 127 147 1 128 148 1 129 149 1 130 150 1 131 151 1 132 152 1
		 133 153 1 134 154 1 135 155 1 136 156 1 137 157 1 138 158 1 139 159 1 140 160 1 141 161 1
		 142 162 1 143 163 1 144 164 1 145 165 1 146 166 1 147 167 1 148 168 1 149 169 1 150 170 1
		 151 171 1 152 172 1 153 173 1 154 174 1 155 175 1 156 176 1 157 177 1 158 178 1 159 179 1
		 160 180 1 161 181 1 162 182 1 163 183 1 164 184 1 165 185 1 166 186 1 167 187 1 168 188 1
		 169 189 1 170 190 1 171 191 1 172 192 1 173 193 1 174 194 1 175 195 1 176 196 1 177 197 1
		 178 198 1 179 199 1 180 200 1 181 201 1 182 202 1 183 203 1 184 204 1 185 205 1 186 206 1
		 187 207 1 188 208 1 189 209 1 190 210 1 191 211 1 192 212 1 193 213 1 194 214 1 195 215 1
		 196 216 1 197 217 1 198 218 1 199 219 1 200 220 1 201 221 1 202 222 1 203 223 1 204 224 1
		 205 225 1 206 226 1 207 227 1 208 228 1 209 229 1 210 230 1 211 231 1 212 232 1 213 233 1
		 214 234 1 215 235 1 216 236 1 217 237 1 218 238 1 219 239 1 220 240 1 221 241 1 222 242 1
		 223 243 1 224 244 1 225 245 1 226 246 1 227 247 1 228 248 1 229 249 1 230 250 1 231 251 1
		 232 252 1 233 253 1 234 254 1 235 255 1 236 256 1 237 257 1 238 258 1 239 259 1 240 260 1
		 241 261 1 242 262 1 243 263 1 244 264 1 245 265 1 246 266 1 247 267 1 248 268 1 249 269 1
		 250 270 1 251 271 1 252 272 1 253 273 1 254 274 1 255 275 1 256 276 1 257 277 1 258 278 1
		 259 279 1 260 280 1 261 281 1 262 282 1 263 283 1 264 284 1 265 285 1 266 286 1 267 287 1
		 268 288 1 269 289 1 270 290 1 271 291 1 272 292 1 273 293 1 274 294 1 275 295 1 276 296 1
		 277 297 1 278 298 1 279 299 1 280 300 1 281 301 1 282 302 1 283 303 1;
	setAttr ".ed[664:779]" 284 304 1 285 305 1 286 306 1 287 307 1 288 308 1 289 309 1
		 290 310 1 291 311 1 292 312 1 293 313 1 294 314 1 295 315 1 296 316 1 297 317 1 298 318 1
		 299 319 1 300 320 1 301 321 1 302 322 1 303 323 1 304 324 1 305 325 1 306 326 1 307 327 1
		 308 328 1 309 329 1 310 330 1 311 331 1 312 332 1 313 333 1 314 334 1 315 335 1 316 336 1
		 317 337 1 318 338 1 319 339 1 320 340 1 321 341 1 322 342 1 323 343 1 324 344 1 325 345 1
		 326 346 1 327 347 1 328 348 1 329 349 1 330 350 1 331 351 1 332 352 1 333 353 1 334 354 1
		 335 355 1 336 356 1 337 357 1 338 358 1 339 359 1 340 360 1 341 361 1 342 362 1 343 363 1
		 344 364 1 345 365 1 346 366 1 347 367 1 348 368 1 349 369 1 350 370 1 351 371 1 352 372 1
		 353 373 1 354 374 1 355 375 1 356 376 1 357 377 1 358 378 1 359 379 1 380 0 1 380 1 1
		 380 2 1 380 3 1 380 4 1 380 5 1 380 6 1 380 7 1 380 8 1 380 9 1 380 10 1 380 11 1
		 380 12 1 380 13 1 380 14 1 380 15 1 380 16 1 380 17 1 380 18 1 380 19 1 360 381 1
		 361 381 1 362 381 1 363 381 1 364 381 1 365 381 1 366 381 1 367 381 1 368 381 1 369 381 1
		 370 381 1 371 381 1 372 381 1 373 381 1 374 381 1 375 381 1 376 381 1 377 381 1 378 381 1
		 379 381 1;
	setAttr -s 400 -ch 1560 ".fc[0:399]" -type "polyFaces" 
		f 4 0 381 -21 -381
		mu 0 4 0 1 22 21
		f 4 1 382 -22 -382
		mu 0 4 1 2 23 22
		f 4 2 383 -23 -383
		mu 0 4 2 3 24 23
		f 4 3 384 -24 -384
		mu 0 4 3 4 25 24
		f 4 4 385 -25 -385
		mu 0 4 4 5 26 25
		f 4 5 386 -26 -386
		mu 0 4 5 6 27 26
		f 4 6 387 -27 -387
		mu 0 4 6 7 28 27
		f 4 7 388 -28 -388
		mu 0 4 7 8 29 28
		f 4 8 389 -29 -389
		mu 0 4 8 9 30 29
		f 4 9 390 -30 -390
		mu 0 4 9 10 31 30
		f 4 10 391 -31 -391
		mu 0 4 10 11 32 31
		f 4 11 392 -32 -392
		mu 0 4 11 12 33 32
		f 4 12 393 -33 -393
		mu 0 4 12 13 34 33
		f 4 13 394 -34 -394
		mu 0 4 13 14 35 34
		f 4 14 395 -35 -395
		mu 0 4 14 15 36 35
		f 4 15 396 -36 -396
		mu 0 4 15 16 37 36
		f 4 16 397 -37 -397
		mu 0 4 16 17 38 37
		f 4 17 398 -38 -398
		mu 0 4 17 18 39 38
		f 4 18 399 -39 -399
		mu 0 4 18 19 40 39
		f 4 19 380 -40 -400
		mu 0 4 19 20 41 40
		f 4 20 401 -41 -401
		mu 0 4 21 22 43 42
		f 4 21 402 -42 -402
		mu 0 4 22 23 44 43
		f 4 22 403 -43 -403
		mu 0 4 23 24 45 44
		f 4 23 404 -44 -404
		mu 0 4 24 25 46 45
		f 4 24 405 -45 -405
		mu 0 4 25 26 47 46
		f 4 25 406 -46 -406
		mu 0 4 26 27 48 47
		f 4 26 407 -47 -407
		mu 0 4 27 28 49 48
		f 4 27 408 -48 -408
		mu 0 4 28 29 50 49
		f 4 28 409 -49 -409
		mu 0 4 29 30 51 50
		f 4 29 410 -50 -410
		mu 0 4 30 31 52 51
		f 4 30 411 -51 -411
		mu 0 4 31 32 53 52
		f 4 31 412 -52 -412
		mu 0 4 32 33 54 53
		f 4 32 413 -53 -413
		mu 0 4 33 34 55 54
		f 4 33 414 -54 -414
		mu 0 4 34 35 56 55
		f 4 34 415 -55 -415
		mu 0 4 35 36 57 56
		f 4 35 416 -56 -416
		mu 0 4 36 37 58 57
		f 4 36 417 -57 -417
		mu 0 4 37 38 59 58
		f 4 37 418 -58 -418
		mu 0 4 38 39 60 59
		f 4 38 419 -59 -419
		mu 0 4 39 40 61 60
		f 4 39 400 -60 -420
		mu 0 4 40 41 62 61
		f 4 40 421 -61 -421
		mu 0 4 42 43 64 63
		f 4 41 422 -62 -422
		mu 0 4 43 44 65 64
		f 4 42 423 -63 -423
		mu 0 4 44 45 66 65
		f 4 43 424 -64 -424
		mu 0 4 45 46 67 66
		f 4 44 425 -65 -425
		mu 0 4 46 47 68 67
		f 4 45 426 -66 -426
		mu 0 4 47 48 69 68
		f 4 46 427 -67 -427
		mu 0 4 48 49 70 69
		f 4 47 428 -68 -428
		mu 0 4 49 50 71 70
		f 4 48 429 -69 -429
		mu 0 4 50 51 72 71
		f 4 49 430 -70 -430
		mu 0 4 51 52 73 72
		f 4 50 431 -71 -431
		mu 0 4 52 53 74 73
		f 4 51 432 -72 -432
		mu 0 4 53 54 75 74
		f 4 52 433 -73 -433
		mu 0 4 54 55 76 75
		f 4 53 434 -74 -434
		mu 0 4 55 56 77 76
		f 4 54 435 -75 -435
		mu 0 4 56 57 78 77
		f 4 55 436 -76 -436
		mu 0 4 57 58 79 78
		f 4 56 437 -77 -437
		mu 0 4 58 59 80 79
		f 4 57 438 -78 -438
		mu 0 4 59 60 81 80
		f 4 58 439 -79 -439
		mu 0 4 60 61 82 81
		f 4 59 420 -80 -440
		mu 0 4 61 62 83 82
		f 4 60 441 -81 -441
		mu 0 4 63 64 85 84
		f 4 61 442 -82 -442
		mu 0 4 64 65 86 85
		f 4 62 443 -83 -443
		mu 0 4 65 66 87 86
		f 4 63 444 -84 -444
		mu 0 4 66 67 88 87
		f 4 64 445 -85 -445
		mu 0 4 67 68 89 88
		f 4 65 446 -86 -446
		mu 0 4 68 69 90 89
		f 4 66 447 -87 -447
		mu 0 4 69 70 91 90
		f 4 67 448 -88 -448
		mu 0 4 70 71 92 91
		f 4 68 449 -89 -449
		mu 0 4 71 72 93 92
		f 4 69 450 -90 -450
		mu 0 4 72 73 94 93
		f 4 70 451 -91 -451
		mu 0 4 73 74 95 94
		f 4 71 452 -92 -452
		mu 0 4 74 75 96 95
		f 4 72 453 -93 -453
		mu 0 4 75 76 97 96
		f 4 73 454 -94 -454
		mu 0 4 76 77 98 97
		f 4 74 455 -95 -455
		mu 0 4 77 78 99 98
		f 4 75 456 -96 -456
		mu 0 4 78 79 100 99
		f 4 76 457 -97 -457
		mu 0 4 79 80 101 100
		f 4 77 458 -98 -458
		mu 0 4 80 81 102 101
		f 4 78 459 -99 -459
		mu 0 4 81 82 103 102
		f 4 79 440 -100 -460
		mu 0 4 82 83 104 103
		f 4 80 461 -101 -461
		mu 0 4 84 85 106 105
		f 4 81 462 -102 -462
		mu 0 4 85 86 107 106
		f 4 82 463 -103 -463
		mu 0 4 86 87 108 107
		f 4 83 464 -104 -464
		mu 0 4 87 88 109 108
		f 4 84 465 -105 -465
		mu 0 4 88 89 110 109
		f 4 85 466 -106 -466
		mu 0 4 89 90 111 110
		f 4 86 467 -107 -467
		mu 0 4 90 91 112 111
		f 4 87 468 -108 -468
		mu 0 4 91 92 113 112
		f 4 88 469 -109 -469
		mu 0 4 92 93 114 113
		f 4 89 470 -110 -470
		mu 0 4 93 94 115 114
		f 4 90 471 -111 -471
		mu 0 4 94 95 116 115
		f 4 91 472 -112 -472
		mu 0 4 95 96 117 116
		f 4 92 473 -113 -473
		mu 0 4 96 97 118 117
		f 4 93 474 -114 -474
		mu 0 4 97 98 119 118
		f 4 94 475 -115 -475
		mu 0 4 98 99 120 119
		f 4 95 476 -116 -476
		mu 0 4 99 100 121 120
		f 4 96 477 -117 -477
		mu 0 4 100 101 122 121
		f 4 97 478 -118 -478
		mu 0 4 101 102 123 122
		f 4 98 479 -119 -479
		mu 0 4 102 103 124 123
		f 4 99 460 -120 -480
		mu 0 4 103 104 125 124
		f 4 100 481 -121 -481
		mu 0 4 105 106 127 126
		f 4 101 482 -122 -482
		mu 0 4 106 107 128 127
		f 4 102 483 -123 -483
		mu 0 4 107 108 129 128
		f 4 103 484 -124 -484
		mu 0 4 108 109 130 129
		f 4 104 485 -125 -485
		mu 0 4 109 110 131 130
		f 4 105 486 -126 -486
		mu 0 4 110 111 132 131
		f 4 106 487 -127 -487
		mu 0 4 111 112 133 132
		f 4 107 488 -128 -488
		mu 0 4 112 113 134 133
		f 4 108 489 -129 -489
		mu 0 4 113 114 135 134
		f 4 109 490 -130 -490
		mu 0 4 114 115 136 135
		f 4 110 491 -131 -491
		mu 0 4 115 116 137 136
		f 4 111 492 -132 -492
		mu 0 4 116 117 138 137
		f 4 112 493 -133 -493
		mu 0 4 117 118 139 138
		f 4 113 494 -134 -494
		mu 0 4 118 119 140 139
		f 4 114 495 -135 -495
		mu 0 4 119 120 141 140
		f 4 115 496 -136 -496
		mu 0 4 120 121 142 141
		f 4 116 497 -137 -497
		mu 0 4 121 122 143 142
		f 4 117 498 -138 -498
		mu 0 4 122 123 144 143
		f 4 118 499 -139 -499
		mu 0 4 123 124 145 144
		f 4 119 480 -140 -500
		mu 0 4 124 125 146 145
		f 4 120 501 -141 -501
		mu 0 4 126 127 148 147
		f 4 121 502 -142 -502
		mu 0 4 127 128 149 148
		f 4 122 503 -143 -503
		mu 0 4 128 129 150 149
		f 4 123 504 -144 -504
		mu 0 4 129 130 151 150
		f 4 124 505 -145 -505
		mu 0 4 130 131 152 151
		f 4 125 506 -146 -506
		mu 0 4 131 132 153 152
		f 4 126 507 -147 -507
		mu 0 4 132 133 154 153
		f 4 127 508 -148 -508
		mu 0 4 133 134 155 154
		f 4 128 509 -149 -509
		mu 0 4 134 135 156 155
		f 4 129 510 -150 -510
		mu 0 4 135 136 157 156
		f 4 130 511 -151 -511
		mu 0 4 136 137 158 157
		f 4 131 512 -152 -512
		mu 0 4 137 138 159 158
		f 4 132 513 -153 -513
		mu 0 4 138 139 160 159
		f 4 133 514 -154 -514
		mu 0 4 139 140 161 160
		f 4 134 515 -155 -515
		mu 0 4 140 141 162 161
		f 4 135 516 -156 -516
		mu 0 4 141 142 163 162
		f 4 136 517 -157 -517
		mu 0 4 142 143 164 163
		f 4 137 518 -158 -518
		mu 0 4 143 144 165 164
		f 4 138 519 -159 -519
		mu 0 4 144 145 166 165
		f 4 139 500 -160 -520
		mu 0 4 145 146 167 166
		f 4 140 521 -161 -521
		mu 0 4 147 148 169 168
		f 4 141 522 -162 -522
		mu 0 4 148 149 170 169
		f 4 142 523 -163 -523
		mu 0 4 149 150 171 170
		f 4 143 524 -164 -524
		mu 0 4 150 151 172 171
		f 4 144 525 -165 -525
		mu 0 4 151 152 173 172
		f 4 145 526 -166 -526
		mu 0 4 152 153 174 173
		f 4 146 527 -167 -527
		mu 0 4 153 154 175 174
		f 4 147 528 -168 -528
		mu 0 4 154 155 176 175
		f 4 148 529 -169 -529
		mu 0 4 155 156 177 176
		f 4 149 530 -170 -530
		mu 0 4 156 157 178 177
		f 4 150 531 -171 -531
		mu 0 4 157 158 179 178
		f 4 151 532 -172 -532
		mu 0 4 158 159 180 179
		f 4 152 533 -173 -533
		mu 0 4 159 160 181 180
		f 4 153 534 -174 -534
		mu 0 4 160 161 182 181
		f 4 154 535 -175 -535
		mu 0 4 161 162 183 182
		f 4 155 536 -176 -536
		mu 0 4 162 163 184 183
		f 4 156 537 -177 -537
		mu 0 4 163 164 185 184
		f 4 157 538 -178 -538
		mu 0 4 164 165 186 185
		f 4 158 539 -179 -539
		mu 0 4 165 166 187 186
		f 4 159 520 -180 -540
		mu 0 4 166 167 188 187
		f 4 160 541 -181 -541
		mu 0 4 168 169 190 189
		f 4 161 542 -182 -542
		mu 0 4 169 170 191 190
		f 4 162 543 -183 -543
		mu 0 4 170 171 192 191
		f 4 163 544 -184 -544
		mu 0 4 171 172 193 192
		f 4 164 545 -185 -545
		mu 0 4 172 173 194 193
		f 4 165 546 -186 -546
		mu 0 4 173 174 195 194
		f 4 166 547 -187 -547
		mu 0 4 174 175 196 195
		f 4 167 548 -188 -548
		mu 0 4 175 176 197 196
		f 4 168 549 -189 -549
		mu 0 4 176 177 198 197
		f 4 169 550 -190 -550
		mu 0 4 177 178 199 198
		f 4 170 551 -191 -551
		mu 0 4 178 179 200 199
		f 4 171 552 -192 -552
		mu 0 4 179 180 201 200
		f 4 172 553 -193 -553
		mu 0 4 180 181 202 201
		f 4 173 554 -194 -554
		mu 0 4 181 182 203 202
		f 4 174 555 -195 -555
		mu 0 4 182 183 204 203
		f 4 175 556 -196 -556
		mu 0 4 183 184 205 204
		f 4 176 557 -197 -557
		mu 0 4 184 185 206 205
		f 4 177 558 -198 -558
		mu 0 4 185 186 207 206
		f 4 178 559 -199 -559
		mu 0 4 186 187 208 207
		f 4 179 540 -200 -560
		mu 0 4 187 188 209 208
		f 4 180 561 -201 -561
		mu 0 4 189 190 211 210
		f 4 181 562 -202 -562
		mu 0 4 190 191 212 211
		f 4 182 563 -203 -563
		mu 0 4 191 192 213 212
		f 4 183 564 -204 -564
		mu 0 4 192 193 214 213
		f 4 184 565 -205 -565
		mu 0 4 193 194 215 214
		f 4 185 566 -206 -566
		mu 0 4 194 195 216 215
		f 4 186 567 -207 -567
		mu 0 4 195 196 217 216
		f 4 187 568 -208 -568
		mu 0 4 196 197 218 217
		f 4 188 569 -209 -569
		mu 0 4 197 198 219 218
		f 4 189 570 -210 -570
		mu 0 4 198 199 220 219
		f 4 190 571 -211 -571
		mu 0 4 199 200 221 220
		f 4 191 572 -212 -572
		mu 0 4 200 201 222 221
		f 4 192 573 -213 -573
		mu 0 4 201 202 223 222
		f 4 193 574 -214 -574
		mu 0 4 202 203 224 223
		f 4 194 575 -215 -575
		mu 0 4 203 204 225 224
		f 4 195 576 -216 -576
		mu 0 4 204 205 226 225
		f 4 196 577 -217 -577
		mu 0 4 205 206 227 226
		f 4 197 578 -218 -578
		mu 0 4 206 207 228 227
		f 4 198 579 -219 -579
		mu 0 4 207 208 229 228
		f 4 199 560 -220 -580
		mu 0 4 208 209 230 229
		f 4 200 581 -221 -581
		mu 0 4 210 211 232 231
		f 4 201 582 -222 -582
		mu 0 4 211 212 233 232
		f 4 202 583 -223 -583
		mu 0 4 212 213 234 233
		f 4 203 584 -224 -584
		mu 0 4 213 214 235 234
		f 4 204 585 -225 -585
		mu 0 4 214 215 236 235
		f 4 205 586 -226 -586
		mu 0 4 215 216 237 236
		f 4 206 587 -227 -587
		mu 0 4 216 217 238 237
		f 4 207 588 -228 -588
		mu 0 4 217 218 239 238
		f 4 208 589 -229 -589
		mu 0 4 218 219 240 239
		f 4 209 590 -230 -590
		mu 0 4 219 220 241 240
		f 4 210 591 -231 -591
		mu 0 4 220 221 242 241
		f 4 211 592 -232 -592
		mu 0 4 221 222 243 242
		f 4 212 593 -233 -593
		mu 0 4 222 223 244 243
		f 4 213 594 -234 -594
		mu 0 4 223 224 245 244
		f 4 214 595 -235 -595
		mu 0 4 224 225 246 245
		f 4 215 596 -236 -596
		mu 0 4 225 226 247 246
		f 4 216 597 -237 -597
		mu 0 4 226 227 248 247
		f 4 217 598 -238 -598
		mu 0 4 227 228 249 248
		f 4 218 599 -239 -599
		mu 0 4 228 229 250 249
		f 4 219 580 -240 -600
		mu 0 4 229 230 251 250
		f 4 220 601 -241 -601
		mu 0 4 231 232 253 252
		f 4 221 602 -242 -602
		mu 0 4 232 233 254 253
		f 4 222 603 -243 -603
		mu 0 4 233 234 255 254
		f 4 223 604 -244 -604
		mu 0 4 234 235 256 255
		f 4 224 605 -245 -605
		mu 0 4 235 236 257 256
		f 4 225 606 -246 -606
		mu 0 4 236 237 258 257
		f 4 226 607 -247 -607
		mu 0 4 237 238 259 258
		f 4 227 608 -248 -608
		mu 0 4 238 239 260 259
		f 4 228 609 -249 -609
		mu 0 4 239 240 261 260
		f 4 229 610 -250 -610
		mu 0 4 240 241 262 261
		f 4 230 611 -251 -611
		mu 0 4 241 242 263 262
		f 4 231 612 -252 -612
		mu 0 4 242 243 264 263
		f 4 232 613 -253 -613
		mu 0 4 243 244 265 264
		f 4 233 614 -254 -614
		mu 0 4 244 245 266 265
		f 4 234 615 -255 -615
		mu 0 4 245 246 267 266
		f 4 235 616 -256 -616
		mu 0 4 246 247 268 267
		f 4 236 617 -257 -617
		mu 0 4 247 248 269 268
		f 4 237 618 -258 -618
		mu 0 4 248 249 270 269
		f 4 238 619 -259 -619
		mu 0 4 249 250 271 270
		f 4 239 600 -260 -620
		mu 0 4 250 251 272 271
		f 4 240 621 -261 -621
		mu 0 4 252 253 274 273
		f 4 241 622 -262 -622
		mu 0 4 253 254 275 274
		f 4 242 623 -263 -623
		mu 0 4 254 255 276 275
		f 4 243 624 -264 -624
		mu 0 4 255 256 277 276
		f 4 244 625 -265 -625
		mu 0 4 256 257 278 277
		f 4 245 626 -266 -626
		mu 0 4 257 258 279 278
		f 4 246 627 -267 -627
		mu 0 4 258 259 280 279
		f 4 247 628 -268 -628
		mu 0 4 259 260 281 280
		f 4 248 629 -269 -629
		mu 0 4 260 261 282 281
		f 4 249 630 -270 -630
		mu 0 4 261 262 283 282
		f 4 250 631 -271 -631
		mu 0 4 262 263 284 283
		f 4 251 632 -272 -632
		mu 0 4 263 264 285 284
		f 4 252 633 -273 -633
		mu 0 4 264 265 286 285
		f 4 253 634 -274 -634
		mu 0 4 265 266 287 286
		f 4 254 635 -275 -635
		mu 0 4 266 267 288 287
		f 4 255 636 -276 -636
		mu 0 4 267 268 289 288
		f 4 256 637 -277 -637
		mu 0 4 268 269 290 289
		f 4 257 638 -278 -638
		mu 0 4 269 270 291 290
		f 4 258 639 -279 -639
		mu 0 4 270 271 292 291
		f 4 259 620 -280 -640
		mu 0 4 271 272 293 292
		f 4 260 641 -281 -641
		mu 0 4 273 274 295 294
		f 4 261 642 -282 -642
		mu 0 4 274 275 296 295
		f 4 262 643 -283 -643
		mu 0 4 275 276 297 296
		f 4 263 644 -284 -644
		mu 0 4 276 277 298 297
		f 4 264 645 -285 -645
		mu 0 4 277 278 299 298
		f 4 265 646 -286 -646
		mu 0 4 278 279 300 299
		f 4 266 647 -287 -647
		mu 0 4 279 280 301 300
		f 4 267 648 -288 -648
		mu 0 4 280 281 302 301
		f 4 268 649 -289 -649
		mu 0 4 281 282 303 302
		f 4 269 650 -290 -650
		mu 0 4 282 283 304 303
		f 4 270 651 -291 -651
		mu 0 4 283 284 305 304
		f 4 271 652 -292 -652
		mu 0 4 284 285 306 305
		f 4 272 653 -293 -653
		mu 0 4 285 286 307 306
		f 4 273 654 -294 -654
		mu 0 4 286 287 308 307
		f 4 274 655 -295 -655
		mu 0 4 287 288 309 308
		f 4 275 656 -296 -656
		mu 0 4 288 289 310 309
		f 4 276 657 -297 -657
		mu 0 4 289 290 311 310
		f 4 277 658 -298 -658
		mu 0 4 290 291 312 311
		f 4 278 659 -299 -659
		mu 0 4 291 292 313 312
		f 4 279 640 -300 -660
		mu 0 4 292 293 314 313
		f 4 280 661 -301 -661
		mu 0 4 294 295 316 315
		f 4 281 662 -302 -662
		mu 0 4 295 296 317 316
		f 4 282 663 -303 -663
		mu 0 4 296 297 318 317
		f 4 283 664 -304 -664
		mu 0 4 297 298 319 318
		f 4 284 665 -305 -665
		mu 0 4 298 299 320 319
		f 4 285 666 -306 -666
		mu 0 4 299 300 321 320
		f 4 286 667 -307 -667
		mu 0 4 300 301 322 321
		f 4 287 668 -308 -668
		mu 0 4 301 302 323 322
		f 4 288 669 -309 -669
		mu 0 4 302 303 324 323
		f 4 289 670 -310 -670
		mu 0 4 303 304 325 324
		f 4 290 671 -311 -671
		mu 0 4 304 305 326 325
		f 4 291 672 -312 -672
		mu 0 4 305 306 327 326
		f 4 292 673 -313 -673
		mu 0 4 306 307 328 327
		f 4 293 674 -314 -674
		mu 0 4 307 308 329 328
		f 4 294 675 -315 -675
		mu 0 4 308 309 330 329
		f 4 295 676 -316 -676
		mu 0 4 309 310 331 330
		f 4 296 677 -317 -677
		mu 0 4 310 311 332 331
		f 4 297 678 -318 -678
		mu 0 4 311 312 333 332
		f 4 298 679 -319 -679
		mu 0 4 312 313 334 333
		f 4 299 660 -320 -680
		mu 0 4 313 314 335 334
		f 4 300 681 -321 -681
		mu 0 4 315 316 337 336
		f 4 301 682 -322 -682
		mu 0 4 316 317 338 337
		f 4 302 683 -323 -683
		mu 0 4 317 318 339 338
		f 4 303 684 -324 -684
		mu 0 4 318 319 340 339
		f 4 304 685 -325 -685
		mu 0 4 319 320 341 340
		f 4 305 686 -326 -686
		mu 0 4 320 321 342 341
		f 4 306 687 -327 -687
		mu 0 4 321 322 343 342
		f 4 307 688 -328 -688
		mu 0 4 322 323 344 343
		f 4 308 689 -329 -689
		mu 0 4 323 324 345 344
		f 4 309 690 -330 -690
		mu 0 4 324 325 346 345
		f 4 310 691 -331 -691
		mu 0 4 325 326 347 346
		f 4 311 692 -332 -692
		mu 0 4 326 327 348 347
		f 4 312 693 -333 -693
		mu 0 4 327 328 349 348
		f 4 313 694 -334 -694
		mu 0 4 328 329 350 349
		f 4 314 695 -335 -695
		mu 0 4 329 330 351 350
		f 4 315 696 -336 -696
		mu 0 4 330 331 352 351
		f 4 316 697 -337 -697
		mu 0 4 331 332 353 352
		f 4 317 698 -338 -698
		mu 0 4 332 333 354 353
		f 4 318 699 -339 -699
		mu 0 4 333 334 355 354
		f 4 319 680 -340 -700
		mu 0 4 334 335 356 355
		f 4 320 701 -341 -701
		mu 0 4 336 337 358 357
		f 4 321 702 -342 -702
		mu 0 4 337 338 359 358
		f 4 322 703 -343 -703
		mu 0 4 338 339 360 359
		f 4 323 704 -344 -704
		mu 0 4 339 340 361 360
		f 4 324 705 -345 -705
		mu 0 4 340 341 362 361
		f 4 325 706 -346 -706
		mu 0 4 341 342 363 362
		f 4 326 707 -347 -707
		mu 0 4 342 343 364 363
		f 4 327 708 -348 -708
		mu 0 4 343 344 365 364
		f 4 328 709 -349 -709
		mu 0 4 344 345 366 365
		f 4 329 710 -350 -710
		mu 0 4 345 346 367 366
		f 4 330 711 -351 -711
		mu 0 4 346 347 368 367
		f 4 331 712 -352 -712
		mu 0 4 347 348 369 368
		f 4 332 713 -353 -713
		mu 0 4 348 349 370 369
		f 4 333 714 -354 -714
		mu 0 4 349 350 371 370
		f 4 334 715 -355 -715
		mu 0 4 350 351 372 371
		f 4 335 716 -356 -716
		mu 0 4 351 352 373 372
		f 4 336 717 -357 -717
		mu 0 4 352 353 374 373
		f 4 337 718 -358 -718
		mu 0 4 353 354 375 374
		f 4 338 719 -359 -719
		mu 0 4 354 355 376 375
		f 4 339 700 -360 -720
		mu 0 4 355 356 377 376
		f 4 340 721 -361 -721
		mu 0 4 357 358 379 378
		f 4 341 722 -362 -722
		mu 0 4 358 359 380 379
		f 4 342 723 -363 -723
		mu 0 4 359 360 381 380
		f 4 343 724 -364 -724
		mu 0 4 360 361 382 381
		f 4 344 725 -365 -725
		mu 0 4 361 362 383 382
		f 4 345 726 -366 -726
		mu 0 4 362 363 384 383
		f 4 346 727 -367 -727
		mu 0 4 363 364 385 384
		f 4 347 728 -368 -728
		mu 0 4 364 365 386 385
		f 4 348 729 -369 -729
		mu 0 4 365 366 387 386
		f 4 349 730 -370 -730
		mu 0 4 366 367 388 387
		f 4 350 731 -371 -731
		mu 0 4 367 368 389 388
		f 4 351 732 -372 -732
		mu 0 4 368 369 390 389
		f 4 352 733 -373 -733
		mu 0 4 369 370 391 390
		f 4 353 734 -374 -734
		mu 0 4 370 371 392 391
		f 4 354 735 -375 -735
		mu 0 4 371 372 393 392
		f 4 355 736 -376 -736
		mu 0 4 372 373 394 393
		f 4 356 737 -377 -737
		mu 0 4 373 374 395 394
		f 4 357 738 -378 -738
		mu 0 4 374 375 396 395
		f 4 358 739 -379 -739
		mu 0 4 375 376 397 396
		f 4 359 720 -380 -740
		mu 0 4 376 377 398 397
		f 3 -1 -741 741
		mu 0 3 1 0 399
		f 3 -2 -742 742
		mu 0 3 2 1 400
		f 3 -3 -743 743
		mu 0 3 3 2 401
		f 3 -4 -744 744
		mu 0 3 4 3 402
		f 3 -5 -745 745
		mu 0 3 5 4 403
		f 3 -6 -746 746
		mu 0 3 6 5 404
		f 3 -7 -747 747
		mu 0 3 7 6 405
		f 3 -8 -748 748
		mu 0 3 8 7 406
		f 3 -9 -749 749
		mu 0 3 9 8 407
		f 3 -10 -750 750
		mu 0 3 10 9 408
		f 3 -11 -751 751
		mu 0 3 11 10 409
		f 3 -12 -752 752
		mu 0 3 12 11 410
		f 3 -13 -753 753
		mu 0 3 13 12 411
		f 3 -14 -754 754
		mu 0 3 14 13 412
		f 3 -15 -755 755
		mu 0 3 15 14 413
		f 3 -16 -756 756
		mu 0 3 16 15 414
		f 3 -17 -757 757
		mu 0 3 17 16 415
		f 3 -18 -758 758
		mu 0 3 18 17 416
		f 3 -19 -759 759
		mu 0 3 19 18 417
		f 3 -20 -760 740
		mu 0 3 20 19 418
		f 3 360 761 -761
		mu 0 3 378 379 419
		f 3 361 762 -762
		mu 0 3 379 380 420
		f 3 362 763 -763
		mu 0 3 380 381 421
		f 3 363 764 -764
		mu 0 3 381 382 422
		f 3 364 765 -765
		mu 0 3 382 383 423
		f 3 365 766 -766
		mu 0 3 383 384 424
		f 3 366 767 -767
		mu 0 3 384 385 425
		f 3 367 768 -768
		mu 0 3 385 386 426
		f 3 368 769 -769
		mu 0 3 386 387 427
		f 3 369 770 -770
		mu 0 3 387 388 428
		f 3 370 771 -771
		mu 0 3 388 389 429
		f 3 371 772 -772
		mu 0 3 389 390 430
		f 3 372 773 -773
		mu 0 3 390 391 431
		f 3 373 774 -774
		mu 0 3 391 392 432
		f 3 374 775 -775
		mu 0 3 392 393 433
		f 3 375 776 -776
		mu 0 3 393 394 434
		f 3 376 777 -777
		mu 0 3 394 395 435
		f 3 377 778 -778
		mu 0 3 395 396 436
		f 3 378 779 -779
		mu 0 3 396 397 437
		f 3 379 760 -780
		mu 0 3 397 398 438;
	setAttr ".cd" -type "dataPolyComponent" Index_Data Edge 0 ;
	setAttr ".cvd" -type "dataPolyComponent" Index_Data Vertex 0 ;
	setAttr ".pd[0]" -type "dataPolyComponent" Index_Data UV 0 ;
	setAttr ".hfd" -type "dataPolyComponent" Index_Data Face 0 ;
	setAttr ".vnm" 0;
createNode displayLayer -n "Mesh_Cheetah";
	rename -uid "7AE8E0B9-4822-A064-F79A-60A30656A7D4";
	setAttr ".do" 1;
createNode displayLayerManager -n "layerManager";
	rename -uid "5C0CE92D-4583-F681-7D1F-58B3A46C44B1";
	setAttr -s 6 ".dli[1:5]"  2 1 4 5 6;
	setAttr -s 3 ".dli";
createNode groupId -n "skinCluster1GroupId";
	rename -uid "63829750-4D30-AA0B-0F88-2CBDC10A209D";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster1Set";
	rename -uid "65512E96-4EFA-AEA3-22ED-EA9A889C3D3E";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster1";
	rename -uid "DCA995EE-4C6C-B7A6-36E8-B0A838483270";
	setAttr -s 2185 ".wl";
	setAttr ".wl[0:469].w"
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		4 32 0.00046759293812019591 33 0.03288053843907645 34 0.61496233940124512 
		35 0.35168952922155822
		1 34 1
		4 30 0.00024187839272168512 33 0.017745446605971587 34 0.76199084520339966 
		35 0.22002182979790708
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 29 1
		4 28 0.014023815823367144 29 0.70323455333709717 30 0.28190726684590334 
		35 0.00083436399363236559
		4 28 0.014637316063173266 29 0.69537448883056641 30 0.28902790628810587 
		35 0.00096028881815446801
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		4 28 0.0064606762052891991 29 0.83660590648651123 30 0.15660397512233457 
		35 0.00032944218586499326
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		4 28 1.1181101533007076e-05 29 0.97488301992416382 30 0.025105071933846 
		35 7.2704045717306598e-07
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		4 28 2.5107050166195657e-07 29 0.81186312437057495 30 0.18813661170806983 
		35 1.2850853551558672e-08
		1 29 1
		4 28 6.3682738840032613e-06 29 0.72617673873901367 30 0.27381653544018858 
		35 3.5754691374172557e-07
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		4 28 8.4548414329529484e-05 29 0.9331890344619751 30 0.066723478268121597 
		35 2.9388555737737066e-06
		1 29 1
		4 28 9.5344144586319833e-05 29 0.79821103811264038 30 0.2016901445299531 
		35 3.4732128202158227e-06
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1;
	setAttr ".wl[470:694].w"
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		4 13 0.00013335138276861813 17 0.0015189427348207411 18 0.85460352897644043 
		19 0.14374417690597022
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		4 16 1.7045622518620436e-07 17 2.6143723675074813e-06 18 0.96026325225830078 
		19 0.039733962913106526
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		4 16 4.3562030631563543e-06 17 6.4567390550998978e-05 18 0.93138027191162109 
		19 0.06855080449476475
		1 18 1
		4 16 1.3599014239500064e-06 17 2.1232107499598866e-05 18 0.92682892084121704 
		19 0.073148487149859415
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		4 16 0.00058934031443847173 17 0.013588944299814623 18 0.60102138669541361 
		19 0.38480032869033332
		4 16 0.00016710518902812881 17 0.0036663909365581811 18 0.87432610988616943 
		19 0.12184039398824426
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		4 16 0.00031010783306624577 17 0.0070009792846711981 18 0.84064728021621704 
		19 0.15204163266604551
		1 18 1
		4 16 0.00018645717697724008 17 0.0036270811429188095 18 0.85317212343215942 
		19 0.14301433824794452
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		4 16 6.0673402183512371e-05 17 0.001029983839182687 18 0.94795221090316772 
		19 0.050957131855466076
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		7 0 0.0088623894313593337 8 0.17282501561694202 14 0.11816686391830444 
		20 0.06833555536685948 23 0.042440918141485533 24 0.52302928309899754 
		25 0.066339974426051662
		9 0 0.35696470966991378 1 0.043824701175005108 2 0.046695838982661574 
		3 0.086707072249150557 9 0.00085674601878853781 14 0.0067695151200907015 
		15 0.045708579129227954 20 0.27623063325881958 25 0.13624220439634224
		10 0 0.019239183447778873 8 0.0011131421271715501 9 0.016297639350531076 
		10 0.0026598062602028695 15 0.10217543716785443 16 0.0022261142117444162 
		20 0.23827989399433136 23 0.00027526984990025935 24 0.0012830603397081509 
		25 0.61645045325077708
		3 22 0.35155492524926896 23 0.45444458723068237 24 0.19400048752004864
		4 8 0.078583516180515289 23 0.26168640902502882 24 0.6241239965457438 
		25 0.035606078248712134
		5 20 0.11337926238775253 22 0.16585197248456932 23 0.44358503525672172 
		24 0.14932693835704186 25 0.12785679151391466
		3 20 0.026591867208480835 22 0.54943441445857655 23 0.42397371833294267
		3 21 0.18587189912796021 36 0.29396561316872788 51 0.52016248770331197
		3 21 0.26887780427932739 22 0.055031109342459243 51 0.67609108637821336
		3 21 0.4224439263343811 22 0.26116207186527185 51 0.31639400180034705
		5 21 0.35257943962183663 22 0.14803950488567352 26 0.0095436499583282357 
		31 0.0162282226314109 51 0.47360918290275072
		5 21 0.12201195321284306 26 0.042473990470170975 31 0.089907168772703647 
		36 0.022001795313734543 51 0.72360509223054781
		5 21 0.050863344465309906 22 0.81864621942843196 23 0.10058670490980148 
		24 0.016392107489148672 51 0.013511623707308009
		2 21 0.27849912643432617 22 0.72150087356567383
		3 21 0.29229337885380113 22 0.6890480595141617 23 0.018658561632037163
		3 21 0.1151730606873671 22 0.7699694295803865 23 0.1148575097322464
		9 0 0.22558462104869817 1 0.15323985839507537 2 0.18125898627566719 
		3 0.1890823721682536 4 0.0093913844483720851 14 0.0055169308924147859 
		15 0.010865773853650876 20 0.18962949514389038 25 0.035430577773977665
		9 0 0.31458494547057569 1 0.090255375959230041 2 0.10472552183874415 
		3 0.14028750540773971 4 0.00088888152914718224 14 0.0075288377333056341 
		15 0.016798225696166319 20 0.2509768009185791 25 0.073953905446512147
		9 0 0.24454989652899622 1 0.024857908470371125 2 0.07192563397664424 
		8 0.17663086950778961 14 0.15657259283289054 15 0.0023895418081145182 
		20 0.16083685409078161 24 0.00038913931260585108 25 0.16184756347180618
		9 0 0.37006784225844996 1 0.15865337229407755 2 0.20551365011890496 
		3 0.096682679628519577 4 0.0082353456732017424 8 0.054068274796009064 
		14 0.037199985675449729 20 0.064698970383337745 25 0.0048798791720496334
		3 2 0.18416954576969147 3 0.13845524596335082 4 0.67737520826695774
		3 2 0.026794163510203362 3 0.047932942652377922 4 0.92527289383741873
		3 21 0.16176728824757919 36 0.754566490650177 37 0.08366622110224381
		1 4 1
		2 2 0.00024789181770756841 4 0.99975210818229243
		3 2 0.014828642830252647 3 0.0028971674240630303 4 0.98227418974568437
		1 4 1
		1 4 1
		1 4 1
		2 38 0.50479999184608459 39 0.49520000815391541
		5 36 0.00036504275591068755 37 0.25442057812491436 38 0.7448723316192627 
		39 2.7166131484737595e-05 51 0.00031488136842749677
		3 21 0.11860940605401993 37 0.21823232778816015 38 0.66315826615781992
		3 21 0.032480001449584961 38 0.48840408737917324 39 0.4791159111712418
		4 41 0.49085341363938478 42 0.49993455410003662 43 0.0085621419462356945 
		44 0.00064989031434293262
		4 41 0.024127563272091024 42 0.48056952669617997 43 0.47881575112977737 
		44 0.016487158901951657
		4 41 0.029622825454309543 42 0.47570534022751099 43 0.47419717509210979 
		44 0.020474659226069683
		4 41 0.48888099202234764 42 0.49967080354690552 43 0.010603524199732489 
		44 0.00084468023101438091
		4 43 0.4921599831007063 44 0.4921600357218045 45 0.014498557497324779 
		46 0.0011814236801644105
		4 44 0.4917185069074641 45 0.49180587865217784 46 0.015436077318326512 
		47 0.0010395371220315119
		4 44 0.48857615677129568 45 0.48864707454085038 46 0.021260440272697721 
		47 0.0015163284151562307
		4 43 0.48759554279637146 44 0.487595581948365 45 0.022799405068304256 
		46 0.002009470186959302
		4 39 0.48561345042466053 40 0.48682485032699702 41 0.025435302550106589 
		42 0.0021263966982359209
		4 39 0.023906901872342047 40 0.47839477981086409 41 0.4776302141289499 
		42 0.020068104187843969
		4 39 0.032200410852282507 40 0.47057873632646668 41 0.46996746686379259 
		42 0.027253385957458284
		4 39 0.4808070533911552 40 0.48178298349399534 41 0.034326197260933902 
		42 0.0030837658539156062
		4 47 0.0024249549987308563 48 0.058579312500968039 49 0.49275049561927514 
		50 0.44624523688102602
		4 47 0.018554276308095887 48 0.43439129700899132 49 0.45856620171607515 
		50 0.088488224966837725
		4 47 0.0041144322445984972 48 0.082566861621558421 49 0.4733700703284805 
		50 0.43994863580536253
		4 47 0.023056606175269459 48 0.42728917427245716 49 0.44764458155574743 
		50 0.10200963799652588
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		3 2 0.07930571585893631 3 0.038020876259696183 4 0.8826734078813675
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		4 47 1.0367669235301822e-05 48 0.00024620328081429642 49 0.4998717145249752 
		50 0.4998717145249752
		6 21 0.082992054771382967 36 0.41480162739753723 37 0.3491175502432704 
		38 0.088343947174383874 39 5.6837455420184594e-05 51 0.064687982958005416
		3 21 0.33632549643516541 36 0.60473602162671003 37 0.058938481938124523
		4 44 0.022877218959961042 45 0.48426650723332976 46 0.47967768179062037 
		47 0.013178592016088824
		4 44 0.017104969103243432 45 0.48940777466175162 46 0.48381561558593161 
		47 0.0096716406490734014
		4 46 0.48429049216460734 47 0.48916496349146082 48 0.023918401966468581 
		49 0.002626142377463247
		4 46 0.48696472046939115 47 0.49279188087794584 48 0.018325591811431761 
		49 0.0019178068412311854
		4 47 0.48046307141650352 48 0.48061329109343642 49 0.033281181235352321 
		50 0.0056424562547077632
		4 47 0.48465282069251542 48 0.48483118516330481 49 0.026270500086144323 
		50 0.0042454940580354018
		5 21 0.17418310052932645 26 0.10101344436407089 31 0.11464055611294909 
		36 0.09350199771852305 51 0.51666090127513054
		9 8 0.011868288765886791 9 0.011769879004480437 10 0.011268721712123959 
		15 0.056447158557779209 16 0.0039869023656377437 20 0.21105293929576874 
		23 0.073572441885713769 24 0.074789854806914705 25 0.54524381360569463
		9 0 0.28203847988757402 1 0.01481998950922001 2 0.016205265718749005 
		3 0.048344213232797154 9 0.014537632279269871 14 0.0025215090155211411 
		15 0.089547782274533971 20 0.28586602210998535 25 0.24611910597234943
		4 22 0.11104961969605595 23 0.40639914878874672 24 0.46188688278198242 
		25 0.020664348733214901
		5 21 0.3522449580926369 22 0.53075850009918213 23 0.041001394538191245 
		24 0.02666938887817023 51 0.049325758391819498
		5 21 0.28741472662942441 26 0.028212945908308029 31 0.0061395100063488788 
		36 0.24084498546809857 51 0.43738783198782016
		9 0 0.12072466943365846 1 0.0036513144628646569 2 0.040674449123322742 
		8 0.18190561234951019 9 0.0057511014554507333 14 0.20867393900881312 
		20 0.10731391645140358 24 0.23879435284614367 25 0.092510644868832842
		8 0 0.40616325070553533 1 0.11301609926585073 2 0.13898144881653893 
		7 0.012137385528211087 8 0.10079826414585114 14 0.080130595286589862 
		20 0.11292876647566551 25 0.035844189775757401
		4 21 0.339739590883255 22 0.17689232786948089 23 4.873329020632041e-06 
		51 0.48336320791824344
		4 21 0.40468793618830379 22 0.3589077889919281 31 0.034248182826219935 
		51 0.20215609199354823
		3 21 0.44833501021263872 22 0.38014352321624756 51 0.17152146657111372
		4 21 0.046775457849411888 26 0.048678176085684727 31 0.056561090052127838 
		51 0.84798527601277551
		6 9 0.0028146077952770957 10 0.0026107922432743328 20 0.16409094631671906 
		23 0.29611354936552275 24 0.26204109008952736 25 0.27232901418967942
		2 22 0.57900542020797729 23 0.42099457979202271
		1 0 0.348157116842706;
	setAttr ".wl[694:849].w"
		6 1 0.06729638670174376 2 0.095912904958838238 8 0.14304117858409882 
		14 0.083965979937180996 20 0.16275166812952421 25 0.098874764845907986
		10 0 0.18352000933975468 1 0.00033432899202817966 2 0.0034537044010225942 
		3 0.026727471222303425 9 0.017050385041760905 14 4.8759900056519819e-05 
		15 0.11516013747335972 16 8.2152695557716975e-06 20 0.27714323997497559 
		25 0.37655374838518263
		7 0 0.080627194944953198 3 0.0004849617201930255 9 0.0062213347972604194 
		10 0.00015088788988914796 15 0.12317638912576391 20 0.25988319516181946 
		25 0.52945603636012084
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		5 8 0.49910211405695803 20 0.033199319610051292 23 0.026066816992535952 
		24 0.40881481766700745 25 0.032816931673447292
		5 8 0.42191911533832321 20 0.077091908176925475 23 0.036375859666928551 
		24 0.43578863143920898 25 0.028824485378613828
		4 8 0.18829393703021177 9 0.057152070105075836 23 0.25913073038457723 
		24 0.49542326248013507
		1 12 1
		1 12 1
		2 11 0.06938750296831131 12 0.93061249703168869
		2 11 0.00065364537294954062 12 0.99934635462705046
		2 11 0.13844586908817291 12 0.86155413091182709
		2 11 0.019833967089653015 12 0.98016603291034698
		2 11 0.15608513355255127 12 0.84391486644744873
		2 11 0.11868970841169357 12 0.88131029158830643
		2 11 0.0021819616667926311 12 0.99781803833320737
		2 11 0.016956176608800888 12 0.98304382339119911
		2 11 0.00018666668620426208 12 0.99981333331379574
		1 12 1
		1 12 1
		1 12 1
		9 0 0.35162919642274804 1 0.044740446044336961 2 0.047743529870345053 
		3 0.087806248692252675 9 0.079857300217992463 14 0.00021899901245398784 
		15 0.0091443067612190041 20 0.25986891984939575 25 0.11899105312925602
		9 0 0.0098419483815308968 8 0.00095338456873362025 9 0.048098131335645791 
		10 0.0060002088546179918 15 0.037464577510960211 20 0.20786602795124054 
		23 0.0023129190466910899 24 0.082373349200670007 25 0.60508945314990981
		7 8 0.03275791654732798 9 0.17458118884011645 10 0.036918164145093364 
		20 0.18905903398990631 23 0.1234063023045459 24 0.12529705722634962 25 
		0.31798033694666034
		8 8 0.0041878006904771253 9 0.23257909138300503 10 0.0068790744116238719 
		15 0.00076050863243165416 20 0.25180849432945251 23 0.001302100716573726 
		24 0.050173663135947032 25 0.45230926670048899
		9 0 0.1894972712958912 1 0.058864176874852972 2 0.094806104898452759 
		3 0.10882919546898186 4 4.4233819370373333e-07 8 0.083678795657501526 
		9 0.22436805153232295 20 0.19710018091018452 25 0.042855781023618519
		6 8 0.191070556640625 20 0.029880167548444057 22 0.026515055689791178 
		23 0.25853410402214644 24 0.48254863491645017 25 0.011451481182543135
		6 8 0.15800321102142334 20 0.023472568412372222 22 0.019921302397324054 
		23 0.24281927228697953 24 0.53328434649861534 25 0.022499299383285567
		3 22 0.29078151063328628 23 0.55008363723754883 24 0.15913485212916489
		5 20 0.039042324787110817 22 0.21268201651866731 23 0.5625188946723938 
		24 0.14136064872710413 25 0.044396115294723926
		2 22 0.64559197425842285 23 0.35440802574157715
		5 20 0.039553331609789986 22 0.22962931990920107 23 0.56534796953201294 
		24 0.1206729366720492 25 0.044796442276946812
		6 10 0.00026539098269538866 20 0.082826457917690277 22 0.28250505517615382 
		23 0.45091771207395787 24 0.11414853219780471 25 0.069336851651697895
		4 20 0.0013800876913592219 22 0.61471878131697522 23 0.38386605208809993 
		25 3.5078903565687486e-05
		2 22 0.64021944999694824 23 0.35978055000305176
		6 10 0.0010950945096550664 20 0.11074221134185791 22 0.19705797180284823 
		23 0.43016982710618462 24 0.13777963645193461 25 0.12315525878751964
		3 20 0.020906075835227966 22 0.56698679701806265 23 0.41210712714670944
		3 21 0.39802416101254545 22 0.2942136824131012 51 0.30776215657435335
		3 21 0.38120893528140176 22 0.29873993992805481 51 0.32005112479054343
		3 21 0.37848793372120981 22 0.057732407003641129 51 0.56377965927514906
		3 21 0.31127814404950188 22 0.069382831454277039 51 0.61933902449622102
		3 21 0.28247454913576053 36 0.19448401033878326 51 0.5230414405254562
		3 21 0.21141132902414922 36 0.26851078867912292 51 0.5200778822967278
		1 52 1
		1 52 1
		4 21 0.27558309811312864 31 0.12589427828788757 36 0.18213570987367714 
		51 0.41638691372530662
		3 21 0.3668958835309411 31 0.14217326045036316 51 0.49093085601869574
		4 21 0.36260645263990277 22 0.23156411945819855 31 0.06122582711270616 
		51 0.3446036007891925
		4 21 0.071712488113539183 31 0.33052483201026917 36 0.00081349396961059015 
		51 0.59694918590658108
		4 21 0.33825304860815669 22 0.1351390928030014 31 0.10206884516011323 
		51 0.42453901342872863
		5 21 0.086966538043977276 22 0.79488091482929979 23 0.060277044773101807 
		24 0.031600067899624697 51 0.026275434453996546
		2 21 0.29299688339233398 22 0.70700311660766602
		4 21 0.28617569804191589 22 0.65835547074879819 31 0.011268775175844674 
		51 0.044200056033441196
		5 21 0.065153803321552031 22 0.77073244716598088 23 0.1119474396109581 
		24 0.028269681859992173 51 0.023896628041516793
		5 21 0.044362735642174161 22 0.77713999468529871 23 0.13094545900821686 
		24 0.025796095204208714 51 0.021755715460101532
		4 21 0.30824523432523826 22 0.61923762904754054 31 0.020305925980210304 
		51 0.05221121064701098
		4 21 0.26009262452310411 22 0.68189389284903335 31 0.023477775976061821 
		51 0.034535706651800731
		2 22 0.85882282257080078 23 0.14117717742919922
		3 21 0.049054320391924033 22 0.8024107260138682 23 0.14853495359420776
		3 21 0.24436121011546216 22 0.75220301867069339 23 0.0034357712138444185
		3 21 0.24464288631223896 22 0.73960421329594395 23 0.015752900391817093
		3 21 0.085587532831073024 22 0.77567438630974272 23 0.13873808085918427
		3 21 0.10397570890144878 22 0.74156226652903978 23 0.15446202456951141
		3 21 0.27474823274921345 22 0.69881779274631572 23 0.026433974504470825
		10 0 0.24395551424590095 1 0.14487373614640928 2 0.17931463149767432 
		3 0.1946416041365141 4 0.0091013138122763727 9 0.040551402007806318 
		14 0.00085525681983357916 15 0.00039062012617213356 20 0.18611086905002594 
		25 0.00020505215738710736
		10 0 0.31845352853256031 1 0.093612604825161469 2 0.10676714212893186 
		3 0.14598869871575301 8 0.00074878052867577156 9 0.068002635020744606 
		14 0.0022571980333903241 15 0.00077661128010073576 20 0.2397904098033905 
		25 0.023602391131291423
		9 0 0.25102470036085528 1 0.076844974748146999 2 0.092326350786313627 
		3 0.12985399433697736 8 0.026042655978029804 9 0.15914783381609549 
		15 3.2872292315387099e-05 20 0.22635070979595184 25 0.038375907885314198
		9 0 0.2246850568623035 1 0.10504903564980569 2 0.17130374908447266 
		3 0.18142208923342543 4 0.0057418258054796048 8 0.019159877197093177 
		9 0.1054017534459001 20 0.18354724119337951 25 0.0036893715281404111
		9 0 0.19966424958268184 1 0.068078424819110819 2 0.15971468583768392 
		3 0.13191846991919751 4 0.00097049598573751238 8 0.10180119425058365 
		9 0.1414400255980075 20 0.18321903303252018 25 0.013193420974477109
		9 0 0.21903432073455331 1 0.082820246603834691 2 0.19105235479422628 
		3 0.10389256812135467 4 0.00024310463199319246 8 0.15087331831455231 
		9 0.0083370150652377056 20 0.21705356420685273 25 0.026693507527395206
		8 0 0.25535605941547229 1 0.10977217410587126 2 0.2062485776936121 
		3 0.071731329262660862 8 0.16408915817737579 9 0.037446401342883594 
		20 0.13700118790171281 25 0.018355112100411349
		8 0 0.32165785449294371 1 0.11427107961356948 2 0.21595443480304891 
		3 0.054820799206296275 7 0.019863447017265279 8 0.15018178522586823 
		20 0.11365706583602453 25 0.009593533804983569
		9 0 0.34099230040537365 1 0.14007666603092769 2 0.20650499629207894 
		3 0.065997161941819094 7 0.015125301385375984 8 0.1020495817065239 
		14 0.010613024654702501 20 0.11109357127451686 25 0.0075473963086814247
		3 2 0.17738885772526766 3 0.13562729954719543 4 0.68698384272753688
		3 2 0.17162108421325684 3 0.12484909323456016 4 0.70352982255218299
		3 2 0.13867451250553131 3 0.10216283720058339 4 0.7591626502938853
		3 2 0.10052108764648438 3 0.067433846481037577 4 0.83204506587247806
		3 2 0.013172256760299206 3 0.0048076945657393724 4 0.98202004867396142
		1 4 1
		3 2 0.015078805387020111 3 0.054590834385929293 4 0.93033036022705062
		1 52 1
		3 21 0.2897678017616272 36 0.53952653989498423 37 0.17070565834338855
		4 21 0.29396351088591122 31 0.08723941445350647 36 0.60525750183711557 
		37 0.01353957282346672
		1 52 1
		3 21 0.24350717959454146 36 0.71892380714416504 37 0.037569013261293485
		3 21 0.18025278901644132 36 0.75822603702545166 37 0.061521173958107037
		9 0 0.070954839233344558 1 0.0084217104477139551 2 0.063559172952654813 
		3 0.011515132818906646 8 0.054903082795277669 9 0.50804751448337271 
		10 8.1182903850117297e-10 20 0.095608599483966827 25 0.18698994697293375
		5 0 0.013064233586192131 3 0.00076637490343941692 9 0.73219137676080459 
		20 0.078148315894826806 25 0.17582969885473704
		2 9 0.93995487689971924 25 0.060045123100280762
		1 9 1
		6 1 0.00048139909773366082 8 0.34137505617742564 9 0.65549566128449999 
		10 0.00013331616326181262 20 0.002121292047352924 25 0.00039327522972598672
		5 9 0.3572162816327466 20 0.036199869583263225 23 0.20816898277173543 
		24 0.18495208024978638 25 0.21346278576246838
		5 9 0.43133913350672959 10 0.00012121954751965154 20 0.15174068510532379 
		24 0.089868551138408262 25 0.32693041070201867
		3 9 0.75094127352835516 24 0.028128098696470261 25 0.22093062777517461
		3 9 0.66840314509796761 20 0.084728218615055084 25 0.24686863628697736
		6 8 0.30772016520044598 9 0.53242830166221888 10 0.022738441585582646 
		20 0.020006304465826644 24 0.095727138221263885 25 0.021379648864661926
		4 8 0.10861415933698974 9 0.67973384354270805 23 0.069832266719263139 
		24 0.14181973040103912
		3 8 0.057198682121420784 9 0.92785629139146719 24 0.014945026487112045
		6 8 0.023316695222834426 9 0.89104445520787645 10 0.028115803469881545 
		20 0.010956596480222508 24 0.034717220813035965 25 0.011849228806149132
		3 8 0.34572507511926032 9 0.6362578272819519 10 0.018017097598787751
		5 8 0.051112372428178787 9 0.94305985530806025 10 0.0035214446750761615 
		20 0.0011352354981210484 25 0.0011710920905637729
		2 11 0.25725013017654419 12 0.74274986982345581
		2 11 0.33708003163337708 12 0.66291996836662292
		2 11 0.62250590324401855 12 0.37749409675598145
		2 11 0.56900191307067871 12 0.43099808692932129
		2 10 0.57120001316070557 11 0.42879998683929443
		1 11 1
		1 11 1
		2 10 0.57120001316070557 11 0.42879998683929443
		1 11 1
		2 10 0.57120001316070557 11 0.42879998683929443
		2 11 0.37171241641044617 12 0.62828758358955383
		2 11 0.65751171112060547 12 0.34248828887939453
		2 11 0.35347077250480652 12 0.64652922749519348
		2 11 0.64512133598327637 12 0.35487866401672363
		1 11 1
		2 10 0.57120001316070557 11 0.42879998683929443
		4 10 0.059826393148631182 11 0.93649489295793398 12 0.0028784474836362007 
		13 0.00080026640979866798
		2 10 0.57120001316070557 11 0.42879998683929443
		2 11 0.27532243728637695 12 0.72467756271362305
		2 11 0.5790066123008728 12 0.4209933876991272
		2 11 0.14352834224700928 12 0.85647165775299072
		2 11 0.40822935104370117 12 0.59177064895629883
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		2 31 0.62015613913536072 32 0.37984386086463928
		2 31 0.57240548729896545 32 0.42759451270103455
		1 53 1
		1 53 1
		2 31 0.64250585436820984 32 0.35749414563179016
		1 53 1
		2 31 0.72535461187362671 32 0.27464538812637329
		2 31 0.66067919135093689 32 0.33932080864906311
		1 53 1
		1 53 1;
	setAttr ".wl[850:1135].w"
		2 31 0.69418066740036011 32 0.30581933259963989
		2 31 0.69648706912994385 32 0.30351293087005615
		1 53 1
		1 53 1
		7 21 0.18671715651432536 22 0.084948189556598663 25 0.0021047897472318429 
		31 0.42869061508599116 32 0.0049825430339670226 33 0.0024992347400155349 
		51 0.29005747132187037
		1 53 1
		2 31 0.71454423666000366 32 0.28545576333999634
		4 31 0.52462947368621815 32 0.46925705385848987 33 0.0038734392058049111 
		51 0.0022400332494869456
		2 31 0.49085745215415955 32 0.50914254784584045
		1 55 1
		1 55 1
		2 32 0.7665954977273941 33 0.2334045022726059
		2 32 0.7737012654542923 33 0.2262987345457077
		2 32 0.7665954977273941 33 0.2334045022726059
		1 55 1
		2 31 0.51440456509590149 32 0.48559543490409851
		2 31 0.44464948773384094 32 0.55535051226615906
		1 55 1
		2 32 0.76495569944381714 33 0.23504430055618286
		2 32 0.76468241214752197 33 0.23531758785247803
		1 55 1
		2 31 0.35396325588226318 32 0.64603674411773682
		2 31 0.34456062316894531 32 0.65543937683105469
		1 55 1
		2 32 0.76468241214752197 33 0.23531758785247803
		2 32 0.76468241214752197 33 0.23531758785247803
		1 55 1
		2 31 0.36389392614364624 32 0.63610607385635376
		2 31 0.4733312726020813 32 0.5266687273979187
		1 55 1
		2 32 0.76495569944381714 33 0.23504430055618286
		1 4 1
		2 3 6.9801310019101948e-05 4 0.9999301986899809
		3 2 0.0018137377919629216 3 0.007208881707124754 4 0.99097738050091233
		2 3 0.0078994492068886757 4 0.99210055079311132
		2 3 0.00041218963451683521 4 0.99958781036548316
		1 4 1
		1 4 1
		2 3 0.00015840870037209243 4 0.99984159129962791
		2 3 0.0050774053670465946 4 0.99492259463295341
		2 3 0.0010728304041549563 4 0.99892716959584504
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		4 36 0.0093732644585264712 37 0.41677013379094108 38 0.57250076532363892 
		39 0.0013558364268934928
		2 38 0.50479999184608459 39 0.49520000815391541
		5 21 0.028820183128118515 36 0.00066761044801354284 37 0.26988373870188737 
		38 0.70049018431790622 39 0.00013828340407427513
		2 38 0.50479999184608459 39 0.49520000815391541
		3 21 0.04946666955947876 37 0.23535207065640759 38 0.71518125978411362
		3 21 0.025760002434253693 38 0.49179634282731821 39 0.4824436547384281
		4 41 0.023612447875701392 42 0.48102573406987886 43 0.47924473557159097 
		44 0.016117082482828692
		4 41 0.49116409809307282 42 0.49997490644454956 43 0.0082405032365904483 
		44 0.00062049222578716234
		4 41 0.020600358552750782 42 0.48369652220004139 43 0.48173686560321483 
		44 0.013966253643992871
		4 41 0.49225689397116268 42 0.50011527538299561 43 0.0071080153186911989 
		44 0.00051981532715050436
		4 41 0.027193002847740705 42 0.47785602509819314 43 0.4762482560280164 
		44 0.01870271602604975
		4 41 0.48988838356415215 42 0.49980765581130981 43 0.0095605707969910123 
		44 0.00074338982754700716
		4 44 0.49159849632193758 45 0.49168507412733986 46 0.015659384374135311 
		47 0.0010570451765871854
		4 43 0.49184941583934877 44 0.49184946720009698 45 0.015066238559709925 
		46 0.0012348784008443154
		4 44 0.4924303759058638 45 0.49252284035323918 46 0.014109931206899519 
		47 0.00093685253399758059
		4 43 0.49229280311252055 44 0.49229285629554287 45 0.014255644850926407 
		46 0.0011586957410100935
		4 44 0.48956004580712931 45 0.48963530747120948 46 0.019441673198651168 
		47 0.001362973523010123
		4 43 0.48888806683926461 44 0.4888881089537393 45 0.020457912763953753 
		46 0.0017659114430423426
		4 39 0.023114798135031898 40 0.47914056759341639 41 0.47835752496064493 
		42 0.019387109310906828
		4 39 0.4862656128524705 40 0.48751918831615598 41 0.024212234021296807 
		42 0.0020029648100767282
		4 39 0.02069408995946348 40 0.48142084795906231 41 0.48057428726109108 
		42 0.0173107748203832
		4 39 0.48769447025248924 40 0.48905291866922118 41 0.021514810216987871 
		42 0.0017378008613017338
		4 39 0.028513360007573842 40 0.47405504053798425 41 0.47338386716243314 
		42 0.024047732292008871
		4 39 0.48317205096544724 40 0.48425042287921644 41 0.029975501867469074 
		42 0.0026020242878671959
		4 47 0.0046458135077070434 48 0.097676754085333661 49 0.47859177945156489 
		50 0.41908565295539435
		4 47 0.018743110509392435 48 0.43408968921735125 49 0.45807675469292664 
		50 0.089090445580329705
		4 47 0.0034464993980285702 48 0.072837594783462314 49 0.47849269518218851 
		50 0.44522321063632059
		4 47 0.01670550002607734 48 0.43735146500570798 49 0.46353264939266942 
		50 0.082410385575545239
		4 47 0.0062019705841377202 48 0.11435293913430225 49 0.46424049488938163 
		50 0.41520459539217841
		4 47 0.021686806683649258 48 0.42942611314645907 49 0.45081490303079425 
		50 0.098072177139097466
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		3 2 0.055663716048002243 3 0.048573833438978697 4 0.89576245051301906
		3 2 0.030018515166958318 3 0.044937431812286363 4 0.92504405302075532
		2 3 0.034722335636615753 4 0.96527766436338425
		3 2 0.0034142835065722466 3 0.018622187961247854 4 0.97796352853217994
		1 4 1
		2 3 0.00013748269702773541 4 0.99986251730297226
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		2 9 0.19127379357814789 10 0.80872620642185211
		3 9 0.19395896792411804 10 0.78931647101667568 51 0.016724561059206222
		2 9 0.14280000329017639 10 0.85719999670982361
		2 9 0.14280000329017639 10 0.85719999670982361
		1 11 1
		2 10 0.57120001316070557 11 0.42879998683929443
		2 9 0.14280000329017639 10 0.85719999670982361
		2 9 0.14793086051940918 10 0.85206913948059082
		2 10 0.57120001316070557 11 0.42879998683929443
		1 11 1
		1 11 1
		2 10 0.57120001316070557 11 0.42879998683929443
		2 9 0.18653512001037598 10 0.81346487998962402
		2 9 0.18160170316696167 10 0.81839829683303833
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		3 33 0.15399576297274109 34 0.045198966355414427 59 0.80080527067184448
		2 33 0.28743541240692139 34 0.71256458759307861
		2 33 0.43667367100715637 34 0.56332632899284363
		1 59 1
		1 59 1
		2 33 0.52325785160064697 34 0.47674214839935303
		2 33 0.54611039161682129 34 0.45388960838317871
		1 59 1
		1 59 1
		2 33 0.54398649930953979 34 0.45601350069046021
		2 33 0.42855557799339294 34 0.57144442200660706
		1 59 1
		1 59 1
		2 33 0.25875088572502136 34 0.74124911427497864
		2 33 0.34151691198348999 34 0.65848308801651001
		1 59 1
		7 21 0.21435293377298709 22 0.10341308544852877 25 0.0067083571735454591 
		31 0.46779659390449524 32 0.014943643161695375 33 0.0075552491508397825 
		51 0.18523013738790831
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		2 11 0.21211573481559753 12 0.78788426518440247
		2 11 0.22707736492156982 12 0.77292263507843018
		2 11 0.50454974174499512 12 0.49545025825500488
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		2 11 0.20500107109546661 12 0.79499892890453339
		2 11 0.40784969925880432 12 0.59215030074119568
		1 12 1
		1 12 1
		6 21 0.12841099539929754 36 0.42584881186485291 37 0.33623127423570015 
		38 0.021912068384647002 39 0.0021350226033250313 51 0.085461827512177346
		3 21 0.18677626226790625 36 0.56813758611679077 37 0.24508615161530298
		4 44 0.021088935862140029 45 0.48584293996732919 46 0.48098679591817184 
		47 0.012081328252358924
		4 44 0.015554627278903674 45 0.4908250657968718 46 0.48487312073795913 
		47 0.0087471861862653856
		4 44 0.017331704123865085 45 0.48920262504598461 46 0.48365832864254488 
		47 0.0098073421876055094
		4 46 0.48513824811381884 47 0.49026863868714543 48 0.022191258073470849 
		49 0.0024018551255649101
		4 46 0.48777476155580313 47 0.4940077868447541 48 0.016517446083274236 
		49 0.0017000055161685223
		4 46 0.48686200156005272 47 0.4926429560551065 48 0.01854983862354782 
		49 0.0019452037612929175
		4 47 0.48174837999180936 48 0.48190619532149498 49 0.031140502272618178 
		50 0.005204922414077399
		4 47 0.48617642091113339 48 0.48636807414060357 49 0.023696841578473082 
		50 0.0037586633697898283
		4 47 0.48448135444183493 48 0.48465834750513043 49 0.026559301342146392 
		50 0.0043009967108882463
		1 12 1
		2 11 0.041832476854324341 12 0.95816752314567566
		2 11 0.025732453912496567 12 0.97426754608750343
		1 12 1
		2 11 0.0048620598390698433 12 0.99513794016093016
		1 12 1
		1 12 1
		1 12 1
		2 11 0.17170853912830353 12 0.82829146087169647
		1 12 1
		1 12 1
		1 12 1
		1 12 1
		2 11 0.011760000139474869 12 0.98823999986052513
		1 66 1
		1 67 1
		1 67 1
		1 66 1
		1 66 1
		1 67 1
		1 66 1
		1 67 1
		1 66 1
		1 67 1
		1 66 1
		1 67 1
		1 66 1
		1 67 1
		1 66 1
		1 67 1
		1 11 1
		4 10 0.019757393373862505 11 0.93494494964863506 12 0.042164033905537288 
		13 0.0031336230719652357
		1 11 1
		1 11 1
		1 11 1
		1 11 1
		1 11 1
		1 11 1
		1 34 1
		1 34 1
		2 33 0.020211219787597656 34 0.97978878021240234
		2 33 0.004254510160535574 34 0.99574548983946443
		2 33 0.091931536793708801 34 0.9080684632062912
		2 33 0.038066670298576355 34 0.96193332970142365
		2 33 0.12532639503479004 34 0.87467360496520996
		2 33 0.076311714947223663 34 0.92368828505277634
		2 33 0.030005492269992828 34 0.96999450773000717
		2 33 0.051414169371128082 34 0.94858583062887192
		1 34 1
		1 34 1
		1 34 1
		2 33 0.011643921956419945 34 0.98835607804358006
		2 33 0.15691797435283661 34 0.84308202564716339
		2 33 0.26177379488945007 34 0.73822620511054993
		1 33 0.29867845773696899;
	setAttr ".wl[1135:1340].w"
		1 34 0.70132154226303101
		2 33 0.23987950384616852 34 0.76012049615383148
		2 33 0.051007546484470367 34 0.94899245351552963
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		2 33 0.083179228007793427 34 0.91682077199220657
		2 33 0.13545864820480347 34 0.86454135179519653
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		2 33 0.14817199110984802 34 0.85182800889015198
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		1 34 1
		2 33 0.041201569139957428 34 0.95879843086004257
		1 34 1
		1 34 1
		2 33 0.03426000103354454 34 0.96573999896645546
		2 33 0.086754105985164642 34 0.91324589401483536
		1 34 1
		1 34 1
		1 34 1
		2 33 0.00179137266241014 34 0.99820862733758986
		2 33 0.012993108481168747 34 0.98700689151883125
		1 59 1
		1 59 1
		1 59 1
		1 59 1
		1 59 1
		1 59 1
		1 59 1
		1 59 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		4 8 0.00085327280336059124 9 0.5705790394310587 10 0.42817023396492004 
		11 0.0003974538006607014
		5 8 0.0033152589991775712 9 0.59992724453287138 10 0.3944028913974762 
		11 0.001744802230739805 25 0.00060980283973498261
		5 8 0.0058515350209133359 9 0.61202409867341723 10 0.37867501378059387 
		11 0.0034466746173123161 25 2.6779077633138618e-06
		5 8 0.0038199027078101404 9 0.63768862929794246 10 0.35556067056173712 
		11 0.002193105610514137 25 0.0007376918219961226
		6 8 0.00023955555946496263 9 0.45258843514557823 10 0.49781074596854213 
		11 0.00011370730265465739 20 0.007951897569000721 24 0.041295658454759285
		5 8 0.00041924914185752617 9 0.55168720759599243 10 0.44677262054599265 
		11 0.00016669496131111442 20 0.00095422775484621525
		4 8 0.0011909895532588336 9 0.61735093593597412 10 0.38096993677205127 
		11 0.00048813773871572805
		4 8 0.00032119255494090419 9 0.58213231215889405 10 0.41741019487380981 
		11 0.00013630041235519516
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 57 1
		1 57 1
		1 57 1
		1 57 1
		1 57 1
		1 57 1
		1 57 1
		1 57 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 33 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		1 58 1
		9 8 0.015968049860675362 9 0.04659835449438629 10 0.020311763093099774 
		15 0.0095188276343334318 16 0.001549814764835058 20 0.18692207336425781 
		23 0.058040690162092949 24 0.14043888647609379 25 0.52065154015022552
		8 0 0.19427594594735939 1 0.013658451935836797 2 0.020155120392061521 
		3 0.027928570126624967 8 0.0043290377277704064 9 0.28180604478199045 
		20 0.20575550198554993 25 0.25209132710280657
		10 0 0.25355694517159583 1 0.019168192754993697 2 0.023124913064490958 
		3 0.052855371685790332 8 5.8770076858680913e-05 9 0.11023240328296827 
		14 5.2810655010064773e-05 15 0.026025997814708799 20 0.25658127665519714 
		25 0.25834331883838624
		4 8 0.36190685629844666 9 0.29749902435642173 23 0.019184355315005442 
		24 0.32140976403012622
		3 8 0.40829607844352722 9 0.47370995036626434 24 0.11799397119020845
		7 0 0.087603708654882692 2 0.058961981105061449 8 0.4526187726278017 
		9 0.0016491895963767784 20 0.11220789421660035 24 0.19805303737023419 
		25 0.088905416429042816
		8 0 0.20472741582384529 1 0.018926583414201344 2 0.069317195830561548 
		3 0.023165364523953697 8 0.29093575477600098 9 0.11124217343179924 
		20 0.19916456590720089 25 0.082520946292437045
		8 0 0.27922025413647572 1 0.0090538122804851122 2 0.096524794796663357 
		3 0.00088317825443980102 8 0.28709781169891357 9 0.020669309428960371 
		20 0.25578071329155072 25 0.050770126112511353
		7 0 0.31459265062056102 1 0.064071923919215165 2 0.11038851442969427 
		8 0.25737085938453674 9 0.015924350801450875 20 0.19110337394219848 
		25 0.046548326902343416
		2 23 0.53401270508766174 24 0.46598729491233826
		3 22 0.027995501653390466 23 0.46530413627624512 24 0.5067003620703644
		3 22 0.089501255996765672 23 0.40857341885566711 24 0.50192532514756727
		8 0 0.17149559082964511 1 0.0016448807185665707 2 0.013781055808067322 
		7 0.024707550158944592 8 0.46523264693789762 9 0.035976229843786164 
		20 0.16763317525440766 25 0.11952887044868499
		2 8 0.0061109918169677258 9 0.99388900818303227
		1 9 1
		3 9 0.98393030063133524 10 0.0047807996161282063 25 0.011288899752536604
		4 9 0.81395020873539048 10 0.052841377482170181 20 0.015327743254601955 
		25 0.11788067052783738
		4 9 0.72926533790850168 10 0.057736784842287253 20 0.044633511453866959 
		25 0.16836436579534408
		3 9 0.98939360876398019 20 0.0013981359079480171 25 0.0092082553280717384
		3 9 0.94599064601885474 10 0.053979907184839249 25 2.944679630599734e-05
		5 8 0.0095919490883389514 9 0.9348944107889956 10 0.043541572988033295 
		11 0.0061614418953137833 25 0.0058106252393184451
		5 8 0.4322189952945853 9 0.11962801821060133 23 0.036694881845282114 
		24 0.38425365090370178 25 0.027204453745829481
		3 21 0.3304456949276906 22 0.57549190521240234 51 0.094062399859907025
		3 21 0.31360859067800589 22 0.58137285709381104 51 0.10501855222818306
		3 21 0.33438041460534867 22 0.53510177135467529 51 0.13051781403997606
		4 21 0.39323370642624961 22 0.39482990533144052 31 0.11122436821460724 
		51 0.10071202002770262
		6 0 0.094612696932385859 2 0.035819496429456664 8 0.4964249195775769 
		9 0.10437188636369284 20 0.13679540951417898 25 0.13197559118270874
		6 8 0.57401384379568798 9 0.10724775900454479 10 0.033697377514531807 
		20 0.07991138839052167 24 0.11889570249508453 25 0.086233928799629211
		1 52 1
		1 52 1
		1 52 1
		1 52 1
		4 21 0.30017083362865349 22 0.15311963856220245 31 0.21920129405263769 
		51 0.3275082337565064
		4 21 0.37310324760843339 22 0.46528258919715881 31 0.026986655434711616 
		51 0.13462750775969612
		2 21 0.27116572856903076 22 0.72883427143096924
		2 22 0.87836711853742599 23 0.12163288146257401
		3 22 0.31013195188087034 23 0.59528944669920392 24 0.09457860141992569
		3 9 0.062045693192991774 23 0.60363358279654067 24 0.33432072401046753
		5 8 0.19752010634875469 9 0.79113560914993286 10 0.0052809748303240863 
		20 0.0029912766474566601 25 0.0030720330235317018
		3 8 0.23375318602313164 9 0.70746790959845418 24 0.058778904378414154
		8 0 0.020903920754790306 1 0.0021449802015054485 3 0.00015231796216169828 
		8 0.17366509533096952 9 0.7850035915143444 10 1.8162017992998805e-06 
		20 0.001958996271231854 25 0.016169281763197527
		4 8 0.16829925644493707 9 0.83165478706359863 10 2.6042235576650153e-05 
		20 1.9914255887662658e-05
		7 0 0.13355878470406962 1 0.0025626087674622449 2 0.031719808709071852 
		8 0.38246983289718628 20 0.12431379930415762 24 0.22295795555866516 
		25 0.10241721005938723
		9 0 0.22500314899292595 1 0.018743827737792717 2 0.039409539115186666 
		7 0.030566652659317472 8 0.33904993534088135 9 0.037223716969036237 
		14 0.00066668994287248109 20 0.17874527247179847 25 0.13059121677018856
		8 0 0.3330654004772361 1 0.089916033671354395 2 0.129890228743965 
		7 0.013079062274122829 8 0.18756583333015442 14 0.0078242019048148388 
		20 0.19507370713872166 25 0.043585532459630934
		1 52 1
		4 21 0.27710705079640063 22 0.058500429068227271 31 0.34169366955757141 
		51 0.32269885057780068
		4 21 0.38262544137240179 22 0.10374904423952103 31 0.12119865880988569 
		51 0.39242685557819146
		3 21 0.36121094920132046 22 0.17661409080028534 51 0.46217495999839425
		3 21 0.32110499726058306 22 0.18496502935886383 51 0.49392997338055311
		6 21 0.36003773707372949 22 0.3358735689011047 23 0.017094575122507734 
		24 0.01105985856694248 31 0.16021384298801422 51 0.1157204173477013
		4 21 0.38857811761139466 22 0.34546536207199097 31 0.087334191738084987 
		51 0.17862232857852942
		4 21 0.38924621805061188 22 0.36758196353912354 31 0.044038789512491565 
		51 0.19913302889777298
		7 21 0.35603820294355132 22 0.18653124570846558 25 0.0033893217233040757 
		31 0.27457340158920096 32 0.0068997127342249861 33 0.0036191259264626934 
		51 0.16894898937479036
		4 21 0.39264170079414579 22 0.2456982433795929 31 0.14736495116173959 
		51 0.21429510466452176
		4 21 0.39265901313666335 22 0.36125925183296204 31 0.045891885265450807 
		51 0.20018984976492385
		3 21 0.38153095758889805 22 0.41667464375495911 51 0.20179439865614285
		3 21 0.41312419848788928 22 0.40995940566062927 51 0.17691639585148147
		4 21 0.30839825099065887 22 0.12600376114662368 31 0.24151827394962311 
		51 0.32407971391309431
		1 52 1
		1 53 1
		1 53 1
		1 53 1
		1 53 1
		1 53 1
		1 52 1
		4 21 0.02996873057980089 26 0.0041908542699167174 31 0.20367836952209473 
		51 0.76216204562818768
		1 52 1
		4 8 0.21518860602350315 9 0.47373230337778027 23 0.062083786491050633 
		24 0.24899530410766602
		4 8 0.090290088024254131 9 0.16477376222610474 23 0.29640815157284006 
		24 0.44852799817680106
		6 8 0.081115751679187914 9 0.329533200609819 10 0.035647526757899207 
		23 0.19987105815625264 24 0.31812310218811035 25 0.035709360608730832
		9 0 0.023140246048569679 1 0.0053720442561568365 2 0.015746299813131994 
		3 0.00535051388634085 8 0.26177985485209404 9 0.58733075343284524 
		10 2.9286241251845514e-05 20 0.021122371473852923 25 0.080128629995756567
		9 0 0.11642806534093537 1 0.028340764033854698 2 0.060684009867933791 
		3 0.056910285988739449 8 0.13931513984346974 9 0.36439037322998047 
		10 6.1263808657169929e-06 20 0.12051035940146552 25 0.11341487591275527
		3 9 0.093590481946883547 23 0.64650799446302853 24 0.25990152359008789
		5 9 0.046528909561906209 22 0.020659678440187228 23 0.55186810188303193 
		24 0.2410198301076889 25 0.13992348000718566
		6 9 0.037023738042553378 10 0.014107495058282649 20 0.13980859518051147 
		23 0.3419178993587893 24 0.26028908190646743 25 0.20685319045339579
		6 9 0.017115980550097651 10 0.007483462303187049 20 0.16228829324245453 
		23 0.31165980261060727 24 0.22413331514669307 25 0.27731914614696035
		6 10 8.6199346743879471e-07 20 0.017164839431643486 22 0.29945840700704218 
		23 0.54078936477777395 24 0.11207506109748427 25 0.030511465692588578
		3 22 0.31991558348565396 23 0.57380481982798281 24 0.10627959668636322
		2 22 0.62296301126480103 23 0.37703698873519897
		3 22 0.56862653973059851 23 0.42772161960601807 24 0.0036518406633834349
		3 22 0.55454183198782014 23 0.42578378319740295 24 0.01967438481477694
		1 22 0.55593001842498779;
	setAttr ".wl[1340:1495].w"
		1 23 0.44406998157501221
		1 66 1
		1 66 1
		1 66 1
		1 66 1
		1 66 1
		1 66 1
		1 66 1
		1 66 1
		1 65 1
		1 65 1
		1 65 1
		1 65 1
		1 65 1
		1 65 1
		1 65 1
		1 65 1
		7 0 0.19593843440937714 1 0.004309767932979245 2 0.034670742767459038 
		8 0.40034690499305725 9 0.053664634437183743 20 0.16910104308299378 
		25 0.14196847237694979
		6 0 0.26466245126494281 1 0.024786656621470341 2 0.052372700201436452 
		8 0.35514581203460693 20 0.20563375840564233 25 0.097398621471901134
		9 0 0.2616927842034571 1 0.047232600906263002 2 0.075200579051898336 
		7 0.031509815997152163 8 0.26273217797279358 9 0.033823029234386445 
		14 0.0056033213030563045 20 0.20252845091704413 25 0.07967724041394883
		5 0 0.012627244898553375 8 0.51786002569415546 9 0.22718647670894251 
		20 0.10976351106111867 25 0.13256274163722992
		7 0 0.12962164464426323 2 0.0051391323477819242 3 2.6264062196564363e-06 
		8 0.43587920069694519 9 0.17316218432051689 20 0.10407896465918133 
		25 0.15211624692509176
		5 8 0.46014708280563354 9 0.44425693451449466 10 3.4025084365611718e-06 
		24 0.036162983987928062 25 0.059429596183507176
		9 0 0.15544016025833457 1 0.026490563911375997 2 0.051785178482532501 
		3 0.041817257136888733 4 2.1678026782979789e-07 8 0.25370717349105748 
		9 0.27705054042096178 20 0.12499031091532124 25 0.068718598603259906
		8 0 0.081578437124007849 1 0.00094272495773251258 2 0.012738331870557822 
		3 0.0073612163124036935 8 0.39735692739486694 9 0.35634262571984526 
		20 0.038641905446832388 25 0.10503783117375352
		7 0 0.0078523970066413182 1 3.8010962560090699e-05 2 1.9657809220584853e-05 
		8 0.44852277636528015 9 0.41753298561959418 20 0.0084430523316148757 
		25 0.11759111990508886
		4 8 0.55067777633666992 9 0.27001728785148976 24 0.0952893021959174 
		25 0.084015633615922902
		7 0 0.17015346589448144 2 0.0076201831300887271 3 0.033643772775266811 
		9 0.081665259533190107 15 0.045226783456875232 20 0.24836520850658417 
		25 0.41332532670351352
		6 0 0.073263398424094697 9 0.052390026715286496 15 0.050984551453459814 
		20 0.23575703799724579 24 0.027013807951208019 25 0.56059117745870513
		9 0 0.0444089203078714 2 0.0019534344041454376 8 0.0021097305497092054 
		9 0.20726898413739353 10 0.0008624275798547311 15 0.00011760264585243439 
		20 0.22882004082202911 24 0.033036829989342625 25 0.48142202956380148
		7 0 0.11342808910865734 2 0.0066950752776259509 3 0.006855842119055538 
		8 0.0026926034039479901 9 0.24338599982788914 20 0.2149469256401062 
		25 0.41199546462271791
		8 0 0.048959214296174648 2 0.01272295055729448 3 0.0024680913086862701 
		8 0.015685136556172759 9 0.44543161599535869 10 0.00035618661825429382 
		20 0.1489705890417099 25 0.32540621562634892
		9 0 0.0095751546323299408 2 0.0012076515571011277 8 0.0045058102891426133 
		9 0.39279367268435234 10 0.0073272174147752294 15 6.315544366379036e-09 
		20 0.17433417164608339 24 0.0061661149048210257 25 0.4040902005558501
		5 9 0.5648651727827485 10 0.00035199377403699221 15 1.3993265435274793e-09 
		20 0.1272895871747857 25 0.3074932448691024
		6 0 0.0056595639866893754 2 0.0025451451433728361 9 0.61753432638347783 
		10 2.8869410016341135e-05 20 0.11368339542624196 25 0.26054869965020167
		8 0 0.25995115355525961 1 0.036531554904153545 2 0.043057061738424031 
		3 0.072677390707944892 8 0.025388705431436093 9 0.21855671271841642 
		20 0.2228797972202301 25 0.12095762372413525
		1 54 1
		1 54 1
		1 54 1
		1 54 1
		1 54 1
		1 54 1
		1 54 1
		1 54 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		1 56 1
		5 1 0.059515327215194702 2 0.27304811869350626 3 0.22428750388397037 
		4 0.44007160760120762 20 0.0030774426061209448
		5 1 0.028934275903054439 2 0.29546802804202926 3 0.22308704553361522 
		4 0.4365193247795105 20 0.015991325741790612
		4 2 0.34594503045082092 3 0.23630082527117313 4 0.38752205519494931 
		20 0.030232089083056624
		5 1 0.00026146850555485476 2 0.30188083648681641 3 0.24700784051593258 
		4 0.43546941183080357 20 0.015380442660892559
		5 1 0.0031986526217345776 2 0.27425068616867065 3 0.24169748486212494 
		4 0.48069735851487483 20 0.00015581783259494973
		4 1 0.0066883973266667306 2 0.22604729235172272 3 0.17982638966809297 
		4 0.58743792065351752
		6 1 0.0057573164558573763 2 0.20820823311805725 3 0.14883814377188137 
		4 0.63614389528898452 6 0.00023951766515221821 7 0.00081289370006732624
		4 1 0.0035320644901722007 2 0.18302516639232635 3 0.16760159505585895 
		4 0.64584117406164243
		3 2 0.16959373652935028 3 0.14125600080402903 4 0.68915026266662072
		6 0 0.036569623318040041 1 0.17157683139244878 2 0.27563506845289776 
		3 0.25157027453453262 4 0.23670758442781603 20 0.027940617874264717
		6 0 0.035215294441052009 1 0.17152525410663097 2 0.29402340532601356 
		3 0.25189462120622197 4 0.2194889623154396 20 0.027852462604641914
		6 0 0.018584761740428814 1 0.093706294894218445 2 0.36090293966140413 
		3 0.28519107899468654 4 0.18391016553880613 20 0.057704759170455922
		5 1 0.058181943315593565 2 0.41418260335922241 3 0.33569659154438414 
		4 0.13680681774875664 20 0.055132044032043324
		6 0 0.019387876440316018 1 0.045923776251922448 2 0.43172824382781982 
		3 0.28851834209809635 4 0.16627036523151789 20 0.048171396150327402
		7 0 0.024141247766091722 1 0.049582921620952791 2 0.39590224623680115 
		3 0.22757747873147666 4 0.27470224667909743 5 0.013602516409560457 
		20 0.014491342556019846
		7 0 0.029593872152336793 1 0.066663195707332853 2 0.37662452459335327 
		3 0.22357411692243959 4 0.25539981459978806 5 0.031320375094752467 
		20 0.016824100929996949
		7 0 0.038019665658386805 1 0.0762579551658705 2 0.37062579393386841 
		3 0.2028839909863939 4 0.28306882811990935 5 0.0085699503825281704 
		20 0.020573815753042853
		7 0 0.012548749841152416 1 0.096705337707439179 2 0.34502708911895752 
		3 0.19521439132405247 4 0.31589042931048755 5 0.026124651167864013 
		20 0.0084893515300467973
		8 0 0.13954941274415911 1 0.19695077883253742 2 0.25934957071147335 
		3 0.22425220554647307 4 0.069872202383991902 14 0.0014150667113694449 
		15 0.0013083879321897265 20 0.10730237513780594
		7 0 0.15439860921736104 1 0.21325918450309606 2 0.24202108470348313 
		3 0.22165346959889398 4 0.06646541213430425 14 5.4668100326952433e-05 
		20 0.10214757174253464
		6 0 0.17730352326431442 1 0.13675281977645948 2 0.29460614373403343 
		3 0.2453394837199448 4 0.059656059836382794 20 0.086341969668865204
		7 0 0.15736169870409752 1 0.091147623040924303 2 0.31555226160449718 
		3 0.25826549530029297 4 0.032983424212472981 9 0.0013309245254723278 
		20 0.14335857261224258
		7 0 0.17823645947943309 1 0.088858316740513046 2 0.33264068217016779 
		3 0.22651505844630135 4 0.0056703773216438512 8 0.016309361904859543 
		20 0.15176974393708131
		7 0 0.1664570411675286 1 0.099155059156930653 2 0.32531803423165639 
		3 0.16291525108069263 4 0.056988602258138871 8 0.037476535886526108 
		20 0.1516894762185268
		7 0 0.19075137201700412 1 0.12358667723957291 2 0.32238351787284131 
		3 0.15101509230037383 4 0.075175361291257389 8 0.020085826516151428 
		20 0.11700215276279907
		9 0 0.18455661170865817 1 0.14177172425811929 2 0.28900986595810996 
		3 0.14903538741073499 4 0.1569827449220545 8 0.0019588728900998831 
		14 0.004799175821099776 20 0.067920292814447517 25 0.0039653242166758952
		9 0 0.19226827155692092 1 0.17715854942798615 2 0.27182962382765247 
		3 0.17273501920600048 4 0.12195487873774292 8 0.0058559000210454083 
		14 0.016512911519037471 20 0.040624202129424733 25 0.0010606435741895358
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		6 0 0.0036018319669294699 14 0.27380037307739258 15 0.024899478101139409 
		20 0.13617199674284727 24 0.50690739762093706 25 0.054618922490754208
		6 0 0.022968356542227186 14 0.20342469215393066 15 0.021430657335528371 
		20 0.108228917471935 24 0.56052797590208092 25 0.083419400594297852
		5 14 0.10386464469923543 15 0.060928817838430405 23 0.27512502595062066 
		24 0.54893441410816868 25 0.011147097403544838
		1 18 1
		1 18 1
		2 17 0.027491765096783638 18 0.97250823490321636
		1 18 1
		2 17 0.14178813993930817 18 0.85821186006069183
		2 17 0.0092421313747763634 18 0.99075786862522364
		2 17 0.18583400547504425 18 0.81416599452495575
		2 17 0.14968125522136688 18 0.85031874477863312
		2 17 0.035246241837739944 18 0.96475375816226006
		2 17 0.035012617707252502 18 0.9649873822927475
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		8 0 0.29035836565536982 1 0.036287522272378601 2 0.046505556568577147 
		3 0.080330258397833976 14 0.018574210206922934 15 0.094752300996680514 
		20 0.27331897616386414 25 0.15987280973837292
		8 9 0.00027029998785197676 14 0.0013754656358772473 15 0.20846003293991089 
		16 0.0031768201878446078 20 0.28054246699678459 23 0.0028352617268017819 
		24 0.0074851612690549759 25 0.49585449125587389
		7 14 0.028143252277715334 15 0.25936321551169589 16 0.029358197435146529 
		20 0.17615565657615662 23 0.11708284488474838 24 0.091832614310613875 
		25 0.29806421900392344
		7 14 0.0044114272830299058 15 0.36306972151922107 16 0.00022730054726574099 
		20 0.25783762335777283 23 0.0063613309234142471 24 0.0093527771151120914 
		25 0.35873981925418424
		8 0 0.24613366267842055 1 0.053350145650240349 2 0.10370708219636886 
		3 0.092893568000666352 14 0.08311629991097913 15 0.12204852992817254 
		20 0.17557570338249207 25 0.12317500825266027
		3 14 0.088070988655090332 23 0.24871571956893493 24 0.66321329177597477
		4 14 0.019907888025045395 23 0.25936865898516909 24 0.68165829586064997 
		25 0.039065157129135657
		3 22 0.35917763694586963 23 0.42511555269894385 24 0.21570681035518646
		3 22 0.35792360657846101 23 0.42277010327185027 24 0.21930629014968872
		5 21 0.0060351388528943062 22 0.63254946450990901 23 0.35711519963895177 
		24 0.0026624382441996107 25 0.0016377587540452908
		3 22 0.3173419454248273 23 0.48376946960374478 24 0.19888858497142792
		5 20 0.080286945181656397 22 0.27014499644083362 23 0.49611079294692167 
		24 0.10955911883105703 25 0.043898146599531174
		2 22 0.56473496556282043 23 0.43526503443717957
		2 22 0.59983676671981812 23 0.40016323328018188
		5 20 0.13081705570220947 22 0.1715700543942118 23 0.47839173525504397 
		24 0.14643321171827881 25 0.072787942930255978
		6 20 0.013707970269024372 21 0.0048212603564005184 22 0.45831592813256938 
		23 0.5144733868555732 24 0.0052229058552804245 25 0.0034585485311521801
		3 21 0.46689767799215004 22 0.22556261718273163 51 0.30753970482511833
		3 21 0.50849157571792603 22 0.19930263375506005 51 0.29220579052701395
		3 21 0.29366850852966309 22 0.042477665506338351 51 0.66385382596399856
		3 21 0.28064152598381042 22 0.05533171224042932 51 0.66402676177576025
		2 21 0.16050063533430042 22 0.0050181262195110321;
	setAttr ".wl[1495:1677].w"
		2 36 0.29542020439508743 51 0.53906103405110117
		3 21 0.15127343833500673 36 0.3037857711315155 51 0.54494079053347777
		1 60 1
		1 60 1
		4 21 0.22191433394366622 26 0.02144322544336319 36 0.26242122322601524 
		51 0.49422121738695535
		3 21 0.30946079533271803 22 0.02665349468588829 51 0.66388570998139362
		3 21 0.48342487215995789 22 0.15719749295149857 51 0.35937763488854352
		5 21 0.10694399364893811 26 0.2584591805934906 31 0.010319417140450007 
		36 0.001829585250707219 51 0.62244782336641402
		4 21 0.38616046499189011 22 0.13863004744052887 26 0.052986540630356078 
		51 0.4222229469372249
		5 21 0.057450300464590834 22 0.80933059794456286 23 0.09896773099899292 
		24 0.018701274154729691 51 0.01555009643712366
		3 21 0.30474862456321716 22 0.69498598695171232 51 0.00026538848507046142
		6 21 0.33146896958351135 22 0.6504354540202133 23 0.0020110309852190322 
		24 0.0011719014589367549 26 0.0026633447929458993 51 0.012249299159173617
		5 21 0.060209891460929636 22 0.80412001614534423 23 0.10538454353809357 
		24 0.016412179291969049 51 0.013873369563663628
		5 21 0.069374662548066901 22 0.7993168822845681 23 0.10219457745552063 
		24 0.015793812069959834 51 0.013320065641884564
		4 21 0.34522747993469238 22 0.63214551310597944 26 0.00083707505713335225 
		51 0.021789931902194751
		2 21 0.31644535064697266 22 0.68355464935302734
		3 21 0.084061850254658954 22 0.81488101517664979 23 0.10105713456869125
		3 21 0.095060648055194999 22 0.81007676419484698 23 0.094862587749958038
		2 21 0.28672498464584351 22 0.71327501535415649
		5 21 0.30354213266586499 22 0.6827283501625061 23 0.005862080106408811 
		24 0.0035260136510372859 51 0.0043414234141828014
		3 21 0.13325972345321799 22 0.78676686200649115 23 0.079973414540290833
		3 21 0.12923783779311845 22 0.79490536480974483 23 0.075856797397136688
		2 21 0.31364732980728149 22 0.68635267019271851
		9 0 0.21953057630476655 1 0.13906002866713621 2 0.20892735323153239 
		3 0.18171574221696174 4 0.0038020134485138922 14 0.012330652918235277 
		15 0.015501635192234853 20 0.17908614873886108 25 0.040045849281757792
		9 0 0.27830485371472419 1 0.076786133331168405 2 0.10611539333514972 
		3 0.12599829799925263 4 6.4832613590591377e-06 14 0.01828639249386791 
		15 0.036188928537197844 20 0.24211758375167847 25 0.1161959335756018
		8 0 0.26835299577325866 1 0.060958942289371668 2 0.10844420863900348 
		3 0.10985787837652217 14 0.039296094218888314 15 0.083962951733580815 
		20 0.21515242755413055 25 0.11397450141524436
		9 0 0.22898974830700086 1 0.12235984651528239 2 0.23941503820016177 
		3 0.17844525331652 4 7.0671429032109672e-05 14 0.01887319561208058 
		15 0.029113326008646041 20 0.1552518755197525 25 0.027481045091523947
		8 0 0.23178365916624724 1 0.099701725030778371 2 0.18587155168910208 
		3 0.13011193471339411 14 0.11967728286981583 15 0.06725021917079646 
		20 0.12488781236422611 25 0.040715814995639893
		8 0 0.25196515948269277 1 0.13035935068002458 2 0.26482821931588207 
		3 0.059789542455946178 14 0.16567809879779816 15 0.024794557857397297 
		20 0.078781922632228538 25 0.023803148778030626
		7 0 0.28501864907065755 1 0.1648313695233837 2 0.21645780203615789 
		3 0.1204199669278198 14 0.14208874106407166 15 0.0038303392488983979 
		20 0.067353132129011048
		8 0 0.31190341463039573 1 0.17609080784805109 2 0.20321545317661907 
		3 0.12651356953937337 7 0.0087831625556146972 14 0.10937578976154327 
		20 0.052730847989677213 25 0.011386954498725583
		8 0 0.35060297069561475 1 0.18263996961823781 2 0.21024778664609309 
		3 0.10780256752062981 7 0.0075236209176139908 14 0.076966084539890289 
		20 0.057039841195393508 25 0.007177158866526809
		4 1 0.0002947201228989485 2 0.23477049171924591 3 0.13298495311632644 
		4 0.63194983504152868
		3 2 0.22268562018871307 3 0.10434985917252067 4 0.67296452063876622
		3 2 0.18405412137508392 3 0.070363250774498912 4 0.74558262785041718
		3 2 0.13360144197940826 3 0.025524163644722302 4 0.84087439437586942
		3 2 0.041180502623319626 3 0.01630917815512491 4 0.94251031922155548
		3 2 0.0089111030101776123 3 0.010795299371053195 4 0.98029359761876922
		3 2 0.031093567609786987 3 0.028970673617502718 4 0.93993575877271029
		5 21 0.15290366706706862 26 0.3852236270904541 31 0.024531307416137502 
		36 0.067552640569261663 51 0.36978875785707815
		3 21 0.27420234680175781 36 0.58781295392992883 37 0.1379846992683133
		3 21 0.2642357349395752 26 0.016099915622312933 36 0.71966434943811186
		1 60 1
		3 21 0.20430280268192291 36 0.78241823015488166 37 0.013278967163195401
		3 21 0.14242438971996307 36 0.7776319876577481 37 0.07994362262228881
		8 0 0.084540619206045747 1 0.0017886677724095481 2 0.010111612094546873 
		3 0.010648806410355545 14 0.040597695629413913 15 0.61793044228353955 
		20 0.17182327806949615 25 0.06255887853419273
		4 14 0.0037322332824691112 15 0.88357849708929526 20 0.080802224576473236 
		25 0.031887045051762465
		5 14 0.017915739221594829 15 0.95204859972000122 16 0.015115697884005708 
		20 0.0057439694644424175 25 0.0091759937099558236
		1 15 1
		5 0 0.0069938119947758025 14 0.26846473201551113 15 0.61299325225218548 
		20 0.038578256964683533 25 0.072969946772844088
		5 14 0.001395297959615169 15 0.55320209265580811 23 0.15917255778902448 
		24 0.12161665409803391 25 0.16461339749751835
		5 15 0.59007603277185461 20 0.16658790409564972 23 0.014251035074117131 
		24 0.013097695678999119 25 0.21598733237937942
		3 15 0.82691402996311947 24 0.0093336533755064011 25 0.16375231666137413
		5 14 0.032791150891407592 15 0.86254972219467163 16 0.069480860334912992 
		20 0.017207722953666325 25 0.017970543625341461
		5 14 0.31780160711402272 15 0.59182911912757319 20 0.0044019306896554995 
		24 0.07248445600271225 25 0.01348288706603628
		4 14 0.1673546485370975 15 0.69179302166680123 24 0.085010550916194916 
		25 0.055841778879906427
		5 14 0.039631664752960205 15 0.9363750667586872 16 0.014068548148540236 
		20 0.0049858140936434791 25 0.0049389062461689167
		5 14 0.016491421075570341 15 0.91491243120636045 16 0.023452773690223694 
		20 0.0094731588862738535 25 0.035670215141571669
		4 14 0.29488955326323979 15 0.66221895945061737 20 0.010141166858375072 
		25 0.032750320427767765
		1 15 1
		2 17 0.26194164156913757 18 0.73805835843086243
		2 17 0.38463914394378662 18 0.61536085605621338
		2 17 0.69998729228973389 18 0.30001270771026611
		2 17 0.61775481700897217 18 0.38224518299102783
		2 16 0.3903999924659729 17 0.6096000075340271
		1 17 1
		1 17 1
		2 16 0.3903999924659729 17 0.6096000075340271
		1 17 1
		2 16 0.3903999924659729 17 0.6096000075340271
		2 17 0.4167712926864624 18 0.5832287073135376
		5 13 0.026168993802445289 16 0.042337942890235486 17 0.71984058618545532 
		18 0.16421866094596843 19 0.047433816175895503
		2 17 0.36021509766578674 18 0.63978490233421326
		2 17 0.63397526741027832 18 0.36602473258972168
		1 17 1
		2 16 0.3903999924659729 17 0.6096000075340271
		1 17 1
		2 16 0.3903999924659729 17 0.6096000075340271
		2 17 0.25232136249542236 18 0.74767863750457764
		2 17 0.5747259259223938 18 0.4252740740776062
		2 17 0.13592609763145447 18 0.86407390236854553
		2 17 0.3959592878818512 18 0.6040407121181488
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 62 1
		1 62 1
		1 61 1
		1 61 1
		1 62 1
		1 61 1
		1 62 1
		1 62 1
		1 61 1
		1 61 1
		1 62 1
		1 62 1
		1 61 1
		1 61 1
		1 60 1
		1 61 1
		1 62 1
		5 26 0.20458537340164185 27 0.76213309109793115 28 0.015629443347159849 
		30 0.0086134908203373203 51 0.0090386013329297483
		5 26 0.20094574987888336 27 0.79743078657454014 28 0.00074797449600118901 
		30 0.00043021875298656899 51 0.00044527029758873637
		1 27 1
		1 27 1
		2 27 0.6855999231338501 28 0.3144000768661499
		2 27 0.6855999231338501 28 0.3144000768661499
		2 27 0.66415753960609436 28 0.33584246039390564
		1 27 1
		2 26 0.20542462170124054 27 0.79457537829875946
		5 26 0.21056684851646423 27 0.78746939298546037 28 0.00087520046157304001 
		29 0.00054427901825120865 30 0.00054427901825120865
		1 27 1
		2 27 0.65711936354637146 28 0.34288063645362854
		2 27 0.65832167863845825 28 0.34167832136154175
		1 27 1
		2 26 0.22187358140945435 27 0.77812641859054565
		2 26 0.22337585687637329 27 0.77662414312362671
		1 27 1
		2 27 0.66528567671775818 28 0.33471432328224182
		2 27 0.6855999231338501 28 0.3144000768661499
		1 27 1
		2 26 0.220833420753479 27 0.779166579246521
		2 26 0.20644386112689972 27 0.79355613887310028
		1 27 1
		2 27 0.6855999231338501 28 0.3144000768661499
		1 4 1
		2 2 0.00074932968709617853 4 0.99925067031290382
		2 2 0.020576613023877144 4 0.97942338697612286
		2 2 0.017018323764204979 4 0.98298167623579502
		2 2 0.00033632494159974158 4 0.99966367505840026
		1 4 1
		1 4 1
		1 4 1
		2 2 0.0065701408311724663 4 0.99342985916882753
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		6 21 0.015389450825750828 36 0.0019081795124954145 37 0.35455328001629655 
		38 0.62492996834811443 39 3.5243544825403564e-05 51 0.0031838777525174354
		2 38 0.50479999184608459 39 0.49520000815391541
		3 21 0.065336667001247406 37 0.231422658988643 38 0.70324067401010959
		3 21 0.0002693856367841363 38 0.50466400597883254 39 0.49506660838438338
		3 21 0.11541952192783356 37 0.21902214315834181 38 0.66555833491382466
		3 21 0.018106667324900627 38 0.49565974632811499 39 0.48623358634698438
		4 41 0.023612447875700961 42 0.48102573406987942 43 0.47924473557159125 
		44 0.016117082482828417
		4 41 0.49116409809307288 42 0.49997490644454956 43 0.0082405032365903599 
		44 0.00062049222578715389
		4 41 0.020600358552750241 42 0.48369652220004172 43 0.48173686560321549 
		44 0.013966253643992543
		4 41 0.49225689397116279 42 0.50011527538299561 43 0.0071080153186910862 
		44 0.00051981532715049373
		4 41 0.027193002847740243 42 0.47785602509819325 43 0.4762482560280169 
		44 0.018702716026049473
		4 41 0.48988838356415226 42 0.49980765581130981 43 0.0095605707969909203 
		44 0.00074338982754699806
		4 44 0.49159849632193786 45 0.49168507412734019 46 0.015659384374134847 
		47 0.0010570451765871476
		4 43 0.49184941583934905 44 0.49184946720009709 45 0.015066238559709542 
		46 0.0012348784008442784
		4 44 0.49243037590586425 45 0.49252284035323918 46 0.014109931206898942 
		47 0.00093685253399753592
		4 43 0.49229280311252077 44 0.49229285629554331 45 0.01425564485092594 
		46 0.0011586957410100488
		4 44 0.48956004580712964 45 0.48963530747120965 46 0.019441673198650675 
		47 0.0013629735230100814
		4 43 0.48888806683926483 44 0.48888810895373958 45 0.02045791276395335 
		46 0.001765911443042301
		4 39 0.023114798135031707 40 0.47914056759341622 41 0.47835752496064526 
		42 0.01938710931090672
		4 39 0.4862656128524705 40 0.48751918831615598 41 0.024212234021296797 
		42 0.0020029648100767252
		4 39 0.02069408995946324 40 0.48142084795906259 41 0.48057428726109125 
		42 0.017310774820383058
		4 39 0.4876944702524893 40 0.48905291866922107 41 0.021514810216987836 
		42 0.001737800861301729
		4 39 0.028513360007573641 40 0.47405504053798436 41 0.47338386716243325 
		42 0.024047732292008753
		4 39 0.4831720509654473 40 0.48425042287921644 41 0.029975501867469063 
		42 0.0026020242878671933
		4 47 0.0046458135077067442 48 0.097676754085329914 49 0.47859177945156811 
		50 0.41908565295539535;
	setAttr ".wl[1678:2010].w"
		4 47 0.018743110509391495 48 0.43408968921735258 49 0.45807675469292897 
		50 0.089090445580326971
		4 47 0.0034464993980282601 48 0.072837594783458012 49 0.47849269518219167 
		50 0.44522321063632209
		4 47 0.016705500026076195 48 0.43735146500570943 49 0.46353264939267269 
		50 0.082410385575541714
		4 47 0.0062019705841373889 48 0.11435293913429884 49 0.46424049488938435 
		50 0.41520459539217947
		4 47 0.021686806683648314 48 0.42942611314646045 49 0.45081490303079641 
		50 0.098072177139094899
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		3 2 0.095643043518066406 3 0.0079991425698503794 4 0.89635781391208325
		2 2 0.088938139379024506 4 0.91106186062097549
		2 2 0.067375823855400085 4 0.93262417614459991
		2 2 0.03562207892537117 4 0.96437792107462883
		1 4 1
		2 2 1.8769849702948704e-05 4 0.99998123015029705
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 16 1
		1 16 1
		2 16 0.99991548954858445 25 8.4510451415553689e-05
		3 15 0.047538329800169407 16 0.95212953609340134 25 0.00033213410642929375
		1 17 1
		2 16 0.3903999924659729 17 0.6096000075340271
		3 10 0.00037141120992600918 15 0.14870952129851925 16 0.85091906749155477
		2 15 0.1771555095911026 16 0.8228444904088974
		2 16 0.3903999924659729 17 0.6096000075340271
		1 17 1
		1 17 1
		2 16 0.3903999924659729 17 0.6096000075340271
		2 15 0.13701103627681732 16 0.86298896372318268
		2 15 0.058314654976129532 16 0.94168534502387047
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 64 1
		2 28 0.37249216437339783 29 0.62750783562660217
		2 28 0.58310282230377197 29 0.41689717769622803
		1 64 1
		1 64 1
		2 28 0.67656224966049194 29 0.32343775033950806
		2 28 0.6578429639339447 29 0.3421570360660553
		1 64 1
		3 28 0.0063841722460438177 29 0.0014589645413707331 64 0.99215686321258545
		2 28 0.5683332085609436 29 0.4316667914390564
		2 28 0.45547235012054443 29 0.54452764987945557
		1 64 1
		1 64 1
		2 28 0.30665513873100281 29 0.69334486126899719
		2 28 0.41120687127113342 29 0.58879312872886658
		1 64 1
		4 21 0.31771913170814514 22 0.14548481917792369 26 0.36490984457474479 
		51 0.17188620453918635
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		2 17 0.17753912508487701 18 0.82246087491512299
		2 17 0.21160180866718292 18 0.78839819133281708
		2 17 0.50663107633590698 18 0.49336892366409302
		1 18 1
		1 18 1
		1 18 1
		4 13 0.00010773243560683891 17 0.0013486168842207844 18 0.89095759391784668 
		19 0.1075860567623257
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		1 18 1
		2 17 0.21069926023483276 18 0.78930073976516724
		2 17 0.41104564070701599 18 0.58895435929298401
		1 18 1
		1 18 1
		3 21 0.069043457508087158 36 0.61228157468149991 37 0.31867496781041288
		3 21 0.14225746691226959 36 0.62946328125875217 37 0.22827925182897824
		4 44 0.02108893586213936 45 0.48584293996732958 46 0.48098679591817251 
		47 0.012081328252358548
		4 44 0.015554627278902887 45 0.49082506579687218 46 0.48487312073796007 
		47 0.0087471861862649467
		4 44 0.017331704123864439 45 0.48920262504598505 46 0.48365832864254543 
		47 0.0098073421876051416
		4 46 0.48513824811381928 47 0.49026863868714587 48 0.022191258073470058 
		49 0.0024018551255648077
		4 46 0.48777476155580357 47 0.49400778684475466 48 0.016517446083273324 
		49 0.0017000055161684098
		4 46 0.4868620015600531 47 0.49264295605510688 48 0.018549838623547067 
		49 0.0019452037612928237
		4 47 0.48174837999181014 48 0.4819061953214957 49 0.031140502272616999 
		50 0.0052049224140771578
		4 47 0.48617642091113422 48 0.48636807414060457 49 0.023696841578471652 
		50 0.0037586633697895577
		4 47 0.48448135444183565 48 0.48465834750513109 49 0.026559301342145219 
		50 0.0043009967108880174
		2 17 0.0055875089019536972 18 0.9944124910980463
		2 17 0.094875238835811615 18 0.90512476116418839
		2 17 0.021440599113702774 18 0.97855940088629723
		1 18 1
		2 17 0.0032870590221136808 18 0.99671294097788632
		1 18 1
		1 18 1
		2 17 0.019151195883750916 18 0.98084880411624908
		2 17 0.096739649772644043 18 0.90326035022735596
		4 16 0.00025450933830926308 17 0.016158216777397327 18 0.97775816917419434 
		19 0.0058291047100990758
		1 18 1
		1 18 1
		2 17 0.038859147578477859 18 0.96114085242152214
		1 18 1
		1 16 1
		1 16 1
		1 16 1
		1 16 1
		1 16 1
		1 16 1
		2 15 0.011776470579206944 16 0.98822352942079306
		1 16 1
		2 15 0.018169412389397621 16 0.98183058761060238
		1 16 1
		2 15 0.014356079511344433 16 0.98564392048865557
		1 16 1
		1 16 1
		1 16 1
		1 16 1
		1 16 1
		1 17 1
		1 17 1
		1 17 1
		1 17 1
		1 17 1
		1 17 1
		1 17 1
		1 17 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		5 27 0.0058458948643801177 28 0.049021729697084265 29 0.92570048570632935 
		30 0.012966270262148371 35 0.0064656194700579072
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		2 28 0.23538173735141754 29 0.76461826264858246
		2 28 0.32099401950836182 29 0.67900598049163818
		2 28 0.33418005704879761 29 0.66581994295120239
		2 28 0.26953917741775513 29 0.73046082258224487
		2 28 0.1767457127571106 29 0.8232542872428894
		2 28 0.10608793050050735 29 0.89391206949949265
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		2 28 0.18451009690761566 29 0.81548990309238434
		2 28 0.20944158732891083 29 0.79055841267108917
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		2 28 0.20987863838672638 29 0.79012136161327362
		1 29 1
		1 29 1
		1 29 1
		1 29 1
		2 28 0.03929881751537323 29 0.96070118248462677
		1 29 1
		2 28 0.049665544182062149 29 0.95033445581793785
		1 29 1
		1 29 1
		2 28 0.048789709806442261 29 0.95121029019355774
		2 28 0.10067497938871384 29 0.89932502061128616
		1 29 1
		1 29 1
		1 29 1
		2 28 0.039515499025583267 29 0.96048450097441673
		1 29 1
		1 64 1
		1 64 1
		1 64 1
		1 64 1
		1 64 1
		1 64 1
		1 64 1
		1 64 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		3 15 0.49765986204147339 16 0.49878872930238677 25 0.0035514086561398827
		2 15 0.48863482475280762 16 0.51136517524719238
		3 15 0.47721492383476222 16 0.5227169394493103 25 6.813671592746774e-05
		3 15 0.44548866930512826 16 0.55363184213638306 25 0.00087948855848865896
		5 14 0.005530661768513568 15 0.47852493536389029 16 0.5087627123648466 
		17 0.0045906412041055123 25 0.0025910492986440659
		5 14 0.0046019837563140154 15 0.51310617774118716 16 0.47596722841262817 
		17 0.0036543385566675793 25 0.0026702715332030556
		3 15 0.5081973671913147 16 0.48831546959226518 25 0.0034871632164201068
		3 15 0.50165447769531546 16 0.49125948548316956 25 0.0070860368215150214
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		2 27 0.25709998607635498 28 0.74290001392364502
		2 27 0.28788477182388306 28 0.71211522817611694
		2 27 0.29413831233978271 28 0.70586168766021729
		2 27 0.28294247388839722 28 0.71705752611160278
		2 27 0.26180762052536011 28 0.73819237947463989
		2 27 0.25709998607635498 28 0.74290001392364502
		2 27 0.25709998607635498 28 0.74290001392364502
		2 27 0.25709998607635498 28 0.74290001392364502
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		1 63 1
		9 9 0.00012041593551563008 10 0.0024909361549543341 14 0.0093843926805286214 
		15 0.14174775261061179 16 0.023944354039395155 20 0.23397336900234222 
		23 0.074833672889490138 24 0.014385204501237033 25 0.49911990218592511
		8 0 0.17127735418236917 1 0.0056303975726246843 2 0.0080334414445595234 
		3 0.023482328721187613 14 0.010465335036882632 15 0.37351226329355813 
		20 0.26751679182052612 25 0.14008208792829213
		9 0 0.23041487672154262 1 0.0083272318557660822 2 0.010297884583788317 
		3 0.036099626724634674 9 8.0135723549257053e-05 14 0.0062373442565538586 
		15 0.19769884490001893 20 0.29454571008682251 25 0.21629834514732368
		3 14 0.30126849220438118 15 0.33504646711970926 16 0.031198311956089117;
	setAttr ".wl[2010:2128].w"
		3 20 0.057232819886455094 24 0.25686550140380859 25 0.01838840742955674
		6 14 0.33977714545917176 15 0.45254185616424625 16 0.0278070185944943 
		20 0.030764810240107916 24 0.10862245410680771 25 0.040486715435171967
		7 0 0.061974300625328889 2 0.12437311391486879 14 0.3526974618434906 
		15 0.02739713406264253 20 0.12267396231439598 24 0.24060529928048222 
		25 0.070278727958791018
		8 0 0.27967270203943995 1 0.060689483289090004 2 0.13143508379292262 
		3 0.030091915417575374 14 0.25837567448616028 15 0.085625304203635066 
		20 0.12528826492837841 25 0.028821571842798207
		8 0 0.32564612942621279 1 0.10692046112246395 2 0.1449727896425716 
		3 0.011459625840356057 14 0.24427853524684906 15 0.035914220942530946 
		20 0.11838172932973977 25 0.012426508449275755
		7 0 0.40377691809335031 1 0.12197401589858979 2 0.15216495657310122 
		14 0.20382958650588989 15 0.0070299475776368983 20 0.11106848224475227 
		25 0.00015609310667967957
		4 22 0.096482868233295438 23 0.48155959962082506 24 0.41600757837295532 
		25 0.0059499537729241726
		3 22 0.12245633431706432 23 0.4206940310355663 24 0.45684963464736938
		4 22 0.13199984787912264 23 0.40423470187630112 24 0.46009030938148499 
		25 0.0036751408630912698
		7 0 0.17906131280726442 1 0.017053067407063454 2 0.12297450606752879 
		14 0.35970714688301086 15 0.027124414751365095 20 0.19065000589804268 
		25 0.10342954618572467
		3 15 0.78433842371388929 16 0.19474302232265472 25 0.020918553963455936
		5 14 0.03971917349222083 15 0.74106590216802293 16 0.17369557917118073 
		17 0.023181336640056643 25 0.02233800852851886
		6 14 0.065405085547416669 15 0.73275246178037301 16 0.14646713900798172 
		17 0.038812227732902105 20 0.00079739815555512905 25 0.015765687775771333
		6 14 0.0017492602038066271 15 0.85556908020070255 16 0.11606993444858396 
		17 0.00024929742197714403 20 0.014956333674490452 25 0.011406094050439332
		5 14 0.010429362663690076 15 0.89075217591489275 16 0.086331784725189209 
		17 0.0064745198366909056 25 0.0060121568595370798
		3 15 0.90977932361689251 16 0.089336320757865906 25 0.00088435562524154417
		3 15 0.8696490680222988 16 0.12850327789783478 25 0.0018476540798664438
		3 15 0.82520565175176963 16 0.17316271364688873 25 0.0016316346013416053
		5 14 0.29761444175357388 15 0.14475748458672322 20 0.10922041177139097 
		24 0.42651361227035522 25 0.021894049617956688
		3 21 0.4076641357382656 22 0.49652808904647827 51 0.095807775215256158
		3 21 0.4494961645201811 22 0.456046462059021 51 0.09445737342079788
		3 21 0.42412404170728968 22 0.45251643657684326 51 0.12335952171586706
		4 21 0.42418153485720739 22 0.41589859127998352 26 0.049182535148162156 
		51 0.11073733871464692
		7 0 0.10719633343283866 1 0.0030820403920494509 2 0.068052497146592963 
		14 0.40729826688766479 15 0.12357844642760081 20 0.20863253281768593 
		25 0.082159882895567443
		5 14 0.45249908708156716 15 0.15015116900970094 20 0.1277510936993195 
		24 0.20142556726932526 25 0.068173082940087157
		5 21 0.22513772425303585 26 0.1961798220872879 31 0.0056058493271008633 
		36 0.23233098455361426 51 0.34074561977896112
		4 21 0.17932830246714501 26 0.37708970904350281 36 0.19431471475500561 
		51 0.24926727373434654
		4 21 0.18372435704711967 26 0.38458535075187683 36 0.10511195112163539 
		51 0.32657834107936817
		3 21 0.24668449056905933 26 0.31264498829841614 51 0.44067052113252453
		4 21 0.42979514598846436 22 0.12703651214534759 26 0.11590716965124397 
		51 0.32726117221494416
		4 21 0.42505620277811867 22 0.44704055786132813 26 0.024635152714638529 
		51 0.10326808664591468
		3 21 0.27008222792179454 22 0.72718338036096519 23 0.0027343917172402143
		5 21 0.09351106756453953 22 0.74628245357006573 23 0.12368322163820267 
		24 0.020092844733243461 51 0.016430412493948589
		3 22 0.36204928794147501 23 0.46754954120872494 24 0.17040117084980011
		5 15 0.046425696462392807 22 0.066151912636299229 23 0.53326910587495779 
		24 0.31907929209764541 25 0.035073992928704716
		2 14 0.14817865192890167 15 0.85182134807109833
		4 14 0.16762345712602753 15 0.79834496559345369 24 0.03280780091881752 
		25 0.001223776361701226
		6 1 6.5578060563029567e-06 3 0.00080831863941894827 14 0.10343354349797497 
		15 0.83787623491762941 20 0.054218068718910217 25 0.0036572764200100915
		3 14 0.13554432785358755 15 0.86423088920664493 20 0.000224782939767465
		8 0 0.10973804824412475 1 0.0032600871171824552 2 0.091252824373997871 
		14 0.28708016872406006 15 0.008937466709828935 20 0.12662629356605731 
		24 0.28011585348586077 25 0.092989257778887904
		7 0 0.23447902485389241 1 0.026562246575857519 2 0.11235345173672658 
		14 0.26772212982177734 20 0.175093611372999 24 0.000210714517453763 25 
		0.18357882112129326
		7 0 0.42052797927138313 1 0.12732780876671695 2 0.15497194086561808 
		7 0.011555385210383668 14 0.14863565564155579 20 0.12912753679949432 
		25 0.0078536934448481255
		1 60 1
		4 21 0.32341075390272345 22 0.044915862194776543 26 0.24279414117336273 
		51 0.38887924272913726
		4 21 0.39758181571960449 22 0.076442199630626748 26 0.0075112945328570805 
		51 0.51846469011691165
		3 21 0.39495301246643066 22 0.10674340010385694 51 0.49830358742971237
		3 21 0.36857050657272339 22 0.12902816067184253 51 0.50240133275543408
		4 21 0.44665226682323755 22 0.35659617185592651 26 0.09591759427750142 
		51 0.10083396704333443
		4 21 0.47894270040455766 22 0.33159562945365906 26 0.030693720855119563 
		51 0.15876794928666368
		4 21 0.4199643538656514 22 0.36182713508605957 26 0.011128831197911457 
		51 0.20707967985037759
		4 21 0.42818483710289001 22 0.23234840777331214 26 0.15233566227835307 
		51 0.1871310928454448
		4 21 0.48281112313270569 22 0.25681990506404301 26 0.050962907554810775 
		51 0.20940606424844049
		3 21 0.53768604056539993 22 0.26853948831558228 51 0.1937744711190178
		3 21 0.51503501233749394 22 0.30386140942573547 51 0.18110357823677065
		3 21 0.46573539030075078 22 0.3437248170375824 51 0.19053979266166685
		4 21 0.38764164944593399 22 0.1354287713766098 26 0.21149956519821797 
		51 0.26543001397923821
		1 60 1
		1 61 1
		1 61 1
		1 61 1
		1 61 1
		1 61 1
		1 60 1
		4 21 0.042199652642011642 26 0.21324631955435969 31 1.4114695333956312e-06 
		51 0.74455261633409531
		1 60 1
		5 14 0.26739594761905439 15 0.5459342734139524 16 0.0014981785873054783 
		24 0.17661350965499878 25 0.0085580907246888913
		5 14 0.10539536116281198 15 0.1699155725489386 23 0.29250209770156332 
		24 0.39306718111038208 25 0.039119787476304041
		5 14 0.086651468741784088 15 0.28203653292302988 23 0.28119749589690929 
		24 0.26749664545059204 25 0.082617856987684812
		8 0 0.072311303431394677 1 0.0014252074187557271 2 0.022126550014620019 
		3 0.01624139255390401 14 0.18032217413754414 15 0.50029192406223588 
		20 0.086036637425422668 25 0.12124481095612294
		8 0 0.17407385427466504 1 0.015459401407178407 2 0.051896631000364776 
		3 0.041910850513930918 14 0.10016141596432032 15 0.26891545969966668 
		20 0.16373421251773834 25 0.18384817462213557
		6 14 0.00792378265262942 15 0.060720417648553848 22 0.047288272051219306 
		23 0.53266190818358161 24 0.25478343872815323 25 0.096622180735862623
		5 15 0.0048851115232462989 22 0.043827009339504272 23 0.55895947763217058 
		24 0.22916877269744873 25 0.1631596288076301
		7 15 0.059297984306208973 16 0.0087790353420653996 20 0.11421677470207214 
		22 0.019576784094780249 23 0.43453597592551524 24 0.17615745363152377 
		25 0.18743599199783428
		7 10 0.00013124598405887713 14 0.0010925873421196754 15 0.039836653775577643 
		20 0.16738595068454742 23 0.33511334118454311 24 0.21245406443806783 
		25 0.24398615659108541
		4 22 0.36516095737657467 23 0.49428460001945496 24 0.12117329464076571 
		25 0.019381147963204701
		4 22 0.35663058014125382 23 0.47960572788726463 24 0.14327188145595859 
		25 0.020491810515522957
		5 21 0.011561732739210129 22 0.60679910455556219 23 0.36833392555529104 
		24 0.008285203560248101 25 0.0050200335896886002
		5 21 0.0093068908900022507 22 0.6277656599319007 23 0.35334689694481253 
		24 0.0059357167123860102 25 0.0036448355208984688
		5 21 0.0056951737797772805 22 0.66058705597427092 23 0.33004042506217957 
		24 0.0022627807923009174 25 0.0014145643914713092
		3 21 0.0012864599331642425 22 0.67644985221779097 23 0.3222636878490448
		1 16 1
		4 15 0.0047082241464870443 16 0.99085991142823981 17 0.004236615391549587 
		18 0.00019524903372337171
		1 16 1
		2 15 0.019739607349038124 16 0.98026039265096188
		5 10 0.029923887852516883 15 0.030366905033588409 16 0.93749124371193882 
		17 0.0021172593396633914 18 0.000100704062292497
		2 15 0.023328628391027451 16 0.97667137160897255
		2 15 0.0021309803705662489 16 0.99786901962943375
		1 16 1
		1 16 1
		1 16 1
		2 15 0.01850588247179985 16 0.98149411752820015
		5 10 0.0018866505551314364 15 0.042709358036518097 16 0.9545296263334957 
		17 0.00080828656288005492 18 6.6078511974687417e-05
		2 15 0.021197646856307983 16 0.97880235314369202
		1 16 1
		1 16 1
		1 16 1
		8 0 0.23633875102347579 1 0.050871264386894391 2 0.094535822202424638 
		7 0.009838270318494536 14 0.3336518406867981 15 0.085478570842848475 
		20 0.16927029072115066 25 0.020015189817913386
		8 0 0.30000723371904348 1 0.064093607989089765 2 0.12011370717054695 
		7 0.0071954799005804621 14 0.2900492250919342 15 0.019355881619320822 
		20 0.14629296994187074 25 0.052891894567613673
		6 0 0.33336248909567923 1 0.072332538390856058 2 0.12177366753145535 
		14 0.21148382127285004 20 0.16548124061951777 25 0.095566243089641595
		5 0 0.068326350276918968 14 0.43782717644719538 15 0.26049981494744778 
		20 0.13248133659362793 25 0.10086532173481004
		7 0 0.18448860528006025 1 0.012735421341318913 2 0.053719108202732707 
		14 0.36102288961410522 15 0.18132865778485593 20 0.13594719354780138 
		25 0.070758124229125544
		6 14 0.37920519056779295 15 0.46960480900916524 16 0.01652220264674318 
		20 0.051505811016837016 24 0.013779857195913792 25 0.069382129563547709
		8 0 0.22576143746559951 1 0.028282042774676594 2 0.10224410887225359 
		3 0.052079924113849277 14 0.19945916533470154 15 0.19198915978160119 
		20 0.13106703789302759 25 0.06911712376429055
		7 0 0.1170541341295093 2 0.046959702345224882 3 0.0069925160959281073 
		14 0.28425396991242435 15 0.33695832342535298 20 0.1013030931353569 25 
		0.10647826095620347
		7 0 0.018340862111319679 2 0.0023751074797105092 14 0.35020201526917366 
		15 0.41793103473735949 16 0.018122999252167791 20 0.074297450482845306 
		25 0.1187305306674237
		5 14 0.43915614989354096 15 0.27634811733260717 20 0.10490803360620701 
		24 0.1114363968372345 25 0.068151302330410363
		9 0 0.1390027225475764 2 0.00082582751836011699 3 0.012778371297171801 
		9 0.0022715628394923055 14 8.69659512839994e-05 15 0.24009507780183686 
		16 6.6728486400482163e-05 20 0.29075905680656433 25 0.31411368675131379
		5 0 0.050769842886173304 15 0.23585142707783643 16 0.00037266786837507202 
		20 0.28155162930488586 25 0.43145443286272933
		5 2 1.8258842509654046e-05 15 0.40175099407406872 16 1.5058293831012224e-05 
		20 0.2800457775592804 25 0.31816991123031024
		8 0 0.079671558903609579 2 0.0010015588816023409 3 0.00089804087328466096 
		14 0.0015799148448385932 15 0.41293575712275993 16 0.0003969151355621756 
		20 0.27361440658569336 25 0.22990184765264934
		8 0 0.0099158627962765665 2 0.00084241712259205753 3 0.00013783995341509891 
		14 0.0021086405817012078 15 0.64183491862300457 20 0.19956369698047638 
		24 0.00055396648481814584 25 0.145042657457716
		6 2 0.00021492602399255937 14 0.00043809580667151707 15 0.59428822994232178 
		20 0.2196498234629452 24 3.3145950495585039e-05 25 0.18537577881357337
		5 14 0.025722137787461213 15 0.77215531043120189 16 0.035967524361048678 
		20 0.08247462660074234 25 0.083680400819545836
		3 15 0.8606417806914306 20 0.080329917920544114 25 0.059028301388025284
		8 0 0.23325874223703302 1 0.025016921626488373 2 0.04443507682879673 
		3 0.064018335297986104 14 0.043153930589810909 15 0.19756178320585374 
		20 0.23924195766448975 25 0.15331325254954137
		1 62 1
		1 62 1
		1 62 1
		1 62 1;
	setAttr ".wl[2129:2184].w"
		1 62 1
		1 62 1
		1 62 1
		1 62 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		1 27 1
		4 26 0.0064912477341078495 27 0.99082203154142545 28 0.0025934020800963439 
		29 9.3318644370433236e-05
		4 26 0.0013310149826559229 27 0.99821013756197052 28 0.00044057108757929208 
		29 1.8276367794119415e-05
		5 1 0.036033835262060165 2 0.35220525619809884 3 0.23539791556838224 
		4 0.37631962558954191 20 4.3367381916818978e-05
		4 1 0.021738657727837563 2 0.33788472034568745 3 0.2442479163858596 
		4 0.39612870554061536
		4 1 0.035846184939146042 2 0.33025575486110192 3 0.22565287825623701 
		4 0.40824518194351495
		4 1 0.054432190804159869 2 0.2749464213848114 3 0.18507548189930598 
		4 0.48554590591172275
		4 1 0.044439578418624108 2 0.19226831197738647 3 0.13814493851228143 
		4 0.62514717109170803
		4 1 0.03163917437725762 2 0.15503707528114319 3 0.11591621955290284 
		4 0.69740753078869633
		4 1 0.027410700168330946 2 0.1602821946144104 3 0.12914297196905089 
		4 0.68316413324820779
		7 0 0.01223777483442565 1 0.11665267760409763 2 0.33007543499893183 
		3 0.26943296973430719 4 0.23733758059087273 15 4.8622315270586435e-05 
		20 0.034214939922094345
		5 1 0.095683265194318454 2 0.43279897984046356 3 0.26184653367693539 
		4 0.1888371273748467 20 0.020834093913435936
		5 1 0.11302196234464645 2 0.35493470504181368 3 0.23307404196423837 
		4 0.25314606375187604 20 0.045823226897425504
		5 1 0.16447950899600983 2 0.37694616543138704 3 0.24941760076277145 
		4 0.20891092357090527 20 0.00024580123892651575
		6 0 0.0037479383253094974 1 0.22666614901708587 2 0.28101783990859985 
		3 0.21610847159996471 4 0.26561412135511864 5 0.0068454797939214405
		5 1 0.2209974335805773 2 0.25213351845741272 3 0.18733214371876528 
		4 0.29454896303799394 5 0.044987941205250737
		6 1 0.14744976028535683 2 0.3018641471862793 3 0.20038061444186167 
		4 0.3077799897258594 5 0.041375456847416073 20 0.0011500315132267984
		8 0 0.12888464896468557 1 0.15098503276913761 2 0.31916137644815268 
		3 0.23479547382169891 4 0.057401017034301893 14 0.0029407601013746445 
		15 0.0036549277433352914 20 0.10217676311731339
		8 0 0.13677320192155182 1 0.13059175689124397 2 0.38197854152270683 
		3 0.25028652620355096 4 0.012744749871379718 14 0.0021134426134430313 
		15 0.00080256134159071093 20 0.084709219634532928
		7 0 0.15529629438886342 1 0.13387270407126156 2 0.40962106578207913 
		3 0.22624446201548734 14 0.017936106506723882 15 0.00046133696763087507 
		20 0.056568030267953873
		7 0 0.17866427169714172 1 0.19018492180206839 2 0.35525823741076207 
		3 0.19979145140846261 14 0.051210951060056686 15 0.0024223330103743173 
		20 0.022467833611134143
		6 0 0.17841422425175749 1 0.24386986104767844 2 0.2784820976193475 
		3 0.21368289735451154 14 0.040031678974628448 20 0.04551924075207657
		7 0 0.19026348198509993 1 0.25759264122342923 2 0.25989208288997867 
		3 0.17267661855545377 4 0.03845018231627563 14 0.024120450019836426 
		20 0.057004543009926321
		7 0 0.18969716712530293 1 0.22348442673683167 2 0.28046743435708532 
		3 0.19633295322739486 4 0.060692750524344419 14 0.012606636346299611 
		20 0.036718631682741122
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1;
	setAttr -s 68 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.00012458487229893169 -2.0659965411739363e-07 -0.99999999223944547 0
		 0.48842646143880952 0.8726079101278057 6.0668998869479536e-05 0 0.87261700544801113 -0.48842137052174622 0.0001088135187630004 0
		 -65.86117792305113 -49.184170767824781 -0.0081949738967855429 1;
	setAttr ".pm[1]" -type "matrix" 0.00011262237759505737 1.8931314143273278e-06 -0.99999999365644021 0
		 0.47337540102499065 0.88086344084625756 5.4979141575822541e-05 0 0.88087262357999918 -0.47337046652374482 9.8307747761787595e-05 0
		 -69.895015497525108 -50.391380966661444 -0.0073579492219432224 1;
	setAttr ".pm[2]" -type "matrix" -0.00013346030276724713 6.5050905995434751e-06 -0.99999999107320137 0
		 0.43580015774893704 0.90004565541224446 -5.2305929585913116e-05 0 0.90005503534307874 -0.43579561508949055 -0.00012295400266156632 0
		 -72.363337743608156 -53.491136413355136 0.010443317886077339 1;
	setAttr ".pm[3]" -type "matrix" -0.000113829106982509 1.6261411675284125e-06 -0.99999999352028024 0
		 0.40325638293605254 0.91508889188929454 -4.4413292931412996e-05 0 0.91509843110801359 -0.40325217908670896 -0.00010481840982613142 0
		 -75.378751698686855 -56.229299560543879 0.0089575651269330186 1;
	setAttr ".pm[4]" -type "matrix" -0.0001138278910175504 1.6281443383055072e-06 -0.99999999352028002 0
		 0.40326828053553532 0.91508179521907895 -4.4413292931412989e-05 0 0.91508178921729388 -0.40326828297794143 -0.00010481840982613139 0
		 -79.498197900566055 -56.227900540898354 0.0089575651269301771 1;
	setAttr ".pm[5]" -type "matrix" -0.0001138278910175504 1.6281443383055072e-06 -0.99999999352028002 0
		 0.40326828053553532 0.91508179521907895 -4.4413292931412989e-05 0 0.91508178921729388 -0.40326828297794143 -0.00010481840982613139 0
		 -80.612309879342348 -56.227900540898318 0.0089575651269301754 1;
	setAttr ".pm[6]" -type "matrix" -0.00086805432194877758 -0.00024576642338952875 -0.99999959304019692 0
		 -0.31985754163774477 0.94746564636959452 4.4798496465073723e-05 0 0.94746524977919511 0.31985745035611107 -0.00090106189323161192 0
		 -37.804677765348472 -95.935749832126049 0.054881066241358967 1;
	setAttr ".pm[7]" -type "matrix" 0.99999999352028024 -4.3009446658595589e-05 -0.00010540221594260256 0
		 4.4413292931496256e-05 0.99991081255204783 0.013355334850295495 0 0.00010481840982613031 -0.013355339445016278 0.99991080798309684 0
		 -0.0089575651269524006 -91.152592140790162 -65.628267695748619 1;
	setAttr ".pm[8]" -type "matrix" 1.4998161329110534e-16 -5.6554169352655066e-15 1 0
		 -0.99726384104029986 -0.073924497655024082 -4.2182842680421475e-16 0 0.073924497655023957 -0.99726384104029986 -5.6905931121490428e-15 0
		 83.872544900709968 34.82358119320763 -9.9955730095320696 1;
	setAttr ".pm[9]" -type "matrix" -0.00022511566015480269 0.0013710229929272011 -0.99999903480898034 0
		 -0.94071644132093046 -0.33919391633890239 -0.00025327290011179795 0 -0.33919393619495009 0.94071547633417341 0.0013661017332728123 0
		 68.119236740264256 -7.7293558823963373 9.9696508005663631 1;
	setAttr ".pm[10]" -type "matrix" 0.00018717798116347746 0.0013767154793019353 -0.99999903480898045 0
		 -0.99883927546436047 -0.048166769070277796 -0.000253272900111798 0 -0.048167071264867023 0.9988383588007721 0.0013661017332728125 0
		 43.285132912672296 -21.374337344299473 9.9696508005663471 1;
	setAttr ".pm[11]" -type "matrix" 2.9399819585950689e-08 -3.301941798772908e-08 0.99999999999999889 0
		 -0.99543426641082378 -0.095449574410492566 2.6113898294678721e-08 0 0.095449574410491539 -0.995434266410824 -3.5674860428343882e-08 0
		 15.418194425213255 23.815547276061086 -9.9955726764485551 1;
	setAttr ".pm[12]" -type "matrix" 3.5674860389151733e-08 2.6113898447940512e-08 0.999999999999999 0
		 2.0996470987281921e-16 -0.99999999999999956 2.6113898294678724e-08 0 0.99999999999999978 -8.4834295552333768e-16 -3.5674860428343875e-08 0
		 -23.684737346442681 2.5033964996451297 -9.9955726764485568 1;
	setAttr ".pm[13]" -type "matrix" 2.6113898447940495e-08 3.5674860266687068e-08 -0.999999999999999 0
		 -0.99999999999999956 -2.3412450317527359e-16 -2.6113898294678724e-08 0 -1.2924321653734002e-15 0.99999999999999978 3.5674860305879203e-08 0
		 2.503396499645155 -32.957356692507574 9.995572676448548 1;
	setAttr ".pm[14]" -type "matrix" 6.9755856085539338e-15 5.4945716925802514e-15 -1 0
		 0.99726384104029997 -0.073924497655023805 6.6674151140336792e-15 0 -0.073924497655023749 -0.99726384104029997 -6.1719100655751393e-15 0
		 -83.8725700269556 34.823620567704097 -9.9955700000003862 1;
	setAttr ".pm[15]" -type "matrix" 4.128451747842549e-15 -2.1788968819162811e-08 -1 0
		 0.94071641281306895 0.33919408996047129 -7.3906854489914258e-09 0 0.3391940899604714 -0.94071641281306873 2.0497241810099345e-08 0
		 -68.117014022271746 7.7156208971678417 -9.9955701681156981 1;
	setAttr ".pm[16]" -type "matrix" -6.3948176963092055e-09 -2.0829437554418905e-08 -0.99999999999999989 0
		 0.99883929916792713 0.048166943412723186 -7.3906854489914249e-09 0 0.048166943412723359 -0.99883929916792691 2.0497241810099338e-08 0
		 -43.287017667550522 21.36058971888021 -9.9955701681156235 1;
	setAttr ".pm[17]" -type "matrix" -9.3133946889839879e-09 -1.9698219248695321e-08 -0.99999999999999978 0
		 0.99543426641082422 -0.095449574410493149 -7.3906854489914249e-09 0 -0.095449574410492954 -0.99543426641082411 2.0497241810099338e-08 0
		 -15.418206924585634 23.815596754290322 -9.9955701681154707 1;
	setAttr ".pm[18]" -type "matrix" -2.0497241986805066e-08 7.3906855660907057e-09 -0.99999999999999978 0
		 -7.4823354383235835e-16 -1 -7.3906854489914249e-09 0 -0.99999999999999989 5.7015629681577987e-16 2.0497241810099338e-08 0
		 23.68469979511838 2.5034000738741056 -9.9955701681153624 1;
	setAttr ".pm[19]" -type "matrix" -7.3906855660906966e-09 -2.0497241986805069e-08 -0.99999999999999978 0
		 1 -3.0414433398229558e-16 -7.3906854489914249e-09 0 -1.2606708696571735e-16 -0.99999999999999989 2.0497241810099338e-08 0
		 -2.5034000738741167 32.957399795118377 -9.9955701681153055 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.012294495601307132 -75.967541225644453 -29.210037970338188 1;
	setAttr ".pm[21]" -type "matrix" -2.2859675757999493e-16 -1.1377780453854859e-17 -1 0
		 -0.29046403376576591 0.95689226381392711 1.1377711280661503e-17 0 0.95689226381392722 0.29046403376576591 -2.2859536778628463e-16 0
		 59.163287827420568 -65.402607641841314 -2.4008296750867673e-15 1;
	setAttr ".pm[22]" -type "matrix" -2.2836516322103463e-16 1.5338866655846349e-17 -1 0
		 -0.1769748535096442 0.98421556686330058 1.137771128066152e-17 0 0.98422155060924299 0.17697377756026983 -2.2859536778628468e-16 0
		 36.75685803871405 -70.163638830663842 -4.260014295321943e-16 1;
	setAttr ".pm[23]" -type "matrix" -2.2121487810953429e-16 5.8735570301223507e-17 -1 0
		 0.014548037722741609 0.99989417298626149 1.1377711280661523e-17 0 0.99990025205359367 -0.014547949275418371 -2.2859536778628468e-16 0
		 6.8492862925651501 -72.818173065675396 1.6953717168565252e-14 1;
	setAttr ".pm[24]" -type "matrix" -2.1182091911337398e-16 8.6704891894763002e-17 -1 0
		 0.14305631977588137 0.98971467515330724 1.137771128066152e-17 0 0.98972069233223736 -0.14305545004012693 -2.2859536778628468e-16 0
		 -18.434736002816852 -71.036945193173963 2.9677641756877866e-14 1;
	setAttr ".pm[25]" -type "matrix" -2.1219034610196334e-16 8.5793656574725056e-17 -1 0
		 0.13880017776148634 0.99032040807679 1.137771128066154e-17 0 0.99032040807679023 -0.13880017776148648 -2.2859536778628468e-16 0
		 -34.759032998643981 -71.187002600727553 9.2010110499140059e-14 1;
	setAttr ".pm[26]" -type "matrix" 5.8808631031432553e-17 -1.3596013310669328e-15 -1 0
		 0.96925223632062973 0.24606930403335264 -2.3388114379588637e-16 0 0.24606930403335264 -0.96925223632062973 1.372426867489865e-15 0
		 -59.867813950748967 -63.389001346120871 -9.9602199999999073 1;
	setAttr ".pm[27]" -type "matrix" 7.19903217066568e-16 -1.1548651837249107e-15 -1 0
		 0.72289138479508119 0.69096168185294471 -2.3388114379588622e-16 0 0.69096168185294471 -0.72289138479508119 1.3724268674898646e-15 0
		 5.6402915176482011 -69.617200793022022 -9.9602199999998948 1;
	setAttr ".pm[28]" -type "matrix" -2.549557143036952e-16 -1.3367766523494708e-15 -1 0
		 0.99985661431772543 0.016933717993842742 -2.3388114379588617e-16 0 0.016933717993842742 -0.99985661431772543 1.3724268674898642e-15 0
		 -23.421978678670282 -73.142808813347543 -9.96021999999987 1;
	setAttr ".pm[29]" -type "matrix" -1.3322676317215364e-15 -1.4901161149778878e-08 0.99999999999999978 0
		 1.7208456881689915e-15 0.99999999999999956 1.4901161106104266e-08 0 -0.99999999999999978 1.6098234061572299e-15 -1.3724268443288074e-15 0
		 -73.110900000000015 -2.5034001484187378 9.9602199626962999 1;
	setAttr ".pm[30]" -type "matrix" -1.3322676317215364e-15 6.6520297792985411e-08 -0.99999999999999767 0
		 1.7208456881689917e-15 -0.99999999999999745 -6.6520297749310777e-08 0 -0.99999999999999978 -1.6098234770007167e-15 1.372426761231111e-15 0
		 -63.655700000000003 2.5034006625567056 -9.9602198334729444 1;
	setAttr ".pm[31]" -type "matrix" 5.7974577104798655e-17 -1.1307245108308495e-15 -1 0
		 -0.96925223632062962 -0.24606930403335253 2.458726262921843e-16 0 -0.24606930403335259 0.96925223632062962 -9.684775344893277e-16 0
		 59.867813950748989 63.389001346120821 9.9602199999999605 1;
	setAttr ".pm[32]" -type "matrix" 6.0660743638632905e-16 -9.55994973368035e-16 -1 0
		 -0.72289138479508108 -0.69096168185294482 2.458726262921843e-16 0 -0.69096168185294482 0.72289138479508097 -9.684775344893277e-16 0
		 -5.6403289296304777 69.617191278823981 9.9602199999999605 1;
	setAttr ".pm[33]" -type "matrix" -2.0321256329858503e-16 -1.1138238752611486e-15 -1 0
		 -0.99985661431772577 -0.016933717993842915 2.4587262629218435e-16 0 -0.016933717993842971 0.99985661431772566 -9.684775344893277e-16 0
		 23.421978678670268 73.1428088133475 9.9602199999999517 1;
	setAttr ".pm[34]" -type "matrix" -1.1102230246251569e-15 -7.885984946898272e-16 1 0
		 -1.7763568394002503e-15 -1 -8.1242651605698221e-16 0 1 -1.8353374375834627e-15 9.6847753448932671e-16 0
		 73.110899999999987 2.5033999999998979 -9.9602199999999357 1;
	setAttr ".pm[35]" -type "matrix" -1.1102230246251569e-15 -2.9802322165650701e-08 -0.99999999999999956 0
		 -1.7763568394002505e-15 0.99999999999999956 -2.9802322141822678e-08 0 1 1.8353374087205816e-15 -9.6847758918664551e-16 0
		 63.655699999999975 -2.5033997031622053 9.9602200746070633 1;
	setAttr ".pm[36]" -type "matrix" -3.6849560335502607e-17 7.4668987557581101e-17 1 0
		 -0.44254844318862974 0.89674459877454527 -7.4668987557581101e-17 0 -0.89674459877454527 -0.44254844318862974 3.6849560335502607e-17 0
		 -16.522795046849147 -95.863657054831407 8.7682558892726907e-16 1;
	setAttr ".pm[37]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -60.883687655383532 -76.855412300828291 8.7682558892728376e-16 1;
	setAttr ".pm[38]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -65.151340200696509 -76.855412300828291 2.0373213689002193e-15 1;
	setAttr ".pm[39]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -71.616141493159205 -76.855412300828291 6.0687656466805437e-15 1;
	setAttr ".pm[40]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -78.973648857535167 -76.855412300828291 1.0496651058565191e-14 1;
	setAttr ".pm[41]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -86.000111716726693 -76.85541230082832 1.4777523177717263e-14 1;
	setAttr ".pm[42]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -93.212787110084449 -76.855412300828291 1.9141090274031412e-14 1;
	setAttr ".pm[43]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -100.25994025085001 -76.855412300828334 2.3431150723979272e-14 1;
	setAttr ".pm[44]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -107.86573099411429 -76.85541230082832 2.7969296105413356e-14 1;
	setAttr ".pm[45]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -115.61635370839679 -76.855412300828306 3.2571759802417908e-14 1;
	setAttr ".pm[46]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -123.40835698582733 -76.855412300828306 3.7192600161014036e-14 1;
	setAttr ".pm[47]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -132.04866180779308 -76.85541230082822 4.219016208223744e-14 1;
	setAttr ".pm[48]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -139.71652339577946 -76.855412300828334 4.6755872456058853e-14 1;
	setAttr ".pm[49]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -146.3291806234904 -76.855412300828291 5.0852977959295225e-14 1;
	setAttr ".pm[50]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -151.01764166481669 -76.855412300828277 5.4095568698523483e-14 1;
	setAttr ".pm[51]" -type "matrix" -2.5558387294194941e-17 -4.9277345199792484e-17 -1 0
		 0.46041897397730874 0.88770173391837115 -4.9277345199792484e-17 0 0.88770173391837126 -0.46041897397730874 2.5558387294194941e-17 0
		 2.3474479136248552 -92.270111827088343 1.2227447489359574e-14 1;
	setAttr ".pm[52]" -type "matrix" 2.1855344559305265e-16 -8.6086891954606934e-16 -1 0
		 -0.96925223632062951 -0.24606930403335275 1.7347234759768071e-16 0 -0.24606930403335248 0.96925223632062985 -9.7144514654701197e-16 0
		 52.233156915778146 63.389001346120821 9.9602199999999641 1;
	setAttr ".pm[53]" -type "matrix" 4.3710689118610511e-16 -1.7217378390921387e-15 -1.0000000000000002 0
		 -0.96925223632062951 -0.24606930403335253 2.1510571102112408e-16 0 -0.24606930403335237 0.96925223632062985 -9.7144514654701197e-16 0
		 44.598499880807324 63.38900134612085 9.9602199999999677 1;
	setAttr ".pm[54]" -type "matrix" 7.3152981316897201e-16 1.8830190484660907e-17 -1 0
		 -0.96925223632062951 -0.24606930403335286 1.5959455978986625e-16 0 -0.24606930403335248 0.96925223632062973 -9.9920072216264089e-16 0
		 36.963842845836496 63.38900134612085 9.9602199999999677 1;
	setAttr ".pm[55]" -type "matrix" 1.7123140037292777e-16 -9.6613260834354998e-16 -1.0000000000000002 1.5407439555097887e-33
		 -0.7228913847950813 -0.69096168185294637 4.163336342344337e-17 1.7347234759768071e-18
		 -0.69096168185294493 0.72289138479508053 -1.1518563880485999e-15 -1.7347234759768071e-18
		 -12.338522734618332 69.617191278823952 9.9602199999999517 0.99999999999999989;
	setAttr ".pm[56]" -type "matrix" 9.6320699662881226e-16 -3.1798044718071028e-16 -0.99999999999999978 0
		 -0.7228913847950813 -0.6909616818529466 4.163336342344337e-17 0 -0.69096168185294482 0.72289138479508064 -1.1657341758564144e-15 0
		 -19.036716539606168 69.61719127882391 9.960219999999941 1;
	setAttr ".pm[57]" -type "matrix" 9.7084087967689426e-16 -1.6081891361056785e-15 -1.0000000000000002 0
		 -0.72289138479508119 -0.69096168185294649 4.163336342344337e-17 0 -0.69096168185294471 0.72289138479508075 -1.124100812432971e-15 0
		 -25.734910344594027 69.617191278823853 9.9602199999999392 1;
	setAttr ".pm[58]" -type "matrix" -6.6764591608617554e-16 -3.0451811411375352e-15 -1.0000000000000002 0
		 -0.99985661431772588 -0.016933717993843217 1.9081958235744878e-16 0 -0.016933717993843023 0.99985661431772554 -9.9920072216264089e-16 0
		 16.036319460806045 73.142808813347543 9.9602199999999499 1;
	setAttr ".pm[59]" -type "matrix" -4.5311893463659017e-16 -1.0150603803791781e-15 -1.0000000000000002 0
		 -0.99985661431772599 -0.016933717993843453 1.2967057982926633e-16 0 -0.016933717993843023 0.99985661431772577 -9.9920072216264089e-16 0
		 8.650660242941818 73.142808813347528 9.9602199999999446 1;
	setAttr ".pm[60]" -type "matrix" -5.0632735186577513e-16 -1.7405679944777565e-15 -1 0
		 0.96925223632062962 0.2460693040333527 -2.6367796834847468e-16 0 0.24606930403335248 -0.96925223632062996 1.3600232051658168e-15 0
		 -52.233166229177677 -63.388998816968261 -9.9602199999999019 1;
	setAttr ".pm[61]" -type "matrix" 4.3710689118610531e-16 -1.7217378390921389e-15 -0.99999999999999989 0
		 0.96925223632062973 0.24606930403335245 -2.5673907444456745e-16 0 0.24606930403335248 -0.96925223632062996 1.3600232051658168e-15 0
		 -44.5985185076064 -63.388996287815594 -9.9602199999999019 1;
	setAttr ".pm[62]" -type "matrix" 4.3710689118610531e-16 -1.7217378390921389e-15 -1 0
		 0.96925223632062973 0.24606930403335261 -2.9143354396410359e-16 0 0.24606930403335248 -0.96925223632062996 1.3600232051658168e-15 0
		 -36.963870786035095 -63.388993758662934 -9.9602199999998984 1;
	setAttr ".pm[63]" -type "matrix" -2.3758880158281056e-16 -1.2700931274774346e-16 -0.99999999999999989 0
		 0.99985661431772499 0.016933717993842707 -2.7842311789427754e-16 6.9388939039072284e-18
		 0.016933717993842773 -0.99985661431772532 1.4155343563970746e-15 0 -16.036319460806034 -73.142808813347543 -9.9602199999998682 1;
	setAttr ".pm[64]" -type "matrix" -3.4209663217407452e-16 -1.0150603803791787e-15 -1 0
		 0.99985661431772499 0.016933717993842641 -2.688821387764051e-16 0 0.016933717993842731 -0.99985661431772543 1.4155343563970746e-15 -1.7347234759768071e-18
		 -8.6506602429418198 -73.142808813347571 -9.96021999999987 1;
	setAttr ".pm[65]" -type "matrix" 0.00018717798116208505 0.0013767154793024325 -0.99999903480898034 0
		 -0.99883927546436013 -0.048166769070277837 -0.00025327290011173398 0 -0.048167071264867009 0.99883835880077199 0.0013661017332728103 0
		 37.131264992580263 -21.37433734429948 9.9696508005662832 1;
	setAttr ".pm[66]" -type "matrix" 0.00018717798116253947 0.0013767154793020676 -0.99999903480898034 0
		 -0.99883927546436013 -0.048166769070277837 -0.00025327290011173398 0 -0.048167071264866995 0.99883835880077187 0.001366101733272812 0
		 30.977397072488213 -21.37433734429947 9.9696508005662174 1;
	setAttr ".pm[67]" -type "matrix" 0.00018717798116292512 0.0013767154793019746 -0.99999903480898023 0
		 -0.99883927546436002 -0.04816676907027817 -0.00025327290011162296 0 -0.048167071264867009 0.99883835880077187 0.001366101733272812 0
		 24.823529152396159 -21.37433734429947 9.9696508005661535 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 68 ".ma";
	setAttr -s 68 ".dpf[0:67]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4;
	setAttr -s 68 ".lw";
	setAttr -s 68 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
	setAttr -s 16 ".ifcl";
	setAttr -s 16 ".ifcl";
createNode dagPose -n "bindPose1";
	rename -uid "ED5BAA26-4209-1983-4B16-8684FA95A772";
	setAttr -s 88 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[2]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[3]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[4]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1.4210854715202004e-14 1;
	setAttr ".wm[13]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 7.1054273576010019e-15 1.4210854715202004e-14 -7.1054273576010019e-15 1;
	setAttr ".wm[14]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 7.1054273576010019e-15 1.4210854715202004e-14 -7.1054273576010019e-15 1;
	setAttr ".wm[15]" -type "matrix" 0 -0.99726384104029986 0.073924497655024082 0 5.8286708792820734e-15 0.073924497655023957 0.99726384104029986 0
		 -1 2.7755575615628918e-16 5.773159728050814e-15 0 38.523635600215258 89.812019648064279 -58.192322719617792 1;
	setAttr ".wm[16]" -type "matrix" 0 -0.99726384104029986 0.073924497655024082 0 5.8286708792820734e-15 0.073924497655023957 0.99726384104029986 0
		 -1 2.7755575615628918e-16 5.773159728050814e-15 0 38.523635600215258 89.812019648064279 -58.192322719617792 1;
	setAttr ".wm[23]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 7.1054273576010019e-15 1.4210854715202004e-14 -7.1054273576010019e-15 1;
	setAttr ".wm[24]" -type "matrix" 7.1054273576010019e-15 0.99726384104029975 -0.073924497655023791 0
		 5.6621374255882984e-15 -0.073924497655023735 -0.99726384104029975 0 -1 6.5503158452884236e-15 -5.9952043329758453e-15 0
		 18.532529999999589 102.55919851570927 113.77067799748247 1;
	setAttr ".wm[25]" -type "matrix" 7.1054273576010019e-15 0.99726384104029975 -0.073924497655023791 0
		 5.6621374255882984e-15 -0.073924497655023735 -0.99726384104029975 0 -1 6.5503158452884236e-15 -5.9952043329758453e-15 0
		 18.532529999999589 102.55919851570927 113.77067799748247 1;
	setAttr ".wm[38]" -type "matrix" 1.1102230246251565e-16 0.96925223632062951 0.24606930403335259 0
		 -1.3877787807814457e-15 0.24606930403335259 -0.96925223632062951 0 -1 -2.7755575615628914e-16 1.3322676295501878e-15 0
		 -56.668519999999887 65.162188392859477 27.103897227749137 1;
	setAttr ".wm[39]" -type "matrix" 1.1102230246251565e-16 0.96925223632062951 0.24606930403335259 0
		 -1.3877787807814457e-15 0.24606930403335259 -0.96925223632062951 0 -1 -2.7755575615628914e-16 1.3322676295501878e-15 0
		 -56.668519999999887 65.162188392859477 27.103897227749137 1;
	setAttr ".wm[45]" -type "matrix" 0 -0.96925223632062962 -0.24606930403335253 0 -9.9920072216264089e-16 -0.24606930403335259 0.96925223632062962 0
		 -1 2.2204460492503131e-16 -1.1102230246251565e-15 0 -36.748079999999923 101.39594262563151 -115.61868842091096 1;
	setAttr ".wm[46]" -type "matrix" 0 -0.96925223632062962 -0.24606930403335253 0 -9.9920072216264089e-16 -0.24606930403335259 0.96925223632062962 0
		 -1 2.2204460492503131e-16 -1.1102230246251565e-15 0 -36.748079999999916 101.39594262563151 -115.61868842091096 1;
	setAttr -s 88 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 -7.8886090522101181e-31
		 -18.582436498317186 0 0 0 0 -7.8886090522101181e-31 -18.582436498317186 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 -18.582436498317197 0
		 0 0 0 0 -18.582436498317197 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 -3.9443045261050599e-31
		 -18.582436498317186 0 0 0 0 -3.9443045261050599e-31 -18.582436498317186 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 -18.582436498317197 0
		 0 0 0 0 -18.582436498317197 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 1.4210854715202004e-14 0
		 0 0 0 77.675372838338731 -40.098096364024762 0 0 0 0 77.675372838338731 -40.098096364024762 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 0.99998956918716431 1 1 2.0659965607742464e-07
		 0.00012458357309986807 0.0033166405696361703 0 7.1054273576009995e-15 75.08616796099831
		 33.447785707402794 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.17732524785459414 -0.68451132676772186 0.17732524785459391 0.68451132676772164 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 0.99998956918716431 1 1 3.8865556264470172e-08
		 -1.1947560078535471e-05 -0.0065060010433877881 0 4.8885521667236702 -7.1054273576010019e-15
		 1.6150275561344074e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.0053302536204008514 0.99998579409726729 1.0000104309216387
		 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 0.99998956918716431 1 1 1.3656155551529993e-07
		 -0.0002459000413926093 -0.0011107077494838756 0 4.6601306773070661 0 2.5543803183758484e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.020538763482520737 0.99978905734890355 1.0000104309216387
		 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 0.99998956918716431 1 1 9.0753203664137518e-08
		 1.9778402632912789e-05 0.0091769359178199127 0 4.9826052703046315 -2.1316282072803006e-14
		 4.0245584642661925e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.022513583804521359 0.99974653715043038 1.0000104309216387
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.1192859066414513 2.1316282072803006e-14
		 2.8397423301740332e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 8.7991199131904239e-06 0.99999999996128774 1.0000104309216387
		 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.1141119787762932 -1.4210854715202004e-14
		 -1.7347234759768071e-18 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 0 0 0 0 12.023723181557614 -10.93518515279851
		 1.3721662694976544e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -6.2372524894409071e-05 -0.00039572757711919034 -0.36192526357937294 0.93220702802132638 1
		 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 0 0 0 0 15.432701195050765 2.0062854880124288
		 -1.463302009254219e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.14107979466808038 0.69288995629638928 -0.14107979466808035 0.69288995629638939 1
		 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.1054273576010019e-15
		 1.4210854715202004e-14 -7.1054273576010019e-15 0 0 0 21.260875205830775 44.776935715437986
		 -50.736840609470399 0 0 0 21.260875205830775 44.776935715437986 -50.736840609470399 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0.88777780010792995
		 48.92812040561126 -41.082616273009762 0 0 0 0.88777780010792995 48.92812040561126
		 -41.082616273009762 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 1.5707963267948908 -0.0739919945926103
		 -1.5707963267948966 0 0 0 0 0 0 0 9.9955730095322686 86.21737203176383 28.528062590683486 0
		 0 0 9.9955730095322686 86.21737203176383 28.528062590683486 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 0 0 0 0 -1.4210854715202004e-14
		 0 0 0 0 0 8.6151530933439773 85.34790654207697 28.528062590682822 0 0 0 8.6151530933439773
		 85.34790654207697 28.528062590682822 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 -3.5897929073769319e-09 -1.0275294057306343e-24
		 -1.0275294057306345e-24 4 9.9955730095322792 86.217372031763844 28.52806259068349 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 6.123233995736766e-17 0 0 0 1 1 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 -0.0013710234571817814 -0.00022511566205399996
		 1.5431945144368098e-07 0 24.823632915734962 -7.1054273576010019e-15 -5.3290705182007514e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.97802548802772327 -0.208485358642121 1.2766046356508073e-17 5.9886789169883971e-17 1
		 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 1.2599662188591606e-28 4.0260588655657977e-28
		 -1.2209582494098899e-14 0 20.467142496475908 -5.5067062021407764e-14 1.9539925233402755e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.1483872214393343 0.98892933646116188 1
		 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 0.0013356571616199597 -0.00038248096210142445
		 -2.5541844091724023e-07 0 24.615471680368177 0 2.5401902803423582e-13 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 6.123233995736766e-17 0 0 0.071828438726842594 0.99741700175506542 1
		 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 -1.656158277185682e-08 -1.9036226991103813e-23
		 -2.2208931117427311e-23 0 15.186925866795827 2.4868995751603507e-14 1.7763568394002505e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 6.123233995736766e-17 0.74008431087629889 -0.6725140985843745 -4.1179611910641087e-17 4.5317094120691707e-17 1
		 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 0 0 0 0 3.8972563359169996 3.2393315585466098e-06
		 3.628584385850786e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.70710678118654735 -0.70710678118654768 4.3297802811774677e-17 4.3297802811774652e-17 1
		 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 -19.067994999999897
		 40.318522710242078 17.0903922734582 0 0 0 -19.067994999999897 40.318522710242078
		 17.0903922734582 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 -1.5707963267949028 0.073991994592610077
		 1.5707963267948897 0 0 0 0 0 0 0 -9.9955700000000007 86.217399999999998 28.528099999999998 0
		 0 0 -9.9955700000000007 86.217399999999998 28.528099999999998 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 0 0 0 0 1.4210854715202004e-14
		 0 0 0 0 0 -8.6370138817222113 87.087251159547606 28.528099999998396 0 0 0 -8.6370138817222113
		 87.087251159547606 28.528099999998396 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 3.5897929073611799e-09 -1.0634519601562079e-14
		 4.4519231674435634e-23 4 -9.9955700000000292 86.217399999999969 28.528099999999995 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 2.1788976680778339e-08 3.5776940169345696e-09
		 3.8977258352909275e-17 0 -24.82361592283835 7.3538289520058697e-05 -1.794120407794253e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.208485358642121 0.97802548802772327 1
		 1 1 yes;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 7.5773842895647713e-29 1.356199430297287e-28
		 -1.2209570634775916e-14 0 -20.467152799752846 -3.961660874196582e-05 -7.460698725481052e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.1483872214393343 0.98892933646116188 1
		 1 1 yes;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 -1.6108485212123563e-08 9.1766856502567172e-14
		 -8.5216137302007773e-22 0 -24.615468692822041 -5.194790077922562e-05 -1.5454304502782179e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.07182843872684265 0.99741700175506542 1
		 1 1 yes;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 1.098048496572801e-08 -4.2070295129186226e-24
		 6.7312466270612168e-23 0 -15.186931224000286 8.6516945575709769e-05 -1.0835776720341528e-13 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.6725140985843745 0.74008431087629889 1
		 1 1 yes;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.9337999999999802 3.4638958368304884e-14
		 1.6928680679484387e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.70710678118654768 0.70710678118654735 1
		 1 1 yes;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 0 0 0 0 0.012294495601307132
		 75.967541225644453 29.210037970338174 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[33]" -type "matrix" "xform" 0.99999392032623291 0.99999392032623291
		 1 -3.7436874410624025e-19 -4.3362155632379537e-16 0.0046545575564635195 0 7.105427357600994e-15
		 79.767086594360279 -37.615329807367665 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.10544653580078511 -0.69920027752255209 -0.10544653580078511 0.69920027752255187 1
		 1 1 yes;
	setAttr ".xm[34]" -type "matrix" "xform" 0.99999392032623291 1 1 -8.7442624643643114e-18
		 -7.3071361151716494e-16 -0.012251025348270345 0 14.480387286793366 4.2632564145606011e-14
		 -1.9748282455545733e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.064480276167171516 0.99791898167406623 1.0000060797107297
		 1.0000060797107297 1 yes;
	setAttr ".xm[35]" -type "matrix" "xform" 0.99999392032623291 1 1 2.5629756455179212e-17
		 2.0057296528809855e-15 0.014250468169963768 0 16.105769629040012 1.4210854715202004e-14
		 -1.7379718598097448e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.088986555206838486 0.99603282726646125 1.0000060797107297
		 1 1 yes;
	setAttr ".xm[36]" -type "matrix" "xform" 0.99999392032623291 1 1 -2.8478842517410642e-17
		 -1.6068301145598995e-15 -0.0096709303810335115 0 15.992460223127296 5.6843418860808015e-14
		 -1.2723924588312611e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.069279660990058348 0.99759727774944462 1.0000060797107297
		 1 1 yes;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 0 0 0 0 16.63016214823514 -1.4210854715202004e-14
		 -6.2332468742262167e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.0021490843713054277 0.99999769071551614 1.0000060797107297
		 1 1 yes;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 -1.5707963267948952 -0.24862276406219905
		 1.5707963267948966 0 0 0 2.1316282072803006e-14 0 0 0 -9.9602199999999996 73.625100000000003
		 -46.708300000000001 0 0 0 -9.9602199999999996 73.625100000000003 -46.708300000000001 0
		 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -7.1054273576010019e-15 0
		 0 0 -8.9044129321510468 75.224156092085394 -46.708300000000037 0 0 0 -8.9044129321510539
		 75.224156092085394 -46.708300000000037 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 0 0 0 0 -9.9602199999999925 73.625100000000003
		 -46.708300000000008 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 -6.1539611697268629e-30 -2.2513954395819954e-29
		 6.6300282668593662e-15 0 -30.538590886285157 -1.0116610610566568e-05 -1.0658141036401503e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.25427489898059347 0.96713198465794159 1
		 1 1 yes;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 3.5897920191985122e-09 -1.1511952388209862e-23
		 -2.0662757404294507e-32 0 -26.792812631933728 -9.5141980267499093e-06 -2.4868995751603507e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.36435677379066866 0.93125943828390567 1
		 1 1 yes;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 1.8490954101224591e-08 -3.1265208265133484e-23
		 2.4317383742288647e-23 0 -22.156976993263303 7.1054273576010019e-14 1.7763568394002505e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70109424544998189 0.71306862152034189 5.3127751211045005e-09 5.2235590690200332e-09 1
		 1 1 yes;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 0 0 0 0 -3.830699999999986 6.1284310959308641e-14
		 3.0198066269804258e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.99999999999999967 0 0 2.5809568321603288e-08 1
		 1 1 yes;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 1.5707963267948977 0.24862276406219896
		 -1.5707963267948966 0 0 1.4210854715202004e-14 7.1054273576010019e-15 0 0 0 9.9602199999999996
		 73.625100000000003 -46.708300000000001 0 0 0 9.9602199999999996 73.625100000000003
		 -46.708300000000001 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 -1.4210854715202004e-14 0
		 0 0 8.9547882083186714 72.038832951553246 -46.708300000000165 0 0 0 8.9547882083186714
		 72.038832951553246 -46.708300000000165 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 0 0 0 0 9.9602199999999996 73.625100000000089
		 -46.708300000000001 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 -3.6630825278871747e-30 4.5769801195857409e-30
		 1.1050048571879146e-14 0 30.538628139883283 7.1054273576010019e-15 -3.5527136788005009e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 -0.25427489898059352 0.96713198465794159 1
		 1 1 yes;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 -3.5897929073769319e-09 1.1511955232339169e-23
		 -2.3023910679571121e-24 0 26.792775219951423 2.8421709430404007e-14 8.8817841970012523e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0.36435677379066866 0.93125943828390567 1
		 1 1 yes;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 -3.5897933514661418e-09 6.7441767438040912e-25
		 1.348835342708268e-24 0 22.156976993263303 -7.1054273576010019e-14 1.4210854715202004e-14 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.70109424544998189 0.71306862152034189 2.0199590059578612e-16 1.9860383592570161e-16 1
		 1 1 yes;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.1470000000000269 -2.7977620220553945e-14
		 -1.0658141036401503e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.99999999999999989 0 0 1.49011614771246e-08 1
		 1 1 yes;
	setAttr ".xm[52]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.1054273576010034e-15
		 78.653079457587495 -57.24103940290513 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.16066689237787501 0.68861175541348141 -0.16066689237787507 0.68861175541348141 1
		 1 1 yes;
	setAttr ".xm[53]" -type "matrix" "xform" 1 1 1 0 0 -5.4956039718945249e-15 0 4.0620799472401536
		 1.4210854715202004e-14 -1.4791141972893971e-29 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.22721729822513201 0.9738440837152893 1 1 1 yes;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.2676525453129841 0
		 -1.1604957799729361e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.4648012924626812 0
		 -4.0314442777803252e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[56]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.3575073643759481 0
		 -4.4278854118846474e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[57]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.0264628591915255 1.4210854715202004e-14
		 -4.2808721191520716e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[58]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.2126753933577703 -1.4210854715202004e-14
		 -4.3635670963141466e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[59]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.047153140765559 4.2632564145606011e-14
		 -4.2900604499478627e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[60]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.6057907432642793 0
		 -4.5381453814340874e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[61]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.7506227142824855 0
		 -4.6024636970045551e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[62]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.7920032774305241 -1.4210854715202004e-14
		 -4.6208403585961213e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[63]" -type "matrix" "xform" 1 1 1 0 0 0 0 8.6403048219657421 -8.5265128291212022e-14
		 -4.9975619212233982e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[64]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.6678615879863798 8.5265128291212022e-14
		 -4.5657103738214131e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[65]" -type "matrix" "xform" 1 1 1 0 0 0 0 6.6126572277109119 -5.6843418860808015e-14
		 -4.0971055032363587e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[66]" -type "matrix" "xform" 1 1 1 0 0 0 0 4.6884610413262635 -1.4210854715202004e-14
		 -3.2425907392282711e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[67]" -type "matrix" "xform" 1 1 1 0 0 0 0 7.1054273576010019e-15
		 80.827528697891978 -44.566743799407405 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.16755466725939699 -0.68696829146591099 0.16755466725939705 0.68696829146591099 1
		 1 1 yes;
	setAttr ".xm[68]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.3081999999999852 2.6201263381153694e-14
		 5.3290705182007514e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[69]" -type "matrix" "xform" 1 1 1 0 0 0 0 -5.624500000000026 -4.4853010194856324e-14
		 -4.4408920985006262e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[70]" -type "matrix" "xform" 1 1 1 0 0 0 0 5.3753630101478862 -3.2393315687606616e-06
		 -3.6285843982852839e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[71]" -type "matrix" "xform" 1 1 1 0 0 0 0 -5.3389000000000131 -3.1086244689504383e-14
		 -1.7497114868092467e-12 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[72]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999989 3.3304031334070517e-17
		 -2.691307308379634e-18 -2.775557561562892e-17 0 7.6346570349708429 2.1316282072803006e-14
		 1.7763568394002505e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[73]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999989 3.3304031334070517e-17
		 -2.691307308379634e-18 -2.775557561562892e-17 0 15.26931406994165 -7.1054273576010019e-15
		 -3.5527136788005009e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[74]" -type "matrix" "xform" 0.99999999999999989 1 0.99999999999999989 3.3304031334070517e-17
		 -2.691307308379634e-18 -2.775557561562892e-17 0 22.903971104912479 -7.1054273576010019e-15
		 -3.5527136788005009e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[75]" -type "matrix" "xform" 0.99999999999999989 1 1 -8.2594696501375822e-18
		 2.2407506280251105e-17 -5.5511151231257839e-17 0 6.6981938049878655 1.4210854715202004e-14
		 7.1054273576010019e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[76]" -type "matrix" "xform" 0.99999999999999989 1 1 -8.2594696501375822e-18
		 2.2407506280251105e-17 -5.5511151231257839e-17 0 13.396387609975701 5.6843418860808015e-14
		 1.5987211554602254e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[77]" -type "matrix" "xform" 0.99999999999999989 1 1 -8.2594696501375822e-18
		 2.2407506280251105e-17 -5.5511151231257839e-17 0 20.09458141496356 1.2789769243681803e-13
		 2.3092638912203256e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[78]" -type "matrix" "xform" 1 1.0000000000000002 1 -2.6473841459748752e-18
		 4.3065495539986852e-18 -2.3939183968479938e-16 0 7.3856592178642231 -2.8421709430404007e-14
		 3.5527136788005009e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[79]" -type "matrix" "xform" 1 1.0000000000000002 1 -2.6473841459748752e-18
		 4.3065495539986852e-18 -2.3939183968479938e-16 0 14.77131843572845 -2.8421709430404007e-14
		 8.8817841970012523e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[80]" -type "matrix" "xform" 1 1 1 -2.0504511376028827e-17 -9.3781098359725086e-18
		 8.3266726846886741e-17 0 -7.6346477215712767 -2.5291526455362145e-06 -3.5527136788005009e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[81]" -type "matrix" "xform" 1 1 1 -2.0504511376028827e-17 -9.3781098359725086e-18
		 8.3266726846886741e-17 0 -15.269295443142568 -5.0583052981778565e-06 -3.5527136788005009e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[82]" -type "matrix" "xform" 1 1 1 -2.0504511376028827e-17 -9.3781098359725086e-18
		 8.3266726846886741e-17 0 -22.903943164713866 -7.5874579650303531e-06 -7.1054273576010019e-15 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[83]" -type "matrix" "xform" 0.99999999999999989 1 1 -4.1705235256714307e-17
		 2.3503449204094969e-17 -4.495411966074444e-16 0 -7.3856592178642408 2.8421709430404007e-14
		 1.7763568394002505e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[84]" -type "matrix" "xform" 0.99999999999999989 1 1 -4.1705235256714307e-17
		 2.3503449204094969e-17 -4.495411966074444e-16 0 -14.771318435728453 5.6843418860808015e-14
		 1.7763568394002505e-15 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[85]" -type "matrix" "xform" 0.99999999999999989 1 1.0000000000000002 -4.3368086899420177e-19
		 4.2541382742899993e-17 2.775557561562892e-17 0 6.1538679200920328 1.0658141036401503e-14
		 6.0396132539608516e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[86]" -type "matrix" "xform" 0.99999999999999989 1 1.0000000000000002 -4.3368086899420177e-19
		 4.2541382742899993e-17 2.775557561562892e-17 0 12.307735840184069 3.5527136788005009e-15
		 1.2967404927621828e-13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[87]" -type "matrix" "xform" 0.99999999999999989 1 1.0000000000000002 -4.3368086899420177e-19
		 4.2541382742899993e-17 2.775557561562892e-17 0 18.46160376027612 1.0658141036401503e-14
		 1.8829382497642655e-13 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr -s 88 ".m";
	setAttr -s 88 ".p";
	setAttr -s 88 ".g[0:87]" yes yes yes yes yes no no no no no no no no 
		yes yes yes yes no no no no no no yes yes yes no no no no no no no no no no no no 
		yes yes no no no no no yes yes no no no no no no no no no no no no no no no no no 
		no no no no no no no no yes yes yes yes yes yes yes yes yes yes yes yes yes yes yes 
		yes;
	setAttr ".bp" yes;
createNode groupParts -n "skinCluster1GroupParts";
	rename -uid "BE0A8D00-407F-F9A8-B3EF-D9AF7217477D";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak4";
	rename -uid "0E10A5A9-4A85-A4A6-0571-78B055DA73C8";
createNode objectSet -n "tweakSet4";
	rename -uid "18B581E2-4106-4EE4-8EB9-AE9BF19C1A63";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId78";
	rename -uid "56131968-4409-A8DA-1EE1-CAB23E7E8FD5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts9";
	rename -uid "2CC55F11-4A47-E27F-DF23-CBADE16AE17E";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode polyTweakUV -n "polyTweakUV1";
	rename -uid "11C8DCA0-460B-2FE1-EBB0-189F322E079C";
	setAttr ".uopa" yes;
	setAttr -s 4758 ".uvtk";
	setAttr ".uvtk[0:249]" -type "float2" -0.24364014 0.038194824 -0.24342105
		 0.03776969 -0.2431132 0.037859563 -0.24326698 0.038400739 -0.30271778 0.11358 -0.30226034
		 0.11329096 -0.30202514 0.1135089 -0.30247599 0.11393109 0.071529865 -0.010992103
		 0.071629807 -0.011614912 0.071928911 -0.011582542 0.071928911 -0.010912832 0.072228059
		 -0.011614912 0.072327942 -0.010992103 -0.12788646 0.11428341 -0.12833725 0.11386133
		 -0.12810206 0.11364324 -0.12764469 0.11393231 0.096760102 -0.00280984 0.096913762
		 -0.0022687907 0.096606091 -0.0021789162 0.096386865 -0.002604079 -0.12449997 0.0013466459
		 -0.12408475 0.0014463323 -0.12417734 0.0017455738 -0.12459423 0.0017455738 -0.12408475
		 0.0020448472 -0.12449997 0.0021446892 -0.2432832 0.037279438 -0.24306895 0.03729444
		 -0.30188975 0.11293132 -0.3017047 0.11304055 0.071729571 -0.012230881 0.071928911
		 -0.01222853 0.072128542 -0.012230881 -0.1286577 0.11339292 -0.12847245 0.11328382
		 0.096958257 -0.0017034501 0.0967438 -0.0016887621 -0.35148776 0.10952347 -0.35158753
		 0.10999424 -0.35178703 0.10999647 -0.35178703 0.10955584 -0.35198647 0.10999424 -0.35208631
		 0.10952347 -0.24324653 0.036749169 -0.24313968 0.03673432 -0.30162457 0.11252511
		 -0.3015224 0.11255955 0.071829334 -0.01280401 0.071928911 -0.012812503 0.072028719
		 -0.01280401 -0.12883988 0.11291186 -0.12873755 0.11287741 0.096887484 -0.0011435476
		 0.096780576 -0.0011583919 -0.35168719 0.11051489 -0.35178703 0.11050632 -0.35188675
		 0.11051489 0.086792804 -0.015963485 0.08692237 -0.015565032 0.086770646 -0.015166677
		 0.086426586 -0.015001605 0.086091764 -0.015166677 0.085962191 -0.015565032 0.086114042
		 -0.015963485 0.086457975 -0.016128493 -0.24332523 0.036208581 -0.22608832 0.043904468
		 -0.22578467 0.043481216 -0.22601709 0.043976676 -0.22591732 0.044006467 0.14851414
		 0.042551212 0.14838153 0.042025752 0.14861409 0.042521212 0.14868546 0.04244921 0.096701905
		 -0.00061774801 -0.35178703 0.11105561 0.054896709 0.0021802143 0.054927543 0.0021264465
		 0.055282157 0.0023350869 0.055259041 0.0024043284 -0.14433233 0.10502019 -0.1442706
		 0.10498498 -0.14404674 0.10533025 -0.14410834 0.10538285 -0.48718789 -0.011112117
		 -0.48717463 -0.01119219 -0.48678863 -0.011111554 -0.48678863 -0.011025229 -0.48640278
		 -0.01119219 -0.48638967 -0.011112117 -0.43932351 0.10512184 -0.43938541 0.10506914
		 -0.43916145 0.10472395 -0.43909961 0.1047593 0.11390615 0.00055369205 0.1139292 0.00062296411
		 0.11357432 0.00083147449 0.11354361 0.00077770726 -0.1817717 0.0010186007 -0.18171598
		 0.0010317068 -0.18180293 0.0014176526 -0.18185841 0.0014176526 -0.18171598 0.0018036878
		 -0.1817717 0.0018167661 0.055133294 0.001767715 0.055292718 0.0012851765 0.055505909
		 0.0013102558 0.055436034 0.0018726236 -0.14385842 0.10474979 -0.14346652 0.10440433
		 -0.14328699 0.10452208 -0.1436345 0.104979 -0.48708797 -0.011726465 -0.48698822 -0.012341859
		 -0.48678863 -0.012335228 -0.48678863 -0.011687653 -0.48658913 -0.012341859 -0.48648953
		 -0.011726465 -0.43979755 0.10471807 -0.44014513 0.10426109 -0.43996567 0.10414332
		 -0.43957394 0.10448891 0.11408302 0.0010854847 0.11415277 0.0016476741 0.11393957
		 0.0016728439 0.11378027 0.0011903347 -0.056435842 0.10364561 -0.056535676 0.10410665
		 -0.05673511 0.10411341 -0.05673511 0.10368427 -0.056934662 0.10410665 -0.057034437
		 0.10364561 0.055353858 0.00075636897 0.055461287 0.00074648845 -0.14317621 0.10400641
		 -0.14307563 0.10404554 -0.4868885 -0.012922222 -0.48678863 -0.012928731 -0.486689
		 -0.012922222 -0.44035634 0.10378443 -0.44025588 0.10374522 0.11410814 0.0022114052
		 0.11400077 0.0022015539 -0.056635395 0.10462386 -0.05673511 0.10461739 -0.056834824
		 0.10462386 -0.47615963 0.10695285 -0.47601882 0.10735177 -0.47615966 0.10775062 -0.47649914
		 0.10791588 -0.47683856 0.10775062 -0.47697905 0.10735177 -0.47683841 0.10695285 -0.47649899
		 0.10678748 0.055301275 0.00021045124 0.15808664 0.019218201 0.15840214 0.01881402
		 0.15815574 0.019293929 0.15825486 0.019325269 0.083460748 0.019873668 0.083313748
		 0.019362537 0.083560057 0.019842232 0.083629221 0.019766564 0.11394818 0.0027475364
		 -0.05673511 0.10516797 -0.18143252 0.0014176526 -0.18134458 0.0017169846 -0.18134458
		 0.0011184078 0.3012934 0.036678538 0.30132878 0.036617514 0.30168134 0.036825761
		 0.30165482 0.036904495 -0.81996542 0.099219829 -0.81989473 0.099179946 -0.81967258
		 0.099523872 -0.81974322 0.099583603 -0.096639611 -0.010281992 -0.096624859 -0.010373056
		 -0.096240535 -0.010292531 -0.096240535 -0.010194425 -0.095856421 -0.010373056 -0.095841549
		 -0.010281992 -0.52526337 0.098310791 -0.525334 0.098251119 -0.52511168 0.097907282
		 -0.52504122 0.097946972 0.51850265 0.033911269 0.51852924 0.033990048 0.51817673
		 0.034198225 0.51814139 0.034137204 0.32494593 0.0012488316 0.32500941 0.0012637014
		 0.32492322 0.0016478548 0.32485983 0.0016478548 0.32500941 0.0020319773 0.32494593
		 0.002046847 0.30153167 0.036267392 0.30169317 0.035785768 0.30190617 0.035811841
		 0.30183387 0.036373764 -0.8194899 0.098951325 -0.81909573 0.098607361 -0.81891698
		 0.098725922 -0.81926703 0.099181615 -0.096539833 -0.010895377 -0.096440271 -0.011510697
		 -0.096240535 -0.011503634 -0.096240535 -0.01085615 -0.096041135 -0.011510697 -0.095941387
		 -0.010895377 -0.52573943 0.097908862 -0.52608955 0.097453102 -0.52591068 0.097334482
		 -0.52551669 0.097678609 0.51868194 0.034442071 0.51875418 0.035004012 0.51854122
		 0.035030056 0.51837969 0.034548316 -0.76152521 0.10524981 -0.76162499 0.10570986
		 -0.76182473 0.10571691 -0.76182473 0.10528913 -0.76202422 0.10570986 -0.76212388
		 0.10524991 0.30175677 0.035257135 0.3018643 0.035247713 -0.81880319 0.098210208 -0.81870282
		 0.098249868 -0.096340373 -0.012091781 -0.096240535 -0.012097945 -0.096140876 -0.012091781
		 -0.52630359 0.096977055 -0.52620322 0.096937351 0.5187121 0.035568085 0.51860493
		 0.035558578 -0.76172471 0.10622668 -0.76182473 0.10622053 -0.76192433 0.10622668
		 -0.58075029 -0.015957581 -0.58061093 -0.015558696 -0.58075261 -0.015159774 -0.58109266
		 -0.014994532 -0.58143151 -0.015159774 -0.58157086 -0.015558696 -0.58142918 -0.015957581
		 -0.58108914 -0.016122825 0.30170682 0.034710724 0.44784191 0.012477038;
	setAttr ".uvtk[250:499]" 0.44815868 0.01207478 0.44791096 0.012552951 0.44800994
		 0.012584576 0.28336734 0.013589221 0.28321859 0.013079521 0.28346637 0.013557653
		 0.28353527 0.013481596 0.51855463 0.036104981 -0.76182473 0.10677105 0.32528654 0.0016478548
		 0.32537413 0.0019470972 0.32537407 0.0013485797 -0.26096255 8.692198e-05 -0.26070181
		 -0.00025485712 -0.26041773 -0.00012413462 -0.26063123 0.00033298673 0.092961647 0.10081757
		 0.092772014 0.10034586 0.093015999 0.10015026 0.093329772 0.10063125 -0.1151385 -0.00091636099
		 -0.11504073 -0.001445403 -0.11474723 -0.0013957442 -0.11474723 -0.00082055526 -0.11445391
		 -0.001445403 -0.11435612 -0.00091636099 -0.15028405 0.098496541 -0.15059794 0.098977461
		 -0.15084176 0.098781899 -0.15065223 0.098310173 -0.44030005 -0.012558623 -0.44008642
		 -0.01210156 -0.4403705 -0.011970906 -0.44063145 -0.012312621 0.4921689 -0.0077538001
		 0.49207109 -0.0073317597 0.49177769 -0.0074082841 0.49177769 -0.0078247692 0.49148431
		 -0.0073317597 0.49138641 -0.0077538001 -0.26050803 -0.00067087298 -0.26030374 -0.00062320079
		 0.092500262 0.099944182 0.092634313 0.099782631 -0.11494285 -0.0019949242 -0.11474723
		 -0.0019784938 -0.11455161 -0.0019949242 -0.15097946 0.099345125 -0.1511135 0.099183626
		 -0.43997237 -0.011602459 -0.44017676 -0.011554822 0.49197337 -0.0069456873 0.49177769
		 -0.0070093204 0.49158204 -0.0069456873 -0.26040384 -0.0011421368 -0.26029873 -0.0011386416
		 0.092165291 0.099632673 0.092215188 0.099540234 -0.11484511 -0.0025312228 -0.11474723
		 -0.0025316316 -0.11464953 -0.0025311878 -0.15139864 0.099587515 -0.15144859 0.099495068
		 -0.43996751 -0.011087051 -0.44007248 -0.011083644 -0.023148997 -0.010955881 -0.023246912
		 -0.010501681 -0.023344586 -0.010502333 -0.023344586 -0.010939453 -0.02344238 -0.010501681
		 -0.023540234 -0.010955881 0.24437337 -0.013326692 0.24452968 -0.012943455 0.24441026
		 -0.01256004 0.24408503 -0.01240132 0.24374458 -0.01256004 0.24358834 -0.012943455
		 0.24370776 -0.013326692 0.24403295 -0.013485558 -0.26040682 -0.0016439358 0.37686288
		 0.0098164976 0.37717661 0.0094816778 0.37692475 0.0098986486 -0.11474723 -0.0030231716
		 0.40195963 0.010457661 0.40170786 0.010040903 0.40202162 0.010375631 -0.44007537
		 -0.010581732 -0.023344586 -0.010006955 0.51039433 0.0380118 0.5104112 0.037979044
		 0.51077956 0.038175963 0.51076758 0.038217504 -0.56262672 0.11207226 -0.56259155
		 0.11205003 -0.56235021 0.11239088 -0.56238484 0.11242321 -0.34840709 -0.011589332
		 -0.34839946 -0.011637044 -0.34800816 -0.011561345 -0.34800816 -0.011509998 -0.34761682
		 -0.011637044 -0.34760913 -0.011589332 -0.31356448 0.11378387 -0.31359908 0.11375149
		 -0.31335777 0.11341071 -0.31332257 0.11343291 0.43454126 0.034982547 0.43455291 0.035023905
		 0.43418476 0.035220936 0.43416792 0.035188243 -0.34374231 0.0019810023 -0.34371039
		 0.0019885644 -0.34380454 0.0023800873 -0.3438364 0.0023800873 -0.34371039 0.0027713061
		 -0.34374231 0.0027790735 0.51061344 0.037586581 0.51075143 0.037096415 0.51096559
		 0.037111256 0.5109213 0.03767639 -0.56216925 0.11178312 -0.56179881 0.11142362 -0.56161362
		 0.1115327 -0.56193411 0.11200108 -0.34830749 -0.012212106 -0.34820753 -0.012828015
		 -0.34800816 -0.012825662 -0.34800816 -0.012179681 -0.34780869 -0.012828036 -0.34770885
		 -0.012212106 -0.31401536 0.11336173 -0.31433567 0.11289337 -0.3141506 0.11278427
		 -0.31378013 0.11314385 0.4346948 0.035523649 0.43473932 0.036088791 0.43452486 0.036103662
		 0.43438712 0.03561341 -0.25965491 0.10957272 -0.25975466 0.11004339 -0.25995418 0.11004559
		 -0.25995418 0.10960504 -0.26015365 0.11004339 -0.26025346 0.10957272 0.51078814 0.036565986
		 0.51089489 0.036551114 -0.56153375 0.11101718 -0.56143135 0.11105179 -0.34810793
		 -0.013401151 -0.34800816 -0.013409577 -0.34790847 -0.013401151 -0.31451795 0.11241246
		 -0.31441569 0.11237786 0.43466845 0.036648907 0.43456164 0.036634065 -0.2598545 0.11056404
		 -0.25995418 0.11055562 -0.26005381 0.11056404 -0.15187502 -0.012624776 -0.15174535
		 -0.012226412 -0.15189712 -0.011827996 -0.1522412 -0.01166305 -0.15257603 -0.011827996
		 -0.15270555 -0.012226412 -0.15255378 -0.012624776 -0.15220971 -0.012789779 0.51070946
		 0.036025345 0.19663189 0.041807875 0.19693583 0.041384447 0.1967033 0.041880023 0.19680305
		 0.041909855 0.59467047 0.045562658 0.59453779 0.045037296 0.59477031 0.045532778
		 0.59484172 0.045460567 0.43448296 0.037174679 -0.25995418 0.11110478 -0.3434197 0.0023800873
		 -0.34332722 0.0026792665 -0.34332722 0.0020808093 0.40646592 0.00051484857 0.40653345
		 0.00039734688 0.40687871 0.00058743643 0.40682843 0.00073905324 -0.28141367 0.10540608
		 -0.2812784 0.1053291 -0.28105456 0.10565365 -0.28118983 0.10576876 0.36249569 -0.011433802
		 0.36252415 -0.011608849 0.36289474 -0.011535823 0.36289474 -0.011346969 0.36326522
		 -0.011608849 0.36329374 -0.011433802 -0.11540594 0.10510226 -0.115541 0.10498718
		 -0.11531707 0.10466246 -0.11518213 0.10473959 0.55344296 0.0016329599 0.5534935 0.0017843981
		 0.55314809 0.0019746097 0.55308062 0.0018571061 0.12196561 0.0014116637 0.12208729
		 0.0014399955 0.12200013 0.0018106863 0.12187881 0.0018106863 0.12208729 0.0021811605
		 0.12196561 0.0022095547 0.40670252 0.00010238067 0.40686199 -0.00038015452 0.40707508
		 -0.00035495684 0.40700525 0.00020722917 -0.28093967 0.10513569 -0.28054786 0.10479022
		 -0.28036839 0.10490789 -0.28071585 0.10536487 0.36259541 -0.012048207 0.36269519
		 -0.012663659 0.36289474 -0.012656908 0.36289474 -0.012009457 0.3630943 -0.012663659
		 0.36319408 -0.012048207 -0.1158798 0.10469834 -0.11622731 0.10424147 -0.11604783
		 0.10412373 -0.115656 0.10446934 0.55361998 0.0021646935 0.55368966 0.0027270033 0.55347663
		 0.0027520477 0.55331719 0.0022695453 -0.2693328 0.10329138 -0.26943257 0.10375225
		 -0.26963198 0.10375902 -0.26963198 0.10332999 -0.26983154 0.10375225 -0.26993132
		 0.10329138 0.40692306 -0.00090878416 0.40703061 -0.00091878301 -0.28025752 0.10439232
		 -0.28015688 0.10443126 0.36279485 -0.013244022 0.36289474 -0.013250417 0.36299446
		 -0.013244022 -0.1164388 0.10376491 -0.11633804 0.10372567 0.55364537 0.0032907368
		 0.55353773 0.0032808643 -0.26953232 0.10426944 -0.26963198 0.10426321;
	setAttr ".uvtk[500:749]" -0.2697317 0.10426944 0.23274685 0.10661262 0.23288742
		 0.10701147 0.23274668 0.10741041 0.23240736 0.10757577 0.23206788 0.10741041 0.23192732
		 0.10701147 0.23206794 0.10661262 0.23240744 0.10644738 0.40687048 -0.0014548211 0.17848809
		 0.012397313 0.17880356 0.011993343 0.17855735 0.012473104 0.17865635 0.012504535
		 0.68402016 0.013550032 0.68387294 0.013038842 0.68411911 0.013518695 0.68418831 0.013442964
		 0.55348516 0.0038268683 -0.26963198 0.10481379 0.12230468 0.0018106863 0.12239268
		 0.0021098659 0.12239268 0.0015113511 0.22506694 0.013778392 0.22509648 0.013727126
		 0.22545056 0.013938277 0.22542828 0.014004263 -0.81058925 0.099381126 -0.81053019
		 0.099347629 -0.81030786 0.09969487 -0.81036705 0.099744707 0.23741251 -0.012037951
		 0.23742498 -0.012114208 0.23781163 -0.012032551 0.23781163 -0.011950329 0.23819819
		 -0.012114208 0.23821056 -0.012037951 -0.75146735 0.10910594 -0.75152653 0.109056
		 -0.75130433 0.10870888 -0.75124526 0.10874218 -0.16338964 0.0033214921 -0.16336721
		 0.0033874209 -0.16372123 0.0035986039 -0.16375095 0.0035474889 0.48075682 0.0016561262
		 0.4808099 0.0016685752 0.48072374 0.0020551744 0.48067081 0.0020551744 0.4808099
		 0.0024418063 0.48075682 0.0024542571 0.22530523 0.013367279 0.22546668 0.012885418
		 0.2256797 0.012911489 0.2256074 0.013473587 -0.81011367 0.099112496 -0.80971968 0.098768435
		 -0.80954081 0.098887101 -0.80989105 0.099342801 0.23751235 -0.012651215 0.23761201
		 -0.013266688 0.23781163 -0.013259535 0.23781163 -0.012612045 0.23801106 -0.013266688
		 0.23811087 -0.012651215 -0.75194347 0.10870404 -0.75229365 0.10824832 -0.75211471
		 0.1081298 -0.75172079 0.10847379 -0.16321036 0.0038522037 -0.16313803 0.0044142394
		 -0.16335122 0.0044402764 -0.1635126 0.0039586015 -0.49191049 0.10520899 -0.49201033
		 0.10566901 -0.49220976 0.10567616 -0.49220976 0.10524818 -0.49240938 0.10566901 -0.49250904
		 0.10520899 0.22553036 0.012356961 0.22563769 0.012347577 -0.80942708 0.098371491
		 -0.80932677 0.098411001 0.23771179 -0.013847646 0.23781163 -0.013853843 0.23791128
		 -0.013847646 -0.75250775 0.10777213 -0.75240743 0.10773259 -0.16318008 0.0049783615
		 -0.16328754 0.0049687959 -0.49210998 0.10618568 -0.49220976 0.10617953 -0.4923096
		 0.10618568 -0.42856398 -0.014508879 -0.42842227 -0.014109957 -0.42856175 -0.013711182
		 -0.42890063 -0.013545887 -0.42924047 -0.013711182 -0.42938229 -0.014109957 -0.42924282
		 -0.014508879 -0.42890394 -0.014674177 0.22548024 0.011810586 0.47411156 0.01294945
		 0.47442824 0.012547225 0.47418055 0.013025453 0.47427958 0.013057016 -0.1884827 0.013159025
		 -0.18863136 0.012649233 -0.18838377 0.013127581 -0.18831488 0.01305146 -0.16333762
		 0.0055152373 -0.49220976 0.10673013 0.48109737 0.0020551744 0.48118502 0.002354451
		 0.48118502 0.0017559325 0.1277436 -0.0019558319 0.1280043 -0.002297485 0.12828852
		 -0.0021667962 0.12807494 -0.0017098252 -0.46292132 0.098180182 -0.46311095 0.09770824
		 -0.46286702 0.097512655 -0.46255296 0.097993582 0.25010422 -0.0012557787 0.25020203
		 -0.0017846683 0.25049558 -0.0017350081 0.25049558 -0.0011599393 0.2507889 -0.0017846683
		 0.25088671 -0.0012557787 0.15109676 0.10107886 0.15078267 0.10155965 0.15053888 0.10136422
		 0.15072833 0.10089226 -0.14740051 -0.0036698512 -0.14718713 -0.0032129167 -0.14747116
		 -0.0030821941 -0.14773209 -0.0034237888 -0.46922475 -0.0065293913 -0.46932232 -0.0061074756
		 -0.46961597 -0.0061840275 -0.46961597 -0.0066006058 -0.46990931 -0.0061074756 -0.47000724
		 -0.0065293913 0.12819818 -0.0027136547 0.12840247 -0.0026658641 -0.46338239 0.097306609
		 -0.46324855 0.097145036 0.2502999 -0.0023342823 0.25049558 -0.00231785 0.25069109
		 -0.0023342823 0.15040118 0.10192728 0.15026718 0.10176591 -0.1470731 -0.0027137811
		 -0.14727746 -0.0026662068 -0.46942028 -0.0057212804 -0.46961597 -0.005784946 -0.46981153
		 -0.0057212804 0.12830247 -0.0031847435 0.12840739 -0.0031814224 -0.46371761 0.096995264
		 -0.4636676 0.096902683 0.25039771 -0.0028705171 0.25049558 -0.0028709897 0.25059333
		 -0.0028705171 0.14998205 0.10216966 0.14993216 0.10207717 -0.14706808 -0.0021982805
		 -0.14717306 -0.0021949396 -0.50200498 -0.0087902248 -0.50210291 -0.008336111 -0.50220066
		 -0.0083366763 -0.50220066 -0.0087737907 -0.50229847 -0.008336111 -0.50239623 -0.0087902248
		 -0.46491784 -0.011729205 -0.46479833 -0.011345915 -0.46495461 -0.010962407 -0.46529514
		 -0.010803627 -0.46562022 -0.010962407 -0.46573973 -0.011345915 -0.46558335 -0.011729205
		 -0.46524301 -0.011888019 0.12829944 -0.0036867838 0.35366467 0.0093082031 0.35397843
		 0.0089734746 0.35372663 0.0093903849 0.25049558 -0.0033625297 0.0095671182 0.010715165
		 0.0093154404 0.010298163 0.0096292729 0.010632982 -0.14717607 -0.0016928936 -0.50220066
		 -0.0078414446 0.033788353 0.036076218 0.034161557 0.035870302 0.034315221 0.036411535
		 0.0340074 0.036501385 -0.53342187 0.1133007 -0.53366363 0.11365172 -0.53411436 0.11322972
		 -0.53387922 0.11301157 -0.080014117 -0.013222548 -0.080413267 -0.013143273 -0.080413267
		 -0.013813052 -0.080113865 -0.013845416 -0.080812059 -0.013222548 -0.08071249 -0.013845416
		 -0.34422648 0.10495567 -0.34446818 0.10460465 -0.34401095 0.1043155 -0.34377563 0.10453343
		 0.047857907 -0.0010514861 0.04748461 -0.0012573082 0.047703747 -0.0016825026 0.048011418
		 -0.0015925916 -0.23143955 0.0022980717 -0.23153374 0.0018990467 -0.23111708 0.0018990467
		 -0.23102432 0.0021982891 -0.23143955 0.0015000259 -0.23102432 0.0015997716 0.034359686
		 0.036976699 0.034145258 0.036991574 -0.53443485 0.11276131 -0.5342496 0.11265201
		 -0.080413267 -0.014458915 -0.080213554 -0.014461197 -0.080612592 -0.014461174 -0.34364027
		 0.10395595 -0.34345505 0.10406516 0.047841486 -0.0021727495 0.048056062 -0.0021579068
		 -0.50440806 0.10360429 -0.50410879 0.10363665 -0.50410879 0.10407737 -0.50430828
		 0.10407507 -0.50380951 0.10360429 -0.50390917 0.10407507 0.03428885 0.037536748 0.034182068
		 0.037521899 -0.53461701 0.11228017 -0.53451478 0.11224572 -0.080413267 -0.015042947
		 -0.08031334 -0.015034307 -0.080512792 -0.015034307 -0.34337509 0.10354965 -0.34327284
		 0.10358419 0.047878295 -0.0027029631 0.047985137 -0.0027178712 -0.50410879 0.10458712
		 -0.50420845 0.10459577;
	setAttr ".uvtk[750:999]" -0.50400901 0.10459577 -0.14260963 -0.014512392 -0.14226562
		 -0.014677395 -0.14193083 -0.014512392 -0.14180131 -0.014113935 -0.14195308 -0.013715574
		 -0.14229703 -0.013550507 -0.14263187 -0.013715574 -0.14276145 -0.014113935 0.034103304
		 0.03806258 0.1234898 0.045479737 0.12341847 0.045551945 0.12318599 0.045056477 0.12331853
		 0.045581736 -0.19563338 0.043634038 -0.19573322 0.043604251 -0.19550078 0.043108653
		 -0.19580458 0.043531973 0.047799651 -0.0032437046 -0.50410879 0.10513657 -0.097379588
		 0.003762471 -0.097017065 0.0035383047 -0.096994072 0.0036076687 -0.097348578 0.0038162381
		 -0.86405247 0.10616232 -0.86427635 0.10652498 -0.86433822 0.10647237 -0.86411417
		 0.10612714 -0.44143924 -0.011836533 -0.44183823 -0.011749634 -0.44183823 -0.011835965
		 -0.44145229 -0.011916598 -0.44223732 -0.011836533 -0.44222423 -0.011916598 -0.34068182
		 0.10331022 -0.34090587 0.10294762 -0.34084412 0.10291228 -0.34062022 0.10325764 -0.042388637
		 0.0023243302 -0.042751044 0.0021002113 -0.042720273 0.0020464491 -0.04236554 0.0022550256
		 -0.17267376 0.0016266373 -0.17276059 0.001227616 -0.17270517 0.001227616 -0.17261815
		 0.0016136181 -0.17267382 0.00082853372 -0.17261815 0.00084161258 -0.097142868 0.0041748858
		 -0.096840173 0.0040700631 -0.096770316 0.0046324376 -0.096983507 0.0046574236 -0.86452645
		 0.10589193 -0.86475033 0.10612111 -0.86509782 0.10566425 -0.86491847 0.10554649 -0.44153896
		 -0.012450877 -0.44183823 -0.012412062 -0.44183823 -0.013059634 -0.44163877 -0.013066265
		 -0.44213751 -0.012450877 -0.44203779 -0.013066265 -0.3402079 0.10290641 -0.3404319
		 0.10267721 -0.34003994 0.10233169 -0.33986041 0.10244954 -0.042211827 0.0017926244
		 -0.042514369 0.0016877466 -0.042355049 0.001205237 -0.042141832 0.0012301971 -0.60980278
		 0.10272799 -0.60950357 0.10276677 -0.60950357 0.10319567 -0.609703 0.10318901 -0.60920429
		 0.10272799 -0.60930413 0.10318901 -0.096814953 0.0051961732 -0.096922308 0.0051862309
		 -0.86530912 0.1051877 -0.86520875 0.10514854 -0.44183823 -0.013653142 -0.44173852
		 -0.013646632 -0.44193804 -0.013646632 -0.33974972 0.10193361 -0.33964911 0.10197282
		 -0.04229388 0.00067639723 -0.042186316 0.00066645892 -0.60950357 0.10369988 -0.60960329
		 0.10370625 -0.60940367 0.10370625 -0.3424069 0.10660627 -0.34206736 0.10644116 -0.34172797
		 0.10660627 -0.34158742 0.10700516 -0.34172806 0.10740425 -0.34206754 0.1075694 -0.34240696
		 0.10740425 -0.34254745 0.10700516 -0.096975029 0.0057321154 -0.071014732 0.044373702
		 -0.071084008 0.044449393 -0.071330041 0.043969635 -0.071182914 0.044480767 0.63542491
		 0.01883371 0.63532597 0.01880249 0.6355722 0.01832257 0.63525677 0.018726761 -0.042346392
		 0.00013048101 -0.60950357 0.1042505 -0.17224672 0.0009283399 -0.17233464 0.001227616
		 -0.17224672 0.0015268911 0.46331358 0.0035639983 0.46367508 0.0033381265 0.46370155
		 0.0034168481 0.4633489 0.003625019 -0.12824033 0.10028362 -0.12846245 0.10064744
		 -0.12853298 0.1005877 -0.1283108 0.10024373 0.14056346 -0.011947119 0.14016439 -0.0118594
		 0.14016439 -0.011957655 0.14054854 -0.01203806 0.13976535 -0.011947119 0.13978021
		 -0.01203806 -0.44091216 0.09930528 -0.44113433 0.09894146 -0.44106373 0.098901547
		 -0.44084138 0.099245518 0.39730409 0.0054832906 0.39694279 0.0052572684 0.39697811
		 0.0051961886 0.3973307 0.0054044542 0.12931953 0.0037150625 0.12923357 0.0033160753
		 0.12929681 0.0033160753 0.1293831 0.0037002871 0.12931953 0.0029169894 0.12938318
		 0.0029317648 0.46355194 0.0039751693 0.46385416 0.0038687724 0.46392649 0.0044306908
		 0.4637135 0.0044567622 -0.12871562 0.10001518 -0.12893865 0.10024533 -0.12928861
		 0.099789627 -0.1291097 0.099670984 0.14046369 -0.012560382 0.14016439 -0.012521178
		 0.14016439 -0.013168697 0.14036386 -0.013175759 0.13986515 -0.012560382 0.13996486
		 -0.013175853 -0.44043604 0.098903157 -0.44065863 0.098672941 -0.4402647 0.09832897
		 -0.44008589 0.098447442 0.3974832 0.0049524605 0.39718115 0.0048461854 0.39734259
		 0.0043644463 0.39755547 0.0043904842 -0.43197545 0.10526212 -0.43167615 0.10530144
		 -0.43167615 0.10572929 -0.43187582 0.10572217 -0.43137699 0.10526221 -0.43147677
		 0.10572217 0.46388453 0.004994784 0.46377701 0.004985373 -0.12950285 0.099313535
		 -0.12940246 0.099273987 0.14016439 -0.013763009 0.14026415 -0.013756841 0.14006463
		 -0.013756841 -0.43997204 0.097931765 -0.43987161 0.097971387 0.39740628 0.0038358329
		 0.39751357 0.0038264534 -0.43167615 0.10623267 -0.43177602 0.10623886 -0.43157652
		 0.10623883 0.15517743 -0.014275402 0.15551646 -0.014440605 0.15585633 -0.014275402
		 0.15599805 -0.013876321 0.15585853 -0.01347749 0.15551968 -0.013312311 0.15517977
		 -0.01347749 0.15503806 -0.013876321 0.463727 0.0055318121 0.65110821 0.012951424
		 0.65103912 0.013027391 0.65079165 0.012549158 0.65094018 0.013058959 0.37108672 0.013157159
		 0.37098777 0.013125594 0.3712354 0.012647398 0.3709186 0.013049593 0.39735615 0.0032895203
		 -0.43167615 0.10678333 0.12974785 0.0030167978 0.12966025 0.0033160753 0.12974779
		 0.0036153472 0.52046269 -0.012361208 0.52079397 -0.012607158 0.5210076 -0.012150124
		 0.52072358 -0.012019557 -0.3990179 0.10072438 -0.39864969 0.10091075 -0.39896363
		 0.10139174 -0.39920753 0.10119604 0.6650731 -0.0020888916 0.66468191 -0.0019930829
		 0.66468191 -0.0025681539 0.6649754 -0.0026178127 0.66429067 -0.0020888916 0.6643883
		 -0.0026178127 0.055940252 0.10465331 0.055572037 0.10483992 0.055382401 0.10436811
		 0.05562637 0.10417246 0.096931837 -0.009414658 0.096600249 -0.0096607804 0.096861191
		 -0.010002469 0.097145155 -0.0098717771 0.51010436 -0.0074600019 0.51049572 -0.0075309784
		 0.51049572 -0.0071145492 0.51020223 -0.0070379046 0.51088691 -0.0074600019 0.51078898
		 -0.0070379046 0.52112162 -0.011651087 0.52091718 -0.01160345 -0.39934507 0.1017594
		 -0.39947921 0.10159783 0.66468191 -0.0031508089 0.66487753 -0.0031672432 0.66448635
		 -0.0031672432 0.055110846 0.10396641 0.055244822 0.10380492 0.09705501 -0.010418482
		 0.097259395 -0.010370847 0.51049572 -0.0067155296 0.51030004 -0.0066519566 0.51069117
		 -0.0066519566 0.52112651 -0.011135623 0.52102143 -0.011132299 -0.3997643 0.10200175
		 -0.39981422 0.10190926;
	setAttr ".uvtk[1000:1249]" 0.66468191 -0.003704163 0.66477972 -0.00370354 0.66458398
		 -0.0037035067 0.054775607 0.10365488 0.054825649 0.10356246 0.097159155 -0.010889691
		 0.0972642 -0.010886313 0.4662188 -0.0089438139 0.46641451 -0.0089273853 0.46641451
		 -0.0084902029 0.46631658 -0.0084896972 0.46661001 -0.0089438139 0.46651223 -0.0084897568
		 -0.31736931 -0.01186925 -0.31702876 -0.012028186 -0.31670377 -0.01186925 -0.31658426
		 -0.011485955 -0.31674039 -0.011102572 -0.31708086 -0.010943793 -0.317406 -0.011102572
		 -0.31752551 -0.011485955 0.52101856 -0.010630324 0.67104 0.010384099 0.67097807 0.01046613
		 0.6707263 0.010049371 0.66468191 -0.0041954885 0.47294727 0.0098040486 0.47288528
		 0.0097220773 0.47319907 0.0093871374 0.097156242 -0.011391697 0.46641451 -0.0079950308
		 -0.12048674 -0.0022083749 -0.12011341 -0.0024141641 -0.12010162 -0.0023726542 -0.12047008
		 -0.0021757707 -0.81922776 0.11362563 -0.81946963 0.11397671 -0.8195042 0.11394433
		 -0.81926286 0.11360341 -0.36712092 -0.01158316 -0.36751977 -0.011503771 -0.36751977
		 -0.011555116 -0.36712861 -0.011630871 -0.36791897 -0.01158316 -0.36791134 -0.011630871
		 -0.93149877 0.11284835 -0.93174058 0.11249727 -0.93170559 0.11247505 -0.93146408
		 0.11281589 -0.2177612 -0.00061477901 -0.21813451 -0.000820602 -0.2181177 -0.00085323444
		 -0.21774949 -0.00065628812 0.47992304 0.0042867716 0.47982889 0.0038876876 0.47986072
		 0.0038876876 0.47995487 0.004279118 0.47992304 0.0034888182 0.47995487 0.0034963794
		 -0.12026758 -0.0017830862 -0.11996 -0.0018729627 -0.11991531 -0.0013077636 -0.12012977
		 -0.0012929596 -0.81968528 0.11333655 -0.81992036 0.11355457 -0.82024086 0.11308628
		 -0.82005566 0.11297705 -0.36722079 -0.012205995 -0.36751977 -0.012173511 -0.36751977
		 -0.012819433 -0.36732033 -0.012821904 -0.36781919 -0.012205995 -0.36771944 -0.012821864
		 -0.93104804 0.11242623 -0.93128318 0.11220811 -0.93091261 0.11184868 -0.93072748
		 0.11195786 -0.21760754 -0.0011560124 -0.21791533 -0.0012457052 -0.21777762 -0.0017360443
		 -0.21756323 -0.0017211437 -0.54150045 0.10255467 -0.54120123 0.10258698 -0.54120123
		 0.10302781 -0.54140073 0.10302544 -0.54090202 0.10255467 -0.54100174 0.10302544 -0.11998615
		 -0.00074774184 -0.12009313 -0.000762649 -0.82042313 0.11260518 -0.82032084 0.11257069
		 -0.36751977 -0.013403407 -0.36742026 -0.01339492 -0.3676196 -0.01339492 -0.93064749
		 0.11144232 -0.93054527 0.11147665 -0.21774064 -0.0022662596 -0.21763389 -0.0022810751
		 -0.54120123 0.10353757 -0.54130095 0.10354619 -0.54110146 0.10354619 0.2444929 -0.014961917
		 0.24482775 -0.015127025 0.24517164 -0.014961917 0.24532335 -0.014563619 0.24519402
		 -0.014165199 0.24485911 -0.014000257 0.24451515 -0.014165199 0.24436332 -0.014563619
		 -0.12017178 -0.00022199993 0.63683319 0.0031809325 0.63676178 0.0032530518 0.63652939
		 0.0027575898 0.63666189 0.0032829917 -0.21751861 0.043597173 -0.21761842 0.043567233
		 -0.21738599 0.043071825 -0.21768978 0.043495085 -0.2178195 -0.0028070607 -0.54120123
		 0.104087 0.48033822 0.0035885056 0.48024553 0.0038876876 0.48033822 0.0041870233
		 0.7054891 0.0034890922 0.70585155 0.0032650128 0.70590186 0.0034165054 0.70555627
		 0.0036066892 -0.87221122 0.10627396 -0.87243527 0.10663661 -0.87257022 0.10652162
		 -0.87234622 0.1061969 0.38480297 -0.011216093 0.38440397 -0.011129317 0.38440397
		 -0.011318052 0.38477463 -0.0113912 0.3840051 -0.011216093 0.38403344 -0.0113912 0.018396663
		 0.1060295 0.018172631 0.10566679 0.018307734 0.10558969 0.018531704 0.10591444 -0.061967351
		 0.00030367714 -0.062329624 7.940962e-05 -0.062262256 -3.8188082e-05 -0.061916772
		 0.00015205758 0.38632435 0.0022365109 0.3862375 0.0018374901 0.38635886 0.0018374901
		 0.38644606 0.0022080541 0.38632435 0.0014385579 0.38644612 0.0014668882 0.70572549
		 0.0039015929 0.70602828 0.0037967095 0.7060982 0.0043590525 0.70588499 0.0043841307
		 -0.87268525 0.10600362 -0.87290907 0.10623275 -0.87325668 0.10577576 -0.87307715
		 0.10565808 0.38470319 -0.011830497 0.38440397 -0.011791687 0.38440397 -0.012439261
		 0.38460359 -0.01244589 0.3841047 -0.011830497 0.38420454 -0.01244589 0.018870512
		 0.10562561 0.018646725 0.10539647 0.019038644 0.10505086 0.019218117 0.10516863 -0.061790332
		 -0.00022818051 -0.062093206 -0.00033300056 -0.061933748 -0.00081562565 -0.061720561
		 -0.00079043035 -0.26598021 0.1031048 -0.265681 0.10314354 -0.265681 0.10357253 -0.26588064
		 0.10356583 -0.26538178 0.1031048 -0.26548147 0.10356583 0.70605361 0.0049228189 0.70594609
		 0.0049128523 -0.8734678 0.10529915 -0.87336743 0.1052602 0.38440397 -0.013032764
		 0.38450375 -0.013026316 0.38430431 -0.013026316 0.019328862 0.10465296 0.019429384
		 0.10469202 -0.061872326 -0.0013443168 -0.06176497 -0.0013543161 -0.265681 0.10407671
		 -0.26578084 0.10408308 -0.26558125 0.10408308 0.073489949 0.10575709 0.073829316
		 0.10559177 0.074168801 0.10575709 0.074309424 0.10615593 0.074168928 0.10655485 0.073829323
		 0.10672019 0.073490135 0.10655485 0.073349454 0.10615593 0.70589352 0.0054587303
		 0.13083559 0.012168164 0.13076624 0.012243836 0.13052006 0.011764041 0.13066721 0.012275233
		 -0.074963078 0.012237366 -0.075061783 0.01220597 -0.074815564 0.011726175 -0.075131021
		 0.012130298 -0.061925091 -0.0018903528 -0.265681 0.10462721 0.38675138 0.0015383058
		 0.38666341 0.0018374901 0.38675138 0.0021368254 0.33050546 0.004310824 0.33086693
		 0.004084955 0.33088914 0.0041508167 0.33053508 0.00436188 -0.47412178 0.099116385
		 -0.47434396 0.099479973 -0.47440308 0.099430136 -0.47418082 0.099082828 0.4277333
		 -0.010064553 0.42733422 -0.0099769374 0.42733422 -0.010059185 0.42772084 -0.010140791
		 0.42693526 -0.010064553 0.42694756 -0.010140791 -0.73600733 0.10048112 -0.73622948
		 0.10011727 -0.73617041 0.10008398 -0.73594797 0.10043099 0.22349741 0.013351885 0.22313583
		 0.013126013 0.22316551 0.013074865 0.22351956 0.013285893 0.3396149 0.0035236785
		 0.33952874 0.0031246275 0.33958185 0.0031246275 0.3396681 0.0035111681 0.3396149
		 0.0027256035 0.3396681 0.0027379948 0.33074373 0.0047219954 0.3310461 0.0046156636
		 0.33111838 0.0051775156 0.33090538 0.0052035875 -0.47459754 0.098847769 -0.47482011
		 0.099077985 -0.47517037 0.0986223;
	setAttr ".uvtk[1250:1499]" -0.47499132 0.098503694 0.42763343 -0.010677914 0.42733422
		 -0.010638529 0.42733428 -0.011286168 0.42753375 -0.011293386 0.42703494 -0.010677914
		 0.42713469 -0.011293386 -0.73553127 0.10007913 -0.73575389 0.099848837 -0.73535997
		 0.099504769 -0.73518109 0.099623427 0.22367629 0.012821206 0.22337417 0.012714898
		 0.22353561 0.012233097 0.22374874 0.012259228 0.10720506 0.10557965 0.10750429 0.10561894
		 0.10750429 0.10604683 0.10730483 0.10603972 0.10780349 0.10557965 0.10770381 0.10603972
		 0.33107635 0.0057416372 0.33096889 0.0057321317 -0.47538444 0.098146237 -0.47528404
		 0.098106705 0.42733422 -0.011880538 0.42743409 -0.011874221 0.42723453 -0.011874221
		 -0.73506731 0.099107645 -0.73496693 0.099147223 0.22359931 0.011704546 0.22370678
		 0.011695197 0.10750429 0.10655016 0.10740453 0.10655634 0.10760405 0.10655634 -0.35838696
		 0.10503931 -0.3580471 0.10487398 -0.35770813 0.10503931 -0.35756868 0.10543815 -0.35771042
		 0.10583706 -0.35805041 0.10600244 -0.35838926 0.10583706 -0.3585287 0.10543815 0.33091876
		 0.0062786383 0.4742257 0.012353769 0.47415662 0.012429829 0.47390899 0.011951691
		 0.47405773 0.012461394 0.45205081 0.010502308 0.45195189 0.010470743 0.45219946 0.0099925464
		 0.45188293 0.010394833 0.22354931 0.011158324 0.10750429 0.10710083 0.34004295 0.0028253533
		 0.33995545 0.0031246275 0.34004313 0.0034239027 -0.14770979 -0.0034240966 -0.14737841
		 -0.0036701665 -0.14716484 -0.0032130766 -0.14744884 -0.0030823555 -0.055211607 0.10569845
		 -0.05484359 0.10588504 -0.055157423 0.10636583 -0.055401288 0.10617033 0.28216359
		 -0.00042562268 0.28177232 -0.00032975074 0.28177232 -0.00090485398 0.28206599 -0.00095451361
		 0.28138119 -0.00042562268 0.28147891 -0.00095451361 -0.21977122 0.10031819 -0.22013941
		 0.10050461 -0.22032918 0.10003284 -0.22008502 0.099837318 0.44456789 -9.1632464e-05
		 0.44423634 -0.000337604 0.44449735 -0.00067944365 0.44478136 -0.00054872205 -0.10944273
		 -0.0074513606 -0.10905156 -0.0075225737 -0.10905156 -0.0071059065 -0.109345 -0.0070293541
		 -0.10866022 -0.0074513606 -0.10875797 -0.0070293541 -0.14705086 -0.0027140663 -0.1472552
		 -0.0026663104 -0.055538923 0.10673352 -0.055673037 0.10657195 0.28177232 -0.0014876939
		 0.28196794 -0.0015041264 0.28157684 -0.0015041264 -0.22060072 0.099631026 -0.22046651
		 0.099469595 0.44469106 -0.0010954605 0.44489539 -0.0010478483 -0.10905156 -0.0067068539
		 -0.10924719 -0.0066433121 -0.10885595 -0.0066433121 -0.14704575 -0.0021985676 -0.14715096
		 -0.0021950938 -0.055957988 0.1069759 -0.056008134 0.10688341 0.28177232 -0.0020408956
		 0.28187022 -0.0020402703 0.28167474 -0.0020402703 -0.22093567 0.099319704 -0.22088565
		 0.099227346 0.44479543 -0.0015666329 0.44490033 -0.0015632574 -0.35838506 -0.0096785016
		 -0.35818943 -0.0096620731 -0.35818943 -0.0092250453 -0.35828719 -0.0092245443 -0.35799375
		 -0.0096785016 -0.35809168 -0.0092245443 -0.48564312 -0.012675007 -0.48531777 -0.012833842
		 -0.48497745 -0.012675007 -0.48482123 -0.01229165 -0.48494068 -0.011908203 -0.48526576
		 -0.011749451 -0.48560619 -0.011908203 -0.48576251 -0.01229165 -0.14715384 -0.0016932072
		 0.29623169 0.0088977162 0.29616973 0.0089798998 0.29591793 0.0085628964 0.28177232
		 -0.0025323774 0.38138062 0.010881392 0.38131872 0.01079942 0.38163248 0.010464631
		 0.44479242 -0.0020685256 -0.35818943 -0.0087297168 -0.36129662 -0.0075531043 -0.36126861
		 -0.0055076783 -0.3620491 -0.0054213437 -0.36249554 -0.0076535093 0.25754446 -0.043095965
		 0.25622177 -0.043287668 0.25622177 -0.045799904 0.2573958 -0.045494005 -0.3598989
		 -0.0044725682 -0.35907373 -0.008142909 -0.3571004 -0.0071831057 -0.35832566 -0.0042849383
		 0.47585475 0.031544991 0.48320973 0.040943868 0.47755638 0.044782352 0.47271958 0.034505319
		 0.46777856 0.047732882 0.46744889 0.041419078 0.019713638 0.081991702 0.020980211
		 0.078137718 0.025987392 0.080745667 0.025528293 0.084488072 0.021525184 0.073126674
		 0.026227061 0.07592351 -0.31732541 -0.10171457 -0.32372794 -0.10214847 -0.32372794
		 -0.10609119 -0.31731817 -0.1067542 0.0030282917 0.06457933 0.0061864974 0.061007004
		 0.01055995 0.066752844 0.0058924006 0.067557208 0.015018609 0.075611919 0.017238328
		 0.06995295 0.013139091 0.080259576 0.15289064 0.0088115474 0.15101315 0.0083188424
		 0.15132365 0.0068735229 0.15289584 0.0076968707 0.15206003 0.0056023169 0.15332949
		 0.0072152335 0.15383981 0.0047317543 0.15583582 0.0052317842 0.15499359 0.0070090154
		 0.15404083 0.0067986152 0.15554444 0.0075415689 0.15575078 0.0087570539 0.15448985
		 0.0091464017 0.15433356 0.007698725 -0.42431802 -0.10903542 -0.42429146 -0.10439661
		 -0.42643005 -0.10381736 -0.42643005 -0.10837757 0.62198508 -0.060475171 0.61817324
		 -0.060112778 0.61817324 -0.067865901 0.62201732 -0.068205446 -0.42088813 -0.10898919
		 -0.42014778 -0.104632 0.02366592 0.066975407 0.027802231 0.070365675 0.027326752
		 0.060178846 0.031707697 0.063143693 -0.31658247 -0.088986263 -0.32372794 -0.09055046
		 -0.32372794 -0.097326413 -0.31677744 -0.096188694 -0.084289916 -0.1332778 -0.088980824
		 -0.1383173 -0.084086396 -0.14203481 -0.079445563 -0.13679892 -0.10007445 -0.12884575
		 -0.10347204 -0.12558153 -0.10602542 -0.13339937 -0.10362663 -0.13554005 0.61817324
		 -0.075482212 0.62144291 -0.076087743 -0.11094093 -0.13846943 -0.10921992 -0.14073794
		 -0.10887901 -0.13097551 -0.10564596 -0.12335094 0.054415312 0.032465458 0.04880251
		 0.029429896 0.050603211 0.024264524 0.057340842 0.027795069 0.050782163 0.015812393
		 0.055353031 0.012324033 0.060249791 0.016479708 0.058652453 0.021325599 -0.88815308
		 0.045612987 -0.8941077 0.044373106 -0.8941077 0.039125953 -0.88702726 0.040291585
		 -0.8941077 0.032922581 -0.8941077 0.028215211 -0.8872782 0.029025381 -0.88749695
		 0.033763848 -0.56480485 0.077704005 -0.56026936 0.074106745 -0.55835789 0.077438019
		 -0.56255716 0.081960246 0.62974894 0.023610881 0.6302703 0.029573994 0.62378591 0.029818993
		 0.62372541 0.024361428 0.042725731 0.025918068 0.044251285 0.021196453 0.64359301
		 -0.042736035 0.638197 -0.046059098 0.63853329 -0.046935875 0.64436793 -0.044190194
		 0.63368303 -0.046349734 0.63359767 -0.049747251 0.61817324 -0.086193278 0.62117654
		 -0.086382583 0.61817324 -0.095067784;
	setAttr ".uvtk[1500:1749]" 0.62100863 -0.095576219 0.62215698 -0.096832998 0.62314886
		 -0.086732 0.62364972 -0.077884294 -0.10661867 -0.14250672 -0.1111872 -0.14916821
		 -0.10930979 -0.15011631 0.6247611 -0.095607713 0.62504995 -0.087255768 -0.11103444
		 -0.15812142 -0.10868095 -0.15824075 -0.10617026 -0.15135528 -0.10282733 -0.14484951
		 -0.1051098 -0.15882413 -0.10170428 -0.15338054 -0.10021931 -0.16057388 -0.095627472
		 -0.16307518 -0.092552088 -0.15826391 -0.096926771 -0.15579286 0.033091277 0.049448531
		 0.029862426 0.054367326 0.024644893 0.051273007 0.02834112 0.046460353 0.03499686
		 0.057725802 0.03823445 0.05312559 0.036322474 0.044761866 0.039656132 0.040110148
		 0.04450155 0.043828811 0.041421209 0.048929267 -0.3314783 0.072126269 -0.33792275
		 0.0730028 -0.33792275 0.067192093 -0.33168882 0.067027278 -0.33792275 0.06250558
		 -0.33792275 0.057828877 -0.3310391 0.057480827 -0.33147407 0.062323518 -0.16878061
		 0.098809958 -0.17164719 0.098326646 -0.17211586 0.09496779 -0.16907193 0.0952911
		 -0.17259078 0.09043467 -0.16897181 0.090329148 -0.54797983 -0.11690983 -0.54860014
		 -0.11292647 -0.55164659 -0.11445481 -0.55114323 -0.11797374 -0.54531777 -0.11017674
		 -0.54519355 -0.11531553 -0.54333121 -0.11942896 -0.54200858 -0.1117407 0.012776772
		 0.08970315 0.007922776 0.088052601 0.0078175273 0.084841199 0.012918244 0.087177902
		 0.012985046 0.08411143 0.017918428 0.085745648 0.017009664 0.088861592 0.016538136
		 0.091302812 0.019829694 0.093550146 0.021326143 0.091205142 0.016717682 0.043588322
		 0.014043466 0.043588322 0.013781928 0.038437668 0.016428258 0.037651721 -0.5061053
		 -0.0099034542 -0.50823027 -0.0084213465 -0.51330644 -0.0081852823 -0.51348078 -0.013530855
		 0.63409203 0.018324291 0.62905592 0.017844381 0.6292522 0.013426485 0.63404608 0.012978762
		 0.63448423 0.028724207 0.63428289 0.023878483 0.63353354 0.03430124 0.63624424 0.032778535
		 -0.8941077 0.048080232 -0.88939941 0.049083989 -0.55609196 0.099115901 -0.55881411
		 0.097865365 -0.55891174 0.094821632 -0.55618972 0.095750064 -0.53635925 -0.13487794
		 -0.53998184 -0.13556153 -0.53888071 -0.13831919 -0.53592789 -0.13804755 -0.53731638
		 -0.12009399 -0.53976572 -0.12036497 -0.54058617 -0.12693234 -0.53663266 -0.12630232
		 -0.37525252 -0.023509393 -0.37929133 -0.019114714 -0.38203356 -0.020919768 -0.37807426
		 -0.024439324 -0.28947827 0.042421959 -0.29402369 0.041342925 -0.29438448 0.038291276
		 -0.29031962 0.039670873 -0.090231158 -0.10794219 -0.09119413 -0.1068621 -0.094614148
		 -0.11004874 -0.093520448 -0.11089057 -0.18367238 -0.13385557 -0.18689828 -0.13390316
		 -0.18612143 -0.13735408 -0.18296768 -0.13726689 0.812038 0.0080451956 0.80876875
		 0.0086856959 0.80883932 0.0052743638 0.81192011 0.004988099 0.12957889 -0.028251965
		 0.12538444 -0.02702512 0.12505423 -0.030209383 0.12875648 -0.031371564 0.13385737
		 -0.030840702 0.13287441 -0.033944719 -0.18936293 -0.17660449 -0.18768381 -0.17699787
		 -0.18695116 -0.17450702 -0.18878864 -0.17353749 0.11740558 -0.049064435 0.11573587
		 -0.051898282 0.11720366 -0.053771578 0.11921439 -0.05058125 -0.18460488 -0.16652966
		 -0.18448181 -0.16174099 -0.18677311 -0.16180895 -0.18676762 -0.16622536 -0.18537208
		 -0.17711523 -0.18503812 -0.17498744 0.81224126 -0.034574013 0.81414467 -0.034261983
		 0.81336391 -0.031893265 0.81177706 -0.032446183 0.81099796 -0.019199755 0.8111794
		 -0.023988422 0.81310374 -0.023684803 0.81306428 -0.019215673 0.21162364 0.039865755
		 0.2096521 0.036601432 0.2116601 0.035570491 0.21345843 0.038377367 0.24735205 -0.037179921
		 0.24637161 -0.039309796 0.24797057 -0.040688597 0.24938966 -0.038183063 0.20986286
		 0.025968356 0.21066833 0.029742057 0.20840459 0.0297735 0.20820294 0.026812347 -0.59565461
		 0.092176564 -0.59768814 0.092165232 -0.59804225 0.090297274 -0.59544104 0.090294085
		 0.31700096 0.042559985 0.3162089 0.039262462 0.31932849 0.039259076 0.31922871 0.042507682
		 0.63736993 0.010874791 0.64015794 0.010881157 0.6396699 0.014103753 0.6370644 0.01412257
		 0.32571027 0.0097602662 0.32759273 0.01043057 0.32762244 0.01234052 0.32576185 0.012792783
		 -0.4564428 0.033809233 -0.45095447 0.031804547 -0.44987819 0.037481558 -0.45564038
		 0.037682611 0.11656649 -0.088750027 0.11587621 -0.085053623 0.10935292 -0.087231956
		 0.11024681 -0.092908964 0.64117706 -0.064245217 0.6460464 -0.062851317 0.64521384
		 -0.059253283 0.63957036 -0.061021335 0.65220517 -0.062082332 0.65204257 -0.058157131
		 0.63057715 0.00053602597 0.63353628 0.00073828397 0.63342422 0.0039883624 0.63017285
		 0.0042711073 -0.50962698 -0.026975719 -0.50840616 -0.023520323 -0.51315296 -0.02252139
		 -0.51355267 -0.025771309 0.11490198 -0.076594174 0.11383115 -0.07253664 0.10756807
		 -0.070526555 0.10691547 -0.072009981 0.62547308 0.0029043036 0.62654412 -0.00080183934
		 0.63428795 -0.0025500772 0.63134217 -0.0031048977 0.63204259 -0.0065874569 0.63505781
		 -0.0056316834 0.041728757 0.023465944 0.042228263 0.027869144 0.039866712 0.028397614
		 0.040053774 0.024635242 0.037623744 0.027953634 0.038576771 0.023535443 0.23194732
		 -0.05046599 0.23302491 -0.052443143 0.23566473 -0.051345225 0.23422356 -0.04870528
		 0.22851253 -0.05396989 0.22755554 -0.051690549 0.23005801 -0.035327811 0.22991432
		 -0.030829579 0.2265466 -0.033568248 0.2269855 -0.037784338 0.63943559 -0.086327344
		 0.64254403 -0.085648395 0.64482546 -0.081376798 0.64116877 -0.082748502 0.65075099
		 -0.068881057 0.65201706 -0.065686189 0.6463241 -0.06642881 0.64638108 -0.069251731
		 -0.51801097 -0.045119092 -0.52185917 -0.046278361 -0.52147049 -0.049765181 -0.51802194
		 -0.048993777 -0.5200904 -0.06383694 -0.52035904 -0.068989746 -0.5180158 -0.068051644
		 -0.51795346 -0.063740492 -0.5158602 -0.069392622 -0.51590109 -0.065442801 0.26516232
		 -0.070834734 0.27086982 -0.070266403 0.26878944 -0.065332107 0.26357266 -0.067500018
		 0.27444237 -0.065512195 0.27465099 -0.069912031 0.27816239 -0.08385209 0.2751177
		 -0.082953386 0.27644762 -0.086454488 0.27915177 -0.087155439 0.11999573 0.0040068463
		 0.12347918 0.001568948 0.12355881 0.0059172502 0.12063579 0.0074333386 0.627321 -0.0034062734
		 0.62912995 -0.0073143519 0.50453126 -0.0089351637;
	setAttr ".uvtk[1750:1999]" 0.51499063 -0.018581463 0.5230732 -0.0082526524 0.50871342
		 0.0038319519 -0.36154681 -0.021691676 -0.36154681 -0.023047598 -0.35817158 -0.023002937
		 -0.35833454 -0.021535851 0.51332802 0.011273981 0.50415301 0.026723733 0.49771163
		 0.015938088 0.49287969 0.003398461 0.02898854 0.12171112 0.026699251 0.12321746 0.026141616
		 0.12086818 0.028760601 0.11899896 0.025805967 0.11872375 0.028532663 0.116879 0.031367134
		 0.11509564 0.032136094 0.11762606 0.033263694 0.12096708 0.03526853 0.12221912 0.035912428
		 0.11824988 0.03692513 0.12025974 0.0051466119 0.11329298 0.0068828901 0.11544232
		 0.004949295 0.11718515 0.0038510293 0.11527789 0.62643099 -0.0021569545 0.62839162
		 -0.002628102 0.63095474 -0.00042709991 0.62800884 0.0004714285 0.52426988 0.011024326
		 0.52466035 0.013727156 0.52173913 0.013714327 0.5215379 0.010490346 0.5182811 0.01353167
		 0.5182811 0.010411736 0.5182811 0.0077437665 0.52083123 0.0075281747 -0.24436837
		 0.15968889 -0.24079968 0.15402494 -0.23868431 0.15533233 -0.2423436 0.16116588 -0.24631715
		 0.15806562 -0.24288589 0.15273559 0.19582438 0.079425089 0.19279641 0.074273214 0.19488263
		 0.072983898 0.19812466 0.078430846 0.19359061 0.080583945 0.19068053 0.075580962
		 0.17992954 0.058161825 0.17661558 0.052740328 0.17868647 0.051460415 0.18201189 0.05687492
		 0.18068913 0.050222717 0.18403555 0.055624265 -0.2321799 0.13528864 -0.22883518 0.12988606
		 -0.22683251 0.13112378 -0.23015621 0.13653928 -0.22476156 0.13240369 -0.22807395
		 0.1378262 0.17290777 0.04647667 0.1690235 0.040301327 0.17108153 0.039029378 0.17496786
		 0.04520341 0.17306033 0.037806485 0.17695071 0.04397792 -0.22491206 0.12375546 -0.22113
		 0.11751693 -0.21915121 0.11873988 -0.22292916 0.12498089 -0.21709318 0.12001184 -0.22086892
		 0.1262542 0.18692607 0.069500171 0.18360738 0.064071417 0.18570061 0.062777698 0.18903063
		 0.068199597 0.1877448 0.061514348 0.19109541 0.066923454 -0.23914863 0.14664407 -0.23579924
		 0.14123441 -0.23375496 0.1424977 -0.23708384 0.14792028 -0.23166162 0.14379153 -0.23497944
		 0.14922088 0.024919881 0.037071265 0.01396131 0.047202375 0.0041102786 0.035277065
		 0.013845875 0.022919834 0.15419316 0.011492735 0.15587059 0.010149876 0.1576131 0.012891644
		 0.15564889 0.014105558 -0.20386772 0.08990518 -0.20218897 0.0912489 -0.20378256 0.093776494
		 -0.20574673 0.092562668 0.56707078 0.029805943 0.57953453 0.021598572 0.59025306
		 0.035295729 0.57591748 0.041774802 0.49221647 -0.036621239 0.49748459 -0.040952075
		 0.50516367 -0.031138988 0.49850199 -0.0257609 0.4877831 -0.019303596 0.027027087
		 0.12720463 0.027377173 0.12913495 0.025966726 0.1296583 0.025036387 0.12746641 0.029075548
		 0.12465378 0.031560175 0.1255441 0.63003719 -0.011053937 0.63393098 -0.0082056522
		 0.63245201 -0.0067093521 0.63010359 -0.0079348683 0.63106376 -0.005336937 0.62914664
		 -0.0060736672 -0.36002424 -0.0024345876 -0.36088663 -0.0019799508 -0.36142895 -0.0041015386
		 -0.15527023 0.036229525 -0.15751731 0.036574073 -0.15755093 0.03569277 -0.15577815
		 0.035314985 0.25622177 -0.039406508 0.25622177 -0.041591577 0.2578629 -0.041461244
		 0.2579717 -0.039145544 -0.35818085 -0.030896423 -0.35833427 -0.027974032 -0.36154681
		 -0.028308628 -0.36154681 -0.031094024 0.017701492 0.11472433 0.020388646 0.11293183
		 0.022659836 0.1151712 0.01987935 0.11661462 0.023381082 0.11036184 0.025417956 0.11270319
		 0.026500998 0.10802049 0.028139569 0.11022923 0.010831016 0.10050724 0.0099143405
		 0.10476468 0.005956213 0.1006756 0.0071515217 0.098193124 0.013277418 0.10195354
		 0.011911935 0.10694269 0.31944355 0.0066412035 0.31918782 0.0034135731 0.32284299
		 0.0024343922 0.32302356 0.0074998681 0.3154636 0.0063968473 0.3154636 0.0036359185
		 -0.36154681 -0.025327073 -0.3582502 -0.025084347 0.024552995 0.1170229 0.021976709
		 0.11881268 0.023450987 0.12049989 0.027316315 0.11479583 0.030110873 0.11232324 0.0052004815
		 0.10819125 0.0031812743 0.10582176 0.0047154604 0.10322117 0.006859459 0.10597774
		 0.0072863493 0.11064858 0.0064073619 0.10814666 0.0070371912 0.10816358 0.0076274145
		 0.10993212 0.65673864 0.004343987 0.65820622 0.00067788566 0.66165745 0.00061832462
		 0.66022843 0.0056709284 0.3154636 -0.0018578874 0.31910989 -0.0017468503 -0.18647474
		 -0.14149298 -0.18656415 -0.14597604 -0.18371841 -0.14608482 -0.18332809 -0.14162901
		 0.8095538 0.00091223436 0.81009924 -0.0035436277 0.81244707 -0.0036877745 0.81231314
		 0.00080308371 -0.29634428 0.033119693 -0.29393265 0.030049589 -0.29125088 0.032090649
		 -0.29298761 0.035289675 0.56350213 -0.0022852272 0.56519705 -0.0051302337 0.56672096
		 -0.0042200126 0.5653823 -0.0016203152 -0.28836197 0.033524606 -0.28968257 0.036763459
		 -0.18075597 -0.10351786 -0.18101007 -0.10753618 -0.17825729 -0.10767477 -0.17783485
		 -0.10394838 -0.53800929 -0.16129971 -0.53791511 -0.16450509 -0.53593582 -0.1647073
		 -0.53602833 -0.16129398 -0.53850031 -0.14171188 -0.53827614 -0.14543819 -0.53569633
		 -0.14536697 -0.53577471 -0.14145993 0.12392768 -0.033010654 0.12256885 -0.036225002
		 0.12544547 -0.037498698 0.12729383 -0.03430026 0.12767452 -0.039587643 0.13038167
		 -0.036569137 -0.36010391 -0.0075400569 -0.3603459 -0.0053475685 -0.3607561 -0.0057266816
		 -0.36067414 -0.007479039 0.47407368 -0.011100773 0.4744007 -0.012530628 0.47482571
		 -0.01226073 0.47473982 -0.010926629 0.093668677 0.0088933902 0.090005361 0.015105134
		 0.084173366 0.0078833206 0.088453986 0.0022295634 0.62926614 -0.0057281139 0.63047791
		 -0.00492738 0.62990767 -0.0045286273 0.62938255 -0.0053917621 -0.010965076 0.014443063
		 -0.010466007 0.015606843 -0.011765462 0.015350727 -0.011669341 0.014687427 -0.36883172
		 0.10088765 -0.36918938 0.10043021 -0.36861598 0.10029786 -0.36846 0.10028566 0.6268788
		 -0.0050492636 0.62742978 -0.0056533413 0.62812644 -0.0054438431 0.62749761 -0.0050639054
		 0.62793505 -0.013707392 0.62788701 -0.01413759 0.62926942 -0.013684253 0.62934083
		 -0.013354168 0.029324122 0.12696186 0.029462198 0.12866484 0.029041154 0.12888131
		 0.028872401 0.1271555 0.029393408 0.12708886 0.029217714 0.12668565;
	setAttr ".uvtk[2000:2249]" 0.02920061 0.12623124 0.02967706 0.12692414 0.62800878
		 -0.0061634448 0.62671399 -0.0058686323 0.62613744 -0.0080344602 0.62788707 -0.0080969958
		 0.62839723 -0.0058607478 0.62877548 -0.0055658957 0.63353258 -0.0043228786 0.63095063
		 -0.0043526194 0.63040692 -0.004365568 0.62987751 -0.0043779705 0.63001484 -0.0035393049
		 0.63225746 -0.0021568893 -0.011853587 0.013993694 -0.011782628 0.013504822 -0.36859164
		 0.10240985 -0.36812782 0.10134982 -0.15559036 0.038192164 -0.15777667 0.038654417
		 -0.49972031 0.099024162 -0.49698296 0.099358395 -0.49789253 0.10015081 -0.49943975
		 0.0996655 0.47524896 -0.011854029 0.47527915 -0.010611683 0.47473982 -0.010926629
		 0.47482571 -0.01226073 0.47362578 -0.010583985 0.47407368 -0.011100773 0.62829775
		 -0.011269999 -0.052977242 -0.00093766203 -0.05299782 0.0011984715 -0.053544793 0.0011109567
		 -0.053474024 -0.0009429956 0.029738599 0.13021778 0.029266549 0.13034074 -0.57707858
		 0.11044908 -0.5774104 0.11055288 -0.57763439 0.10894938 -0.57730889 0.10873215 -0.49710324
		 0.096281059 -0.49711117 0.096649945 -0.49933439 0.096644923 -0.49920201 0.096214317
		 -0.052979726 0.0020761222 -0.053489458 0.0019954627 0.21236707 0.082539283 0.21645151
		 0.079107873 0.2165487 0.080134504 0.21342731 0.083297074 0.07404539 0.10081036 0.073506221
		 0.10452795 0.072106123 0.10445731 0.072762176 0.10026985 -0.77761984 0.063061245
		 -0.77588737 0.060704965 -0.77504981 0.061148092 -0.77700907 0.064322583 0.0071052625
		 0.10724131 -0.7742722 0.056720681 -0.77540493 0.05719097 0.011332168 0.1152713 0.0085569769
		 0.11269204 0.010444502 0.11060879 0.013934289 0.11193585 0.5182811 0.021407526 0.5182811
		 0.017044682 0.52182168 0.017202033 0.52192742 0.021097753 0.62956452 -0.003748565
		 0.62912631 -0.0039520832 0.0022365998 0.11120142 0.0019155174 0.11363865 -0.20003329
		 0.090919979 -0.1981477 0.093200192 -0.20080584 0.095223427 -0.20156725 0.092805825
		 0.46898314 -0.015732998 0.46896091 -0.018158564 0.47136012 -0.016618695 0.47399011
		 -0.013052872 -0.15179008 0.0095534138 -0.14856517 0.0073722508 -0.14806624 0.010517957
		 -0.15139721 0.012750731 0.066967063 0.0092599429 0.064759947 0.0089834211 0.065413728
		 0.0036460308 0.067545548 0.0067689526 0.094524033 -0.012754149 0.094424598 -0.01617766
		 0.09587007 -0.017661614 0.096620925 -0.016962089 -0.020960456 -0.020243814 -0.020790383
		 -0.022594783 -0.020515146 -0.022996426 -0.018431354 -0.019033199 0.21133882 0.087566309
		 0.21037097 0.087052785 0.16453187 0.068245083 0.16597259 0.066539779 0.16656967 0.069828212
		 0.16488728 0.069939777 0.90816277 0.011357266 0.90879232 0.0113426 0.90909535 0.013498349
		 0.90813702 0.01410942 -0.14625837 0.0058464319 -0.14646395 0.0076226941 -0.7840336
		 0.090248615 -0.78403032 0.086863384 -0.78153938 0.086344056 -0.78272742 0.089680478
		 0.16548067 0.073202707 0.16788283 0.074104831 -0.14719436 0.012604695 -0.14986327
		 0.015954433 -0.07719259 0.0015992684 -0.076467566 0.0040167975 -0.078431904 0.0065964642
		 -0.078055687 0.00095943437 0.75526065 0.0071839103 0.75297457 0.0064206454 0.7526933
		 0.0042154696 0.75596988 0.0042076847 0.75297457 0.002012084 0.75526065 0.0012461485
		 0.0060032313 0.11191126 0.0033554588 0.10957335 0.0087532243 0.11765826 0.056917004
		 0.11140595 0.057613701 0.11027616 0.059446558 0.11027683 0.058587741 0.11185487 0.2589542
		 0.07484065 0.25903597 0.072218545 0.2609399 0.071760692 0.26065534 0.074993581 0.43739489
		 0.0221559 0.43617007 0.020287504 0.43820035 0.019478686 0.43906718 0.021073021 -0.066575915
		 -0.058430564 -0.066706896 -0.060128883 -0.064446561 -0.059108231 -0.064610466 -0.057887893
		 0.27513486 -0.074644268 0.27243438 -0.074395522 0.27371234 -0.078260295 0.27635565
		 -0.078976117 0.63533449 -0.014456213 0.633672 -0.010812288 0.63111424 -0.011413265
		 0.63310534 -0.014810572 0.12667562 0.016113771 0.12398705 0.016068121 0.12293889
		 0.012051924 0.12564334 0.011472018 0.22999142 -0.041989751 0.23069017 -0.047125168
		 0.2329376 -0.045438141 0.23221652 -0.040988673 0.22709563 -0.048512079 0.227061 -0.043414157
		 0.64665109 -0.077739768 0.64884919 -0.072749645 0.64559358 -0.072660588 0.6435762
		 -0.077610418 -0.51782036 -0.054490864 -0.52089518 -0.054100398 -0.52022302 -0.059613623
		 -0.51790583 -0.059749652 0.27117744 -0.079385988 0.26834968 -0.075111344 -0.060527194
		 -0.026692385 -0.062106367 -0.026044901 -0.062064469 -0.031335119 -0.060149781 -0.032299075
		 0.40633908 -0.023235075 0.40462777 -0.029015871 0.40660241 -0.030713605 0.41023979
		 -0.028086381 -0.10781546 -0.16355439 -0.11152306 -0.16298577 -0.11204758 -0.16612074
		 -0.10967561 -0.16675416 0.041263614 0.029437095 0.045945249 0.03261143 0.042985845
		 0.036066871 0.038788505 0.032924462 0.047992859 0.039901178 0.051545039 0.03622416
		 -0.33136895 0.082046449 -0.33792275 0.08323206 -0.33792275 0.077986248 -0.3317216
		 0.077009887 0.011801154 0.1093137 0.0091174738 0.11125286 -0.021228036 -0.023661954
		 -0.020721436 -0.024103383 0.034445461 0.11431464 0.03520637 0.11636673 0.0068775164
		 0.11081285 0.0097628776 0.10645975 0.01201379 0.10710716 0.0076563237 0.10735448
		 0.33888218 -0.022334011 0.34274694 -0.022565067 0.34204739 -0.020574201 0.34086004
		 -0.020606931 -0.59782457 0.098416619 -0.59744304 0.097224459 -0.59570926 0.09715122
		 -0.59579611 0.098438673 0.15234481 0.010366036 0.15083709 0.0096268868 0.34028524
		 -0.025048649 0.34223357 -0.025021866 -0.36592084 -0.035542812 -0.36966962 -0.035573728
		 -0.36938518 -0.03786293 -0.36660406 -0.037960108 0.15675087 0.010198569 0.15454145
		 0.01067816 0.68791962 0.015626559 0.68805373 0.014219422 0.68883491 0.013327928 0.69009089
		 0.013968197 -0.36781698 -0.03375008 -0.36928013 -0.033678863 -0.089435488 -0.12096167
		 -0.084378511 -0.122921 -0.081824623 -0.11829063 -0.087325767 -0.11579217 -0.18232259
		 -0.12788005 -0.18553399 -0.12603475 -0.18454266 -0.13006783 -0.1827164 -0.13045873
		 0.43594599 -0.044723395 0.437112 -0.040462881 0.4361538 -0.039934758 0.43463799 -0.041605268
		 -0.82359838 0.098664813 -0.82599288 0.10436048 -0.82631898 0.10159893 -0.8242389
		 0.096337229 -0.085254155 -0.11173325 -0.081037231 -0.11421648 0.041071318 0.0014912916;
	setAttr ".uvtk[2250:2499]" 0.043443874 0.0034997952 0.039002959 0.0075140116
		 0.03654322 0.0053963992 0.62944835 0.0098463325 0.63354838 0.0097745797 -0.50682807
		 -0.017060446 -0.5134089 -0.016734952 0.63998771 -0.049797352 0.63653058 -0.055428974
		 0.64604592 -0.046973381 -0.44729218 0.054101616 -0.45331547 0.056544263 -0.4569515
		 0.051322576 -0.45449916 0.043477688 0.26890457 -0.061812494 0.27430555 -0.062839724
		 0.26162383 -0.064171582 0.65521449 -0.067090079 0.65715224 -0.063743308 0.64263153
		 -0.067436576 -0.51347244 -0.029059745 -0.51108605 -0.030174 0.11254326 -0.0665958
		 0.10760873 -0.066711664 0.27529445 -0.05934678 0.26879445 -0.05768491 -0.8941077
		 0.05490892 -0.8941077 0.050919529 -0.89121461 0.052024331 -0.89146179 0.055756696
		 -0.24582578 0.16328105 -0.2483954 0.16147988 0.20070189 0.081536837 0.19765706 0.083501071
		 0.19564766 0.086044364 0.63825917 0.027758854 0.63907295 0.024118057 0.63897872 0.03084968
		 -0.21547547 0.11276564 -0.21341965 0.11403621 -0.21745017 0.11154517 0.16738799 0.033066168
		 0.16936268 0.031845652 0.16533205 0.034336679 -0.21096016 0.10542766 -0.20890699
		 0.10669667 -0.21293001 0.1042102 0.16285139 0.025741324 0.16482118 0.024523903 0.16079819
		 0.027010327 -0.20730366 0.099492617 -0.20525201 0.10076058 -0.20927061 0.098276839
		 0.15918243 0.019813957 0.16114937 0.018598257 0.1571307 0.021081988 -0.20173226 0.095043652
		 0.15359865 0.015372687 -0.080397055 0.14708038 -0.077963799 0.14837678 -0.077285938
		 0.15100828 -0.080366991 0.15100828 0.21075296 0.025055222 0.21152841 0.026897911
		 0.21204193 0.027919935 0.21184589 0.029126769 -0.52025658 -0.020774854 -0.52262592
		 -0.022305319 -0.52303964 -0.02441569 -0.52137697 -0.023749357 0.24819589 -0.04320531
		 0.24907705 -0.044464108 0.25055498 -0.042727351 0.24980451 -0.041736595 -0.36368465
		 -0.020271191 -0.3648935 -0.018870592 -0.36726624 -0.020601649 -0.36441359 -0.022470646
		 0.64672667 -0.014183139 0.64875442 -0.010118549 0.64848512 -0.0084096575 0.64742804
		 -0.0082476409 0.035006523 -0.01649477 0.037755657 -0.018845206 0.037924282 -0.017186005
		 0.035334613 -0.013333321 -0.59761089 0.096026674 -0.59566998 0.096284226 -0.56650043
		 -0.022285471 -0.56622899 -0.021626491 -0.56921327 -0.022619199 -0.56657112 -0.026043568
		 0.15537666 0.014342769 0.15170865 0.014339819 -0.17697515 -0.013249843 -0.17399952
		 -0.014272538 -0.17260191 -0.011086875 -0.17423728 -0.0094453953 -0.69079334 0.079749651
		 -0.6874162 0.077313408 -0.68662441 0.080165379 -0.6870997 0.079715922 -0.31840694
		 -0.039203919 -0.32224876 -0.041204967 -0.32149032 -0.043998856 -0.31755921 -0.041277487
		 -0.58478141 0.11081841 -0.5880301 0.11077508 -0.58748293 0.10724769 -0.5852735 0.10675029
		 -0.68694133 0.082098819 -0.69038165 0.084711038 -0.59565473 0.092366219 -0.59374481
		 0.092336588 -0.59397572 0.096131183 -0.31843174 -0.036633108 -0.32199517 -0.039150003
		 -0.42845869 0.10012302 -0.42698699 0.10110663 -0.42853561 0.10339178 -0.42959878
		 0.10199442 0.15758297 0.0081564495 0.15791288 0.0096453456 -0.44482571 0.092641696
		 -0.44296917 0.090146951 -0.44156104 0.092312753 -0.44314015 0.094117343 0.68930334
		 0.011294236 0.69039655 0.0094806477 0.69163096 0.010546902 -0.22314951 0.094433285
		 -0.22111012 0.093234345 -0.22144657 0.095173873 -0.22312959 0.096996114 0.68849504
		 0.012411225 0.11563228 -0.048271433 0.11428695 -0.050870977 -0.18097889 -0.12348493
		 -0.18112801 -0.12693338 -0.17899524 -0.1267415 -0.17885201 -0.12353611 -0.43069401
		 0.10067186 -0.43011317 0.09930633 0.15711677 0.0067041693 0.2460724 -0.040779907
		 0.24717496 -0.041846558 0.15228568 0.0039640563 0.15384059 0.0031883391 0.15615296
		 0.0036846183 -0.43216303 0.099554554 -0.43177307 0.098009825 0.69291753 0.01144072
		 0.69227582 0.014185606 0.732526 -0.0021708086 0.73371345 -0.0021326509 0.73402107
		 0.00013161614 0.73299819 0.00041790385 0.21375863 0.023050763 0.21395087 0.025565065
		 0.25147566 -0.048059203 0.25344914 -0.0451831 0.15852274 -0.024868159 0.15869795
		 -0.021969223 0.15674976 -0.021928787 0.15701506 -0.025609527 0.71582454 0.011012224
		 0.71304321 0.010903073 0.71354914 0.0082665803 0.71471131 0.0077200918 -0.42448714
		 0.1039657 -0.42600021 0.10636961 0.68718022 0.0098277675 0.68735141 0.0072818757
		 -0.36935309 -0.031211428 -0.36832687 -0.031642266 -0.59412825 0.097108997 0.12138218
		 -0.043479349 0.11953795 -0.046077214 0.12126847 -0.047900308 0.12322412 -0.045424011
		 0.11932158 -0.042321704 0.11776871 -0.045061056 -0.53799999 -0.15307188 -0.53789711
		 -0.15657042 -0.53584498 -0.156847 -0.53580046 -0.15322575 -0.18107219 -0.11547755
		 -0.18109392 -0.11900506 -0.17889188 -0.11880682 -0.17872079 -0.11530825 -0.28731358
		 0.026413633 -0.28552648 0.023905667 -0.28363168 0.02483139 -0.28512737 0.027460853
		 -0.28933078 0.024669956 -0.28738186 0.022253891 0.8105672 -0.011877492 0.81079507
		 -0.015476622 0.81294006 -0.015327333 0.81280196 -0.011754445 -0.18662001 -0.15432955
		 -0.18671505 -0.1579455 -0.18431044 -0.15801778 -0.18411797 -0.15441868 0.68897796
		 0.019970881 0.6906361 0.017532693 0.69249445 0.018582828 0.6908716 0.021155087 0.68717885
		 0.01951021 0.68877381 0.01712396 -0.53796607 -0.16779162 -0.53581715 -0.16803195
		 -0.18128705 -0.13027081 -0.1789763 -0.13002798 0.21000844 0.033083607 0.21192378
		 0.032807022 0.21353459 0.035227031 0.20803183 0.034005441 0.81124967 -0.027619349
		 0.81319803 -0.027208613 -0.18683097 -0.16974375 -0.18458445 -0.17016055 -0.076654747
		 -0.018100988 -0.077078737 -0.016301667 -0.078502916 -0.016617205 -0.077748917 -0.018106429
		 -0.079768479 -0.017356645 -0.078407794 -0.018563423 -0.080644339 -0.019127617 -0.080157429
		 -0.021118814 -0.078622185 -0.020317793 -0.07883206 -0.019328631 -0.077914454 -0.020898554
		 -0.076716907 -0.021116009 -0.076358669 -0.019777611 -0.077784546 -0.019621318 0.25654349
		 0.070346236 0.25841793 0.069940694 0.25704327 0.073122621 0.26067302 0.069868468
		 -0.076190256 0.026013924 -0.074335665 0.02628644 -0.075030379 0.028433571 -0.076604187
		 0.027906086 0.21729994 -0.0012806403 0.21638346 -0.0031289996 0.2181416 -0.0046209311
		 0.21940108 -0.0025122897 -0.36605859 -0.016778177 -0.3655591 -0.013240009;
	setAttr ".uvtk[2500:2749]" -0.36740583 -0.013302615 -0.36770493 -0.015938876
		 -0.23005685 0.11200827 -0.23209019 0.11201153 -0.23244461 0.11019261 -0.22984335
		 0.11016741 -0.2868523 0.09238337 -0.28694656 0.088550255 -0.28382072 0.088550255
		 -0.28463659 0.092344709 -0.46439585 0.09874431 -0.46161705 0.09874431 -0.46206427
		 0.10250763 -0.46465325 0.10253861 0.097502679 0.0023840745 0.096831612 0.0042190789
		 0.094922625 0.0042333142 0.094470076 0.0024154056 -0.019293873 0.088349834 -0.019555336
		 0.084485129 -0.017593205 0.085169084 -0.01762208 0.086359411 -0.23195688 0.11799238
		 -0.23159124 0.11718798 -0.23001471 0.11709852 -0.23007724 0.11745867 -0.25592393
		 -0.033039037 -0.25418577 -0.032570656 -0.25504681 -0.031063033 -0.25634781 -0.031239737
		 0.49108911 -0.004620357 0.49108911 -0.0062776259 0.49450669 -0.0061769853 0.49450669
		 -0.0027278743 0.38336223 0.0080013312 0.38336229 0.01114813 0.38025343 0.010377212
		 0.38025346 0.0079668695 -0.25598606 -0.036054246 -0.25433549 -0.036976606 -0.25392246
		 -0.03476727 -0.25562781 -0.034715723 -0.2286143 0.11709146 -0.22842918 0.11804698
		 -0.34261337 0.099035196 -0.34407595 0.099108085 -0.34444225 0.097230814 -0.34069312
		 0.097299114 -0.3652015 -0.017693644 -0.36439368 -0.015759289 -0.36388856 -0.014695432
		 -0.36436671 -0.013456161 0.32364655 -0.01877488 0.32124257 -0.020266738 0.32086122
		 -0.022355614 0.32248107 -0.021710157 -0.055967893 0.07802745 -0.055068403 0.07681483
		 -0.053574234 0.07846079 -0.054323278 0.07942082 0.23940766 -0.022188891 0.24077384
		 -0.021014662 0.23860869 -0.018474709 0.23736633 -0.021661662 0.72281307 -0.010252623
		 0.72488147 -0.0061889868 0.72456825 -0.0045229928 0.72351223 -0.0043547517 0.77542531
		 -0.014830041 0.77810532 -0.017095933 0.778328 -0.01548773 0.77569538 -0.011683377
		 -0.2318441 0.1158738 -0.23001055 0.11609162 -0.59132314 0.09828376 -0.59104693 0.098938927
		 -0.59438032 0.097628176 -0.59114403 0.094579093 -0.18514924 0.097495183 -0.18431409
		 0.10158825 -0.18798228 0.10157923 -0.187346 0.097232036 -0.01533665 -0.027044609
		 -0.014022077 -0.023713825 -0.017104931 -0.022355536 -0.018695071 -0.023740193 -0.41691774
		 0.078664884 -0.41391113 0.075632997 -0.41279697 0.078832217 -0.41327739 0.078381307
		 -0.89998949 0.077793539 -0.90372878 0.075829588 -0.90266222 0.072685346 -0.89920253
		 0.075963348 -0.47216097 -0.021049848 -0.47540963 -0.021074638 -0.47486252 -0.025045412
		 -0.47265312 -0.025458567 -0.41306159 0.080743372 -0.41654074 0.083343618 0.094969042
		 0.0081350952 0.096522443 0.0080099376 -0.89999032 0.080407366 -0.90354437 0.07786411
		 0.21189505 -0.037840635 0.21335676 -0.036885764 0.2117946 -0.034701832 0.21071999
		 -0.036043402 -0.25651881 -0.037807338 -0.2550461 -0.038138796 -0.14269538 0.10418399
		 -0.14147851 0.10136881 -0.13963035 0.10369361 -0.14117292 0.10546903 0.056577384
		 0.10777744 0.057698727 0.1058986 0.058894999 0.10696953 0.054298192 -0.024951944
		 0.056300916 -0.026127012 0.055986539 -0.024203934 0.054259334 -0.022402354 0.05582045
		 0.10888179 0.056448177 0.10983345 0.20962968 -0.03734896 0.21024907 -0.038649917
		 -0.25701794 -0.033044603 -0.25705367 -0.034559462 -0.078686416 -0.022397347 -0.077249691
		 -0.022869285 -0.25767687 -0.033501592 -0.25810122 -0.034266748 -0.2578913 -0.035255872
		 -0.2571837 -0.035836596 -0.072879009 0.0036469668 -0.074240364 0.0026765647 -0.074255109
		 0.0012701962 -0.072530851 0.0018220975 -0.081510752 -0.01775166 -0.082466096 -0.019133491
		 -0.081807449 -0.021278461 0.20816043 -0.038465668 0.20843108 -0.040068578 0.060182489
		 0.107842 -0.056147866 0.08045806 -0.056982767 0.07936392 0.41598839 0.0012827638
		 0.41717872 0.0013176744 0.41764012 0.0035712211 0.41657114 0.0038368376 -0.36230978
		 -0.019643933 -0.36203414 -0.017147895 -0.05313991 0.073069192 -0.050738461 0.076116383
		 -0.79428846 0.085025318 -0.7941131 0.08832635 -0.7960614 0.088326395 -0.79579616
		 0.084464297 0.38527265 -0.0012810435 0.3824915 -0.0013531034 0.38299736 -0.004373739
		 0.38415959 -0.0047842301 0.21582018 -0.034124851 0.2138806 -0.031549472 0.054499116
		 0.1062649 0.054752275 0.10373549 -0.3442046 0.1015913 -0.34320551 0.10114296 -0.2284572
		 0.11596647 0.25716841 0.075178422 0.6224488 -0.03316946 0.62062383 -0.032569282 0.62040406
		 -0.033789616 0.62246972 -0.034713876 -0.068086244 -0.058826733 -0.068208911 -0.060829103
		 -0.075080968 0.030999275 -0.076563545 0.031138906 0.25889981 0.077778332 0.2571328
		 0.077752292 0.26055571 0.07789731 -0.075190552 0.033976093 -0.076671988 0.034042522
		 0.43863022 0.024399793 0.44020739 0.023090228 -0.066564158 -0.055994216 -0.068048045
		 -0.056167066 -0.064612232 -0.055656314 0.62251532 -0.030807769 0.62070644 -0.030337557
		 0.27222273 -0.098000124 0.27115971 -0.099761464 0.27252337 -0.10070771 0.27376068
		 -0.09884464 0.25877142 0.087830119 0.25702983 0.086857833 0.25709268 0.083608687
		 0.25885651 0.084661186 0.26048884 0.085697718 0.2605961 0.088709578 -0.075361699
		 0.044230346 -0.077047437 0.044854883 -0.076874703 0.041843146 -0.075335674 0.041153822
		 -0.27346313 -0.019852292 -0.27487409 -0.022085564 -0.27375907 -0.024257971 -0.2722728
		 -0.021868603 -0.27051526 -0.023296276 -0.27203432 -0.025319424 -0.066210553 -0.047718778
		 -0.066383503 -0.050642367 -0.064408034 -0.05080368 -0.064210951 -0.048052065 0.6225189
		 -0.022549706 0.62065351 -0.022733461 0.62075508 -0.02548508 0.62255239 -0.025404681
		 0.27797329 -0.092227936 0.27573642 -0.091809429 0.27464435 -0.094062842 0.27641821
		 -0.094592191 0.25719965 0.080280252 0.2588979 0.080679379 0.26058337 0.081058212
		 -0.0767859 0.03720358 -0.075263835 0.03701999 -0.27668321 -0.025129799 -0.27540207
		 -0.026720289 -0.27348897 -0.027453972 -0.066563241 -0.053589359 -0.064513974 -0.053438626
		 0.62070268 -0.028120078 0.62258953 -0.028432917 0.2733351 -0.096273452 0.27511001
		 -0.097109355 0.12369267 -0.040000223 0.12586066 -0.042084176 -0.1839207 -0.14953852
		 -0.18650006 -0.149459 0.81032521 -0.0069974079 0.81263721 -0.0070508621 -0.29190084
		 0.027859982 -0.28958344 0.029734077 -0.28702295 0.030964237 -0.18104227 -0.11086845
		 -0.1784828 -0.11084379 -0.53813708 -0.14860737 -0.53575104 -0.14860862 0.12123574
		 -0.038758162 -0.28527397 0.019605473;
	setAttr ".uvtk[2750:2999]" -0.28337047 0.020982785 -0.15214114 0.096165925 -0.1537315
		 0.093027122 -0.15190974 0.0922677 -0.15004416 0.095567495 -0.29893839 0.035733759
		 -0.18024361 -0.10022144 -0.17724557 -0.10055579 -0.69591171 0.11451563 -0.69598162
		 0.11457475 -0.69638973 0.11363809 -0.69631988 0.11357877 -0.19090684 0.10915428 -0.19099227
		 0.1091541 -0.19105695 0.10849095 -0.19097134 0.10849117 -0.3685317 0.100262 -0.36837575
		 0.1002498 -0.18488218 -0.0027601263 -0.18479663 -0.0027601067 -0.18456118 -0.0019948275
		 -0.18464664 -0.0019949104 -0.18480158 -0.0034178232 -0.18471612 -0.0034179525 -0.1471065
		 -0.011614488 -0.14719066 -0.011650494 -0.14712851 -0.011779089 -0.14704429 -0.011743017
		 -0.14712732 -0.010810349 -0.14721148 -0.010846453 -0.36804369 0.10131379 -0.18456528
		 -0.0040265368 -0.18447982 -0.0040265741 -0.19117887 0.10779722 -0.19109344 0.10779727
		 -0.50087357 0.099343389 -0.50023293 0.096634805 -0.57470328 0.10949094 -0.5754891
		 0.10741013 0.027596621 0.13031577 0.46554342 0.026595334 0.45971084 0.036658563 0.46858251
		 0.022251887 -0.18101633 -0.13410093 -0.17876135 -0.13242963 0.25050071 -0.034508184
		 0.25229087 -0.035948042 0.55519795 -0.01489157 0.55291218 -0.017896181 0.55382764
		 -0.020038901 0.55652386 -0.016803117 -0.53825337 -0.17019325 -0.53614748 -0.17203598
		 0.27271765 -0.082872592 0.23201977 -0.0345897 0.12560065 0.0051683947 0.12116578
		 0.012581298 0.62183487 -0.017102631 0.61913937 -0.017204961 0.61989522 -0.019461485
		 0.622325 -0.019571861 -0.065344594 -0.04227367 -0.065960675 -0.044765204 -0.063511401
		 -0.044780027 -0.062690161 -0.042523596 0.63980955 -0.088769652 0.64247191 -0.088291198
		 0.6354658 -0.087703027 0.63693154 -0.089914076 -0.074755438 0.049848288 -0.077145003
		 0.050485615 -0.077148147 0.047333293 -0.075012498 0.046950139 0.25846767 0.093628362
		 0.25863305 0.090559661 0.26091257 0.091187932 0.26103434 0.09434016 0.28282306 -0.088643298
		 0.27869025 -0.089574687 0.28120694 -0.090904556 0.27639228 -0.089033321 0.64049077
		 -0.091454439 0.64296192 -0.091181464 0.63840979 -0.092029579 0.27983266 -0.092925787
		 0.024658093 0.0092634168 0.023749813 0.01096631 0.021636462 0.0094218673 0.022963438
		 0.0078556258 -0.27628422 -0.028730972 -0.27451962 -0.029247956 -0.42328042 -0.11278105
		 -0.42314875 -0.11708243 -0.42030138 -0.11748888 -0.42098203 -0.11296996 -0.42643005
		 -0.11218728 -0.42643005 -0.11642721 -0.4227623 -0.093196519 -0.42643005 -0.093948223
		 -0.42643005 -0.099012733 -0.42324847 -0.09883444 -0.54395252 -0.12711343 -0.54146802
		 -0.10479937 -0.54406011 -0.10357037 0.012881878 0.06036713 0.018385086 0.063241124
		 0.023421336 0.088289984 0.021472028 0.05704483 -0.31684443 -0.083478712 -0.32372794
		 -0.084700875 -5.9045789e-08 0.06891647 0.0043562367 0.071577534 0.13040049 -0.024602627
		 0.12571844 -0.023158967 -0.53654617 -0.13133739 -0.54075301 -0.13189214 -0.16114525
		 -0.024058906 -0.16108204 -0.02118171 -0.16494671 -0.019594623 -0.16481473 -0.022640262
		 -0.29604498 0.042799391 -0.29123342 0.046159096 -0.29361326 0.045791242 -0.37472379
		 -0.020839663 -0.37805656 -0.015638098 0.81135029 0.01208253 0.80822855 0.012473441
		 -0.18744934 -0.13006315 0.12439435 0.028660299 0.12030679 0.032188002 0.11843408
		 0.029596819 0.12217236 0.026028646 -0.10237787 -0.16555269 -0.097933218 -0.16775128
		 -0.50803626 -0.0023914969 -0.50433236 -0.0067653595 -0.50502884 -0.0042106626 -0.51243949
		 -0.0026310794 0.62383789 0.018252738 0.037419725 0.023020985 0.038925108 0.018065942
		 -0.10442524 -0.16930436 -0.088587232 -0.14698596 -0.093396038 -0.14333275 -0.097868264
		 -0.14815976 -0.092907034 -0.15141329 -0.094239093 -0.11933361 -0.091336235 -0.11507373
		 0.30836651 0.033033665 0.31124583 0.033692442 0.31269309 0.038021889 0.30959475 0.039109066
		 -0.089892633 -0.11039152 -0.32372794 -0.10991777 -0.31694147 -0.11076453 0.019864323
		 0.036927279 0.019576825 0.043588322 0.035104081 0.014011803 0.032595877 0.01100953
		 0.042574923 0.010104472 0.046888512 0.01299451 -0.11270412 -0.16370276 -0.11370455
		 -0.16600253 0.40941903 -0.035586145 0.41159886 -0.033773899 0.62057829 -0.10224702
		 0.62215763 -0.10269 0.61817324 -0.10177925 0.10502098 -0.070611946 0.10503189 -0.069184192
		 0.10400861 -0.065947659 0.10459919 -0.059776168 0.10781009 -0.05959294 -0.33109319
		 0.086427249 -0.33792275 0.087711662 -0.064511478 -0.025880557 -0.064511478 -0.031102525
		 -0.44827753 0.043951448 -0.44665453 0.052703571 0.11507247 -0.080791228 0.10752708
		 -0.080762058 0.029919034 0.0086959731 0.034675475 0.0032246679 0.039379537 -2.0119933e-05
		 0.62959141 0.0072679208 0.6331712 0.0070785573 -0.5076344 -0.020253912 -0.51330763
		 -0.019431209 -0.062863618 -0.037825357 -0.061292879 -0.039353896 -0.064511478 -0.03725493
		 0.6430158 -0.054598134 0.63802564 -0.058211241 0.65159971 -0.052465834 -0.092931144
		 -0.12297087 -0.087334722 -0.12661813 -0.09801688 -0.139769 -0.094571419 -0.13383916
		 -0.18985493 -0.12556545 -0.079674028 -0.1283098 -0.090604737 -0.12887493 -0.096295819
		 -0.12249927 -0.0994884 -0.11899459 -0.096314318 -0.11531223 -0.097258173 -0.11365724
		 -0.10108381 -0.1164022 -0.42643005 -0.12425887 -0.42261812 -0.12446384 0.032262668
		 0.042019997 -0.07540141 -0.11682055 -0.078051142 -0.12065405 -0.32372794 -0.11387223
		 -0.31706697 -0.1145447 0.007115359 0.0822905 0.0076067192 0.078289591 -0.53898597
		 -0.10596241 -0.53928739 -0.099773385 -0.5417766 -0.098743729 0.0023753291 0.075824425
		 0.009397665 0.073311009 -0.53963083 -0.11311992 -0.53628391 -0.11388459 -0.53630084
		 -0.10739157 -0.073971599 -0.11384077 -0.079654075 -0.11086956 -0.41985422 -0.099123225
		 -0.085633032 -0.10555431 -0.086593181 -0.10403404 0.4398174 -0.03598661 0.43764678
		 -0.036576811 0.24541515 0.0038274846 0.2501305 0.00056004088 0.24828099 0.0046506333
		 0.24552132 0.0063378969 -0.28888425 0.046515703 -0.54753363 -0.12207038 -0.54628682
		 -0.12761851 -0.55090201 -0.1229357 -0.41901025 -0.093027338 0.62479705 0.0060536386
		 0.27612469 -0.056517694 0.26939738 -0.053793699 0.63585788 -0.0091588171 -0.35829985
		 -0.033773825 -0.36154681 -0.034288228 0.015288192 0.11329966 0.017926944 0.11133207
		 0.020985758 0.1086141 0.024329705 0.10584868 0.028322514 0.10362546;
	setAttr ".uvtk[3000:3249]" 0.030273179 0.10572944 0.011578989 0.097659983 0.014208603
		 0.099266589 0.31979078 0.0097384667 0.32323542 0.010175128 0.3154636 0.0094108712
		 -0.3583383 -0.037151486 -0.36154681 -0.037617028 -0.35534808 -0.036464822 -0.35540003
		 -0.032933209 0.017921306 0.10727777 0.014763589 0.11023568 0.021679671 0.10392658
		 0.025046362 0.10081612 0.012273597 0.093255237 0.015466499 0.0950168 0.32028794 0.013573518
		 0.3235867 0.014418274 0.3154636 0.013281635 -0.35820428 -0.040671308 -0.36154681
		 -0.040963285 -0.35510877 -0.040536169 0.01382395 0.10555971 0.011240909 0.10881573
		 0.019046182 0.10201077 0.0081942007 0.091763906 0.018261116 0.096635461 0.3206141
		 0.016579418 0.3154636 0.016355509 -0.61002403 0.11435435 -0.60961473 0.11437702 -0.60944778
		 0.1153081 -0.6098392 0.1153081 -0.57768017 0.10736487 -0.57812786 0.10815078 -0.57817376
		 0.10656629 0.0093960287 0.006802801 0.0085109593 0.0082641644 0.0077123893 0.0087577021
		 0.0085975491 0.0072963363 -0.092469506 0.10435598 -0.092551686 0.10471447 -0.092551686
		 0.10391602 -0.092469506 0.1035575 0.24321947 -0.013524356 0.24404712 -0.01544211
		 0.2448456 -0.01544211 0.24401806 -0.013524356 0.010337713 0.0055373646 0.0095390985
		 0.0060309283 -0.57790375 0.10975435 -0.61086053 0.11252028 -0.6108225 0.11435435
		 -0.61165905 0.11252028 -0.28957796 -0.012739236 -0.28941989 -0.012509297 -0.28941989
		 -0.011710821 -0.28957796 -0.011940639 -0.089299843 0.11481439 -0.086426303 0.11848654
		 -0.091258094 0.12066729 -0.094131634 0.11699526 -0.61063772 0.1153081 0.4744007 -0.012530628
		 -0.01024148 0.014191922 -0.0091309221 0.015870009 -0.36906791 0.10349897 -0.36921355
		 0.10150617 -0.36977836 0.10056623 0.62624323 -0.0050341892 -0.011709807 0.013002516
		 0.28538892 -0.0076137548 0.29521677 -0.0077140997 0.29155755 -0.0054819942 0.28515899
		 -0.0055684852 0.093248256 -0.041735999 0.094467796 -0.044134043 0.10409155 -0.044439949
		 0.10409155 -0.041927554 0.27393189 -0.0045333104 0.26103505 -0.0043457448 0.25099322
		 -0.0072439127 0.26716787 -0.0082036564 0.60558689 0.031129008 0.60921425 0.034089345
		 0.61802691 0.044366308 0.61294186 0.040527888 0.61719227 0.041003101 0.62324178 0.047316846
		 0.39870924 0.082004726 0.35104671 0.084501088 0.34728348 0.080758713 0.38832721 0.078150764
		 0.34531894 0.075936563 0.38386008 0.07313969 0.36963934 -0.097666055 0.36957863 -0.10270569
		 0.42212093 -0.10204269 0.42212093 -0.098099947 0.53547853 0.064592376 0.51200134
		 0.067570247 0.47374171 0.066765875 0.50959074 0.06102005 0.41899928 0.069965981 0.43719423
		 0.075624965 0.45260069 0.080272615 0.090358369 0.0091054123 0.090315551 0.0079907309
		 0.10320394 0.0071675372 0.10574882 0.0086127035 0.086762823 0.0075092469 0.097166926
		 0.0058963331 0.082579039 0.0050257687 0.080930792 0.0070924764 0.073121637 0.0073030307
		 0.066217273 0.0055257962 0.068605922 0.0078354292 0.078531548 0.0079925861 0.07725057
		 0.0094402609 0.06691438 0.009050915 0.080684133 -0.10555755 0.097995445 -0.1048997
		 0.097995445 -0.10033946 0.080466636 -0.10091881 0.74356663 -0.076634929 0.74330264
		 -0.084365241 0.77481216 -0.084025912 0.77481216 -0.076272719 0.052569803 -0.10551132
		 0.046499766 -0.10115411 0.3324073 0.070378713 0.36631247 0.066988468 0.30039427 0.063156731
		 0.33630478 0.060191896 0.36354944 -0.084937729 0.36514756 -0.092140183 0.42212093
		 -0.093277857 0.42212093 -0.086501934 0.12286054 -0.14646678 0.083151259 -0.14998786
		 0.12119284 -0.15522379 0.16131185 -0.15150626 0.25224581 -0.14203472 0.28136319 -0.14872901
		 0.30102515 -0.14658837 0.28009662 -0.13877048 0.74801165 -0.092247546 0.77481216
		 -0.091642193 0.34131882 -0.15165836 0.324417 -0.14416444 0.32721055 -0.15392689 0.2979151
		 -0.13653986 0.1142607 0.032478508 0.090280183 0.027808124 0.14550824 0.024277586
		 0.16026844 0.029442947 0.14404136 0.015825458 0.079528928 0.021338657 0.066435605
		 0.016492778 0.10657419 0.01233709 -0.32629025 0.048013259 -0.33551848 0.042691711
		 -0.27747995 0.041526023 -0.27747995 0.046773173 -0.27747995 0.03532286 -0.33166993
		 0.036163922 -0.33346164 0.031425659 -0.27747995 0.030615332 -0.36325917 0.073815055
		 -0.38168329 0.078071393 -0.41610435 0.073549166 -0.40043649 0.070217706 0.13313437
		 0.020388277 0.18250914 0.021138765 0.18201384 0.026596291 0.12886094 0.026351437
		 0.19757479 0.021209517 0.21007974 0.025931127 -0.148727 -0.041110162 -0.15507714
		 -0.042564142 -0.1072522 -0.04530976 -0.10449535 -0.044433098 -0.066794485 -0.048121136
		 -0.067494512 -0.044723742 0.75019443 -0.10254239 0.77481216 -0.10235323 0.7515713
		 -0.11173608 0.77481216 -0.11122783 0.7340278 -0.102892 0.74215758 -0.11299285 0.72992235
		 -0.094044253 0.3058885 -0.15569572 0.32794732 -0.1633053 0.34333658 -0.16235721 0.71844453
		 -0.10341566 0.72081202 -0.11176767 0.34208509 -0.1713104 0.30221349 -0.16454425 0.32279328
		 -0.17142975 0.27481106 -0.15803848 0.26560521 -0.1665695 0.29352036 -0.17201315 0.2534329
		 -0.1737628 0.22644371 -0.16898184 0.19058523 -0.17145289 0.21579397 -0.17626417 0.28905296
		 0.049461585 0.32799006 0.04647341 0.35828796 0.051286068 0.3155199 0.05438038 0.27343288
		 0.057738844 0.24689457 0.053138644 0.26256701 0.044774931 0.22077277 0.048942331
		 0.19552326 0.043841872 0.2352411 0.040123224 0.19371679 0.035125971 0.19544259 0.030027049
		 0.24654213 0.030191816 0.24654213 0.03600258 0.24654213 0.025505293 0.19368187 0.025323223
		 0.19011681 0.020480555 0.24654213 0.020828614 -0.50080043 0.093494534 -0.49841374
		 0.089975581 -0.47346157 0.089652292 -0.47730234 0.093011141 -0.49923334 0.085013621
		 -0.46956941 0.08511924 0.052269597 -0.10915683 0.078200504 -0.11022081 0.082326144
		 -0.10670188 0.057354692 -0.10517349 0.030449476 -0.10242377 0.029431213 -0.10756262
		 0.0033243659 -0.10398776 0.014165679 -0.11167599 0.45557046 0.089716189 0.45441094
		 0.087190934 0.49622121 0.084854238 0.4953585 0.088065624 0.45386338 0.084124468 0.42087358
		 0.088874638 0.41342443 0.085758694 0.42473871 0.091315873 0.39775792 0.093563162
		 0.38549164 0.091218166 0.40446237 0.043527298 0.40683466 0.037590612;
	setAttr ".uvtk[3250:3499]" 0.42852652 0.038376659 0.4263818 0.043527298 -0.86818588
		 -0.0095570618 -0.8077293 -0.013184405 -0.80915713 -0.0078388117 -0.85076725 -0.0080748126
		 0.09753491 0.01510175 0.097911574 0.0097561609 0.13720563 0.01020382 0.1388156 0.01462178
		 0.094319679 0.025501601 0.095969841 0.020655818 0.10211261 0.031078624 0.079893239
		 0.029555965 -0.27747995 0.050480504 -0.31607383 0.051484276 -0.17642491 0.10301412
		 -0.17562366 0.099648237 -0.1533107 0.098719791 -0.15411015 0.10176347 -0.04298256
		 -0.12712505 -0.046519842 -0.13029458 -0.022314787 -0.13056627 -0.013289272 -0.12780859
		 -0.035137538 -0.11234103 -0.040742125 -0.11854939 -0.00833508 -0.11917944 -0.015059737
		 -0.11261204 0.26210693 -0.027440537 0.2852352 -0.028370745 0.31769046 -0.024850987
		 0.29521233 -0.023046084 -0.39084396 0.05189256 -0.38394755 0.049141478 -0.35062891
		 0.04776188 -0.35358635 0.050813466 0.17156085 -0.12113118 0.19852248 -0.1240795 0.20748748
		 -0.12323778 0.17945474 -0.120051 0.46021301 -0.11820135 0.45443699 -0.12161276 0.48028773
		 -0.12169993 0.48665586 -0.118249 0.27678937 0.021830376 0.27775729 0.018773211 0.3030076
		 0.019059543 0.30358717 0.022470865 -0.48950711 -0.07407923 -0.48276606 -0.077198833
		 -0.45241863 -0.076036647 -0.45512506 -0.072852463 -0.52457762 -0.076667972 -0.51652032
		 -0.079771981 0.50685805 -0.16095027 0.50215107 -0.15788329 0.48708859 -0.15885283
		 0.49309462 -0.16134375 -0.3897227 -0.09489169 -0.40454891 -0.096408524 -0.38806745
		 -0.099598855 -0.37603575 -0.097725578 0.46785668 -0.15087551 0.48558474 -0.15057114
		 0.48562971 -0.14615479 0.46684846 -0.14608683 0.47140828 -0.15933321 0.47414541 -0.161461
		 0.27512503 -0.02078886 0.27892902 -0.018661033 0.26592129 -0.018108113 0.25952217
		 -0.020476829 0.28531486 -0.0054146023 0.26837677 -0.0054305331 0.2680555 -0.0098996591
		 0.28382674 -0.010203265 -0.083296098 0.034429342 -0.098336786 0.032940891 -0.083596162
		 0.03013402 -0.067135505 0.031165024 0.83208317 -0.033438273 0.81537992 -0.034441471
		 0.82701272 -0.036946949 0.840119 -0.035568215 -0.06886334 0.020531878 -0.055257153
		 0.021375872 -0.056910995 0.024337085 -0.075465746 0.024305638 -0.048946675 0.099954136
		 -0.050696962 0.098071828 -0.029375194 0.098074913 -0.032277044 0.099942975 -0.099826954
		 0.040615086 -0.11808824 0.040562779 -0.11890607 0.037314117 -0.093334645 0.0373175
		 0.42610022 0.010675481 0.42860407 0.01392326 0.40724739 0.013904505 0.40324622 0.010681787
		 0.21534446 0.0079637151 0.21492232 0.010996445 0.19967145 0.010544087 0.19991316
		 0.0086340206 0.24452393 0.029300045 0.23794702 0.033173431 0.19071382 0.032972384
		 0.19953586 0.02729536 0.32057387 -0.090993904 0.37237746 -0.09515287 0.37970355 -0.08947584
		 0.32623252 -0.08729741 -0.12892318 -0.062619112 -0.11575322 -0.059395336 -0.16201194
		 -0.057627205 -0.16883658 -0.061225183 -0.21932019 -0.060456254 -0.21798661 -0.056531049
		 0.12634623 -0.002686606 0.12965888 0.0010484131 0.10300811 0.0007657276 0.10209015
		 -0.0024842916 -0.83931863 -0.026629236 -0.80713975 -0.025424881 -0.81041706 -0.022174861
		 -0.84932435 -0.023173889 0.33421844 -0.078838088 0.39968374 -0.074253827 0.39433435
		 -0.07277032 0.34299618 -0.074780397 0.15940547 -0.0040245298 0.16818379 -0.00031835481
		 0.095929064 -0.0057727373 0.089618437 -0.0088543715 0.11433323 -0.0098101208 0.12007513
		 -0.0063275862 0.55647159 0.025390496 0.57020277 0.026559796 0.57173485 0.030322172
		 0.5523774 0.02979375 0.58230907 0.025460001 0.59012145 0.029878128 -0.29344428 -0.042798981
		 -0.312103 -0.041038446 -0.32391587 -0.043678224 -0.30227715 -0.044776082 -0.26528963
		 -0.046302814 -0.25744563 -0.04402354 -0.27795777 -0.027660746 -0.25277212 -0.030117422
		 -0.24917515 -0.025901241 -0.27677915 -0.023162518 -0.11464784 -0.08470124 -0.12885401
		 -0.081122391 -0.15882936 -0.079750694 -0.14012875 -0.084022321 -0.20740022 -0.067254916
		 -0.17157947 -0.067625657 -0.17111416 -0.064802736 -0.21777768 -0.064059988 -0.045278292
		 -0.039472561 -0.045187987 -0.043347247 -0.016920518 -0.04411865 -0.013735101 -0.040631827
		 -0.028233385 -0.058190398 -0.045750026 -0.058093961 -0.045238648 -0.062405087 -0.026030663
		 -0.063343205 -0.062573843 -0.059796263 -0.062907726 -0.063746102 0.57037193 -0.075593285
		 0.58340299 -0.072258644 0.54064101 -0.070090517 0.52358794 -0.075025022 0.49430501
		 -0.070270635 0.49259391 -0.074670583 0.46381125 -0.088610582 0.45570186 -0.091914013
		 0.47786763 -0.091213048 0.48876876 -0.087711938 0.45739809 0.0058743432 0.45215201
		 0.0093007721 0.42819268 0.007784693 0.42884523 0.0034362883 0.13820808 -0.010537013
		 0.15303521 -0.0066289655 0.64856941 -0.0068209283 0.65995663 0.0059463107 0.64477432
		 -0.0061384151 0.63669163 -0.016467106 -0.05455713 -0.019959167 -0.08088734 -0.019803485
		 -0.082223982 -0.021270419 -0.05455713 -0.02131523 0.66607112 0.01338834 0.67435282
		 0.018052327 0.68327343 0.028837973 0.6633426 0.0055128187 -0.58652121 0.1249276 -0.58465213
		 0.12221557 -0.56318468 0.12408476 -0.56775582 0.12643394 -0.58278424 0.1200956 -0.56043315
		 0.12194024 -0.61232078 0.12084252 -0.60601866 0.1183121 -0.62156427 0.12418355 -0.63799798
		 0.12543572 -0.65157652 0.12347634 -0.64327586 0.12146649 0.51811457 0.11330602 0.52873445
		 0.11529095 0.519732 0.11719821 0.50388247 0.11545538 0.70254457 -0.0081209755 0.68961054
		 -0.0054925326 0.66546321 -0.0063912207 0.68647242 -0.0085922768 0.83060139 0.012960084
		 0.85299462 0.012426165 0.85134512 0.015650241 0.82740086 0.015663126 0.87969166 0.012347554
		 0.87969166 0.015467642 0.85878807 0.0094640851 0.87969166 0.0096795866 0.14218682
		 0.12022047 0.1255898 0.12169749 0.095595315 0.11586381 0.1129342 0.11455646 0.1581603
		 0.11859717 0.13003449 0.11326714 -0.19665289 0.070671409 -0.21550891 0.069677167
		 -0.18893433 0.064230144 -0.17183372 0.065519482 -0.17834365 0.071830235 -0.15448944
		 0.066827245 -0.066364326 0.049408037 -0.083432637 0.048121136 -0.056174375 0.04270665
		 -0.039199047 0.043986559 -0.10002024 0.04687047 -0.072590016 0.041468929 0.042278636
		 0.095820189 0.025690267 0.09707091 -0.0015540106 0.091655388 0.014861697 0.090417646
		 0.0086225057 0.098357782 -0.018529603 0.092935212;
	setAttr ".uvtk[3500:3749]" -0.0088059166 0.037722886 -0.025693687 0.036449645
		 0.0061630704 0.030275589 0.023032818 0.031547558 -0.041946504 0.03522414 -0.01005653
		 0.029052721 -0.017296493 0.084287055 -0.033549678 0.085512571 -0.064517416 0.079271518
		 -0.048297014 0.078048564 -0.050437454 0.086785786 -0.081386387 0.080543444 -0.12371455
		 0.060746461 -0.14096487 0.059445843 -0.11366972 0.05402391 -0.096510999 0.055317648
		 -0.15789005 0.058169749 -0.13042541 0.052760575 0.099401489 0.1071757 0.082475878
		 0.10845184 0.055189393 0.1030293 0.071945332 0.10176597 0.065225922 0.10975247 0.038030542
		 0.10432313 0.40942681 0.033138953 0.39835256 0.018987374 0.41268814 0.031344656 0.42189535
		 0.043270059 0.14459661 0.0027389561 0.13266449 0.0053517791 0.11656383 0.0041378648
		 0.13084672 0.0013960972 -0.18979582 0.050436795 -0.1743935 0.053094264 -0.19049372
		 0.05430812 -0.20355602 0.051780518 0.24247716 0.029942621 0.25196812 0.041911535
		 0.24223259 0.035432532 0.23151395 0.021735249 0.62465614 -0.03450688 0.63368672 -0.023646533
		 0.62686473 -0.029024748 0.61918569 -0.038837831 0.64253157 -0.017189354 -0.57044303
		 0.13042121 -0.55412567 0.13068305 -0.56175119 0.13287474 -0.57331234 0.13235159 -0.58723384
		 0.12787029 -0.60760033 0.12876059 0.67298514 -0.017017901 0.67244047 -0.013898773
		 0.65319067 -0.012673319 0.64106637 -0.01416962 0.68028367 -0.012037784 0.66456908
		 -0.011300902 0.27495912 -0.0024952402 0.28647333 -0.0041622827 0.28202829 -0.0020407534
		 -0.08865983 0.034370385 -0.084496439 0.033455629 -0.069965564 0.033833422 -0.07024058
		 0.034714933 0.10409155 -0.03804661 0.089746788 -0.0377855 0.090639003 -0.04010113
		 0.10409155 -0.040231675 -0.08214727 -0.029163903 -0.05455713 -0.029361671 -0.05455713
		 -0.02657626 -0.080889709 -0.026241519 -0.49400187 0.11794091 -0.51185328 0.11983112
		 -0.53464437 0.11838783 -0.51602781 0.11614832 -0.54055655 0.11357842 -0.55725312
		 0.11591984 -0.57956225 0.11344567 -0.56613088 0.11123716 0.4715198 0.10052028 0.50168037
		 0.098206155 0.51147842 0.10068864 0.47903377 0.10477771 0.46265954 0.10695574 0.45146668
		 0.10196656 -0.21503942 0.012364388 -0.24438438 0.013222991 -0.24290355 0.0081575792
		 -0.21294114 0.0091366973 -0.1824142 0.0093588922 -0.1824142 0.012119882 -0.081579149
		 -0.023351986 -0.05455713 -0.02359456 -0.5290454 0.12202916 -0.55016285 0.12023953
		 -0.54112953 0.12371636 -0.57281327 0.11801243 -0.59572071 0.11553979 0.51767302 0.10820431
		 0.50407439 0.10599077 0.52164871 0.10323419 0.53422451 0.10583478 0.50057536 0.11066163
		 0.49777958 0.10994518 0.50261772 0.10817663 0.50778031 0.10815971 0.47229862 0.00038104676
		 0.44369301 0.0017080442 0.43197966 -0.003344561 0.4602702 -0.0032849971 -0.21230297
		 0.0039762771 -0.1824142 0.0038652983 0.48318398 -0.1258388 0.45739105 -0.12597482
		 0.46059012 -0.13043061 0.48391706 -0.13032188 0.29715228 0.014697345 0.27453512 0.014588259
		 0.27343649 0.010097284 0.29268166 0.010241585 -0.33456311 0.04259045 -0.36207792
		 0.044760216 -0.37631401 0.041561246 -0.35433206 0.039520346 0.2813893 -0.0034645407
		 0.26597807 -0.0027995685 0.25500453 -0.0053993245 0.26749647 -0.0063095451 -0.38917005
		 0.046234157 -0.39999461 0.042995207 0.23339276 -0.11435737 0.20944975 -0.11478775
		 0.21291147 -0.11851424 0.235476 -0.11837569 -0.029457971 -0.15354669 -0.045696139
		 -0.15354104 -0.046454329 -0.1569543 -0.030230233 -0.15675209 -0.025433658 -0.13395883
		 -0.047774766 -0.13370694 -0.048417319 -0.13761401 -0.027270475 -0.13768522 -0.44318378
		 -0.078837931 -0.47077653 -0.080127522 -0.45562518 -0.083325945 -0.43204659 -0.082052261
		 -0.49608722 -0.082396396 -0.47389701 -0.085414842 0.27561191 -0.0076007079 0.280287
		 -0.0075398404 0.28095847 -0.0057873302 0.27759606 -0.0054082191 0.24510428 -0.01209632
		 0.2396439 -0.011922178 0.23893987 -0.013256278 0.24242426 -0.013526179 0.21328807
		 0.0075838757 0.20807338 0.00091998698 0.21459062 0.0065737464 0.22019862 0.01379571
		 0.67930347 -0.011692077 0.67834932 -0.011355727 0.67404568 -0.010492684 0.66937119
		 -0.010891341 0.75325596 0.012462598 0.75902897 0.01270708 0.75981724 0.013370262
		 0.74916506 0.013626495 0.19496973 0.097639397 0.19192237 0.097037472 0.19320124 0.097049683
		 0.19790128 0.097181968 0.69887328 -0.011013227 0.69380105 -0.011028019 0.68864655
		 -0.011407809 0.69435763 -0.01161731 0.69021606 -0.019671358 0.67869288 -0.019318283
		 0.67927843 -0.019648364 0.69060946 -0.020101553 -0.58927101 0.13017835 -0.58556867
		 0.13037193 -0.58695233 0.13209791 -0.59040284 0.13188131 -0.58983964 0.13030535 -0.5921641
		 0.13014075 -0.58825916 0.12944768 -0.58839929 0.12990205 0.68961179 -0.012127561
		 0.69060934 -0.014060902 0.70495111 -0.013998424 0.70022458 -0.011832597 0.68332666
		 -0.011530012 0.68642694 -0.011824713 0.64433306 -0.010287056 0.66549647 -0.010316644
		 0.67429268 -0.010342146 0.66995364 -0.010329529 0.65478569 -0.0081210062 0.67316812
		 -0.0095033301 0.76053911 0.012013229 0.75995773 0.011524356 0.19300152 0.099161617
		 0.18920022 0.098101437 -0.086035781 0.036332864 -0.068114996 0.036795065 -0.1544988
		 0.097045034 -0.15679859 0.097686306 -0.16948156 0.098171674 -0.17693663 0.097379267
		 0.23547074 -0.012849579 0.23893987 -0.013256278 0.2396439 -0.011922178 0.23522373
		 -0.011607231 0.24510428 -0.01209632 0.24877529 -0.01157953 0.68724352 -0.017234119
		 0.76093394 0.01046713 0.76500803 0.010461736 0.76558697 0.012515808 0.76110375 0.012603174
		 -0.59266901 0.13343428 -0.58879924 0.1335572 0.0011516141 0.11046167 0.0030388234
		 0.10874484 0.00570784 0.10896205 0.0038711941 0.11056563 -0.17595166 0.094301827
		 -0.15874757 0.094235122 -0.15766306 0.094665773 -0.17588656 0.09467081 0.76513481
		 0.013400258 0.76095599 0.013480857 0.18334924 0.088470988 0.17465845 0.089228913
		 0.14907277 0.086066343 0.14986922 0.085039645 -0.68497682 0.10463046 -0.67445892
		 0.10408994 -0.66908056 0.10827725 -0.68055737 0.10834804 0.064062454 0.066993155
		 0.059055619 0.068254501 0.042996041 0.065080002 0.049861435 0.064636879 0.5020597
		 0.10725436 0.036621857 0.060652599 0.045906045 0.061122876 0.46741188 0.11528435;
	setAttr ".uvtk[3750:3999]" 0.44608238 0.11194891 0.47468802 0.11062185 0.49016002
		 0.11270511 0.87969166 0.023343436 0.84980303 0.023033725 0.85066909 0.019137792 0.87969166
		 0.018980592 0.6804505 -0.0099161966 0.67685825 -0.0097125312 0.54196787 0.11121451
		 0.54460001 0.11365171 -0.53830904 0.093992412 -0.52573514 0.095878184 -0.53197724
		 0.098295763 -0.55376583 0.096272558 0.25749838 -0.015742004 0.21645495 -0.01306187
		 0.23801367 -0.016627692 0.25767988 -0.018167512 -0.032588892 0.0088785179 -0.035809532
		 0.012075836 -0.063113026 0.0098430626 -0.059023645 0.0066972952 0.088778995 0.0053660283
		 0.084037632 0.0028750952 0.10151225 -0.00024810125 0.10686987 0.0050892932 0.59987015
		 -0.018664395 0.58268178 -0.022872336 0.58883661 -0.02357186 0.60068506 -0.022087911
		 0.29612496 -0.012792169 0.27539441 -0.011581488 0.29247424 -0.015544779 0.29473042
		 -0.015143074 0.19177733 0.093497939 0.19971125 0.092984453 0.21119611 0.062375221
		 0.2082821 0.064069696 0.1944924 0.063958228 0.19938581 0.060669906 0.61737138 0.010022062
		 0.61758322 0.012774213 0.60972673 0.012163139 0.61221099 0.010007396 -0.076247305
		 0.0069477414 -0.077932656 0.005171475 -0.040039513 0.094194718 -0.050745998 0.093626574
		 -0.060484368 0.090290338 -0.04006619 0.090809494 0.20341702 0.067332774 0.18372715
		 0.068234734 -0.048382986 0.01527954 -0.070260257 0.011929738 0.48497707 0.00030773302
		 0.49205208 -0.00033221979 0.49513581 0.0053048725 0.4790343 0.0027252631 0.088421986
		 0.0032770194 0.082608685 0.00030070037 0.10946675 0.00030842531 0.10716003 0.0025136594
		 0.088421986 -0.0026607444 0.10716003 -0.0018949587 0.51109284 0.11192431 0.5327968
		 0.1095864 0.48855138 0.1176713 -0.16773294 0.11125537 -0.18142834 0.11170425 -0.18846679
		 0.11012622 -0.17344251 0.1101254 0.095303379 0.063904412 0.081359722 0.064057395
		 0.079027124 0.060824458 0.094633095 0.06128237 -0.31713048 0.028023157 -0.33083749
		 0.026940279 -0.32373279 0.025345787 -0.30709144 0.026154824 0.46533981 -0.077693433
		 0.44922948 -0.077150829 0.44788566 -0.078371212 0.46641442 -0.07939183 0.48862797
		 -0.079402842 0.47862175 -0.083734609 0.50028932 -0.083018929 0.51076257 -0.079154052
		 0.087350577 -0.017678872 0.10562204 -0.01803326 0.12194291 -0.014635959 0.10097787
		 -0.014034946 0.40264478 0.017981205 0.41110602 0.013339363 0.43327451 0.013919359
		 0.42468154 0.017935554 -0.27741173 -0.034322694 -0.2956512 -0.0333216 -0.30156285
		 -0.037771229 -0.28313899 -0.039458316 -0.25367579 -0.040845085 -0.25339091 -0.035747163
		 -0.17379262 -0.076113679 -0.14858903 -0.075984322 -0.16512471 -0.071034543 -0.19181068
		 -0.071123473 -0.046840888 -0.048844334 -0.046140876 -0.054103106 -0.027146164 -0.053967066
		 -0.021636641 -0.048453867 0.52106673 -0.084144548 0.54424673 -0.07986977 0.36630991
		 -0.034563579 0.36321744 -0.0401701 0.37891161 -0.039206155 0.37925515 -0.033915933
		 -0.18680711 -0.019188862 -0.21877967 -0.024040172 -0.18896425 -0.026667388 -0.17277935
		 -0.024969602 0.31569901 -0.17674337 0.33094606 -0.1799432 0.35038936 -0.17930965
		 0.3460899 -0.17617469 0.2220646 0.029450152 0.24235304 0.032937508 0.20794758 0.036079932
		 0.18368939 0.032624487 0.16690513 0.039914239 0.13778806 0.036237225 0.1928208 0.045046225
		 0.19571134 0.040009607 0.24654213 0.040985946 0.24654213 0.046231851 0.46356758 0.10932676
		 0.48556566 0.11126592 0.2983174 -0.016210245 0.2941649 -0.016651673 -0.63748837 0.11958322
		 -0.63125032 0.1175312 0.5039264 0.1108259 0.46182463 0.10712017 0.48027536 0.10647279
		 0.49754268 0.1073675 0.16522218 -0.01842526 0.1490099 -0.016698027 0.13927703 -0.016665425
		 0.13354327 -0.018656224 -0.031158775 0.10619435 -0.047785945 0.10621619 -0.048498925
		 0.10492895 -0.034285668 0.10500219 0.10719148 0.0099207461 0.09483283 0.010660051
		 0.15372162 -0.021139741 0.13775235 -0.021113232 0.31225017 -0.031743199 0.31785074
		 -0.034160569 0.34064794 -0.034063324 0.34297881 -0.031774107 0.076827735 0.010972018
		 0.058717836 0.010492434 0.97315735 0.014033196 0.95535946 0.01237477 0.96565413 0.011734498
		 0.97205794 0.012625997 0.32779321 -0.029950527 0.33978584 -0.029879311 0.16503887
		 -0.1341507 0.14774495 -0.12898104 0.10265238 -0.1314797 0.12358688 -0.13611002 0.4491491
		 -0.11222576 0.45237684 -0.11480451 0.46734753 -0.11441354 0.47547254 -0.11038058
		 -0.11093637 -0.050663184 -0.10021491 -0.047545154 -0.11264024 -0.045874644 -0.12049455
		 -0.046402685 -0.76383358 0.092888333 -0.75858325 0.090560757 -0.74153149 0.095822439
		 -0.74420601 0.098584004 0.13076456 -0.12492224 0.096199475 -0.12740545 0.22364077
		 0.001504352 0.26075748 0.0054094619 0.2405951 0.0075270701 0.20419312 0.0035128552
		 0.1019908 0.0065520075 0.13559823 0.0066237869 -0.86226147 -0.016714053 -0.80831838
		 -0.016388508 -0.11917415 -0.048171304 -0.090835348 -0.053802803 -0.16883196 -0.045347389
		 0.16951686 0.049592435 0.22859253 0.038968351 0.24869323 0.046813238 0.21888924 0.052034922
		 0.53969896 -0.066570967 0.49542549 -0.067598201 0.59937811 -0.068930082 -0.25987002
		 -0.062117293 -0.24398716 -0.065463908 -0.14084472 -0.065810382 -0.8077966 -0.028713264
		 -0.82735837 -0.029827507 0.39400104 -0.068955548 0.35355243 -0.068839587 0.48731932
		 -0.06410522 0.54060137 -0.062443532 -0.27747995 0.057308979 -0.29916957 0.058156908
		 -0.3011958 0.054424617 -0.27747995 0.053319804 0.1751965 0.12201145 0.15413319 0.12381269
		 -0.21167538 0.074747354 -0.23663427 0.072783142 -0.19520435 0.077290632 0.063377455
		 0.024536189 0.056706514 0.020895394 0.057478655 0.027627053 -0.11149891 0.074567847
		 -0.094647326 0.073297292 -0.078460991 0.07207682 0.020252448 0.023091869 0.036438759
		 0.024312379 0.053290784 0.025582902 -0.14848924 0.067228302 -0.13165885 0.065959297
		 -0.11551204 0.06474182 0.057478648 0.015770109 0.073625483 0.016987532 0.090455763
		 0.018256538 -0.17844956 0.061292216 -0.16163102 0.06002422 -0.14550796 0.058808465
		 0.087576158 0.009844467 0.10369954 0.011060164 0.12051754 0.012328204 -0.20729965
		 0.055575244 0.14946948 0.0066189063 -0.6755507 0.14405388 -0.67579716 0.14798178
		 -0.70105165 0.14798178 -0.69549584 0.14535035 -0.082516916 0.021461444;
	setAttr ".uvtk[4000:4249]" -0.076160587 0.019618811 -0.085118875 0.023690294
		 -0.086725943 0.022483518 -0.16972011 -0.018837344 -0.1605372 -0.021811726 -0.14690833
		 -0.022478048 -0.15029863 -0.020367809 0.82516629 -0.039463714 0.81197959 -0.037995156
		 0.8058278 -0.038985815 0.8179428 -0.040722657 -0.41140872 -0.018366199 -0.40543506
		 -0.020565772 -0.38205129 -0.018696707 -0.40150008 -0.01696559 0.74395293 -0.014296339
		 0.73820275 -0.0083608339 0.72953916 -0.0085227964 0.72733265 -0.010231681 0.94112718
		 -0.017585333 0.93843669 -0.014423834 0.91720963 -0.018276569 0.91859168 -0.019935831
		 -0.032911036 0.10380442 -0.0488199 0.10406178 -0.39215487 -0.027773572 -0.39157528
		 -0.03153171 -0.36991647 -0.028107459 -0.39437896 -0.02711463 0.10004871 0.014633684
		 0.069980972 0.014636632 -0.34243828 -0.013238574 -0.36487955 -0.0094340639 -0.37828544
		 -0.011075541 -0.36682972 -0.014261264 -0.12662238 0.078644671 -0.15689829 0.078610934
		 -0.16079469 0.079060383 -0.15430376 0.076208435 -0.26575953 -0.035339084 -0.27270773
		 -0.037412647 -0.24048463 -0.040134009 -0.23426807 -0.037340119 -0.83998942 0.10884793
		 -0.83595526 0.10477981 -0.81784517 0.1052772 -0.81336027 0.10880463 -0.12999672 0.083606116
		 -0.15819645 0.080993816 -0.062708281 0.10390892 -0.064600796 0.1001143 -0.048944697
		 0.10014374 -0.26555583 -0.032768283 -0.23634656 -0.035285145 -0.49169153 0.094250523
		 -0.48234627 0.096121952 -0.49106258 0.097519472 -0.5037567 0.095234275 0.049192052
		 0.0099393586 0.051895928 0.0084503107 -0.25791597 0.086779006 -0.27173215 0.088254541
		 -0.28467506 0.086450122 -0.27313337 0.084284112 0.94273633 0.0089534754 0.95285481
		 0.0078871613 0.96181375 0.0097008673 -0.47748208 0.092169926 -0.47764543 0.094732687
		 -0.49144027 0.092910595 -0.4941991 0.090970837 0.96843904 0.010817857 -0.37518674
		 -0.094098642 -0.36415976 -0.096698262 0.2352206 -0.1343244 0.21778697 -0.1343756
		 0.21896099 -0.13758107 0.23644306 -0.13777292 -0.47813147 0.093433812 -0.47337022
		 0.094799288 0.055716816 0.00699803 0.83353472 -0.038105119 0.84257227 -0.037038457
		 0.082571968 0.0034823534 0.095317833 0.0042580687 0.063617833 0.0039784787 -0.46452463
		 0.092137389 -0.46132755 0.093682118 0.93744922 0.012592178 0.93218917 0.0098472908
		 0.45420581 0.0015548451 0.45033547 0.0041433456 0.44195077 0.0038570589 0.44447288
		 0.0015929451 -0.10079702 0.017614286 -0.10237217 0.020128647 0.79828244 -0.044317547
		 0.78210562 -0.041441724 -0.0050949501 -0.02367847 0.0072635203 -0.02441996 0.0094375433
		 -0.020739214 -0.0065316241 -0.020779541 0.013486447 0.0066293497 0.02261119 0.0033371584
		 0.032136794 0.0038836459 0.036283601 0.0065201987 -0.52424771 0.098093137 -0.51184422
		 0.10049726 0.9792186 0.0082343398 0.97781515 0.0056884484 0.34038457 -0.027411828
		 0.33197141 -0.02784266 -0.06145779 0.10488658 -0.42231873 -0.08930663 -0.43741733
		 -0.091251396 -0.42138696 -0.093727589 -0.40720138 -0.091904476 -0.40542799 -0.088148959
		 -0.39269963 -0.090888374 -0.029533247 -0.14531891 -0.047563497 -0.14547272 -0.047199342
		 -0.14909399 -0.030377129 -0.14881742 0.23598543 -0.12631699 0.21671115 -0.12614787
		 0.2181125 -0.12964645 0.23616394 -0.12984462 -0.40858781 0.035884228 -0.42650789
		 0.036931396 -0.43876809 0.034302082 -0.42323691 0.033376276 -0.3920539 0.03414065
		 -0.40802875 0.031724494 0.28884441 0.0019076206 0.27052858 0.0020306744 0.26939601
		 -0.0015421516 0.28697681 -0.001691383 0.48437449 -0.13867538 0.46386603 -0.13876447
		 0.46544346 -0.14236359 0.48515403 -0.14229128 0.96448171 0.018377453 0.94895887 0.019561665
		 0.93565822 0.016989402 0.95089036 0.015939264 0.97922814 0.01791678 0.96615523 0.015530535
		 -0.047427561 -0.16027896 -0.029812125 -0.16003869 0.21880512 -0.14086752 0.23774655
		 -0.14111041 -0.098960668 0.029790618 -0.085757107 0.027370546 -0.070056468 0.027647126
		 -0.053855039 0.028568968 0.26728174 -0.013423461 0.28325161 -0.0138342 0.48610407
		 -0.15408958 0.46768904 -0.1545064 -0.28173083 -0.019765066 -0.27276218 -0.019770624
		 -0.26658171 -0.018281395 -0.27825519 -0.017965861 -0.26736143 -0.020227619 -0.25620818
		 -0.019020727 -0.24902898 -0.020791816 -0.26388317 -0.020992832 -0.26560378 -0.021981867
		 -0.25301975 -0.022782905 -0.2714048 -0.022562636 -0.27247027 -0.021285396 -0.28415787
		 -0.021441812 -0.28122136 -0.02278021 0.11506329 0.059409995 0.11096625 0.062186398
		 0.099699333 0.059004456 0.081214324 0.058932234 -0.67371553 0.031385351 -0.6703229
		 0.03327756 -0.68322325 0.033805002 -0.68891793 0.031658016 -0.031195911 -0.001309677
		 -0.048418388 -0.0025413313 -0.038094532 -0.0046499125 -0.023683302 -0.0031581046
		 0.37154165 -0.015045471 0.385037 -0.014206054 0.38258559 -0.011569791 0.36744756
		 -0.011507308 -0.4620986 0.11010966 -0.46384835 0.10826885 -0.44252664 0.10829429
		 -0.44543159 0.11011304 -0.70700198 0.093654752 -0.72516483 0.093616113 -0.73185194
		 0.089821853 -0.70622957 0.089821853 -0.36294371 0.096802063 -0.36083448 0.10059636
		 -0.38205692 0.10056561 -0.38572156 0.096802063 0.74185234 0.00045482549 0.76671094
		 0.00048615847 0.76300257 0.0023040692 0.74735439 0.0022898319 -0.78426874 0.088297173
		 -0.79797316 0.086306982 -0.79820889 0.085116558 -0.78212595 0.084432483 -0.44652477
		 0.11609384 -0.46193218 0.11556018 -0.46244413 0.11520007 -0.44952038 0.11528961 -0.48723498
		 -0.033152092 -0.48375934 -0.031352583 -0.49442464 -0.031176036 -0.50148255 -0.032683644
		 0.12198767 -0.0026938915 0.093974113 -0.00080141053 0.093974113 -0.004250519 0.12198767
		 -0.0043511596 0.74802291 0.011679637 0.77350646 0.011645118 0.77350664 0.01405555
		 0.74802291 0.014826588 -0.48672545 -0.036167026 -0.48966217 -0.034828722 -0.50364023
		 -0.034880206 -0.50025463 -0.037089616 -0.47544041 0.11614845 -0.47392377 0.11519311
		 -0.12536478 0.099013045 -0.14110447 0.097277075 -0.11037346 0.097208537 -0.11337586
		 0.099085853 0.35789347 -0.014026311 0.36451608 -0.015960665 0.3576726 -0.011723337
		 0.35375392 -0.01296257 0.15456772 -0.014923004 0.16412158 -0.01785822 0.17739825
		 -0.018503891 0.1742733 -0.016414996 0.13531044 0.078008361 0.12182875 0.079401575
		 0.1156896 0.078441761 0.12793788 0.0767956 0.27536961 -0.022436257 0.29210395 -0.021909032
		 0.28191987 -0.01872208;
	setAttr ".uvtk[4250:4499]" 0.26417184 -0.021261979 0.52135855 -0.012236948 0.51562661
		 -0.0063391379 0.50697201 -0.0065073194 0.50440472 -0.0081733149 0.74384582 -0.01669584
		 0.74163121 -0.013549025 0.72005171 -0.017353533 0.72187752 -0.018961642 -0.44744846
		 0.11397534 -0.46247792 0.11419308 0.026837859 0.093032062 0.025369387 0.08932744
		 0.051896855 0.092376471 0.024573172 0.093687266 -0.14550081 0.099414416 -0.12749565
		 0.099151209 -0.12227993 0.10349847 -0.15234739 0.10350748 0.043633722 -0.028935377
		 0.071163081 -0.025630953 0.058128353 -0.024246356 0.032858819 -0.02560465 -0.3295992
		 0.076747149 -0.35943782 0.076463401 -0.36337686 0.076914504 -0.35424408 0.07371518
		 -0.64790255 0.075485088 -0.65435374 0.073654763 -0.62599486 0.070376813 -0.61725134
		 0.073521145 -0.46561238 -0.019440074 -0.46157816 -0.02384863 -0.44346803 -0.023435749
		 -0.43898323 -0.01946497 -0.33269045 0.081425905 -0.36120883 0.078825653 0.76262122
		 0.0062058489 0.74988818 0.0060806917 -0.6478954 0.078098834 -0.61876416 0.075555719
		 -0.023588179 -0.037751053 -0.0139567 -0.035953872 -0.022765376 -0.034612246 -0.035569735
		 -0.036796182 -0.49443009 -0.038251579 -0.48235837 -0.037920326 0.090178557 0.10749079
		 0.077699304 0.10877596 0.065054342 0.1070004 0.08020328 0.10467576 -0.18394549 0.10681894
		 -0.17413931 0.10574773 -0.16494729 0.10762665 -0.64184999 -0.026908454 -0.64153117
		 -0.024358865 -0.65568906 -0.026160445 -0.65826583 -0.028083531 -0.15874432 0.1087312
		 -0.16388993 0.10968287 -0.010096231 -0.038560327 -0.0050194194 -0.037259374 -0.47797444
		 -0.034672312 -0.47826654 -0.033157591 -0.2650772 -0.024061542 -0.27685434 -0.024533359
		 -0.4728657 -0.033614371 -0.46938762 -0.034379676 -0.47110775 -0.035368863 -0.4769088
		 -0.035949666 0.27009887 0.0055526104 0.26724675 0.0037278049 0.28138041 0.003175844
		 0.2812598 0.0045822687 -0.23409511 -0.020797685 -0.24192692 -0.019415863 -0.23949486
		 -0.022942664 0.0048057763 -0.039978988 0.0070236274 -0.038376082 -0.19449878 0.10769126
		 0.14362986 0.079344653 0.13678597 0.080439039 0.83379519 0.0024974837 0.82901967
		 0.0050514368 0.82025647 0.0047859377 0.82403791 0.0025322728 0.34081286 -0.017910954
		 0.33855394 -0.015414982 0.11212958 0.073050119 0.092445165 0.076097287 -0.60043466
		 0.087163121 -0.58807623 0.086602025 -0.58590204 0.090464033 -0.60187119 0.09046407
		 0.036499947 -0.0011682168 0.045624688 -0.0046714037 0.055150233 -0.0042609144 0.05929713
		 -0.0012402781 -0.055762514 -0.034035262 -0.039864324 -0.031459887 -0.14791186 0.106114
		 -0.14998753 0.10358471 -0.11232149 0.10156914 -0.12051054 0.1011209 -0.47521099 0.11406792
		 0.10994164 0.064242192 -0.2906855 -0.017598011 -0.29085785 -0.019142581 -0.27392474
		 -0.018218171 -0.27572799 -0.016997842 0.4787257 -0.080092043 0.47771972 -0.078089677
		 -0.68280923 0.036370765 -0.67065722 0.036510482 0.095748968 0.066842079 0.11023314
		 0.066816121 0.082175575 0.06696105 -0.68191063 0.039347667 -0.66976839 0.039414153
		 -0.32725638 0.030266892 -0.34018451 0.028957482 0.46524402 -0.075257219 0.47740695
		 -0.07543014 0.44924328 -0.074919187 -0.29123098 -0.015236537 -0.27640417 -0.014766326
		 0.51249862 -0.1027587 0.4998931 -0.10360324 0.51003563 -0.10546625 0.52121139 -0.10452002
		 0.096801355 0.076893874 0.096103184 0.073724948 0.11056153 0.072672442 0.11107726
		 0.075921603 0.081844896 0.077773392 0.082722679 0.07476154 -0.68050873 0.049601775
		 -0.68072104 0.046525307 -0.66810584 0.04721472 -0.6666894 0.050226521 0.24098343
		 -0.021876521 0.23122667 -0.023892829 0.24341004 -0.026282253 0.25254905 -0.024109786
		 0.21682002 -0.025320565 0.22927113 -0.027343798 0.46234527 -0.06698186 0.44595423
		 -0.067315012 0.44757074 -0.070066787 0.46376231 -0.069905452 -0.29126069 -0.0069782636
		 -0.29153565 -0.0098333843 -0.27680385 -0.0099136941 -0.27596903 -0.0071620159 0.46536282
		 -0.096986413 0.47810778 -0.099350736 0.49264807 -0.098821357 0.48369676 -0.096567981
		 0.095764481 0.069743127 0.1096852 0.069344066 0.081948921 0.070121989 -0.68130952
		 0.042391635 -0.66883308 0.042575009 0.25687677 -0.02874456 0.26737922 -0.027154077
		 0.24119562 -0.029478341 0.44843778 -0.072701715 0.4652366 -0.072852463 -0.29183981
		 -0.012861624 -0.27637354 -0.012548633 0.48883161 -0.10186796 0.50338066 -0.10103193
		 -0.44125831 -0.085827507 -0.4590283 -0.087911434 0.4622488 -0.13388428 0.48339188
		 -0.13380484 0.29082933 0.0067879208 0.27187866 0.0067342827 -0.37098628 0.037330583
		 -0.38998204 0.039204683 -0.41097003 0.040434934 0.23574015 -0.12170795 0.21476008
		 -0.12168335 -0.028410843 -0.14085439 -0.047969151 -0.14085568 -0.42111877 -0.084585436
		 -0.44090983 0.030453388 -0.42530626 0.029076166 -0.45649466 0.096160561 -0.47368318
		 0.095561996 -0.45839101 0.092262201 -0.44345832 0.093021624 -0.31329963 0.045204517
		 0.22919352 -0.11106087 0.20461893 -0.11139523 -0.2664071 0.11388659 -0.2630609 0.11294988
		 -0.2624886 0.11300921 -0.26583472 0.11394587 0.093036018 0.11267492 0.093565859 0.11201177
		 0.094266526 0.11201186 0.09373711 0.11267499 0.19123165 0.097001411 0.19251078 0.097013637
		 0.14904836 -0.014569971 0.14711776 -0.013804755 0.14641704 -0.013804941 0.14834741
		 -0.014570156 0.14838813 -0.015227881 0.14768767 -0.015227852 0.17891271 -0.010984315
		 0.17840409 -0.011112914 0.1790944 -0.011148827 0.17960317 -0.011020323 0.17908405
		 -0.010180299 0.1797743 -0.01021625 0.18850952 0.09806563 0.14645056 -0.015836503
		 0.14574957 -0.015836567 0.094567008 0.11131811 0.095267683 0.11131792 -0.15029748
		 0.094655558 -0.14504692 0.097364254 -0.01831766 0.10950369 -0.011876792 0.10742271
		 -0.57511145 0.13353227 0.60326135 0.026179224 0.6144318 0.036242511 0.5983147 0.021835789
		 0.21704338 -0.14326909 0.23552708 -0.14494044 0.80627328 -0.030766755 0.79159963
		 -0.032206595 0.16205642 -0.014900112 0.1511884 -0.016811578 0.17329007 -0.020047417
		 0.18079361 -0.017904844 -0.044719312 -0.16428301 -0.027457252 -0.16244024 0.50844121
		 -0.087631218 -0.29403833 -0.02692279 0.41145521 0.0070356759 0.44780719 0.014448581
		 -0.28565466 -0.0015313367 -0.28967023 -0.0040003555 -0.26975489 -0.0038901898 -0.26355854
		 -0.0016336711 0.45524621 -0.061536647 0.4334884 -0.061786599;
	setAttr ".uvtk[4500:4749]" 0.4402208 -0.064043127 0.4602966 -0.064028144 -0.1395359
		 -0.086665079 -0.11771299 -0.087143518 -0.082108103 -0.086076863 -0.094122976 -0.088287964
		 -0.68547684 0.055219725 -0.68337047 0.052321777 -0.66586393 0.052704867 -0.66588944
		 0.0558571 0.099291459 0.082692184 0.078252524 0.083403975 0.079249233 0.080251731
		 0.097934775 0.079623424 0.42560849 -0.093401894 0.43885481 -0.095662989 0.45948461
		 -0.094333142 0.478322 -0.093791835 -0.14355373 -0.089555308 -0.12329749 -0.089828312
		 -0.10623991 -0.090403453 0.45012084 -0.097684324 0.60264337 0.0055819191 0.61653394
		 0.0041741277 0.62741309 0.0057403701 0.61008835 0.0072847516 0.24964266 -0.031272396
		 0.2641083 -0.030755349 0.072178528 -0.10930315 0.053337961 -0.10949207 0.047758915
		 -0.11401102 0.071098559 -0.11360463 0.097995445 -0.10870942 0.097995445 -0.11294934
		 0.067930937 -0.089718603 0.07191699 -0.095356524 0.097995445 -0.09553495 0.097995445
		 -0.090470307 0.019258741 -0.11936051 -0.0011071586 -0.097046413 0.020140652 -0.095817484
		 0.40959927 0.06325417 0.45470908 0.060380176 0.36831731 0.088303022 0.38429579 0.057057876
		 0.36569569 -0.079430155 0.42212093 -0.080652326 0.56030166 0.068929493 0.52459317
		 0.071590565 -0.49624187 -0.070429839 -0.45786291 -0.06898617 -0.041451272 -0.12358443
		 -0.0069678118 -0.12413922 0.22211127 -0.027998216 0.25218907 -0.026579686 0.25327069
		 -0.023533992 0.22159201 -0.025121134 -0.33701709 0.052270144 -0.35694924 0.055262003
		 -0.37645757 0.055629853 0.25777233 -0.024770884 0.28508988 -0.019569254 0.28242517
		 0.025867593 0.30801582 0.026258616 0.49117294 -0.11440891 0.38413468 0.029857663
		 0.40234917 0.027225941 0.43299082 0.030794237 0.41764033 0.033385359 0.27112684 -0.17874171
		 0.23469454 -0.18094021 -0.85235703 -0.002045104 -0.87700778 -0.0038641947 -0.88271815
		 -0.0064188307 -0.81626451 -0.0022846849 0.18158741 0.015030136 0.25357279 0.023034049
		 0.24123332 0.018079005 0.28790894 -0.18249328 0.15808578 -0.16017497 0.19349416 -0.16460229
		 0.23416148 -0.16134872 0.19750254 -0.15652177 0.20441408 -0.1325226 0.18061891 -0.12826265
		 0.0098565118 0.031001877 -0.00021077189 0.037077215 -0.025607994 0.035990041 -0.01374602
		 0.03166059 0.16878588 -0.12358056 0.42212093 -0.10586926 0.36649188 -0.10671596 0.38102511
		 0.043527298 0.37866968 0.036866169 0.29311392 0.011022585 0.27255407 0.01402487 0.21131584
		 0.010117521 0.17595749 0.013007564 0.36397144 -0.17919149 0.35577044 -0.17689171
		 -0.22991945 -0.029727563 -0.21205249 -0.031539813 0.75509793 -0.1184069 0.74215233
		 -0.11884984 0.77481216 -0.11793905 0.41521281 -0.072855718 0.41512343 -0.071428075
		 0.42351201 -0.068191431 0.41867009 -0.062020041 0.39234969 -0.061836723 0.19056061
		 0.049426973 0.24654213 0.050711442 0.39896935 -0.038973562 0.39896935 -0.033751585
		 0.16428965 0.048194397 0.17759405 0.039442271 0.33282119 -0.083035 0.39467043 -0.083005935
		 0.27606744 0.0032377278 0.31505585 0.0087090349 0.23750836 -7.0593651e-06 0.10508303
		 0.0038558666 0.13442576 0.0040452564 -0.85565233 -0.019907523 -0.80914801 -0.019084683
		 0.37258813 -0.047224931 0.38546246 -0.045696396 0.39896935 -0.045125965 -0.14399463
		 -0.052972 -0.10309154 -0.056585148 -0.21435738 -0.050839808 0.19369243 -0.13615979
		 0.14781867 -0.13980709 0.23538058 -0.15295793 0.20713791 -0.14702815 0.5108912 -0.10991137
		 0.085024491 -0.14149879 0.17462313 -0.14206386 0.22127184 -0.13568825 0.24744175
		 -0.13218352 0.22916134 -0.12684612 0.2214241 -0.12850113 0.26051992 -0.12959123 0.066750206
		 -0.12098594 0.097995445 -0.12078098 0.29584521 0.042033058 0.050001774 -0.13000947
		 0.071721591 -0.13384299 0.42212093 -0.10982372 0.3675206 -0.11049616 0.50197679 0.082303531
		 0.4979493 0.078302614 0.0014226346 -0.090990804 -0.018981712 -0.092020445 -0.02145198
		 -0.098209515 0.48326892 0.07332404 0.54083073 0.075837448 -0.016165553 -0.10536699
		 -0.04346193 -0.099638604 -0.043601461 -0.10613163 0.038281608 -0.12702979 0.084860645
		 -0.12405846 0.044093933 -0.09564542 0.13387044 -0.11874327 0.14174025 -0.11722301
		 -0.14267014 -0.041926336 -0.12487753 -0.042516537 0.4018845 -0.0041719656 0.40101391
		 -0.0016615498 0.37839344 -0.0033488148 0.36323255 -0.0074393163 -0.39571288 0.055986308
		 0.048612669 -0.11431745 0.038391933 -0.11986557 0.076222241 -0.11518276 0.037175938
		 -0.089549512 0.17372453 0.002830981 0.48051438 -0.061276261 0.53565925 -0.058552183
		 0.083060384 -0.012381505 -0.081173196 -0.03204146 -0.05455713 -0.032555707 -0.47421947
		 0.11651625 -0.49584869 0.11454855 -0.5209223 0.11183053 -0.54833221 0.10906529 -0.58106154
		 0.10684192 -0.59705079 0.10894586 0.46538877 0.097672991 0.44383377 0.099279635 -0.21788464
		 0.015461498 -0.24612045 0.015898313 -0.1824142 0.015134059 -0.0808568 -0.035419125
		 -0.05455713 -0.035884671 -0.10494257 -0.03120069 -0.10536762 -0.034732457 -0.49580267
		 0.11049425 -0.46991944 0.11345217 -0.52661049 0.10714325 -0.55420625 0.10403272 0.45969501
		 0.09326826 0.43352291 0.095029861 -0.22195882 0.019296644 -0.24900034 0.020141399
		 -0.1824142 0.019004816 -0.081955314 -0.038938936 -0.05455713 -0.039230924 -0.10733031
		 -0.038803805 -0.46221653 0.1087762 -0.44104394 0.11203215 -0.5050233 0.10522725 0.49313366
		 0.091776937 0.41061541 0.096648492 -0.22463392 0.022302454 -0.1824142 0.022078641
		 -0.45666614 0.11534687 -0.45818126 0.1163005 -0.46139085 0.1163005 -0.46002191 0.11536941
		 0.006082675 0.1073775 0.010128414 0.10657901 0.0097528147 0.10816351 0.17983805 0.0042109662
		 0.18638359 0.0047045001 0.19363859 0.0061659869 0.18709315 0.0056724502 -0.29795399
		 0.10520545 -0.29795399 0.10440686 -0.29728067 0.10476527 -0.29728067 0.10556375 -0.087239757
		 -0.012024599 -0.093785301 -0.012024599 -0.10056912 -0.013942266 -0.094023518 -0.013942266
		 0.17211865 0.0029455919 0.17866433 0.003439093 0.0079164011 0.10976702 -0.44981 0.11351262
		 -0.44326442 0.11351262 -0.45012042 0.11534687 0.10183008 -0.013077125 0.10183008
		 -0.012278518 0.10053387 -0.0120487 0.10053387 -0.012847185 -0.17539732 0.11678677
		 -0.17211883 0.11896752 -0.16924529 0.12263964 -0.17252378 0.12045879 -0.45163548
		 0.1163005;
	setAttr ".uvtk[4750:4757]" 0.24242426 -0.013526179 0.74732518 0.012211517 0.73822224
		 0.013889662 0.19690643 0.10025056 0.19810005 0.09825778 0.20272936 0.097317822 0.7040838
		 -0.010998306 0.75936019 0.01102211;
createNode materialInfo -n "materialInfo3";
	rename -uid "C2DA783F-4D70-872B-DF1B-43BBE429181C";
createNode shadingEngine -n "blinn2SG";
	rename -uid "CD6CB877-4B77-54E7-2338-A2BC4A4C569C";
	setAttr ".ihi" 0;
	setAttr ".ro" yes;
createNode blinn -n "blinn3";
	rename -uid "C09DF4AC-45F3-4EA5-7B79-DA9C3EC4AE0C";
	setAttr ".sc" -type "float3" 0.18736705 0.18686499 0.28099999 ;
	setAttr ".ec" 0.1817999929189682;
	setAttr ".sro" 0;
createNode file -n "file3";
	rename -uid "AA20BFD5-4681-D953-79F1-75975FC4AE43";
	setAttr ".ftn" -type "string" "K:/내 드라이브/Library/CharacterRig/Misc/Cheetah/Col.JPG";
	setAttr ".cs" -type "string" "sRGB";
createNode place2dTexture -n "place2dTexture2";
	rename -uid "E44950D9-4FF6-C063-165B-F0918450CA8E";
createNode displayLayer -n "layer2";
	rename -uid "B7430804-4ADF-7E47-B297-A8BDB0F29650";
	setAttr ".do" 5;
createNode groupId -n "skinCluster2GroupId";
	rename -uid "E43A7CFA-4DF2-27ED-ADFB-B2B458DBC055";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster2Set";
	rename -uid "0DC07259-495C-2D74-5C79-2590E71462CD";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster2";
	rename -uid "99EA842E-4340-4BAE-A518-FB8A32520583";
	setAttr -s 382 ".wl";
	setAttr ".wl[0:381].w"
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1;
	setAttr -s 52 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.00012458487229893169 -2.0659965411739363e-07 -0.99999999223944547 0
		 0.48842646143880952 0.8726079101278057 6.0668998869479536e-05 0 0.87261700544801113 -0.48842137052174622 0.0001088135187630004 0
		 -65.86117792305113 -49.184170767824781 -0.0081949738967855429 1;
	setAttr ".pm[1]" -type "matrix" 0.00011262237759505737 1.8931314143273278e-06 -0.99999999365644021 0
		 0.47337540102499065 0.88086344084625756 5.4979141575822541e-05 0 0.88087262357999918 -0.47337046652374482 9.8307747761787595e-05 0
		 -69.895015497525108 -50.391380966661444 -0.0073579492219432224 1;
	setAttr ".pm[2]" -type "matrix" -0.00013346030276724713 6.5050905995434751e-06 -0.99999999107320137 0
		 0.43580015774893704 0.90004565541224446 -5.2305929585913116e-05 0 0.90005503534307874 -0.43579561508949055 -0.00012295400266156632 0
		 -72.363337743608156 -53.491136413355136 0.010443317886077339 1;
	setAttr ".pm[3]" -type "matrix" -0.000113829106982509 1.6261411675284125e-06 -0.99999999352028024 0
		 0.40325638293605254 0.91508889188929454 -4.4413292931412996e-05 0 0.91509843110801359 -0.40325217908670896 -0.00010481840982613142 0
		 -75.378751698686855 -56.229299560543879 0.0089575651269330186 1;
	setAttr ".pm[4]" -type "matrix" -0.0001138278910175504 1.6281443383055072e-06 -0.99999999352028002 0
		 0.40326828053553532 0.91508179521907895 -4.4413292931412989e-05 0 0.91508178921729388 -0.40326828297794143 -0.00010481840982613139 0
		 -79.498197900566055 -56.227900540898354 0.0089575651269301771 1;
	setAttr ".pm[5]" -type "matrix" -0.0001138278910175504 1.6281443383055072e-06 -0.99999999352028002 0
		 0.40326828053553532 0.91508179521907895 -4.4413292931412989e-05 0 0.91508178921729388 -0.40326828297794143 -0.00010481840982613139 0
		 -80.612309879342348 -56.227900540898318 0.0089575651269301754 1;
	setAttr ".pm[6]" -type "matrix" -0.00086805432194877758 -0.00024576642338952875 -0.99999959304019692 0
		 -0.31985754163774477 0.94746564636959452 4.4798496465073723e-05 0 0.94746524977919511 0.31985745035611107 -0.00090106189323161192 0
		 -37.804677765348472 -95.935749832126049 0.054881066241358967 1;
	setAttr ".pm[7]" -type "matrix" 0.99999999352028024 -4.3009446658595589e-05 -0.00010540221594260256 0
		 4.4413292931496256e-05 0.99991081255204783 0.013355334850295495 0 0.00010481840982613031 -0.013355339445016278 0.99991080798309684 0
		 -0.0089575651269524006 -91.152592140790162 -65.628267695748619 1;
	setAttr ".pm[8]" -type "matrix" 1.4998161329110534e-16 -5.6554169352655066e-15 1 0
		 -0.99726384104029986 -0.073924497655024082 -4.2182842680421475e-16 0 0.073924497655023957 -0.99726384104029986 -5.6905931121490428e-15 0
		 83.872544900709968 34.82358119320763 -9.9955730095320696 1;
	setAttr ".pm[9]" -type "matrix" -0.00022511566015480269 0.0013710229929272011 -0.99999903480898034 0
		 -0.94071644132093046 -0.33919391633890239 -0.00025327290011179795 0 -0.33919393619495009 0.94071547633417341 0.0013661017332728123 0
		 68.119236740264256 -7.7293558823963373 9.9696508005663631 1;
	setAttr ".pm[10]" -type "matrix" 0.00018717798116347746 0.0013767154793019353 -0.99999903480898045 0
		 -0.99883927546436047 -0.048166769070277796 -0.000253272900111798 0 -0.048167071264867023 0.9988383588007721 0.0013661017332728125 0
		 43.285132912672296 -21.374337344299473 9.9696508005663471 1;
	setAttr ".pm[11]" -type "matrix" 2.9399819585950689e-08 -3.301941798772908e-08 0.99999999999999889 0
		 -0.99543426641082378 -0.095449574410492566 2.6113898294678721e-08 0 0.095449574410491539 -0.995434266410824 -3.5674860428343882e-08 0
		 15.418194425213255 23.815547276061086 -9.9955726764485551 1;
	setAttr ".pm[12]" -type "matrix" 3.5674860389151733e-08 2.6113898447940512e-08 0.999999999999999 0
		 2.0996470987281921e-16 -0.99999999999999956 2.6113898294678724e-08 0 0.99999999999999978 -8.4834295552333768e-16 -3.5674860428343875e-08 0
		 -23.684737346442681 2.5033964996451297 -9.9955726764485568 1;
	setAttr ".pm[13]" -type "matrix" 2.6113898447940495e-08 3.5674860266687068e-08 -0.999999999999999 0
		 -0.99999999999999956 -2.3412450317527359e-16 -2.6113898294678724e-08 0 -1.2924321653734002e-15 0.99999999999999978 3.5674860305879203e-08 0
		 2.503396499645155 -32.957356692507574 9.995572676448548 1;
	setAttr ".pm[14]" -type "matrix" 6.9755856085539338e-15 5.4945716925802514e-15 -1 0
		 0.99726384104029997 -0.073924497655023805 6.6674151140336792e-15 0 -0.073924497655023749 -0.99726384104029997 -6.1719100655751393e-15 0
		 -83.8725700269556 34.823620567704097 -9.9955700000003862 1;
	setAttr ".pm[15]" -type "matrix" 4.128451747842549e-15 -2.1788968819162811e-08 -1 0
		 0.94071641281306895 0.33919408996047129 -7.3906854489914258e-09 0 0.3391940899604714 -0.94071641281306873 2.0497241810099345e-08 0
		 -68.117014022271746 7.7156208971678417 -9.9955701681156981 1;
	setAttr ".pm[16]" -type "matrix" -6.3948176963092055e-09 -2.0829437554418905e-08 -0.99999999999999989 0
		 0.99883929916792713 0.048166943412723186 -7.3906854489914249e-09 0 0.048166943412723359 -0.99883929916792691 2.0497241810099338e-08 0
		 -43.287017667550522 21.36058971888021 -9.9955701681156235 1;
	setAttr ".pm[17]" -type "matrix" -9.3133946889839879e-09 -1.9698219248695321e-08 -0.99999999999999978 0
		 0.99543426641082422 -0.095449574410493149 -7.3906854489914249e-09 0 -0.095449574410492954 -0.99543426641082411 2.0497241810099338e-08 0
		 -15.418206924585634 23.815596754290322 -9.9955701681154707 1;
	setAttr ".pm[18]" -type "matrix" -2.0497241986805066e-08 7.3906855660907057e-09 -0.99999999999999978 0
		 -7.4823354383235835e-16 -1 -7.3906854489914249e-09 0 -0.99999999999999989 5.7015629681577987e-16 2.0497241810099338e-08 0
		 23.68469979511838 2.5034000738741056 -9.9955701681153624 1;
	setAttr ".pm[19]" -type "matrix" -7.3906855660906966e-09 -2.0497241986805069e-08 -0.99999999999999978 0
		 1 -3.0414433398229558e-16 -7.3906854489914249e-09 0 -1.2606708696571735e-16 -0.99999999999999989 2.0497241810099338e-08 0
		 -2.5034000738741167 32.957399795118377 -9.9955701681153055 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.012294495601307132 -75.967541225644453 -29.210037970338188 1;
	setAttr ".pm[21]" -type "matrix" -2.2859675757999493e-16 -1.1377780453854859e-17 -1 0
		 -0.29046403376576591 0.95689226381392711 1.1377711280661503e-17 0 0.95689226381392722 0.29046403376576591 -2.2859536778628463e-16 0
		 59.163287827420568 -65.402607641841314 -2.4008296750867673e-15 1;
	setAttr ".pm[22]" -type "matrix" -2.2836516322103463e-16 1.5338866655846349e-17 -1 0
		 -0.1769748535096442 0.98421556686330058 1.137771128066152e-17 0 0.98422155060924299 0.17697377756026983 -2.2859536778628468e-16 0
		 36.75685803871405 -70.163638830663842 -4.260014295321943e-16 1;
	setAttr ".pm[23]" -type "matrix" -2.2121487810953429e-16 5.8735570301223507e-17 -1 0
		 0.014548037722741609 0.99989417298626149 1.1377711280661523e-17 0 0.99990025205359367 -0.014547949275418371 -2.2859536778628468e-16 0
		 6.8492862925651501 -72.818173065675396 1.6953717168565252e-14 1;
	setAttr ".pm[24]" -type "matrix" -2.1182091911337398e-16 8.6704891894763002e-17 -1 0
		 0.14305631977588137 0.98971467515330724 1.137771128066152e-17 0 0.98972069233223736 -0.14305545004012693 -2.2859536778628468e-16 0
		 -18.434736002816852 -71.036945193173963 2.9677641756877866e-14 1;
	setAttr ".pm[25]" -type "matrix" -2.1219034610196334e-16 8.5793656574725056e-17 -1 0
		 0.13880017776148634 0.99032040807679 1.137771128066154e-17 0 0.99032040807679023 -0.13880017776148648 -2.2859536778628468e-16 0
		 -34.759032998643981 -71.187002600727553 9.2010110499140059e-14 1;
	setAttr ".pm[26]" -type "matrix" 5.8808631031432553e-17 -1.3596013310669328e-15 -1 0
		 0.96925223632062973 0.24606930403335264 -2.3388114379588637e-16 0 0.24606930403335264 -0.96925223632062973 1.372426867489865e-15 0
		 -59.867813950748967 -63.389001346120871 -9.9602199999999073 1;
	setAttr ".pm[27]" -type "matrix" 7.19903217066568e-16 -1.1548651837249107e-15 -1 0
		 0.72289138479508119 0.69096168185294471 -2.3388114379588622e-16 0 0.69096168185294471 -0.72289138479508119 1.3724268674898646e-15 0
		 5.6402915176482011 -69.617200793022022 -9.9602199999998948 1;
	setAttr ".pm[28]" -type "matrix" -2.549557143036952e-16 -1.3367766523494708e-15 -1 0
		 0.99985661431772543 0.016933717993842742 -2.3388114379588617e-16 0 0.016933717993842742 -0.99985661431772543 1.3724268674898642e-15 0
		 -23.421978678670282 -73.142808813347543 -9.96021999999987 1;
	setAttr ".pm[29]" -type "matrix" -1.3322676317215364e-15 -1.4901161149778878e-08 0.99999999999999978 0
		 1.7208456881689915e-15 0.99999999999999956 1.4901161106104266e-08 0 -0.99999999999999978 1.6098234061572299e-15 -1.3724268443288074e-15 0
		 -73.110900000000015 -2.5034001484187378 9.9602199626962999 1;
	setAttr ".pm[30]" -type "matrix" -1.3322676317215364e-15 6.6520297792985411e-08 -0.99999999999999767 0
		 1.7208456881689917e-15 -0.99999999999999745 -6.6520297749310777e-08 0 -0.99999999999999978 -1.6098234770007167e-15 1.372426761231111e-15 0
		 -63.655700000000003 2.5034006625567056 -9.9602198334729444 1;
	setAttr ".pm[31]" -type "matrix" 5.7974577104798655e-17 -1.1307245108308495e-15 -1 0
		 -0.96925223632062962 -0.24606930403335253 2.458726262921843e-16 0 -0.24606930403335259 0.96925223632062962 -9.684775344893277e-16 0
		 59.867813950748989 63.389001346120821 9.9602199999999605 1;
	setAttr ".pm[32]" -type "matrix" 6.0660743638632905e-16 -9.55994973368035e-16 -1 0
		 -0.72289138479508108 -0.69096168185294482 2.458726262921843e-16 0 -0.69096168185294482 0.72289138479508097 -9.684775344893277e-16 0
		 -5.6403289296304777 69.617191278823981 9.9602199999999605 1;
	setAttr ".pm[33]" -type "matrix" -2.0321256329858503e-16 -1.1138238752611486e-15 -1 0
		 -0.99985661431772577 -0.016933717993842915 2.4587262629218435e-16 0 -0.016933717993842971 0.99985661431772566 -9.684775344893277e-16 0
		 23.421978678670268 73.1428088133475 9.9602199999999517 1;
	setAttr ".pm[34]" -type "matrix" -1.1102230246251569e-15 -7.885984946898272e-16 1 0
		 -1.7763568394002503e-15 -1 -8.1242651605698221e-16 0 1 -1.8353374375834627e-15 9.6847753448932671e-16 0
		 73.110899999999987 2.5033999999998979 -9.9602199999999357 1;
	setAttr ".pm[35]" -type "matrix" -1.1102230246251569e-15 -2.9802322165650701e-08 -0.99999999999999956 0
		 -1.7763568394002505e-15 0.99999999999999956 -2.9802322141822678e-08 0 1 1.8353374087205816e-15 -9.6847758918664551e-16 0
		 63.655699999999975 -2.5033997031622053 9.9602200746070633 1;
	setAttr ".pm[36]" -type "matrix" -3.6849560335502607e-17 7.4668987557581101e-17 1 0
		 -0.44254844318862974 0.89674459877454527 -7.4668987557581101e-17 0 -0.89674459877454527 -0.44254844318862974 3.6849560335502607e-17 0
		 -16.522795046849147 -95.863657054831407 8.7682558892726907e-16 1;
	setAttr ".pm[37]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -60.883687655383532 -76.855412300828291 8.7682558892728376e-16 1;
	setAttr ".pm[38]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -65.151340200696509 -76.855412300828291 2.0373213689002193e-15 1;
	setAttr ".pm[39]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -71.616141493159205 -76.855412300828291 6.0687656466805437e-15 1;
	setAttr ".pm[40]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -78.973648857535167 -76.855412300828291 1.0496651058565191e-14 1;
	setAttr ".pm[41]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -86.000111716726693 -76.85541230082832 1.4777523177717263e-14 1;
	setAttr ".pm[42]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -93.212787110084449 -76.855412300828291 1.9141090274031412e-14 1;
	setAttr ".pm[43]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -100.25994025085001 -76.855412300828334 2.3431150723979272e-14 1;
	setAttr ".pm[44]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -107.86573099411429 -76.85541230082832 2.7969296105413356e-14 1;
	setAttr ".pm[45]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -115.61635370839679 -76.855412300828306 3.2571759802417908e-14 1;
	setAttr ".pm[46]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -123.40835698582733 -76.855412300828306 3.7192600161014036e-14 1;
	setAttr ".pm[47]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -132.04866180779308 -76.85541230082822 4.219016208223744e-14 1;
	setAttr ".pm[48]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -139.71652339577946 -76.855412300828334 4.6755872456058853e-14 1;
	setAttr ".pm[49]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -146.3291806234904 -76.855412300828291 5.0852977959295225e-14 1;
	setAttr ".pm[50]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -151.01764166481669 -76.855412300828277 5.4095568698523483e-14 1;
	setAttr ".pm[51]" -type "matrix" -2.5558387294194941e-17 -4.9277345199792484e-17 -1 0
		 0.46041897397730874 0.88770173391837115 -4.9277345199792484e-17 0 0.88770173391837126 -0.46041897397730874 2.5558387294194941e-17 0
		 2.3474479136248552 -92.270111827088343 1.2227447489359574e-14 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 4 ".ma";
	setAttr -s 52 ".dpf[0:51]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 4 ".lw";
	setAttr -s 4 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupParts -n "skinCluster2GroupParts";
	rename -uid "83144E0E-4DCF-D084-5A31-42B9A3C70394";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak5";
	rename -uid "684964E4-4879-271B-D229-24A403459D41";
createNode objectSet -n "tweakSet5";
	rename -uid "531AF1BA-41AB-4E03-9524-559927E5FACE";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId80";
	rename -uid "74469859-419C-151B-050D-718BDE6F104F";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts11";
	rename -uid "0B9330F1-4A32-641C-76B5-189B720D8B07";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode materialInfo -n "materialInfo4";
	rename -uid "CB7C4EE8-490B-6599-3B17-BD854C1F3846";
createNode shadingEngine -n "lambert2SG";
	rename -uid "3A6FE5EA-435B-A96B-FBA9-9B98A4820749";
	setAttr ".ihi" 0;
	setAttr -s 2 ".dsm";
	setAttr ".ro" yes;
createNode lambert -n "lambert2";
	rename -uid "666790ED-42AB-6850-7560-D1A381A43DBD";
createNode ramp -n "ramp1";
	rename -uid "2C6D740A-4DAD-2E09-9F07-019432A18912";
	setAttr ".in" 0;
	setAttr -s 2 ".cel";
	setAttr ".cel[0].ep" 0;
	setAttr ".cel[0].ec" -type "float3" 1 1 1 ;
	setAttr ".cel[2].ep" 0.86500000953674316;
	setAttr ".cel[2].ec" -type "float3" 0.147 0.059780609 0.031604998 ;
createNode place2dTexture -n "place2dTexture1";
	rename -uid "87A939E7-4364-1982-164D-D6B7D3F6BABC";
createNode groupId -n "skinCluster3GroupId";
	rename -uid "DD79E751-40FD-4046-091A-7BBF10B520D4";
	setAttr ".ihi" 0;
createNode objectSet -n "skinCluster3Set";
	rename -uid "40CB735A-4468-212B-696D-16AA0D3D42EB";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode skinCluster -n "skinCluster3";
	rename -uid "9ECEFCBF-4358-397D-88F4-EAB8ADADDFE8";
	setAttr -s 382 ".wl";
	setAttr ".wl[0:381].w"
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1
		1 4 1;
	setAttr -s 52 ".pm";
	setAttr ".pm[0]" -type "matrix" 0.00012458487229893169 -2.0659965411739363e-07 -0.99999999223944547 0
		 0.48842646143880952 0.8726079101278057 6.0668998869479536e-05 0 0.87261700544801113 -0.48842137052174622 0.0001088135187630004 0
		 -65.86117792305113 -49.184170767824781 -0.0081949738967855429 1;
	setAttr ".pm[1]" -type "matrix" 0.00011262237759505737 1.8931314143273278e-06 -0.99999999365644021 0
		 0.47337540102499065 0.88086344084625756 5.4979141575822541e-05 0 0.88087262357999918 -0.47337046652374482 9.8307747761787595e-05 0
		 -69.895015497525108 -50.391380966661444 -0.0073579492219432224 1;
	setAttr ".pm[2]" -type "matrix" -0.00013346030276724713 6.5050905995434751e-06 -0.99999999107320137 0
		 0.43580015774893704 0.90004565541224446 -5.2305929585913116e-05 0 0.90005503534307874 -0.43579561508949055 -0.00012295400266156632 0
		 -72.363337743608156 -53.491136413355136 0.010443317886077339 1;
	setAttr ".pm[3]" -type "matrix" -0.000113829106982509 1.6261411675284125e-06 -0.99999999352028024 0
		 0.40325638293605254 0.91508889188929454 -4.4413292931412996e-05 0 0.91509843110801359 -0.40325217908670896 -0.00010481840982613142 0
		 -75.378751698686855 -56.229299560543879 0.0089575651269330186 1;
	setAttr ".pm[4]" -type "matrix" -0.0001138278910175504 1.6281443383055072e-06 -0.99999999352028002 0
		 0.40326828053553532 0.91508179521907895 -4.4413292931412989e-05 0 0.91508178921729388 -0.40326828297794143 -0.00010481840982613139 0
		 -79.498197900566055 -56.227900540898354 0.0089575651269301771 1;
	setAttr ".pm[5]" -type "matrix" -0.0001138278910175504 1.6281443383055072e-06 -0.99999999352028002 0
		 0.40326828053553532 0.91508179521907895 -4.4413292931412989e-05 0 0.91508178921729388 -0.40326828297794143 -0.00010481840982613139 0
		 -80.612309879342348 -56.227900540898318 0.0089575651269301754 1;
	setAttr ".pm[6]" -type "matrix" -0.00086805432194877758 -0.00024576642338952875 -0.99999959304019692 0
		 -0.31985754163774477 0.94746564636959452 4.4798496465073723e-05 0 0.94746524977919511 0.31985745035611107 -0.00090106189323161192 0
		 -37.804677765348472 -95.935749832126049 0.054881066241358967 1;
	setAttr ".pm[7]" -type "matrix" 0.99999999352028024 -4.3009446658595589e-05 -0.00010540221594260256 0
		 4.4413292931496256e-05 0.99991081255204783 0.013355334850295495 0 0.00010481840982613031 -0.013355339445016278 0.99991080798309684 0
		 -0.0089575651269524006 -91.152592140790162 -65.628267695748619 1;
	setAttr ".pm[8]" -type "matrix" 1.4998161329110534e-16 -5.6554169352655066e-15 1 0
		 -0.99726384104029986 -0.073924497655024082 -4.2182842680421475e-16 0 0.073924497655023957 -0.99726384104029986 -5.6905931121490428e-15 0
		 83.872544900709968 34.82358119320763 -9.9955730095320696 1;
	setAttr ".pm[9]" -type "matrix" -0.00022511566015480269 0.0013710229929272011 -0.99999903480898034 0
		 -0.94071644132093046 -0.33919391633890239 -0.00025327290011179795 0 -0.33919393619495009 0.94071547633417341 0.0013661017332728123 0
		 68.119236740264256 -7.7293558823963373 9.9696508005663631 1;
	setAttr ".pm[10]" -type "matrix" 0.00018717798116347746 0.0013767154793019353 -0.99999903480898045 0
		 -0.99883927546436047 -0.048166769070277796 -0.000253272900111798 0 -0.048167071264867023 0.9988383588007721 0.0013661017332728125 0
		 43.285132912672296 -21.374337344299473 9.9696508005663471 1;
	setAttr ".pm[11]" -type "matrix" 2.9399819585950689e-08 -3.301941798772908e-08 0.99999999999999889 0
		 -0.99543426641082378 -0.095449574410492566 2.6113898294678721e-08 0 0.095449574410491539 -0.995434266410824 -3.5674860428343882e-08 0
		 15.418194425213255 23.815547276061086 -9.9955726764485551 1;
	setAttr ".pm[12]" -type "matrix" 3.5674860389151733e-08 2.6113898447940512e-08 0.999999999999999 0
		 2.0996470987281921e-16 -0.99999999999999956 2.6113898294678724e-08 0 0.99999999999999978 -8.4834295552333768e-16 -3.5674860428343875e-08 0
		 -23.684737346442681 2.5033964996451297 -9.9955726764485568 1;
	setAttr ".pm[13]" -type "matrix" 2.6113898447940495e-08 3.5674860266687068e-08 -0.999999999999999 0
		 -0.99999999999999956 -2.3412450317527359e-16 -2.6113898294678724e-08 0 -1.2924321653734002e-15 0.99999999999999978 3.5674860305879203e-08 0
		 2.503396499645155 -32.957356692507574 9.995572676448548 1;
	setAttr ".pm[14]" -type "matrix" 6.9755856085539338e-15 5.4945716925802514e-15 -1 0
		 0.99726384104029997 -0.073924497655023805 6.6674151140336792e-15 0 -0.073924497655023749 -0.99726384104029997 -6.1719100655751393e-15 0
		 -83.8725700269556 34.823620567704097 -9.9955700000003862 1;
	setAttr ".pm[15]" -type "matrix" 4.128451747842549e-15 -2.1788968819162811e-08 -1 0
		 0.94071641281306895 0.33919408996047129 -7.3906854489914258e-09 0 0.3391940899604714 -0.94071641281306873 2.0497241810099345e-08 0
		 -68.117014022271746 7.7156208971678417 -9.9955701681156981 1;
	setAttr ".pm[16]" -type "matrix" -6.3948176963092055e-09 -2.0829437554418905e-08 -0.99999999999999989 0
		 0.99883929916792713 0.048166943412723186 -7.3906854489914249e-09 0 0.048166943412723359 -0.99883929916792691 2.0497241810099338e-08 0
		 -43.287017667550522 21.36058971888021 -9.9955701681156235 1;
	setAttr ".pm[17]" -type "matrix" -9.3133946889839879e-09 -1.9698219248695321e-08 -0.99999999999999978 0
		 0.99543426641082422 -0.095449574410493149 -7.3906854489914249e-09 0 -0.095449574410492954 -0.99543426641082411 2.0497241810099338e-08 0
		 -15.418206924585634 23.815596754290322 -9.9955701681154707 1;
	setAttr ".pm[18]" -type "matrix" -2.0497241986805066e-08 7.3906855660907057e-09 -0.99999999999999978 0
		 -7.4823354383235835e-16 -1 -7.3906854489914249e-09 0 -0.99999999999999989 5.7015629681577987e-16 2.0497241810099338e-08 0
		 23.68469979511838 2.5034000738741056 -9.9955701681153624 1;
	setAttr ".pm[19]" -type "matrix" -7.3906855660906966e-09 -2.0497241986805069e-08 -0.99999999999999978 0
		 1 -3.0414433398229558e-16 -7.3906854489914249e-09 0 -1.2606708696571735e-16 -0.99999999999999989 2.0497241810099338e-08 0
		 -2.5034000738741167 32.957399795118377 -9.9955701681153055 1;
	setAttr ".pm[20]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 -0.012294495601307132 -75.967541225644453 -29.210037970338188 1;
	setAttr ".pm[21]" -type "matrix" -2.2859675757999493e-16 -1.1377780453854859e-17 -1 0
		 -0.29046403376576591 0.95689226381392711 1.1377711280661503e-17 0 0.95689226381392722 0.29046403376576591 -2.2859536778628463e-16 0
		 59.163287827420568 -65.402607641841314 -2.4008296750867673e-15 1;
	setAttr ".pm[22]" -type "matrix" -2.2836516322103463e-16 1.5338866655846349e-17 -1 0
		 -0.1769748535096442 0.98421556686330058 1.137771128066152e-17 0 0.98422155060924299 0.17697377756026983 -2.2859536778628468e-16 0
		 36.75685803871405 -70.163638830663842 -4.260014295321943e-16 1;
	setAttr ".pm[23]" -type "matrix" -2.2121487810953429e-16 5.8735570301223507e-17 -1 0
		 0.014548037722741609 0.99989417298626149 1.1377711280661523e-17 0 0.99990025205359367 -0.014547949275418371 -2.2859536778628468e-16 0
		 6.8492862925651501 -72.818173065675396 1.6953717168565252e-14 1;
	setAttr ".pm[24]" -type "matrix" -2.1182091911337398e-16 8.6704891894763002e-17 -1 0
		 0.14305631977588137 0.98971467515330724 1.137771128066152e-17 0 0.98972069233223736 -0.14305545004012693 -2.2859536778628468e-16 0
		 -18.434736002816852 -71.036945193173963 2.9677641756877866e-14 1;
	setAttr ".pm[25]" -type "matrix" -2.1219034610196334e-16 8.5793656574725056e-17 -1 0
		 0.13880017776148634 0.99032040807679 1.137771128066154e-17 0 0.99032040807679023 -0.13880017776148648 -2.2859536778628468e-16 0
		 -34.759032998643981 -71.187002600727553 9.2010110499140059e-14 1;
	setAttr ".pm[26]" -type "matrix" 5.8808631031432553e-17 -1.3596013310669328e-15 -1 0
		 0.96925223632062973 0.24606930403335264 -2.3388114379588637e-16 0 0.24606930403335264 -0.96925223632062973 1.372426867489865e-15 0
		 -59.867813950748967 -63.389001346120871 -9.9602199999999073 1;
	setAttr ".pm[27]" -type "matrix" 7.19903217066568e-16 -1.1548651837249107e-15 -1 0
		 0.72289138479508119 0.69096168185294471 -2.3388114379588622e-16 0 0.69096168185294471 -0.72289138479508119 1.3724268674898646e-15 0
		 5.6402915176482011 -69.617200793022022 -9.9602199999998948 1;
	setAttr ".pm[28]" -type "matrix" -2.549557143036952e-16 -1.3367766523494708e-15 -1 0
		 0.99985661431772543 0.016933717993842742 -2.3388114379588617e-16 0 0.016933717993842742 -0.99985661431772543 1.3724268674898642e-15 0
		 -23.421978678670282 -73.142808813347543 -9.96021999999987 1;
	setAttr ".pm[29]" -type "matrix" -1.3322676317215364e-15 -1.4901161149778878e-08 0.99999999999999978 0
		 1.7208456881689915e-15 0.99999999999999956 1.4901161106104266e-08 0 -0.99999999999999978 1.6098234061572299e-15 -1.3724268443288074e-15 0
		 -73.110900000000015 -2.5034001484187378 9.9602199626962999 1;
	setAttr ".pm[30]" -type "matrix" -1.3322676317215364e-15 6.6520297792985411e-08 -0.99999999999999767 0
		 1.7208456881689917e-15 -0.99999999999999745 -6.6520297749310777e-08 0 -0.99999999999999978 -1.6098234770007167e-15 1.372426761231111e-15 0
		 -63.655700000000003 2.5034006625567056 -9.9602198334729444 1;
	setAttr ".pm[31]" -type "matrix" 5.7974577104798655e-17 -1.1307245108308495e-15 -1 0
		 -0.96925223632062962 -0.24606930403335253 2.458726262921843e-16 0 -0.24606930403335259 0.96925223632062962 -9.684775344893277e-16 0
		 59.867813950748989 63.389001346120821 9.9602199999999605 1;
	setAttr ".pm[32]" -type "matrix" 6.0660743638632905e-16 -9.55994973368035e-16 -1 0
		 -0.72289138479508108 -0.69096168185294482 2.458726262921843e-16 0 -0.69096168185294482 0.72289138479508097 -9.684775344893277e-16 0
		 -5.6403289296304777 69.617191278823981 9.9602199999999605 1;
	setAttr ".pm[33]" -type "matrix" -2.0321256329858503e-16 -1.1138238752611486e-15 -1 0
		 -0.99985661431772577 -0.016933717993842915 2.4587262629218435e-16 0 -0.016933717993842971 0.99985661431772566 -9.684775344893277e-16 0
		 23.421978678670268 73.1428088133475 9.9602199999999517 1;
	setAttr ".pm[34]" -type "matrix" -1.1102230246251569e-15 -7.885984946898272e-16 1 0
		 -1.7763568394002503e-15 -1 -8.1242651605698221e-16 0 1 -1.8353374375834627e-15 9.6847753448932671e-16 0
		 73.110899999999987 2.5033999999998979 -9.9602199999999357 1;
	setAttr ".pm[35]" -type "matrix" -1.1102230246251569e-15 -2.9802322165650701e-08 -0.99999999999999956 0
		 -1.7763568394002505e-15 0.99999999999999956 -2.9802322141822678e-08 0 1 1.8353374087205816e-15 -9.6847758918664551e-16 0
		 63.655699999999975 -2.5033997031622053 9.9602200746070633 1;
	setAttr ".pm[36]" -type "matrix" -3.6849560335502607e-17 7.4668987557581101e-17 1 0
		 -0.44254844318862974 0.89674459877454527 -7.4668987557581101e-17 0 -0.89674459877454527 -0.44254844318862974 3.6849560335502607e-17 0
		 -16.522795046849147 -95.863657054831407 8.7682558892726907e-16 1;
	setAttr ".pm[37]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -60.883687655383532 -76.855412300828291 8.7682558892728376e-16 1;
	setAttr ".pm[38]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -65.151340200696509 -76.855412300828291 2.0373213689002193e-15 1;
	setAttr ".pm[39]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -71.616141493159205 -76.855412300828291 6.0687656466805437e-15 1;
	setAttr ".pm[40]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -78.973648857535167 -76.855412300828291 1.0496651058565191e-14 1;
	setAttr ".pm[41]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -86.000111716726693 -76.85541230082832 1.4777523177717263e-14 1;
	setAttr ".pm[42]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -93.212787110084449 -76.855412300828291 1.9141090274031412e-14 1;
	setAttr ".pm[43]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -100.25994025085001 -76.855412300828334 2.3431150723979272e-14 1;
	setAttr ".pm[44]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -107.86573099411429 -76.85541230082832 2.7969296105413356e-14 1;
	setAttr ".pm[45]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -115.61635370839679 -76.855412300828306 3.2571759802417908e-14 1;
	setAttr ".pm[46]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -123.40835698582733 -76.855412300828306 3.7192600161014036e-14 1;
	setAttr ".pm[47]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -132.04866180779308 -76.85541230082822 4.219016208223744e-14 1;
	setAttr ".pm[48]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -139.71652339577946 -76.855412300828334 4.6755872456058853e-14 1;
	setAttr ".pm[49]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -146.3291806234904 -76.855412300828291 5.0852977959295225e-14 1;
	setAttr ".pm[50]" -type "matrix" 4.5297872291987787e-31 8.3266726846886741e-17 1 0
		 5.440092820663267e-15 1 -7.4668987557581101e-17 0 -1 5.440092820663267e-15 3.6849560335502607e-17 0
		 -151.01764166481669 -76.855412300828277 5.4095568698523483e-14 1;
	setAttr ".pm[51]" -type "matrix" -2.5558387294194941e-17 -4.9277345199792484e-17 -1 0
		 0.46041897397730874 0.88770173391837115 -4.9277345199792484e-17 0 0.88770173391837126 -0.46041897397730874 2.5558387294194941e-17 0
		 2.3474479136248552 -92.270111827088343 1.2227447489359574e-14 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 4 ".ma";
	setAttr -s 52 ".dpf[0:51]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 4 ".lw";
	setAttr -s 4 ".lw";
	setAttr ".mi" 4;
	setAttr ".ucm" yes;
createNode groupParts -n "skinCluster3GroupParts";
	rename -uid "D0E98C86-46A3-78E5-FF3E-FD96FFE113C7";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode tweak -n "tweak6";
	rename -uid "168F03A7-4DEC-C5BB-5B38-C9B89AD4E009";
createNode objectSet -n "tweakSet6";
	rename -uid "12CAD9BA-4A24-05BF-0844-4CABF4F8C7EA";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId82";
	rename -uid "013D1CE6-48C4-777F-E326-33831D8C88B5";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts13";
	rename -uid "CD6570A1-4244-7A99-63BE-B6BE0B28B590";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "567A0D11-49ED-F1D4-4FE3-2583DFF6B3F7";
	setAttr -s 4 ".lnk";
	setAttr -s 4 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "8D06B9B7-4ACE-5F3D-45E4-42A7A1E2A430";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "F10C12B2-44B9-5773-AD40-E780AE927623";
createNode displayLayer -n "defaultLayer";
	rename -uid "FD55BA10-4811-5604-E7BA-20AAEFD12FD5";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "DBE2F9EF-4F2F-C736-2C09-8CA4CCB2A4BB";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "DAAFFA91-4008-6CF8-280E-D39FCCBF02EE";
	setAttr ".g" yes;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "2C736414-41F5-90DF-2D04-4885EA725156";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 120 -ast 0 -aet 125 ";
	setAttr ".st" 6;
createNode deltaMush -n "deltaMush1";
	rename -uid "8E50D672-4BE5-BFFE-C311-E1B08C09503F";
createNode objectSet -n "deltaMush1Set";
	rename -uid "A8E5D1B0-435A-7CCE-DE7B-C7B4572EB056";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "deltaMush1GroupId";
	rename -uid "08F3964E-4387-60F0-B8B2-22A3862E761D";
	setAttr ".ihi" 0;
createNode groupParts -n "deltaMush1GroupParts";
	rename -uid "8869D8ED-495C-A467-00DF-0FADFEA38BDE";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode nodeGraphEditorInfo -n "MayaNodeEditorSavedTabsInfo";
	rename -uid "02A8D312-4D44-5EE4-BD4A-D08194A6CC51";
	setAttr ".tgi[0].tn" -type "string" "Untitled_1";
	setAttr ".tgi[0].vl" -type "double2" 2247.390020586854 -1899.9999245007764 ;
	setAttr ".tgi[0].vh" -type "double2" 6656.1810541884479 -705.95235290034475 ;
select -ne :time1;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".o" 0;
	setAttr -av ".unw";
	setAttr -av -k on ".etw";
	setAttr -av -k on ".tps";
	setAttr -av -k on ".tms";
select -ne :hardwareRenderingGlobals;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -av -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".rm";
	setAttr -k on ".lm";
	setAttr -k on ".hom";
	setAttr -k on ".hodm";
	setAttr -k on ".xry";
	setAttr -k on ".jxr";
	setAttr -k on ".sslt";
	setAttr -k on ".cbr";
	setAttr -k on ".bbr";
	setAttr -k on ".mhl";
	setAttr -k on ".cons";
	setAttr -k on ".vac" 2;
	setAttr -k on ".hwi";
	setAttr -k on ".csvd";
	setAttr -av ".ta";
	setAttr -av ".tq";
	setAttr -k on ".ts";
	setAttr -av ".etmr" no;
	setAttr -av ".tmr" 4096;
	setAttr -av ".aoon";
	setAttr -av ".aoam";
	setAttr -av ".aora";
	setAttr -k on ".aofr";
	setAttr -av -k on ".aosm";
	setAttr -k on ".hff";
	setAttr -av ".hfd";
	setAttr -av ".hfs";
	setAttr -av ".hfe";
	setAttr -av ".hfc";
	setAttr -av ".hfcr";
	setAttr -av ".hfcg";
	setAttr -av ".hfcb";
	setAttr -av ".hfa";
	setAttr -av ".mbe";
	setAttr -k on ".mbt";
	setAttr -av -k on ".mbsof";
	setAttr -k on ".mbsc";
	setAttr -k on ".mbc";
	setAttr -k on ".mbfa";
	setAttr -k on ".mbftb";
	setAttr -k on ".mbftg";
	setAttr -k on ".mbftr";
	setAttr -k on ".mbfta";
	setAttr -k on ".mbfe";
	setAttr -k on ".mbme";
	setAttr -k on ".mbcsx";
	setAttr -k on ".mbcsy";
	setAttr -k on ".mbasx";
	setAttr -k on ".mbasy";
	setAttr -k on ".blen";
	setAttr -k on ".blth";
	setAttr -k on ".blfr";
	setAttr -k on ".blfa";
	setAttr -k on ".blat";
	setAttr -av ".msaa" yes;
	setAttr -av -k on ".aasc";
	setAttr -k on ".aasq";
	setAttr -k on ".laa";
	setAttr -k on ".rtfm";
select -ne :renderPartition;
	setAttr -av -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 4 ".st";
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
	setAttr -s 7 ".s";
select -ne :postProcessList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".p";
select -ne :defaultRenderUtilityList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".u";
select -ne :defaultRenderingList1;
	setAttr -k on ".ihi";
select -ne :defaultTextureList1;
	setAttr -k on ".cch";
	setAttr -cb on ".ihi";
	setAttr -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -s 2 ".tx";
select -ne :initialShadingGroup;
	setAttr -av -k on ".cch";
	setAttr -k on ".fzn";
	setAttr -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -k on ".bbx";
	setAttr -k on ".vwm";
	setAttr -k on ".tpv";
	setAttr -k on ".uit";
	setAttr -k on ".mwc";
	setAttr -av -cb on ".an";
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
	setAttr -av -k on ".macc";
	setAttr -av -k on ".macd";
	setAttr -av -k on ".macq";
	setAttr -av -k on ".mcfr" 48;
	setAttr -cb on ".ifg";
	setAttr -av -k on ".clip";
	setAttr -av -k on ".edm";
	setAttr -av -k on ".edl";
	setAttr -av -cb on ".ren";
	setAttr -av -k on ".esr";
	setAttr -av -k on ".ors";
	setAttr -cb on ".sdf";
	setAttr -av -k on ".outf";
	setAttr -av -cb on ".imfkey";
	setAttr -av -k on ".gama";
	setAttr -av -k on ".exrc";
	setAttr -av -k on ".expt";
	setAttr -av -k on ".an";
	setAttr -cb on ".ar";
	setAttr -av -k on ".fs";
	setAttr -av -k on ".ef";
	setAttr -av -k on ".bfs";
	setAttr -av -cb on ".me";
	setAttr -cb on ".se";
	setAttr -av -k on ".be";
	setAttr -av -cb on ".ep" 1;
	setAttr -av -k on ".fec";
	setAttr -av -k on ".ofc";
	setAttr -cb on ".ofe";
	setAttr -cb on ".efe";
	setAttr -cb on ".oft";
	setAttr -cb on ".umfn";
	setAttr -cb on ".ufe";
	setAttr -av -cb on ".pff";
	setAttr -av -cb on ".peie";
	setAttr -av -cb on ".ifp";
	setAttr -k on ".rv";
	setAttr -av -k on ".comp";
	setAttr -av -k on ".cth";
	setAttr -av -k on ".soll";
	setAttr -av -cb on ".sosl";
	setAttr -av -k on ".rd";
	setAttr -av -k on ".lp";
	setAttr -av -k on ".sp";
	setAttr -av -k on ".shs";
	setAttr -av -k on ".lpr";
	setAttr -cb on ".gv";
	setAttr -cb on ".sv";
	setAttr -av -k on ".mm";
	setAttr -av -k on ".npu";
	setAttr -av -k on ".itf";
	setAttr -av -k on ".shp";
	setAttr -cb on ".isp";
	setAttr -av -k on ".uf";
	setAttr -av -k on ".oi";
	setAttr -av -k on ".rut";
	setAttr -av -k on ".mot";
	setAttr -av -cb on ".mb";
	setAttr -av -k on ".mbf";
	setAttr -av -k on ".mbso";
	setAttr -av -k on ".mbsc";
	setAttr -av -k on ".afp";
	setAttr -av -k on ".pfb";
	setAttr -av -k on ".pram" -type "string" "";
	setAttr -av -k on ".poam";
	setAttr -av -k on ".prlm";
	setAttr -av -k on ".polm";
	setAttr -av -cb on ".prm";
	setAttr -av -cb on ".pom";
	setAttr -cb on ".pfrm";
	setAttr -cb on ".pfom";
	setAttr -av -k on ".bll";
	setAttr -av -k on ".bls";
	setAttr -av -k on ".smv";
	setAttr -av -k on ".ubc";
	setAttr -av -k on ".mbc";
	setAttr -cb on ".mbt";
	setAttr -av -k on ".udbx";
	setAttr -av -k on ".smc";
	setAttr -av -k on ".kmv";
	setAttr -cb on ".isl";
	setAttr -cb on ".ism";
	setAttr -cb on ".imb";
	setAttr -av -k on ".rlen";
	setAttr -av -k on ".frts";
	setAttr -av -k on ".tlwd";
	setAttr -av -k on ".tlht";
	setAttr -av -k on ".jfc";
	setAttr -cb on ".rsb";
	setAttr -av -k on ".ope";
	setAttr -av -k on ".oppf";
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
	setAttr -av -k on ".w" 640;
	setAttr -av -k on ".h" 480;
	setAttr -av -k on ".pa";
	setAttr -av -k on ".al";
	setAttr -av -k on ".dar" 1.3333332538604736;
	setAttr -av -k on ".ldar";
	setAttr -av -k on ".dpi";
	setAttr -av -k on ".off";
	setAttr -av -k on ".fld";
	setAttr -av -k on ".zsl";
	setAttr -av -k on ".isu";
	setAttr -av -k on ".pdu";
select -ne :defaultLightSet;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -k on ".mwc";
	setAttr -k on ".an";
	setAttr -k on ".il";
	setAttr -k on ".vo";
	setAttr -k on ".eo";
	setAttr -k on ".fo";
	setAttr -k on ".epo";
	setAttr -k on ".ro" yes;
select -ne :defaultColorMgtGlobals;
	setAttr ".cme" no;
select -ne :hardwareRenderGlobals;
	setAttr -av -k on ".cch";
	setAttr -av -cb on ".ihi";
	setAttr -av -k on ".nds";
	setAttr -cb on ".bnm";
	setAttr -av ".ctrs" 256;
	setAttr -av ".btrs" 512;
	setAttr -av -k off ".fbfm";
	setAttr -av -k off -cb on ".ehql";
	setAttr -av -k off -cb on ".eams";
	setAttr -av -k off -cb on ".eeaa";
	setAttr -av -k off -cb on ".engm";
	setAttr -av -k off -cb on ".mes";
	setAttr -av -k off -cb on ".emb";
	setAttr -av -k off -cb on ".mbbf";
	setAttr -av -k off -cb on ".mbs";
	setAttr -av -k off -cb on ".trm";
	setAttr -av -k off -cb on ".tshc";
	setAttr -av -k off ".enpt";
	setAttr -av -k off -cb on ".clmt";
	setAttr -av -k off -cb on ".tcov";
	setAttr -av -k off -cb on ".lith";
	setAttr -av -k off -cb on ".sobc";
	setAttr -av -k off -cb on ".cuth";
	setAttr -av -k off -cb on ".hgcd";
	setAttr -av -k off -cb on ".hgci";
	setAttr -av -k off -cb on ".mgcs";
	setAttr -av -k off -cb on ".twa";
	setAttr -av -k off -cb on ".twz";
	setAttr -av -k on ".hwcc";
	setAttr -av -k on ".hwdp";
	setAttr -av -k on ".hwql";
	setAttr -av -k on ".hwfr" 48;
	setAttr -av -k on ".soll";
	setAttr -av -k on ".sosl";
	setAttr -av -k on ".bswa";
	setAttr -av -k on ".shml";
	setAttr -av -k on ".hwel";
select -ne :ikSystem;
	setAttr -k on ".cch";
	setAttr -k on ".ihi";
	setAttr -k on ".nds";
	setAttr -k on ".bnm";
	setAttr -av ".gsn";
	setAttr -k on ".gsv";
	setAttr -s 4 ".sol";
connectAttr "Hip_joint.s" "Spine_1.is";
connectAttr "Spine_1.s" "Spine_2.is";
connectAttr "Spine_2.s" "Spine_3.is";
connectAttr "Spine_3.s" "Spine_4.is";
connectAttr "Spine_4.s" "Spine_5.is";
connectAttr "Spine_5.s" "joint80.is";
connectAttr "joint80.s" "Neck1.is";
connectAttr "Neck1.s" "Neck2.is";
connectAttr "Neck2.s" "Neck3.is";
connectAttr "Neck3.s" "Neck4.is";
connectAttr "Neck4.s" "Head.is";
connectAttr "Head.s" "Head_1.is";
connectAttr "Head_1.s" "Head_4.is";
connectAttr "Head_1.s" "Head_3.is";
connectAttr "joint80.s" "L_Front_Scapula.is";
connectAttr "L_Front_Scapula.s" "L_Front_Shoulder.is";
connectAttr "L_Front_Shoulder.s" "L_Front_Knee.is";
connectAttr "L_Front_Knee.s" "L_Front_Fetlock.is";
connectAttr "L_Front_Fetlock.s" "L_Front_Ankle.is";
connectAttr "L_Front_Ankle.s" "L_Front_Ball.is";
connectAttr "L_Front_Ball.s" "L_Front_Toe.is";
connectAttr "L_Front_Knee.s" "L_Front_Knee1.is";
connectAttr "L_Front_Knee.s" "L_Front_Knee2.is";
connectAttr "L_Front_Knee.s" "L_Front_Knee3.is";
connectAttr "joint80.s" "R_Front_Scapula.is";
connectAttr "R_Front_Scapula.s" "R_Front_Shoulder.is";
connectAttr "R_Front_Shoulder.s" "R_Front_Knee.is";
connectAttr "R_Front_Knee.s" "R_Front_Fetlock.is";
connectAttr "R_Front_Fetlock.s" "R_Front_Ankle.is";
connectAttr "R_Front_Ankle.s" "R_Front_Ball.is";
connectAttr "R_Front_Ball.s" "R_Front_Toe.is";
connectAttr "Hip_joint.s" "joint26.is";
connectAttr "joint26.s" "joint39.is";
connectAttr "joint39.s" "joint40.is";
connectAttr "joint40.s" "joint41.is";
connectAttr "joint41.s" "joint42.is";
connectAttr "joint42.s" "joint43.is";
connectAttr "joint43.s" "joint44.is";
connectAttr "joint44.s" "joint45.is";
connectAttr "joint45.s" "joint46.is";
connectAttr "joint46.s" "joint47.is";
connectAttr "joint47.s" "joint48.is";
connectAttr "joint48.s" "joint49.is";
connectAttr "joint49.s" "joint50.is";
connectAttr "joint50.s" "joint51.is";
connectAttr "joint51.s" "joint52.is";
connectAttr "Hip_joint.s" "L_Back_Hip.is";
connectAttr "L_Back_Hip.s" "L_Back_Knee.is";
connectAttr "L_Back_Knee.s" "L_Back_Fetlock.is";
connectAttr "L_Back_Fetlock.s" "L_Back_Ankle.is";
connectAttr "L_Back_Ankle.s" "L_Back_Ball.is";
connectAttr "L_Back_Ball.s" "L_Back_Toe.is";
connectAttr "L_Back_Fetlock.s" "L_Back_Fetlock1.is";
connectAttr "L_Back_Fetlock.s" "L_Back_Fetlock2.is";
connectAttr "L_Back_Knee.s" "L_Back_Knee1.is";
connectAttr "L_Back_Knee.s" "L_Back_Knee2.is";
connectAttr "L_Back_Knee.s" "L_Back_Knee3.is";
connectAttr "L_Back_Hip.s" "L_Back_Hip1.is";
connectAttr "L_Back_Hip.s" "L_Back_Hip2.is";
connectAttr "L_Back_Hip.s" "L_Back_Hip3.is";
connectAttr "Hip_joint.s" "R_Back_Hip.is";
connectAttr "R_Back_Hip.s" "R_Back_Knee.is";
connectAttr "R_Back_Knee.s" "R_Back_Fetlock.is";
connectAttr "R_Back_Fetlock.s" "R_Back_Ankle.is";
connectAttr "R_Back_Ankle.s" "R_Back_Ball.is";
connectAttr "R_Back_Ball.s" "R_Back_Toe.is";
connectAttr "R_Back_Fetlock.s" "R_Back_Fetlock1.is";
connectAttr "R_Back_Fetlock.s" "R_Back_Fetlock2.is";
connectAttr "R_Back_Hip.s" "R_Back_Hip1.is";
connectAttr "R_Back_Hip.s" "R_Back_Hip2.is";
connectAttr "R_Back_Hip.s" "R_Back_Hip3.is";
connectAttr "Mesh_Cheetah.di" "polySurface20.do";
connectAttr "skinCluster1GroupId.id" "polySurfaceShape20.iog.og[1].gid";
connectAttr "skinCluster1Set.mwc" "polySurfaceShape20.iog.og[1].gco";
connectAttr "groupId78.id" "polySurfaceShape20.iog.og[2].gid";
connectAttr "tweakSet4.mwc" "polySurfaceShape20.iog.og[2].gco";
connectAttr "deltaMush1GroupId.id" "polySurfaceShape20.iog.og[3].gid";
connectAttr "deltaMush1Set.mwc" "polySurfaceShape20.iog.og[3].gco";
connectAttr "deltaMush1.og[0]" "polySurfaceShape20.i";
connectAttr "tweak4.vl[0].vt[0]" "polySurfaceShape20.twl";
connectAttr "polyTweakUV1.uvtk[0]" "polySurfaceShape20.uvst[0].uvtw";
connectAttr "layer2.di" "pSphere2.do";
connectAttr "skinCluster2GroupId.id" "pSphereShape2.iog.og[0].gid";
connectAttr "skinCluster2Set.mwc" "pSphereShape2.iog.og[0].gco";
connectAttr "groupId80.id" "pSphereShape2.iog.og[1].gid";
connectAttr "tweakSet5.mwc" "pSphereShape2.iog.og[1].gco";
connectAttr "skinCluster2.og[0]" "pSphereShape2.i";
connectAttr "tweak5.vl[0].vt[0]" "pSphereShape2.twl";
connectAttr "layer2.di" "pSphere1.do";
connectAttr "skinCluster3GroupId.id" "pSphereShape1.iog.og[0].gid";
connectAttr "skinCluster3Set.mwc" "pSphereShape1.iog.og[0].gco";
connectAttr "groupId82.id" "pSphereShape1.iog.og[1].gid";
connectAttr "tweakSet6.mwc" "pSphereShape1.iog.og[1].gco";
connectAttr "skinCluster3.og[0]" "pSphereShape1.i";
connectAttr "tweak6.vl[0].vt[0]" "pSphereShape1.twl";
connectAttr "layerManager.dli[1]" "Mesh_Cheetah.id";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "polySurfaceShape20.iog.og[1]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "Neck1.wm" "skinCluster1.ma[0]";
connectAttr "Neck2.wm" "skinCluster1.ma[1]";
connectAttr "Neck3.wm" "skinCluster1.ma[2]";
connectAttr "Neck4.wm" "skinCluster1.ma[3]";
connectAttr "Head.wm" "skinCluster1.ma[4]";
connectAttr "Head_1.wm" "skinCluster1.ma[5]";
connectAttr "Head_4.wm" "skinCluster1.ma[6]";
connectAttr "Head_3.wm" "skinCluster1.ma[7]";
connectAttr "L_Front_Scapula.wm" "skinCluster1.ma[8]";
connectAttr "L_Front_Shoulder.wm" "skinCluster1.ma[9]";
connectAttr "L_Front_Knee.wm" "skinCluster1.ma[10]";
connectAttr "L_Front_Fetlock.wm" "skinCluster1.ma[11]";
connectAttr "L_Front_Ankle.wm" "skinCluster1.ma[12]";
connectAttr "L_Front_Toe.wm" "skinCluster1.ma[13]";
connectAttr "R_Front_Scapula.wm" "skinCluster1.ma[14]";
connectAttr "R_Front_Shoulder.wm" "skinCluster1.ma[15]";
connectAttr "R_Front_Knee.wm" "skinCluster1.ma[16]";
connectAttr "R_Front_Fetlock.wm" "skinCluster1.ma[17]";
connectAttr "R_Front_Ankle.wm" "skinCluster1.ma[18]";
connectAttr "R_Front_Toe.wm" "skinCluster1.ma[19]";
connectAttr "joint80.wm" "skinCluster1.ma[20]";
connectAttr "Spine_1.wm" "skinCluster1.ma[21]";
connectAttr "Spine_2.wm" "skinCluster1.ma[22]";
connectAttr "Spine_3.wm" "skinCluster1.ma[23]";
connectAttr "Spine_4.wm" "skinCluster1.ma[24]";
connectAttr "Spine_5.wm" "skinCluster1.ma[25]";
connectAttr "R_Back_Hip.wm" "skinCluster1.ma[26]";
connectAttr "R_Back_Knee.wm" "skinCluster1.ma[27]";
connectAttr "R_Back_Fetlock.wm" "skinCluster1.ma[28]";
connectAttr "R_Back_Ankle.wm" "skinCluster1.ma[29]";
connectAttr "R_Back_Toe.wm" "skinCluster1.ma[30]";
connectAttr "L_Back_Hip.wm" "skinCluster1.ma[31]";
connectAttr "L_Back_Knee.wm" "skinCluster1.ma[32]";
connectAttr "L_Back_Fetlock.wm" "skinCluster1.ma[33]";
connectAttr "L_Back_Ankle.wm" "skinCluster1.ma[34]";
connectAttr "L_Back_Toe.wm" "skinCluster1.ma[35]";
connectAttr "joint26.wm" "skinCluster1.ma[36]";
connectAttr "joint39.wm" "skinCluster1.ma[37]";
connectAttr "joint40.wm" "skinCluster1.ma[38]";
connectAttr "joint41.wm" "skinCluster1.ma[39]";
connectAttr "joint42.wm" "skinCluster1.ma[40]";
connectAttr "joint43.wm" "skinCluster1.ma[41]";
connectAttr "joint44.wm" "skinCluster1.ma[42]";
connectAttr "joint45.wm" "skinCluster1.ma[43]";
connectAttr "joint46.wm" "skinCluster1.ma[44]";
connectAttr "joint47.wm" "skinCluster1.ma[45]";
connectAttr "joint48.wm" "skinCluster1.ma[46]";
connectAttr "joint49.wm" "skinCluster1.ma[47]";
connectAttr "joint50.wm" "skinCluster1.ma[48]";
connectAttr "joint51.wm" "skinCluster1.ma[49]";
connectAttr "joint52.wm" "skinCluster1.ma[50]";
connectAttr "Hip_joint.wm" "skinCluster1.ma[51]";
connectAttr "L_Back_Hip1.wm" "skinCluster1.ma[52]";
connectAttr "L_Back_Hip2.wm" "skinCluster1.ma[53]";
connectAttr "L_Back_Hip3.wm" "skinCluster1.ma[54]";
connectAttr "L_Back_Knee1.wm" "skinCluster1.ma[55]";
connectAttr "L_Back_Knee2.wm" "skinCluster1.ma[56]";
connectAttr "L_Back_Knee3.wm" "skinCluster1.ma[57]";
connectAttr "L_Back_Fetlock1.wm" "skinCluster1.ma[58]";
connectAttr "L_Back_Fetlock2.wm" "skinCluster1.ma[59]";
connectAttr "R_Back_Hip1.wm" "skinCluster1.ma[60]";
connectAttr "R_Back_Hip2.wm" "skinCluster1.ma[61]";
connectAttr "R_Back_Hip3.wm" "skinCluster1.ma[62]";
connectAttr "R_Back_Fetlock1.wm" "skinCluster1.ma[63]";
connectAttr "R_Back_Fetlock2.wm" "skinCluster1.ma[64]";
connectAttr "L_Front_Knee1.wm" "skinCluster1.ma[65]";
connectAttr "L_Front_Knee2.wm" "skinCluster1.ma[66]";
connectAttr "L_Front_Knee3.wm" "skinCluster1.ma[67]";
connectAttr "Neck1.liw" "skinCluster1.lw[0]";
connectAttr "Neck2.liw" "skinCluster1.lw[1]";
connectAttr "Neck3.liw" "skinCluster1.lw[2]";
connectAttr "Neck4.liw" "skinCluster1.lw[3]";
connectAttr "Head.liw" "skinCluster1.lw[4]";
connectAttr "Head_1.liw" "skinCluster1.lw[5]";
connectAttr "Head_4.liw" "skinCluster1.lw[6]";
connectAttr "Head_3.liw" "skinCluster1.lw[7]";
connectAttr "L_Front_Scapula.liw" "skinCluster1.lw[8]";
connectAttr "L_Front_Shoulder.liw" "skinCluster1.lw[9]";
connectAttr "L_Front_Knee.liw" "skinCluster1.lw[10]";
connectAttr "L_Front_Fetlock.liw" "skinCluster1.lw[11]";
connectAttr "L_Front_Ankle.liw" "skinCluster1.lw[12]";
connectAttr "L_Front_Toe.liw" "skinCluster1.lw[13]";
connectAttr "R_Front_Scapula.liw" "skinCluster1.lw[14]";
connectAttr "R_Front_Shoulder.liw" "skinCluster1.lw[15]";
connectAttr "R_Front_Knee.liw" "skinCluster1.lw[16]";
connectAttr "R_Front_Fetlock.liw" "skinCluster1.lw[17]";
connectAttr "R_Front_Ankle.liw" "skinCluster1.lw[18]";
connectAttr "R_Front_Toe.liw" "skinCluster1.lw[19]";
connectAttr "joint80.liw" "skinCluster1.lw[20]";
connectAttr "Spine_1.liw" "skinCluster1.lw[21]";
connectAttr "Spine_2.liw" "skinCluster1.lw[22]";
connectAttr "Spine_3.liw" "skinCluster1.lw[23]";
connectAttr "Spine_4.liw" "skinCluster1.lw[24]";
connectAttr "Spine_5.liw" "skinCluster1.lw[25]";
connectAttr "R_Back_Hip.liw" "skinCluster1.lw[26]";
connectAttr "R_Back_Knee.liw" "skinCluster1.lw[27]";
connectAttr "R_Back_Fetlock.liw" "skinCluster1.lw[28]";
connectAttr "R_Back_Ankle.liw" "skinCluster1.lw[29]";
connectAttr "R_Back_Toe.liw" "skinCluster1.lw[30]";
connectAttr "L_Back_Hip.liw" "skinCluster1.lw[31]";
connectAttr "L_Back_Knee.liw" "skinCluster1.lw[32]";
connectAttr "L_Back_Fetlock.liw" "skinCluster1.lw[33]";
connectAttr "L_Back_Ankle.liw" "skinCluster1.lw[34]";
connectAttr "L_Back_Toe.liw" "skinCluster1.lw[35]";
connectAttr "joint26.liw" "skinCluster1.lw[36]";
connectAttr "joint39.liw" "skinCluster1.lw[37]";
connectAttr "joint40.liw" "skinCluster1.lw[38]";
connectAttr "joint41.liw" "skinCluster1.lw[39]";
connectAttr "joint42.liw" "skinCluster1.lw[40]";
connectAttr "joint43.liw" "skinCluster1.lw[41]";
connectAttr "joint44.liw" "skinCluster1.lw[42]";
connectAttr "joint45.liw" "skinCluster1.lw[43]";
connectAttr "joint46.liw" "skinCluster1.lw[44]";
connectAttr "joint47.liw" "skinCluster1.lw[45]";
connectAttr "joint48.liw" "skinCluster1.lw[46]";
connectAttr "joint49.liw" "skinCluster1.lw[47]";
connectAttr "joint50.liw" "skinCluster1.lw[48]";
connectAttr "joint51.liw" "skinCluster1.lw[49]";
connectAttr "joint52.liw" "skinCluster1.lw[50]";
connectAttr "Hip_joint.liw" "skinCluster1.lw[51]";
connectAttr "L_Back_Hip1.liw" "skinCluster1.lw[52]";
connectAttr "L_Back_Hip2.liw" "skinCluster1.lw[53]";
connectAttr "L_Back_Hip3.liw" "skinCluster1.lw[54]";
connectAttr "L_Back_Knee1.liw" "skinCluster1.lw[55]";
connectAttr "L_Back_Knee2.liw" "skinCluster1.lw[56]";
connectAttr "L_Back_Knee3.liw" "skinCluster1.lw[57]";
connectAttr "L_Back_Fetlock1.liw" "skinCluster1.lw[58]";
connectAttr "L_Back_Fetlock2.liw" "skinCluster1.lw[59]";
connectAttr "R_Back_Hip1.liw" "skinCluster1.lw[60]";
connectAttr "R_Back_Hip2.liw" "skinCluster1.lw[61]";
connectAttr "R_Back_Hip3.liw" "skinCluster1.lw[62]";
connectAttr "R_Back_Fetlock1.liw" "skinCluster1.lw[63]";
connectAttr "R_Back_Fetlock2.liw" "skinCluster1.lw[64]";
connectAttr "L_Front_Knee1.liw" "skinCluster1.lw[65]";
connectAttr "L_Front_Knee2.liw" "skinCluster1.lw[66]";
connectAttr "L_Front_Knee3.liw" "skinCluster1.lw[67]";
connectAttr "L_Front_Knee1.msg" "skinCluster1.ptt";
connectAttr "L_Back_Hip1.obcc" "skinCluster1.ifcl[52]";
connectAttr "L_Back_Hip2.obcc" "skinCluster1.ifcl[53]";
connectAttr "L_Back_Hip3.obcc" "skinCluster1.ifcl[54]";
connectAttr "L_Back_Knee1.obcc" "skinCluster1.ifcl[55]";
connectAttr "L_Back_Knee2.obcc" "skinCluster1.ifcl[56]";
connectAttr "L_Back_Knee3.obcc" "skinCluster1.ifcl[57]";
connectAttr "L_Back_Fetlock1.obcc" "skinCluster1.ifcl[58]";
connectAttr "L_Back_Fetlock2.obcc" "skinCluster1.ifcl[59]";
connectAttr "R_Back_Hip1.obcc" "skinCluster1.ifcl[60]";
connectAttr "R_Back_Hip2.obcc" "skinCluster1.ifcl[61]";
connectAttr "R_Back_Hip3.obcc" "skinCluster1.ifcl[62]";
connectAttr "R_Back_Fetlock1.obcc" "skinCluster1.ifcl[63]";
connectAttr "R_Back_Fetlock2.obcc" "skinCluster1.ifcl[64]";
connectAttr "L_Front_Knee1.obcc" "skinCluster1.ifcl[65]";
connectAttr "L_Front_Knee2.obcc" "skinCluster1.ifcl[66]";
connectAttr "L_Front_Knee3.obcc" "skinCluster1.ifcl[67]";
connectAttr "Neck1.msg" "bindPose1.m[5]";
connectAttr "Neck2.msg" "bindPose1.m[6]";
connectAttr "Neck3.msg" "bindPose1.m[7]";
connectAttr "Neck4.msg" "bindPose1.m[8]";
connectAttr "Head.msg" "bindPose1.m[9]";
connectAttr "Head_1.msg" "bindPose1.m[10]";
connectAttr "Head_4.msg" "bindPose1.m[11]";
connectAttr "Head_3.msg" "bindPose1.m[12]";
connectAttr "L_Front_Scapula.msg" "bindPose1.m[17]";
connectAttr "L_Front_Shoulder.msg" "bindPose1.m[18]";
connectAttr "L_Front_Knee.msg" "bindPose1.m[19]";
connectAttr "L_Front_Fetlock.msg" "bindPose1.m[20]";
connectAttr "L_Front_Ankle.msg" "bindPose1.m[21]";
connectAttr "L_Front_Toe.msg" "bindPose1.m[22]";
connectAttr "R_Front_Scapula.msg" "bindPose1.m[26]";
connectAttr "R_Front_Shoulder.msg" "bindPose1.m[27]";
connectAttr "R_Front_Knee.msg" "bindPose1.m[28]";
connectAttr "R_Front_Fetlock.msg" "bindPose1.m[29]";
connectAttr "R_Front_Ankle.msg" "bindPose1.m[30]";
connectAttr "R_Front_Toe.msg" "bindPose1.m[31]";
connectAttr "joint80.msg" "bindPose1.m[32]";
connectAttr "Spine_1.msg" "bindPose1.m[33]";
connectAttr "Spine_2.msg" "bindPose1.m[34]";
connectAttr "Spine_3.msg" "bindPose1.m[35]";
connectAttr "Spine_4.msg" "bindPose1.m[36]";
connectAttr "Spine_5.msg" "bindPose1.m[37]";
connectAttr "R_Back_Hip.msg" "bindPose1.m[40]";
connectAttr "R_Back_Knee.msg" "bindPose1.m[41]";
connectAttr "R_Back_Fetlock.msg" "bindPose1.m[42]";
connectAttr "R_Back_Ankle.msg" "bindPose1.m[43]";
connectAttr "R_Back_Toe.msg" "bindPose1.m[44]";
connectAttr "L_Back_Hip.msg" "bindPose1.m[47]";
connectAttr "L_Back_Knee.msg" "bindPose1.m[48]";
connectAttr "L_Back_Fetlock.msg" "bindPose1.m[49]";
connectAttr "L_Back_Ankle.msg" "bindPose1.m[50]";
connectAttr "L_Back_Toe.msg" "bindPose1.m[51]";
connectAttr "joint26.msg" "bindPose1.m[52]";
connectAttr "joint39.msg" "bindPose1.m[53]";
connectAttr "joint40.msg" "bindPose1.m[54]";
connectAttr "joint41.msg" "bindPose1.m[55]";
connectAttr "joint42.msg" "bindPose1.m[56]";
connectAttr "joint43.msg" "bindPose1.m[57]";
connectAttr "joint44.msg" "bindPose1.m[58]";
connectAttr "joint45.msg" "bindPose1.m[59]";
connectAttr "joint46.msg" "bindPose1.m[60]";
connectAttr "joint47.msg" "bindPose1.m[61]";
connectAttr "joint48.msg" "bindPose1.m[62]";
connectAttr "joint49.msg" "bindPose1.m[63]";
connectAttr "joint50.msg" "bindPose1.m[64]";
connectAttr "joint51.msg" "bindPose1.m[65]";
connectAttr "joint52.msg" "bindPose1.m[66]";
connectAttr "Hip_joint.msg" "bindPose1.m[67]";
connectAttr "L_Back_Ball.msg" "bindPose1.m[68]";
connectAttr "R_Back_Ball.msg" "bindPose1.m[69]";
connectAttr "L_Front_Ball.msg" "bindPose1.m[70]";
connectAttr "R_Front_Ball.msg" "bindPose1.m[71]";
connectAttr "L_Back_Hip1.msg" "bindPose1.m[72]";
connectAttr "L_Back_Hip2.msg" "bindPose1.m[73]";
connectAttr "L_Back_Hip3.msg" "bindPose1.m[74]";
connectAttr "L_Back_Knee1.msg" "bindPose1.m[75]";
connectAttr "L_Back_Knee2.msg" "bindPose1.m[76]";
connectAttr "L_Back_Knee3.msg" "bindPose1.m[77]";
connectAttr "L_Back_Fetlock1.msg" "bindPose1.m[78]";
connectAttr "L_Back_Fetlock2.msg" "bindPose1.m[79]";
connectAttr "R_Back_Hip1.msg" "bindPose1.m[80]";
connectAttr "R_Back_Hip2.msg" "bindPose1.m[81]";
connectAttr "R_Back_Hip3.msg" "bindPose1.m[82]";
connectAttr "R_Back_Fetlock1.msg" "bindPose1.m[83]";
connectAttr "R_Back_Fetlock2.msg" "bindPose1.m[84]";
connectAttr "L_Front_Knee1.msg" "bindPose1.m[85]";
connectAttr "L_Front_Knee2.msg" "bindPose1.m[86]";
connectAttr "L_Front_Knee3.msg" "bindPose1.m[87]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[6]" "bindPose1.p[7]";
connectAttr "bindPose1.m[7]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[10]";
connectAttr "bindPose1.m[10]" "bindPose1.p[11]";
connectAttr "bindPose1.m[10]" "bindPose1.p[12]";
connectAttr "bindPose1.m[3]" "bindPose1.p[13]";
connectAttr "bindPose1.m[13]" "bindPose1.p[14]";
connectAttr "bindPose1.m[14]" "bindPose1.p[15]";
connectAttr "bindPose1.m[15]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[17]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[19]" "bindPose1.p[20]";
connectAttr "bindPose1.m[20]" "bindPose1.p[21]";
connectAttr "bindPose1.m[70]" "bindPose1.p[22]";
connectAttr "bindPose1.m[13]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "bindPose1.m[24]" "bindPose1.p[25]";
connectAttr "bindPose1.m[25]" "bindPose1.p[26]";
connectAttr "bindPose1.m[26]" "bindPose1.p[27]";
connectAttr "bindPose1.m[27]" "bindPose1.p[28]";
connectAttr "bindPose1.m[28]" "bindPose1.p[29]";
connectAttr "bindPose1.m[29]" "bindPose1.p[30]";
connectAttr "bindPose1.m[71]" "bindPose1.p[31]";
connectAttr "bindPose1.m[4]" "bindPose1.p[32]";
connectAttr "bindPose1.m[4]" "bindPose1.p[33]";
connectAttr "bindPose1.m[33]" "bindPose1.p[34]";
connectAttr "bindPose1.m[34]" "bindPose1.p[35]";
connectAttr "bindPose1.m[35]" "bindPose1.p[36]";
connectAttr "bindPose1.m[36]" "bindPose1.p[37]";
connectAttr "bindPose1.m[23]" "bindPose1.p[38]";
connectAttr "bindPose1.m[38]" "bindPose1.p[39]";
connectAttr "bindPose1.m[39]" "bindPose1.p[40]";
connectAttr "bindPose1.m[40]" "bindPose1.p[41]";
connectAttr "bindPose1.m[41]" "bindPose1.p[42]";
connectAttr "bindPose1.m[42]" "bindPose1.p[43]";
connectAttr "bindPose1.m[69]" "bindPose1.p[44]";
connectAttr "bindPose1.m[14]" "bindPose1.p[45]";
connectAttr "bindPose1.m[45]" "bindPose1.p[46]";
connectAttr "bindPose1.m[46]" "bindPose1.p[47]";
connectAttr "bindPose1.m[47]" "bindPose1.p[48]";
connectAttr "bindPose1.m[48]" "bindPose1.p[49]";
connectAttr "bindPose1.m[49]" "bindPose1.p[50]";
connectAttr "bindPose1.m[68]" "bindPose1.p[51]";
connectAttr "bindPose1.m[4]" "bindPose1.p[52]";
connectAttr "bindPose1.m[52]" "bindPose1.p[53]";
connectAttr "bindPose1.m[53]" "bindPose1.p[54]";
connectAttr "bindPose1.m[54]" "bindPose1.p[55]";
connectAttr "bindPose1.m[55]" "bindPose1.p[56]";
connectAttr "bindPose1.m[56]" "bindPose1.p[57]";
connectAttr "bindPose1.m[57]" "bindPose1.p[58]";
connectAttr "bindPose1.m[58]" "bindPose1.p[59]";
connectAttr "bindPose1.m[59]" "bindPose1.p[60]";
connectAttr "bindPose1.m[60]" "bindPose1.p[61]";
connectAttr "bindPose1.m[61]" "bindPose1.p[62]";
connectAttr "bindPose1.m[62]" "bindPose1.p[63]";
connectAttr "bindPose1.m[63]" "bindPose1.p[64]";
connectAttr "bindPose1.m[64]" "bindPose1.p[65]";
connectAttr "bindPose1.m[65]" "bindPose1.p[66]";
connectAttr "bindPose1.m[4]" "bindPose1.p[67]";
connectAttr "bindPose1.m[50]" "bindPose1.p[68]";
connectAttr "bindPose1.m[43]" "bindPose1.p[69]";
connectAttr "bindPose1.m[21]" "bindPose1.p[70]";
connectAttr "bindPose1.m[30]" "bindPose1.p[71]";
connectAttr "bindPose1.m[47]" "bindPose1.p[72]";
connectAttr "bindPose1.m[47]" "bindPose1.p[73]";
connectAttr "bindPose1.m[47]" "bindPose1.p[74]";
connectAttr "bindPose1.m[48]" "bindPose1.p[75]";
connectAttr "bindPose1.m[48]" "bindPose1.p[76]";
connectAttr "bindPose1.m[48]" "bindPose1.p[77]";
connectAttr "bindPose1.m[49]" "bindPose1.p[78]";
connectAttr "bindPose1.m[49]" "bindPose1.p[79]";
connectAttr "bindPose1.m[40]" "bindPose1.p[80]";
connectAttr "bindPose1.m[40]" "bindPose1.p[81]";
connectAttr "bindPose1.m[40]" "bindPose1.p[82]";
connectAttr "bindPose1.m[42]" "bindPose1.p[83]";
connectAttr "bindPose1.m[42]" "bindPose1.p[84]";
connectAttr "bindPose1.m[19]" "bindPose1.p[85]";
connectAttr "bindPose1.m[19]" "bindPose1.p[86]";
connectAttr "bindPose1.m[19]" "bindPose1.p[87]";
connectAttr "Neck1.bps" "bindPose1.wm[5]";
connectAttr "Neck2.bps" "bindPose1.wm[6]";
connectAttr "Neck3.bps" "bindPose1.wm[7]";
connectAttr "Neck4.bps" "bindPose1.wm[8]";
connectAttr "Head.bps" "bindPose1.wm[9]";
connectAttr "Head_1.bps" "bindPose1.wm[10]";
connectAttr "Head_4.bps" "bindPose1.wm[11]";
connectAttr "Head_3.bps" "bindPose1.wm[12]";
connectAttr "L_Front_Scapula.bps" "bindPose1.wm[17]";
connectAttr "L_Front_Shoulder.bps" "bindPose1.wm[18]";
connectAttr "L_Front_Knee.bps" "bindPose1.wm[19]";
connectAttr "L_Front_Fetlock.bps" "bindPose1.wm[20]";
connectAttr "L_Front_Ankle.bps" "bindPose1.wm[21]";
connectAttr "L_Front_Toe.bps" "bindPose1.wm[22]";
connectAttr "R_Front_Scapula.bps" "bindPose1.wm[26]";
connectAttr "R_Front_Shoulder.bps" "bindPose1.wm[27]";
connectAttr "R_Front_Knee.bps" "bindPose1.wm[28]";
connectAttr "R_Front_Fetlock.bps" "bindPose1.wm[29]";
connectAttr "R_Front_Ankle.bps" "bindPose1.wm[30]";
connectAttr "R_Front_Toe.bps" "bindPose1.wm[31]";
connectAttr "joint80.bps" "bindPose1.wm[32]";
connectAttr "Spine_1.bps" "bindPose1.wm[33]";
connectAttr "Spine_2.bps" "bindPose1.wm[34]";
connectAttr "Spine_3.bps" "bindPose1.wm[35]";
connectAttr "Spine_4.bps" "bindPose1.wm[36]";
connectAttr "Spine_5.bps" "bindPose1.wm[37]";
connectAttr "R_Back_Hip.bps" "bindPose1.wm[40]";
connectAttr "R_Back_Knee.bps" "bindPose1.wm[41]";
connectAttr "R_Back_Fetlock.bps" "bindPose1.wm[42]";
connectAttr "R_Back_Ankle.bps" "bindPose1.wm[43]";
connectAttr "R_Back_Toe.bps" "bindPose1.wm[44]";
connectAttr "L_Back_Hip.bps" "bindPose1.wm[47]";
connectAttr "L_Back_Knee.bps" "bindPose1.wm[48]";
connectAttr "L_Back_Fetlock.bps" "bindPose1.wm[49]";
connectAttr "L_Back_Ankle.bps" "bindPose1.wm[50]";
connectAttr "L_Back_Toe.bps" "bindPose1.wm[51]";
connectAttr "joint26.bps" "bindPose1.wm[52]";
connectAttr "joint39.bps" "bindPose1.wm[53]";
connectAttr "joint40.bps" "bindPose1.wm[54]";
connectAttr "joint41.bps" "bindPose1.wm[55]";
connectAttr "joint42.bps" "bindPose1.wm[56]";
connectAttr "joint43.bps" "bindPose1.wm[57]";
connectAttr "joint44.bps" "bindPose1.wm[58]";
connectAttr "joint45.bps" "bindPose1.wm[59]";
connectAttr "joint46.bps" "bindPose1.wm[60]";
connectAttr "joint47.bps" "bindPose1.wm[61]";
connectAttr "joint48.bps" "bindPose1.wm[62]";
connectAttr "joint49.bps" "bindPose1.wm[63]";
connectAttr "joint50.bps" "bindPose1.wm[64]";
connectAttr "joint51.bps" "bindPose1.wm[65]";
connectAttr "joint52.bps" "bindPose1.wm[66]";
connectAttr "Hip_joint.bps" "bindPose1.wm[67]";
connectAttr "L_Back_Ball.bps" "bindPose1.wm[68]";
connectAttr "R_Back_Ball.bps" "bindPose1.wm[69]";
connectAttr "L_Front_Ball.bps" "bindPose1.wm[70]";
connectAttr "R_Front_Ball.bps" "bindPose1.wm[71]";
connectAttr "L_Back_Hip1.bps" "bindPose1.wm[72]";
connectAttr "L_Back_Hip2.bps" "bindPose1.wm[73]";
connectAttr "L_Back_Hip3.bps" "bindPose1.wm[74]";
connectAttr "L_Back_Knee1.bps" "bindPose1.wm[75]";
connectAttr "L_Back_Knee2.bps" "bindPose1.wm[76]";
connectAttr "L_Back_Knee3.bps" "bindPose1.wm[77]";
connectAttr "L_Back_Fetlock1.bps" "bindPose1.wm[78]";
connectAttr "L_Back_Fetlock2.bps" "bindPose1.wm[79]";
connectAttr "R_Back_Hip1.bps" "bindPose1.wm[80]";
connectAttr "R_Back_Hip2.bps" "bindPose1.wm[81]";
connectAttr "R_Back_Hip3.bps" "bindPose1.wm[82]";
connectAttr "R_Back_Fetlock1.bps" "bindPose1.wm[83]";
connectAttr "R_Back_Fetlock2.bps" "bindPose1.wm[84]";
connectAttr "L_Front_Knee1.bps" "bindPose1.wm[85]";
connectAttr "L_Front_Knee2.bps" "bindPose1.wm[86]";
connectAttr "L_Front_Knee3.bps" "bindPose1.wm[87]";
connectAttr "tweak4.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupParts9.og" "tweak4.ip[0].ig";
connectAttr "groupId78.id" "tweak4.ip[0].gi";
connectAttr "groupId78.msg" "tweakSet4.gn" -na;
connectAttr "polySurfaceShape20.iog.og[2]" "tweakSet4.dsm" -na;
connectAttr "tweak4.msg" "tweakSet4.ub[0]";
connectAttr "polySurfaceShape20Orig.w" "groupParts9.ig";
connectAttr "groupId78.id" "groupParts9.gi";
connectAttr "skinCluster1.og[0]" "polyTweakUV1.ip";
connectAttr "blinn2SG.msg" "materialInfo3.sg";
connectAttr "blinn3.msg" "materialInfo3.m";
connectAttr "file3.msg" "materialInfo3.t" -na;
connectAttr "blinn3.oc" "blinn2SG.ss";
connectAttr "polySurfaceShape20.iog" "blinn2SG.dsm" -na;
connectAttr "file3.oc" "blinn3.c";
connectAttr "place2dTexture2.c" "file3.c";
connectAttr "place2dTexture2.tf" "file3.tf";
connectAttr "place2dTexture2.rf" "file3.rf";
connectAttr "place2dTexture2.mu" "file3.mu";
connectAttr "place2dTexture2.mv" "file3.mv";
connectAttr "place2dTexture2.s" "file3.s";
connectAttr "place2dTexture2.wu" "file3.wu";
connectAttr "place2dTexture2.wv" "file3.wv";
connectAttr "place2dTexture2.re" "file3.re";
connectAttr "place2dTexture2.of" "file3.of";
connectAttr "place2dTexture2.r" "file3.ro";
connectAttr "place2dTexture2.n" "file3.n";
connectAttr "place2dTexture2.vt1" "file3.vt1";
connectAttr "place2dTexture2.vt2" "file3.vt2";
connectAttr "place2dTexture2.vt3" "file3.vt3";
connectAttr "place2dTexture2.vc1" "file3.vc1";
connectAttr "place2dTexture2.o" "file3.uv";
connectAttr "place2dTexture2.ofs" "file3.fs";
connectAttr ":defaultColorMgtGlobals.cme" "file3.cme";
connectAttr ":defaultColorMgtGlobals.cfe" "file3.cmcf";
connectAttr ":defaultColorMgtGlobals.cfp" "file3.cmcp";
connectAttr ":defaultColorMgtGlobals.wsn" "file3.ws";
connectAttr "layerManager.dli[5]" "layer2.id";
connectAttr "skinCluster2GroupId.msg" "skinCluster2Set.gn" -na;
connectAttr "pSphereShape2.iog.og[0]" "skinCluster2Set.dsm" -na;
connectAttr "skinCluster2.msg" "skinCluster2Set.ub[0]";
connectAttr "skinCluster2GroupParts.og" "skinCluster2.ip[0].ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2.ip[0].gi";
connectAttr "Head.wm" "skinCluster2.ma[4]";
connectAttr "Head_1.wm" "skinCluster2.ma[5]";
connectAttr "Head_4.wm" "skinCluster2.ma[6]";
connectAttr "Head_3.wm" "skinCluster2.ma[7]";
connectAttr "Head.liw" "skinCluster2.lw[4]";
connectAttr "Head_1.liw" "skinCluster2.lw[5]";
connectAttr "Head_4.liw" "skinCluster2.lw[6]";
connectAttr "Head_3.liw" "skinCluster2.lw[7]";
connectAttr "bindPose1.msg" "skinCluster2.bp";
connectAttr "Head.msg" "skinCluster2.ptt";
connectAttr "tweak5.og[0]" "skinCluster2GroupParts.ig";
connectAttr "skinCluster2GroupId.id" "skinCluster2GroupParts.gi";
connectAttr "groupParts11.og" "tweak5.ip[0].ig";
connectAttr "groupId80.id" "tweak5.ip[0].gi";
connectAttr "groupId80.msg" "tweakSet5.gn" -na;
connectAttr "pSphereShape2.iog.og[1]" "tweakSet5.dsm" -na;
connectAttr "tweak5.msg" "tweakSet5.ub[0]";
connectAttr "pSphereShape2Orig.w" "groupParts11.ig";
connectAttr "groupId80.id" "groupParts11.gi";
connectAttr "lambert2SG.msg" "materialInfo4.sg";
connectAttr "lambert2.msg" "materialInfo4.m";
connectAttr "ramp1.msg" "materialInfo4.t" -na;
connectAttr "lambert2.oc" "lambert2SG.ss";
connectAttr "pSphereShape1.iog" "lambert2SG.dsm" -na;
connectAttr "pSphereShape2.iog" "lambert2SG.dsm" -na;
connectAttr "ramp1.oc" "lambert2.c";
connectAttr "place2dTexture1.o" "ramp1.uv";
connectAttr "place2dTexture1.ofs" "ramp1.fs";
connectAttr "skinCluster3GroupId.msg" "skinCluster3Set.gn" -na;
connectAttr "pSphereShape1.iog.og[0]" "skinCluster3Set.dsm" -na;
connectAttr "skinCluster3.msg" "skinCluster3Set.ub[0]";
connectAttr "skinCluster3GroupParts.og" "skinCluster3.ip[0].ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3.ip[0].gi";
connectAttr "Head.wm" "skinCluster3.ma[4]";
connectAttr "Head_1.wm" "skinCluster3.ma[5]";
connectAttr "Head_4.wm" "skinCluster3.ma[6]";
connectAttr "Head_3.wm" "skinCluster3.ma[7]";
connectAttr "Head.liw" "skinCluster3.lw[4]";
connectAttr "Head_1.liw" "skinCluster3.lw[5]";
connectAttr "Head_4.liw" "skinCluster3.lw[6]";
connectAttr "Head_3.liw" "skinCluster3.lw[7]";
connectAttr "bindPose1.msg" "skinCluster3.bp";
connectAttr "Head.msg" "skinCluster3.ptt";
connectAttr "tweak6.og[0]" "skinCluster3GroupParts.ig";
connectAttr "skinCluster3GroupId.id" "skinCluster3GroupParts.gi";
connectAttr "groupParts13.og" "tweak6.ip[0].ig";
connectAttr "groupId82.id" "tweak6.ip[0].gi";
connectAttr "groupId82.msg" "tweakSet6.gn" -na;
connectAttr "pSphereShape1.iog.og[1]" "tweakSet6.dsm" -na;
connectAttr "tweak6.msg" "tweakSet6.ub[0]";
connectAttr "pSphereShape1Orig.w" "groupParts13.ig";
connectAttr "groupId82.id" "groupParts13.gi";
relationship "link" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "blinn2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" "lambert2SG.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "deltaMush1GroupParts.og" "deltaMush1.ip[0].ig";
connectAttr "deltaMush1GroupId.id" "deltaMush1.ip[0].gi";
connectAttr "polySurfaceShape20Orig.o" "deltaMush1.orggeom[0]";
connectAttr "deltaMush1GroupId.msg" "deltaMush1Set.gn" -na;
connectAttr "polySurfaceShape20.iog.og[3]" "deltaMush1Set.dsm" -na;
connectAttr "deltaMush1.msg" "deltaMush1Set.ub[0]";
connectAttr "polyTweakUV1.out" "deltaMush1GroupParts.ig";
connectAttr "deltaMush1GroupId.id" "deltaMush1GroupParts.gi";
connectAttr "blinn2SG.pa" ":renderPartition.st" -na;
connectAttr "lambert2SG.pa" ":renderPartition.st" -na;
connectAttr "blinn3.msg" ":defaultShaderList1.s" -na;
connectAttr "lambert2.msg" ":defaultShaderList1.s" -na;
connectAttr "place2dTexture1.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "place2dTexture2.msg" ":defaultRenderUtilityList1.u" -na;
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
connectAttr "ramp1.msg" ":defaultTextureList1.tx" -na;
connectAttr "file3.msg" ":defaultTextureList1.tx" -na;
// End of cheetaSkel.ma
