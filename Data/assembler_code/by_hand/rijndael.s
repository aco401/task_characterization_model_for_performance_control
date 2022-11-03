	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"aes.c"
	.text
	.global	s_box
	.section	.rodata
	.align	2
	.type	s_box, %object
	.size	s_box, 256
s_box:
	.ascii	"c|w{\362ko\3050\001g+\376\327\253v\312\202\311}\372"
	.ascii	"YG\360\255\324\242\257\234\244r\300\267\375\223&6?\367"
	.ascii	"\3144\245\345\361q\3301\025\004\307#\303\030\226\005"
	.ascii	"\232\007\022\200\342\353'\262u\011\203,\032\033nZ\240"
	.ascii	"R;\326\263)\343/\204S\321\000\355 \374\261[j\313\276"
	.ascii	"9JLX\317\320\357\252\373CM3\205E\371\002\177P<\237\250"
	.ascii	"Q\243@\217\222\2358\365\274\266\332!\020\377\363\322"
	.ascii	"\315\014\023\354_\227D\027\304\247~=d]\031s`\201O\334"
	.ascii	"\"*\220\210F\356\270\024\336^\013\333\3402:\012I\006"
	.ascii	"$\\\302\323\254b\221\225\344y\347\3107m\215\325N\251"
	.ascii	"lV\364\352ez\256\010\272x%.\034\246\264\306\350\335"
	.ascii	"t\037K\275\213\212p>\265fH\003\366\016a5W\271\206\301"
	.ascii	"\035\236\341\370\230\021i\331\216\224\233\036\207\351"
	.ascii	"\316U(\337\214\241\211\015\277\346BhA\231-\017\260T"
	.ascii	"\273\026"
	.global	inv_s_box
	.align	2
	.type	inv_s_box, %object
	.size	inv_s_box, 256
inv_s_box:
	.ascii	"R\011j\32506\2458\277@\243\236\201\363\327\373|\343"
	.ascii	"9\202\233/\377\2074\216CD\304\336\351\313T{\2242\246"
	.ascii	"\302#=\356L\225\013B\372\303N\010.\241f(\331$\262v["
	.ascii	"\242Im\213\321%r\370\366d\206h\230\026\324\244\\\314"
	.ascii	"]e\266\222lpHP\375\355\271\332^\025FW\247\215\235\204"
	.ascii	"\220\330\253\000\214\274\323\012\367\344X\005\270\263"
	.ascii	"E\006\320,\036\217\312?\017\002\301\257\275\003\001"
	.ascii	"\023\212k:\221\021AOg\334\352\227\362\317\316\360\264"
	.ascii	"\346s\226\254t\"\347\2555\205\342\3717\350\034u\337"
	.ascii	"nG\361\032q\035)\305\211o\267b\016\252\030\276\033\374"
	.ascii	"V>K\306\322y \232\333\300\376x\315Z\364\037\335\250"
	.ascii	"3\210\007\3071\261\022\020Y'\200\354_`Q\177\251\031"
	.ascii	"\265J\015-\345z\237\223\311\234\357\240\340;M\256*\365"
	.ascii	"\260\310\353\273<\203S\231a\027+\004~\272w\326&\341"
	.ascii	"i\024cU!\014}"
	.global	rcon_tab
	.align	2
	.type	rcon_tab, %object
	.size	rcon_tab, 116
rcon_tab:
	.word	1
	.word	2
	.word	4
	.word	8
	.word	16
	.word	32
	.word	64
	.word	128
	.word	27
	.word	54
	.word	108
	.word	216
	.word	171
	.word	77
	.word	154
	.word	47
	.word	94
	.word	188
	.word	99
	.word	198
	.word	151
	.word	53
	.word	106
	.word	212
	.word	179
	.word	125
	.word	250
	.word	239
	.word	197
	.global	ft_tab
	.align	2
	.type	ft_tab, %object
	.size	ft_tab, 1024
ft_tab:
	.word	-1520213050
	.word	-2072216328
	.word	-1720223762
	.word	-1921287178
	.word	234025727
	.word	-1117033514
	.word	-1318096930
	.word	1422247313
	.word	1345335392
	.word	50397442
	.word	-1452841010
	.word	2099981142
	.word	436141799
	.word	1658312629
	.word	-424957107
	.word	-1703512340
	.word	1170918031
	.word	-1652391393
	.word	1086966153
	.word	-2021818886
	.word	368769775
	.word	-346465870
	.word	-918075506
	.word	200339707
	.word	-324162239
	.word	1742001331
	.word	-39673249
	.word	-357585083
	.word	-1080255453
	.word	-140204973
	.word	-1770884380
	.word	1539358875
	.word	-1028147339
	.word	486407649
	.word	-1366060227
	.word	1780885068
	.word	1513502316
	.word	1094664062
	.word	49805301
	.word	1338821763
	.word	1546925160
	.word	-190470831
	.word	887481809
	.word	150073849
	.word	-1821281822
	.word	1943591083
	.word	1395732834
	.word	1058346282
	.word	201589768
	.word	1388824469
	.word	1696801606
	.word	1589887901
	.word	672667696
	.word	-1583966665
	.word	251987210
	.word	-1248159185
	.word	151455502
	.word	907153956
	.word	-1686077413
	.word	1038279391
	.word	652995533
	.word	1764173646
	.word	-843926913
	.word	-1619692054
	.word	453576978
	.word	-1635548387
	.word	1949051992
	.word	773462580
	.word	756751158
	.word	-1301385508
	.word	-296068428
	.word	-73359269
	.word	-162377052
	.word	1295727478
	.word	1641469623
	.word	-827083907
	.word	2066295122
	.word	1055122397
	.word	1898917726
	.word	-1752923117
	.word	-179088474
	.word	1758581177
	.word	0
	.word	753790401
	.word	1612718144
	.word	536673507
	.word	-927878791
	.word	-312779850
	.word	-1100322092
	.word	1187761037
	.word	-641810841
	.word	1262041458
	.word	-565556588
	.word	-733197160
	.word	-396863312
	.word	1255133061
	.word	1808847035
	.word	720367557
	.word	-441800113
	.word	385612781
	.word	-985447546
	.word	-682799718
	.word	1429418854
	.word	-1803188975
	.word	-817543798
	.word	284817897
	.word	100794884
	.word	-2122350594
	.word	-263171936
	.word	1144798328
	.word	-1163944155
	.word	-475486133
	.word	-212774494
	.word	-22830243
	.word	-1069531008
	.word	-1970303227
	.word	-1382903233
	.word	-1130521311
	.word	1211644016
	.word	83228145
	.word	-541279133
	.word	-1044990345
	.word	1977277103
	.word	1663115586
	.word	806359072
	.word	452984805
	.word	250868733
	.word	1842533055
	.word	1288555905
	.word	336333848
	.word	890442534
	.word	804056259
	.word	-513843266
	.word	-1567123659
	.word	-867941240
	.word	957814574
	.word	1472513171
	.word	-223893675
	.word	-2105639172
	.word	1195195770
	.word	-1402706744
	.word	-413311558
	.word	723065138
	.word	-1787595802
	.word	-1604296512
	.word	-1736343271
	.word	-783331426
	.word	2145180835
	.word	1713513028
	.word	2116692564
	.word	-1416589253
	.word	-2088204277
	.word	-901364084
	.word	703524551
	.word	-742868885
	.word	1007948840
	.word	2044649127
	.word	-497131844
	.word	487262998
	.word	1994120109
	.word	1004593371
	.word	1446130276
	.word	1312438900
	.word	503974420
	.word	-615954030
	.word	168166924
	.word	1814307912
	.word	-463709000
	.word	1573044895
	.word	1859376061
	.word	-273896381
	.word	-1503501628
	.word	-1466855111
	.word	-1533700815
	.word	937747667
	.word	-1954973198
	.word	854058965
	.word	1137232011
	.word	1496790894
	.word	-1217565222
	.word	-1936880383
	.word	1691735473
	.word	-766620004
	.word	-525751991
	.word	-1267962664
	.word	-95005012
	.word	133494003
	.word	636152527
	.word	-1352309302
	.word	-1904575756
	.word	-374428089
	.word	403179536
	.word	-709182865
	.word	-2005370640
	.word	1864705354
	.word	1915629148
	.word	605822008
	.word	-240736681
	.word	-944458637
	.word	1371981463
	.word	602466507
	.word	2094914977
	.word	-1670089496
	.word	555687742
	.word	-582268010
	.word	-591544991
	.word	-2037675251
	.word	-2054518257
	.word	-1871679264
	.word	1111375484
	.word	-994724495
	.word	-1436129588
	.word	-666351472
	.word	84083462
	.word	32962295
	.word	302911004
	.word	-1553899070
	.word	1597322602
	.word	-111716434
	.word	-793134743
	.word	-1853454825
	.word	1489093017
	.word	656219450
	.word	-1180787161
	.word	954327513
	.word	335083755
	.word	-1281845205
	.word	856756514
	.word	-1150719534
	.word	1893325225
	.word	-1987146233
	.word	-1483434957
	.word	-1231316179
	.word	572399164
	.word	-1836611819
	.word	552200649
	.word	1238290055
	.word	-11184726
	.word	2015897680
	.word	2061492133
	.word	-1886614525
	.word	-123625127
	.word	-2138470135
	.word	386731290
	.word	-624967835
	.word	837215959
	.word	-968736124
	.word	-1201116976
	.word	-1019133566
	.word	-1332111063
	.word	1999449434
	.word	286199582
	.word	-877612933
	.word	-61582168
	.word	-692339859
	.word	974525996
	.global	it_tab
	.align	2
	.type	it_tab, %object
	.size	it_tab, 1024
it_tab:
	.word	1353184337
	.word	1399144830
	.word	-1012656358
	.word	-1772214470
	.word	-882136261
	.word	-247096033
	.word	-1420232020
	.word	-1828461749
	.word	1442459680
	.word	-160598355
	.word	-1854485368
	.word	625738485
	.word	-52959921
	.word	-674551099
	.word	-2143013594
	.word	-1885117771
	.word	1230680542
	.word	1729870373
	.word	-1743852987
	.word	-507445667
	.word	41234371
	.word	317738113
	.word	-1550367091
	.word	-956705941
	.word	-413167869
	.word	-1784901099
	.word	-344298049
	.word	-631680363
	.word	763608788
	.word	-752782248
	.word	694804553
	.word	1154009486
	.word	1787413109
	.word	2021232372
	.word	1799248025
	.word	-579749593
	.word	-1236278850
	.word	397248752
	.word	1722556617
	.word	-1271214467
	.word	407560035
	.word	-2110711067
	.word	1613975959
	.word	1165972322
	.word	-529046351
	.word	-2068943941
	.word	480281086
	.word	-1809118983
	.word	1483229296
	.word	436028815
	.word	-2022908268
	.word	-1208452270
	.word	601060267
	.word	-503166094
	.word	1468997603
	.word	715871590
	.word	120122290
	.word	63092015
	.word	-1703164538
	.word	-1526188077
	.word	-226023376
	.word	-1297760477
	.word	-1167457534
	.word	1552029421
	.word	723308426
	.word	-1833666137
	.word	-252573709
	.word	-1578997426
	.word	-839591323
	.word	-708967162
	.word	526529745
	.word	-1963022652
	.word	-1655493068
	.word	-1604979806
	.word	853641733
	.word	1978398372
	.word	971801355
	.word	-1427152832
	.word	111112542
	.word	1360031421
	.word	-108388034
	.word	1023860118
	.word	-1375387939
	.word	1186850381
	.word	-1249028975
	.word	90031217
	.word	1876166148
	.word	-15380384
	.word	620468249
	.word	-1746289194
	.word	-868007799
	.word	2006899047
	.word	-1119688528
	.word	-2004121337
	.word	945494503
	.word	-605108103
	.word	1191869601
	.word	-384875908
	.word	-920746760
	.word	0
	.word	-2088337399
	.word	1223502642
	.word	-1401941730
	.word	1316117100
	.word	-67170563
	.word	1446544655
	.word	517320253
	.word	658058550
	.word	1691946762
	.word	564550760
	.word	-783000677
	.word	976107044
	.word	-1318647284
	.word	266819475
	.word	-761860428
	.word	-1634624741
	.word	1338359936
	.word	-1574904735
	.word	1766553434
	.word	370807324
	.word	179999714
	.word	-450191168
	.word	1138762300
	.word	488053522
	.word	185403662
	.word	-1379431438
	.word	-1180125651
	.word	-928440812
	.word	-2061897385
	.word	1275557295
	.word	-1143105042
	.word	-44007517
	.word	-1624899081
	.word	-1124765092
	.word	-985962940
	.word	880737115
	.word	1982415755
	.word	-590994485
	.word	1761406390
	.word	1676797112
	.word	-891538985
	.word	277177154
	.word	1076008723
	.word	538035844
	.word	2099530373
	.word	-130171950
	.word	288553390
	.word	1839278535
	.word	1261411869
	.word	-214912292
	.word	-330136051
	.word	-790380169
	.word	1813426987
	.word	-1715900247
	.word	-95906799
	.word	577038663
	.word	-997393240
	.word	440397984
	.word	-668172970
	.word	-275762398
	.word	-951170681
	.word	-1043253031
	.word	-22885748
	.word	906744984
	.word	-813566554
	.word	685669029
	.word	646887386
	.word	-1530942145
	.word	-459458004
	.word	227702864
	.word	-1681105046
	.word	1648787028
	.word	-1038905866
	.word	-390539120
	.word	1593260334
	.word	-173030526
	.word	-1098883681
	.word	2090061929
	.word	-1456614033
	.word	-1290656305
	.word	999926984
	.word	-1484974064
	.word	1852021992
	.word	2075868123
	.word	158869197
	.word	-199730834
	.word	28809964
	.word	-1466282109
	.word	1701746150
	.word	2129067946
	.word	147831841
	.word	-420997649
	.word	-644094022
	.word	-835293366
	.word	-737566742
	.word	-696471511
	.word	-1347247055
	.word	824393514
	.word	815048134
	.word	-1067015627
	.word	935087732
	.word	-1496677636
	.word	-1328508704
	.word	366520115
	.word	1251476721
	.word	-136647615
	.word	240176511
	.word	804688151
	.word	-1915335306
	.word	1303441219
	.word	1414376140
	.word	-553347356
	.word	-474623586
	.word	461924940
	.word	-1205916479
	.word	2136040774
	.word	82468509
	.word	1563790337
	.word	1937016826
	.word	776014843
	.word	1511876531
	.word	1389550482
	.word	861278441
	.word	323475053
	.word	-1939744870
	.word	2047648055
	.word	-1911228327
	.word	-1992551445
	.word	-299390514
	.word	902390199
	.word	-303751967
	.word	1018251130
	.word	1507840668
	.word	1064563285
	.word	2043548696
	.word	-1086863501
	.word	-355600557
	.word	1537932639
	.word	342834655
	.word	-2032450440
	.word	-2114736182
	.word	1053059257
	.word	741614648
	.word	1598071746
	.word	1925389590
	.word	203809468
	.word	-1958134744
	.word	1100287487
	.word	1895934009
	.word	-558691320
	.word	-1662733096
	.word	-1866377628
	.word	1636092795
	.word	1890988757
	.word	1952214088
	.word	1113045200
	.global	fl_tab
	.align	2
	.type	fl_tab, %object
	.size	fl_tab, 1024
fl_tab:
	.word	99
	.word	124
	.word	119
	.word	123
	.word	242
	.word	107
	.word	111
	.word	197
	.word	48
	.word	1
	.word	103
	.word	43
	.word	254
	.word	215
	.word	171
	.word	118
	.word	202
	.word	130
	.word	201
	.word	125
	.word	250
	.word	89
	.word	71
	.word	240
	.word	173
	.word	212
	.word	162
	.word	175
	.word	156
	.word	164
	.word	114
	.word	192
	.word	183
	.word	253
	.word	147
	.word	38
	.word	54
	.word	63
	.word	247
	.word	204
	.word	52
	.word	165
	.word	229
	.word	241
	.word	113
	.word	216
	.word	49
	.word	21
	.word	4
	.word	199
	.word	35
	.word	195
	.word	24
	.word	150
	.word	5
	.word	154
	.word	7
	.word	18
	.word	128
	.word	226
	.word	235
	.word	39
	.word	178
	.word	117
	.word	9
	.word	131
	.word	44
	.word	26
	.word	27
	.word	110
	.word	90
	.word	160
	.word	82
	.word	59
	.word	214
	.word	179
	.word	41
	.word	227
	.word	47
	.word	132
	.word	83
	.word	209
	.word	0
	.word	237
	.word	32
	.word	252
	.word	177
	.word	91
	.word	106
	.word	203
	.word	190
	.word	57
	.word	74
	.word	76
	.word	88
	.word	207
	.word	208
	.word	239
	.word	170
	.word	251
	.word	67
	.word	77
	.word	51
	.word	133
	.word	69
	.word	249
	.word	2
	.word	127
	.word	80
	.word	60
	.word	159
	.word	168
	.word	81
	.word	163
	.word	64
	.word	143
	.word	146
	.word	157
	.word	56
	.word	245
	.word	188
	.word	182
	.word	218
	.word	33
	.word	16
	.word	255
	.word	243
	.word	210
	.word	205
	.word	12
	.word	19
	.word	236
	.word	95
	.word	151
	.word	68
	.word	23
	.word	196
	.word	167
	.word	126
	.word	61
	.word	100
	.word	93
	.word	25
	.word	115
	.word	96
	.word	129
	.word	79
	.word	220
	.word	34
	.word	42
	.word	144
	.word	136
	.word	70
	.word	238
	.word	184
	.word	20
	.word	222
	.word	94
	.word	11
	.word	219
	.word	224
	.word	50
	.word	58
	.word	10
	.word	73
	.word	6
	.word	36
	.word	92
	.word	194
	.word	211
	.word	172
	.word	98
	.word	145
	.word	149
	.word	228
	.word	121
	.word	231
	.word	200
	.word	55
	.word	109
	.word	141
	.word	213
	.word	78
	.word	169
	.word	108
	.word	86
	.word	244
	.word	234
	.word	101
	.word	122
	.word	174
	.word	8
	.word	186
	.word	120
	.word	37
	.word	46
	.word	28
	.word	166
	.word	180
	.word	198
	.word	232
	.word	221
	.word	116
	.word	31
	.word	75
	.word	189
	.word	139
	.word	138
	.word	112
	.word	62
	.word	181
	.word	102
	.word	72
	.word	3
	.word	246
	.word	14
	.word	97
	.word	53
	.word	87
	.word	185
	.word	134
	.word	193
	.word	29
	.word	158
	.word	225
	.word	248
	.word	152
	.word	17
	.word	105
	.word	217
	.word	142
	.word	148
	.word	155
	.word	30
	.word	135
	.word	233
	.word	206
	.word	85
	.word	40
	.word	223
	.word	140
	.word	161
	.word	137
	.word	13
	.word	191
	.word	230
	.word	66
	.word	104
	.word	65
	.word	153
	.word	45
	.word	15
	.word	176
	.word	84
	.word	187
	.word	22
	.global	il_tab
	.align	2
	.type	il_tab, %object
	.size	il_tab, 1024
il_tab:
	.word	82
	.word	9
	.word	106
	.word	213
	.word	48
	.word	54
	.word	165
	.word	56
	.word	191
	.word	64
	.word	163
	.word	158
	.word	129
	.word	243
	.word	215
	.word	251
	.word	124
	.word	227
	.word	57
	.word	130
	.word	155
	.word	47
	.word	255
	.word	135
	.word	52
	.word	142
	.word	67
	.word	68
	.word	196
	.word	222
	.word	233
	.word	203
	.word	84
	.word	123
	.word	148
	.word	50
	.word	166
	.word	194
	.word	35
	.word	61
	.word	238
	.word	76
	.word	149
	.word	11
	.word	66
	.word	250
	.word	195
	.word	78
	.word	8
	.word	46
	.word	161
	.word	102
	.word	40
	.word	217
	.word	36
	.word	178
	.word	118
	.word	91
	.word	162
	.word	73
	.word	109
	.word	139
	.word	209
	.word	37
	.word	114
	.word	248
	.word	246
	.word	100
	.word	134
	.word	104
	.word	152
	.word	22
	.word	212
	.word	164
	.word	92
	.word	204
	.word	93
	.word	101
	.word	182
	.word	146
	.word	108
	.word	112
	.word	72
	.word	80
	.word	253
	.word	237
	.word	185
	.word	218
	.word	94
	.word	21
	.word	70
	.word	87
	.word	167
	.word	141
	.word	157
	.word	132
	.word	144
	.word	216
	.word	171
	.word	0
	.word	140
	.word	188
	.word	211
	.word	10
	.word	247
	.word	228
	.word	88
	.word	5
	.word	184
	.word	179
	.word	69
	.word	6
	.word	208
	.word	44
	.word	30
	.word	143
	.word	202
	.word	63
	.word	15
	.word	2
	.word	193
	.word	175
	.word	189
	.word	3
	.word	1
	.word	19
	.word	138
	.word	107
	.word	58
	.word	145
	.word	17
	.word	65
	.word	79
	.word	103
	.word	220
	.word	234
	.word	151
	.word	242
	.word	207
	.word	206
	.word	240
	.word	180
	.word	230
	.word	115
	.word	150
	.word	172
	.word	116
	.word	34
	.word	231
	.word	173
	.word	53
	.word	133
	.word	226
	.word	249
	.word	55
	.word	232
	.word	28
	.word	117
	.word	223
	.word	110
	.word	71
	.word	241
	.word	26
	.word	113
	.word	29
	.word	41
	.word	197
	.word	137
	.word	111
	.word	183
	.word	98
	.word	14
	.word	170
	.word	24
	.word	190
	.word	27
	.word	252
	.word	86
	.word	62
	.word	75
	.word	198
	.word	210
	.word	121
	.word	32
	.word	154
	.word	219
	.word	192
	.word	254
	.word	120
	.word	205
	.word	90
	.word	244
	.word	31
	.word	221
	.word	168
	.word	51
	.word	136
	.word	7
	.word	199
	.word	49
	.word	177
	.word	18
	.word	16
	.word	89
	.word	39
	.word	128
	.word	236
	.word	95
	.word	96
	.word	81
	.word	127
	.word	169
	.word	25
	.word	181
	.word	74
	.word	13
	.word	45
	.word	229
	.word	122
	.word	159
	.word	147
	.word	201
	.word	156
	.word	239
	.word	160
	.word	224
	.word	59
	.word	77
	.word	174
	.word	42
	.word	245
	.word	176
	.word	200
	.word	235
	.word	187
	.word	60
	.word	131
	.word	83
	.word	153
	.word	97
	.word	23
	.word	43
	.word	4
	.word	126
	.word	186
	.word	119
	.word	214
	.word	38
	.word	225
	.word	105
	.word	20
	.word	99
	.word	85
	.word	33
	.word	12
	.word	125
	.global	im_tab
	.align	2
	.type	im_tab, %object
	.size	im_tab, 1024
im_tab:
	.word	0
	.word	185403662
	.word	370807324
	.word	488053522
	.word	741614648
	.word	658058550
	.word	976107044
	.word	824393514
	.word	1483229296
	.word	1399144830
	.word	1316117100
	.word	1165972322
	.word	1952214088
	.word	2136040774
	.word	1648787028
	.word	1766553434
	.word	-1328508704
	.word	-1143105042
	.word	-1496677636
	.word	-1379431438
	.word	-1662733096
	.word	-1746289194
	.word	-1963022652
	.word	-2114736182
	.word	-390539120
	.word	-474623586
	.word	-22885748
	.word	-173030526
	.word	-997393240
	.word	-813566554
	.word	-761860428
	.word	-644094022
	.word	2075868123
	.word	1890988757
	.word	1839278535
	.word	1722556617
	.word	1468997603
	.word	1552029421
	.word	1100287487
	.word	1251476721
	.word	601060267
	.word	685669029
	.word	902390199
	.word	1053059257
	.word	266819475
	.word	82468509
	.word	436028815
	.word	317738113
	.word	-882136261
	.word	-1067015627
	.word	-579749593
	.word	-696471511
	.word	-413167869
	.word	-330136051
	.word	-247096033
	.word	-95906799
	.word	-1828461749
	.word	-1743852987
	.word	-2061897385
	.word	-1911228327
	.word	-1086863501
	.word	-1271214467
	.word	-1456614033
	.word	-1574904735
	.word	-160598355
	.word	-44007517
	.word	-529046351
	.word	-344298049
	.word	-631680363
	.word	-783000677
	.word	-868007799
	.word	-951170681
	.word	-1375387939
	.word	-1526188077
	.word	-1205916479
	.word	-1290656305
	.word	-2110711067
	.word	-1992551445
	.word	-1809118983
	.word	-1624899081
	.word	1186850381
	.word	1303441219
	.word	1353184337
	.word	1537932639
	.word	1787413109
	.word	1636092795
	.word	2090061929
	.word	2006899047
	.word	517320253
	.word	366520115
	.word	147831841
	.word	63092015
	.word	853641733
	.word	971801355
	.word	620468249
	.word	804688151
	.word	-1915335306
	.word	-2032450440
	.word	-1681105046
	.word	-1866377628
	.word	-1578997426
	.word	-1427152832
	.word	-1208452270
	.word	-1124765092
	.word	-708967162
	.word	-558691320
	.word	-1012656358
	.word	-928440812
	.word	-108388034
	.word	-226023376
	.word	-275762398
	.word	-459458004
	.word	1023860118
	.word	906744984
	.word	723308426
	.word	538035844
	.word	288553390
	.word	440397984
	.word	120122290
	.word	203809468
	.word	1701746150
	.word	1852021992
	.word	1937016826
	.word	2021232372
	.word	1230680542
	.word	1113045200
	.word	1598071746
	.word	1414376140
	.word	-136647615
	.word	-52959921
	.word	-507445667
	.word	-355600557
	.word	-605108103
	.word	-790380169
	.word	-839591323
	.word	-956705941
	.word	-1347247055
	.word	-1530942145
	.word	-1180125651
	.word	-1297760477
	.word	-2088337399
	.word	-2004121337
	.word	-1784901099
	.word	-1634624741
	.word	1191869601
	.word	1275557295
	.word	1360031421
	.word	1511876531
	.word	1799248025
	.word	1613975959
	.word	2099530373
	.word	1982415755
	.word	526529745
	.word	342834655
	.word	158869197
	.word	41234371
	.word	861278441
	.word	945494503
	.word	625738485
	.word	776014843
	.word	-1939744870
	.word	-2022908268
	.word	-1703164538
	.word	-1854485368
	.word	-1604979806
	.word	-1420232020
	.word	-1236278850
	.word	-1119688528
	.word	-737566742
	.word	-553347356
	.word	-1038905866
	.word	-920746760
	.word	-130171950
	.word	-214912292
	.word	-299390514
	.word	-450191168
	.word	1018251130
	.word	935087732
	.word	715871590
	.word	564550760
	.word	277177154
	.word	461924940
	.word	111112542
	.word	227702864
	.word	1691946762
	.word	1876166148
	.word	1925389590
	.word	2043548696
	.word	1223502642
	.word	1138762300
	.word	1593260334
	.word	1442459680
	.word	28809964
	.word	179999714
	.word	397248752
	.word	480281086
	.word	763608788
	.word	646887386
	.word	999926984
	.word	815048134
	.word	1507840668
	.word	1389550482
	.word	1338359936
	.word	1154009486
	.word	1978398372
	.word	2129067946
	.word	1676797112
	.word	1761406390
	.word	-1318647284
	.word	-1167457534
	.word	-1484974064
	.word	-1401941730
	.word	-1655493068
	.word	-1772214470
	.word	-1958134744
	.word	-2143013594
	.word	-384875908
	.word	-503166094
	.word	-15380384
	.word	-199730834
	.word	-985962940
	.word	-835293366
	.word	-752782248
	.word	-668172970
	.word	2047648055
	.word	1895934009
	.word	1813426987
	.word	1729870373
	.word	1446544655
	.word	1563790337
	.word	1076008723
	.word	1261411869
	.word	577038663
	.word	694804553
	.word	880737115
	.word	1064563285
	.word	240176511
	.word	90031217
	.word	407560035
	.word	323475053
	.word	-891538985
	.word	-1043253031
	.word	-590994485
	.word	-674551099
	.word	-420997649
	.word	-303751967
	.word	-252573709
	.word	-67170563
	.word	-1833666137
	.word	-1715900247
	.word	-2068943941
	.word	-1885117771
	.word	-1098883681
	.word	-1249028975
	.word	-1466282109
	.word	-1550367091
	.text
	.align	2
	.global	set_key
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_key, %function
set_key:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r3, [fp, #-36]
	mov	r3, r2
	strb	r3, [fp, #-29]
	ldr	r3, [fp, #-28]
	and	r3, r3, #7
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-28]
	cmp	r3, #15
	bls	.L2
	ldr	r3, [fp, #-28]
	cmp	r3, #32
	bhi	.L2
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L3
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L3
.L2:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L4
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #520]	@ zero_extendqisi2
	bic	r3, r3, #3
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	strb	r2, [r3, #520]
	mov	r3, #0
	b	.L6
.L4:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	lsl	r3, r3, #2
	lsl	r3, r3, #16
	asr	r3, r3, #16
	b	.L6
.L3:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #520]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	bic	r3, r3, #3
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldrsb	r3, [fp, #-29]
	and	r3, r3, #3
	lsl	r3, r3, #24
	asr	r3, r3, #24
	orr	r3, r2, r3
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	strb	r2, [r3, #520]
	ldr	r3, [fp, #-28]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-36]
	str	r2, [r3]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	cmp	r3, #4
	movcs	r3, r3
	movcc	r3, #4
	add	r2, r3, #6
	ldr	r3, [fp, #-36]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-36]
	add	r3, r3, #8
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	lsl	r2, r3, #2
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	sub	r3, r2, r3
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	cmp	r3, #8
	beq	.L7
	cmp	r3, #8
	bhi	.L8
	cmp	r3, #4
	beq	.L9
	cmp	r3, #6
	beq	.L10
	b	.L8
.L16:
	nop
.L9:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r1, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	str	r2, [fp, #-16]
	ldr	r2, .L17+4
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcc	.L16
	b	.L8
.L10:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
.L11:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r1, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	str	r2, [fp, #-16]
	ldr	r2, .L17+4
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcc	.L11
	b	.L8
.L7:
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #32]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #36]
.L12:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r1, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	str	r2, [fp, #-16]
	ldr	r2, .L17+4
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L17
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #52
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #52
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #56
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r1, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #56
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #60
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcc	.L12
	nop
.L8:
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #520]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	beq	.L13
	ldr	r3, [fp, #-36]
	add	r2, r3, #264
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	lsl	r3, r3, #4
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-36]
	add	r3, r3, #8
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #32
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L14
.L15:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #24
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #16
	eor	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r2, lsl #2]
	ror	r2, r3, #8
	ldr	r3, [fp, #-12]
	add	r0, r3, #4
	str	r0, [fp, #-12]
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #24
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #16
	eor	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r2, lsl #2]
	ror	r2, r3, #8
	ldr	r3, [fp, #-12]
	add	r0, r3, #4
	str	r0, [fp, #-12]
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #24
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #16
	eor	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r2, lsl #2]
	ror	r2, r3, #8
	ldr	r3, [fp, #-12]
	add	r0, r3, #4
	str	r0, [fp, #-12]
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r2, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #24
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r1, lsl #2]
	ror	r3, r3, #16
	eor	r1, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L17+8
	ldr	r3, [r3, r2, lsl #2]
	ror	r2, r3, #8
	ldr	r3, [fp, #-12]
	add	r0, r3, #4
	str	r0, [fp, #-12]
	eor	r2, r2, r1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #32
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L14:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bcc	.L15
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
.L13:
	mov	r3, #1
.L6:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L18:
	.align	2
.L17:
	.word	fl_tab
	.word	rcon_tab
	.word	im_tab
	.size	set_key, .-set_key
	.align	2
	.global	encrypt
	.syntax unified
	.arm
	.fpu softvfp
	.type	encrypt, %function
encrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	ldr	r3, [fp, #-56]
	add	r3, r3, #8
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #520]	@ zero_extendqisi2
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L20
	mov	r3, #0
	b	.L26
.L20:
	ldr	r3, [fp, #-48]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-48]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #4]
	cmp	r3, #14
	beq	.L22
	cmp	r3, #14
	bhi	.L23
	cmp	r3, #10
	beq	.L24
	cmp	r3, #12
	beq	.L25
	b	.L23
.L22:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
.L25:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #52
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #56
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	b	.L28
.L29:
	.align	2
.L27:
	.word	ft_tab
	.word	ft_tab
	.word	fl_tab
.L28:
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #60
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #64
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #68
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #72
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #76
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #80
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #84
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #88
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #92
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #96
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #100
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #104
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #108
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #112
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #116
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #120
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #124
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #132
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #136
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #140
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #144
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #148
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #152
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #156
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L27+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L27+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
.L23:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	add	r3, r3, #4
	ldr	r2, [fp, #-36]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	add	r3, r3, #8
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	add	r3, r3, #12
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	mov	r3, #1
.L26:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	encrypt, .-encrypt
	.align	2
	.global	decrypt
	.syntax unified
	.arm
	.fpu softvfp
	.type	decrypt, %function
decrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	ldr	r3, [fp, #-56]
	add	r3, r3, #264
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-56]
	ldrb	r3, [r3, #520]	@ zero_extendqisi2
	and	r3, r3, #2
	cmp	r3, #0
	bne	.L31
	mov	r3, #0
	b	.L37
.L31:
	ldr	r3, [fp, #-48]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-48]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-48]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r3, [r3]
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3, #4]
	cmp	r3, #14
	beq	.L33
	cmp	r3, #14
	bhi	.L34
	cmp	r3, #10
	beq	.L35
	cmp	r3, #12
	beq	.L36
	b	.L34
.L33:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
.L36:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
.L35:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #36
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #40
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #44
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #48
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #52
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #56
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	b	.L39
.L40:
	.align	2
.L38:
	.word	it_tab
	.word	it_tab
	.word	il_tab
.L39:
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #60
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #64
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #68
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #72
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #76
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #80
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #84
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #88
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #92
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #96
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #100
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #104
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #108
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #112
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #116
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #120
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #124
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	ldr	r2, [r3]
	ldr	r3, [fp, #-40]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #132
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #136
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #140
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+4
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #24
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+4
	ldr	r3, [r3, r0, lsl #2]
	ror	r3, r3, #8
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #144
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #148
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #152
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #156
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L38+8
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #8
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #8
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #16
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #24
	and	r3, r3, #255
	mov	r0, r3
	ldr	r3, .L38+8
	ldr	r3, [r3, r0, lsl #2]
	lsl	r3, r3, #24
	eor	r3, r3, r1
	eor	r3, r3, r2
	str	r3, [fp, #-28]
.L34:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	add	r3, r3, #4
	ldr	r2, [fp, #-36]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	add	r3, r3, #8
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-52]
	add	r3, r3, #12
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	mov	r3, #1
.L37:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	decrypt, .-decrypt
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
