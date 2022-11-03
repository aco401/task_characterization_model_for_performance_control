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
	.file	"libstb_perlin.c"
	.text
	.section	.rodata
	.align	2
	.type	stb__perlin_randtab, %object
	.size	stb__perlin_randtab, 2048
stb__perlin_randtab:
	.word	23
	.word	125
	.word	161
	.word	52
	.word	103
	.word	117
	.word	70
	.word	37
	.word	247
	.word	101
	.word	203
	.word	169
	.word	124
	.word	126
	.word	44
	.word	123
	.word	152
	.word	238
	.word	145
	.word	45
	.word	171
	.word	114
	.word	253
	.word	10
	.word	192
	.word	136
	.word	4
	.word	157
	.word	249
	.word	30
	.word	35
	.word	72
	.word	175
	.word	63
	.word	77
	.word	90
	.word	181
	.word	16
	.word	96
	.word	111
	.word	133
	.word	104
	.word	75
	.word	162
	.word	93
	.word	56
	.word	66
	.word	240
	.word	8
	.word	50
	.word	84
	.word	229
	.word	49
	.word	210
	.word	173
	.word	239
	.word	141
	.word	1
	.word	87
	.word	18
	.word	2
	.word	198
	.word	143
	.word	57
	.word	225
	.word	160
	.word	58
	.word	217
	.word	168
	.word	206
	.word	245
	.word	204
	.word	199
	.word	6
	.word	73
	.word	60
	.word	20
	.word	230
	.word	211
	.word	233
	.word	94
	.word	200
	.word	88
	.word	9
	.word	74
	.word	155
	.word	33
	.word	15
	.word	219
	.word	130
	.word	226
	.word	202
	.word	83
	.word	236
	.word	42
	.word	172
	.word	165
	.word	218
	.word	55
	.word	222
	.word	46
	.word	107
	.word	98
	.word	154
	.word	109
	.word	67
	.word	196
	.word	178
	.word	127
	.word	158
	.word	13
	.word	243
	.word	65
	.word	79
	.word	166
	.word	248
	.word	25
	.word	224
	.word	115
	.word	80
	.word	68
	.word	51
	.word	184
	.word	128
	.word	232
	.word	208
	.word	151
	.word	122
	.word	26
	.word	212
	.word	105
	.word	43
	.word	179
	.word	213
	.word	235
	.word	148
	.word	146
	.word	89
	.word	14
	.word	195
	.word	28
	.word	78
	.word	112
	.word	76
	.word	250
	.word	47
	.word	24
	.word	251
	.word	140
	.word	108
	.word	186
	.word	190
	.word	228
	.word	170
	.word	183
	.word	139
	.word	39
	.word	188
	.word	244
	.word	246
	.word	132
	.word	48
	.word	119
	.word	144
	.word	180
	.word	138
	.word	134
	.word	193
	.word	82
	.word	182
	.word	120
	.word	121
	.word	86
	.word	220
	.word	209
	.word	3
	.word	91
	.word	241
	.word	149
	.word	85
	.word	205
	.word	150
	.word	113
	.word	216
	.word	31
	.word	100
	.word	41
	.word	164
	.word	177
	.word	214
	.word	153
	.word	231
	.word	38
	.word	71
	.word	185
	.word	174
	.word	97
	.word	201
	.word	29
	.word	95
	.word	7
	.word	92
	.word	54
	.word	254
	.word	191
	.word	118
	.word	34
	.word	221
	.word	131
	.word	11
	.word	163
	.word	99
	.word	234
	.word	81
	.word	227
	.word	147
	.word	156
	.word	176
	.word	17
	.word	142
	.word	69
	.word	12
	.word	110
	.word	62
	.word	27
	.word	255
	.word	0
	.word	194
	.word	59
	.word	116
	.word	242
	.word	252
	.word	19
	.word	21
	.word	187
	.word	53
	.word	207
	.word	129
	.word	64
	.word	135
	.word	61
	.word	40
	.word	167
	.word	237
	.word	102
	.word	223
	.word	106
	.word	159
	.word	197
	.word	189
	.word	215
	.word	137
	.word	36
	.word	32
	.word	22
	.word	5
	.word	23
	.word	125
	.word	161
	.word	52
	.word	103
	.word	117
	.word	70
	.word	37
	.word	247
	.word	101
	.word	203
	.word	169
	.word	124
	.word	126
	.word	44
	.word	123
	.word	152
	.word	238
	.word	145
	.word	45
	.word	171
	.word	114
	.word	253
	.word	10
	.word	192
	.word	136
	.word	4
	.word	157
	.word	249
	.word	30
	.word	35
	.word	72
	.word	175
	.word	63
	.word	77
	.word	90
	.word	181
	.word	16
	.word	96
	.word	111
	.word	133
	.word	104
	.word	75
	.word	162
	.word	93
	.word	56
	.word	66
	.word	240
	.word	8
	.word	50
	.word	84
	.word	229
	.word	49
	.word	210
	.word	173
	.word	239
	.word	141
	.word	1
	.word	87
	.word	18
	.word	2
	.word	198
	.word	143
	.word	57
	.word	225
	.word	160
	.word	58
	.word	217
	.word	168
	.word	206
	.word	245
	.word	204
	.word	199
	.word	6
	.word	73
	.word	60
	.word	20
	.word	230
	.word	211
	.word	233
	.word	94
	.word	200
	.word	88
	.word	9
	.word	74
	.word	155
	.word	33
	.word	15
	.word	219
	.word	130
	.word	226
	.word	202
	.word	83
	.word	236
	.word	42
	.word	172
	.word	165
	.word	218
	.word	55
	.word	222
	.word	46
	.word	107
	.word	98
	.word	154
	.word	109
	.word	67
	.word	196
	.word	178
	.word	127
	.word	158
	.word	13
	.word	243
	.word	65
	.word	79
	.word	166
	.word	248
	.word	25
	.word	224
	.word	115
	.word	80
	.word	68
	.word	51
	.word	184
	.word	128
	.word	232
	.word	208
	.word	151
	.word	122
	.word	26
	.word	212
	.word	105
	.word	43
	.word	179
	.word	213
	.word	235
	.word	148
	.word	146
	.word	89
	.word	14
	.word	195
	.word	28
	.word	78
	.word	112
	.word	76
	.word	250
	.word	47
	.word	24
	.word	251
	.word	140
	.word	108
	.word	186
	.word	190
	.word	228
	.word	170
	.word	183
	.word	139
	.word	39
	.word	188
	.word	244
	.word	246
	.word	132
	.word	48
	.word	119
	.word	144
	.word	180
	.word	138
	.word	134
	.word	193
	.word	82
	.word	182
	.word	120
	.word	121
	.word	86
	.word	220
	.word	209
	.word	3
	.word	91
	.word	241
	.word	149
	.word	85
	.word	205
	.word	150
	.word	113
	.word	216
	.word	31
	.word	100
	.word	41
	.word	164
	.word	177
	.word	214
	.word	153
	.word	231
	.word	38
	.word	71
	.word	185
	.word	174
	.word	97
	.word	201
	.word	29
	.word	95
	.word	7
	.word	92
	.word	54
	.word	254
	.word	191
	.word	118
	.word	34
	.word	221
	.word	131
	.word	11
	.word	163
	.word	99
	.word	234
	.word	81
	.word	227
	.word	147
	.word	156
	.word	176
	.word	17
	.word	142
	.word	69
	.word	12
	.word	110
	.word	62
	.word	27
	.word	255
	.word	0
	.word	194
	.word	59
	.word	116
	.word	242
	.word	252
	.word	19
	.word	21
	.word	187
	.word	53
	.word	207
	.word	129
	.word	64
	.word	135
	.word	61
	.word	40
	.word	167
	.word	237
	.word	102
	.word	223
	.word	106
	.word	159
	.word	197
	.word	189
	.word	215
	.word	137
	.word	36
	.word	32
	.word	22
	.word	5
	.global	__aeabi_fsub
	.global	__aeabi_fmul
	.global	__aeabi_fadd
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	stb__perlin_lerp, %function
stb__perlin_lerp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]	@ float
	str	r1, [fp, #-12]	@ float
	str	r2, [fp, #-16]	@ float
	ldr	r1, [fp, #-8]	@ float
	ldr	r0, [fp, #-12]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-16]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, [fp, #-8]	@ float
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	stb__perlin_lerp, .-stb__perlin_lerp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	stb__perlin_grad, %function
stb__perlin_grad:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]	@ float
	str	r2, [fp, #-32]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-24]
	and	r3, r3, #63
	ldr	r2, .L5
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	lsl	r3, r3, #4
	ldr	r2, .L5+4
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]	@ float
	ldr	r1, [fp, #-28]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r3, [r3]	@ float
	ldr	r1, [fp, #-32]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r4, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	ldr	r3, [r3]	@ float
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	indices.1
	.word	basis.0
	.size	stb__perlin_grad, .-stb__perlin_grad
	.global	__aeabi_f2d
	.global	__aeabi_d2iz
	.global	__aeabi_i2f
	.align	2
	.global	stb_perlin_noise3
	.syntax unified
	.arm
	.fpu softvfp
	.type	stb_perlin_noise3, %function
stb_perlin_noise3:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 160
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #164
	str	r0, [fp, #-168]	@ float
	str	r1, [fp, #-172]	@ float
	str	r2, [fp, #-176]	@ float
	str	r3, [fp, #-180]
	ldr	r3, [fp, #-180]
	sub	r3, r3, #1
	and	r3, r3, #255
	str	r3, [fp, #-24]
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	and	r3, r3, #255
	str	r3, [fp, #-28]
	ldr	r3, [fp, #8]
	sub	r3, r3, #1
	and	r3, r3, #255
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	floor
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	floor
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-40]
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	floor
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	and	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-28]
	and	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-28]
	and	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-32]
	and	r3, r3, r2
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-32]
	and	r3, r3, r2
	str	r3, [fp, #-68]
	ldr	r0, [fp, #-36]
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-168]	@ float
	ldr	r1, .L9
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, .L9+4
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-168]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, .L9+8
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-168]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, [fp, #-168]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-72]	@ float
	ldr	r0, [fp, #-40]
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-172]	@ float
	ldr	r1, .L9
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, .L9+4
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-172]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, .L9+8
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-172]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, [fp, #-172]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-76]	@ float
	ldr	r0, [fp, #-44]
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-176]	@ float
	ldr	r1, .L9
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, .L9+4
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-176]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, .L9+8
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-176]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, [fp, #-176]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-80]	@ float
	ldr	r2, .L9+12
	ldr	r3, [fp, #-48]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-84]
	ldr	r2, .L9+12
	ldr	r3, [fp, #-52]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-88]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-92]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-96]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-100]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-104]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r0, [r2, r3, lsl #2]
	ldr	r3, [fp, #-176]	@ float
	ldr	r2, [fp, #-172]	@ float
	ldr	r1, [fp, #-168]	@ float
	bl	stb__perlin_grad
	str	r0, [fp, #-108]	@ float
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r2, [fp, #-172]	@ float
	ldr	r1, [fp, #-168]	@ float
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-112]	@ float
	ldr	r2, [fp, #-96]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-176]	@ float
	ldr	r1, [fp, #-168]	@ float
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-116]	@ float
	ldr	r2, [fp, #-96]
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r5, r3
	mov	r1, #1065353216
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r5
	ldr	r1, [fp, #-168]	@ float
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-120]	@ float
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	ldr	r3, [fp, #-176]	@ float
	ldr	r2, [fp, #-172]	@ float
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-124]	@ float
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r5, r3
	mov	r1, #1065353216
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r2, [fp, #-172]	@ float
	mov	r1, r5
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-128]	@ float
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r5, r3
	mov	r1, #1065353216
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-176]	@ float
	mov	r1, r5
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-132]	@ float
	ldr	r2, [fp, #-104]
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldr	r2, .L9+12
	ldr	r4, [r2, r3, lsl #2]
	mov	r1, #1065353216
	ldr	r0, [fp, #-168]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r5, r3
	mov	r1, #1065353216
	ldr	r0, [fp, #-172]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r6, r3
	mov	r1, #1065353216
	ldr	r0, [fp, #-176]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r6
	mov	r1, r5
	mov	r0, r4
	bl	stb__perlin_grad
	str	r0, [fp, #-136]	@ float
	ldr	r2, [fp, #-80]	@ float
	ldr	r1, [fp, #-112]	@ float
	ldr	r0, [fp, #-108]	@ float
	bl	stb__perlin_lerp
	str	r0, [fp, #-140]	@ float
	ldr	r2, [fp, #-80]	@ float
	ldr	r1, [fp, #-120]	@ float
	ldr	r0, [fp, #-116]	@ float
	bl	stb__perlin_lerp
	str	r0, [fp, #-144]	@ float
	ldr	r2, [fp, #-80]	@ float
	ldr	r1, [fp, #-128]	@ float
	ldr	r0, [fp, #-124]	@ float
	bl	stb__perlin_lerp
	str	r0, [fp, #-148]	@ float
	ldr	r2, [fp, #-80]	@ float
	ldr	r1, [fp, #-136]	@ float
	ldr	r0, [fp, #-132]	@ float
	bl	stb__perlin_lerp
	str	r0, [fp, #-152]	@ float
	ldr	r2, [fp, #-76]	@ float
	ldr	r1, [fp, #-144]	@ float
	ldr	r0, [fp, #-140]	@ float
	bl	stb__perlin_lerp
	str	r0, [fp, #-156]	@ float
	ldr	r2, [fp, #-76]	@ float
	ldr	r1, [fp, #-152]	@ float
	ldr	r0, [fp, #-148]	@ float
	bl	stb__perlin_lerp
	str	r0, [fp, #-160]	@ float
	ldr	r2, [fp, #-72]	@ float
	ldr	r1, [fp, #-160]	@ float
	ldr	r0, [fp, #-156]	@ float
	bl	stb__perlin_lerp
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	1086324736
	.word	1097859072
	.word	1092616192
	.word	stb__perlin_randtab
	.size	stb_perlin_noise3, .-stb_perlin_noise3
	.section	.rodata
	.align	2
	.type	expected, %object
	.size	expected, 400
expected:
	.word	0
	.word	-1141083731
	.word	-1120023883
	.word	-1108751693
	.word	-1102903037
	.word	-1098907648
	.word	-1098135091
	.word	-1098871540
	.word	-1103040488
	.word	-1110766601
	.word	1036717046
	.word	1035683035
	.word	1028075282
	.word	-1125114648
	.word	-1107796818
	.word	-1102263088
	.word	-1099387963
	.word	-1099697592
	.word	-1103073646
	.word	-1109978105
	.word	1044443158
	.word	1044206610
	.word	1041333608
	.word	1030357424
	.word	-1119114752
	.word	-1105618529
	.word	-1101055461
	.word	-1099714670
	.word	-1101755865
	.word	-1106472042
	.word	1048612107
	.word	1048833379
	.word	1046688184
	.word	1040987325
	.word	1017509104
	.word	-1110651712
	.word	-1102554676
	.word	-1099168840
	.word	-1099368382
	.word	-1102749702
	.word	1049348558
	.word	1050095022
	.word	1049393472
	.word	1045168312
	.word	1034491184
	.word	-1119040312
	.word	-1104328122
	.word	-1098907144
	.word	-1097984390
	.word	-1098849842
	.word	1048576000
	.word	1049966495
	.word	1049987972
	.word	1047698205
	.word	1040694728
	.word	0
	.word	-1106788920
	.word	-1099785440
	.word	-1097495670
	.word	-1097517152
	.word	1044580610
	.word	1048633805
	.word	1049499254
	.word	1048576504
	.word	1043155524
	.word	1028443328
	.word	-1112992464
	.word	-1102315336
	.word	-1098090168
	.word	-1097388624
	.word	1038731952
	.word	1044733942
	.word	1048115258
	.word	1048314806
	.word	1044928970
	.word	1036831936
	.word	-1129974528
	.word	-1106496320
	.word	-1100795448
	.word	-1098650266
	.word	1027459728
	.word	1041011596
	.word	1045727771
	.word	1047768972
	.word	1046428186
	.word	1041865120
	.word	1028368912
	.word	-1117126208
	.word	-1106150028
	.word	-1103277036
	.word	1006399872
	.word	1037505541
	.word	1044409996
	.word	1047786054
	.word	1048095683
	.word	1045220560
	.word	1039686828
	.word	1022368992
	.word	-1119408336
	.word	-1111800608
	.text
	.align	2
	.global	beebs_stb_perlin_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_stb_perlin_verify_benchmark, %function
beebs_stb_perlin_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	mvn	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_stb_perlin_verify_benchmark, .-beebs_stb_perlin_verify_benchmark
	.align	2
	.global	beebs_stb_perlin_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_stb_perlin_initialise_benchmark, %function
beebs_stb_perlin_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_stb_perlin_initialise_benchmark, .-beebs_stb_perlin_initialise_benchmark
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_d2f
	.global	__aeabi_fcmpeq
	.align	2
	.global	beebs_stb_perlin_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_stb_perlin_benchmark, %function
beebs_stb_perlin_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L15
.L20:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L16
.L19:
	ldr	r0, [fp, #-8]
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	adr	r3, .L23
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L23+8
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r0, [fp, #-12]
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	adr	r3, .L23
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L23+8
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [fp, #-24]	@ float
	mov	r3, #0
	str	r3, [sp, #4]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #1065353216
	ldr	r1, [fp, #-24]	@ float
	ldr	r0, [fp, #-20]	@ float
	bl	stb_perlin_noise3
	str	r0, [fp, #-28]	@ float
	ldr	r1, .L23+12
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L17
	mov	r3, #1
	str	r3, [fp, #-16]
.L17:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L16:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L19
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	ble	.L20
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L24:
	.align	3
.L23:
	.word	-1717986918
	.word	1069128089
	.word	1075052544
	.word	expected
	.size	beebs_stb_perlin_benchmark, .-beebs_stb_perlin_benchmark
	.data
	.align	2
	.type	indices.1, %object
	.size	indices.1, 64
indices.1:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013\000"
	.ascii	"\011\001\013\000\001\002\003\004\005\006\007\010\011"
	.ascii	"\012\013\000\001\002\003\004\005\006\007\010\011\012"
	.ascii	"\013\000\001\002\003\004\005\006\007\010\011\012\013"
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013"
	.align	2
	.type	basis.0, %object
	.size	basis.0, 192
basis.0:
	.word	1065353216
	.word	1065353216
	.word	0
	.space	4
	.word	-1082130432
	.word	1065353216
	.word	0
	.space	4
	.word	1065353216
	.word	-1082130432
	.word	0
	.space	4
	.word	-1082130432
	.word	-1082130432
	.word	0
	.space	4
	.word	1065353216
	.word	0
	.word	1065353216
	.space	4
	.word	-1082130432
	.word	0
	.word	1065353216
	.space	4
	.word	1065353216
	.word	0
	.word	-1082130432
	.space	4
	.word	-1082130432
	.word	0
	.word	-1082130432
	.space	4
	.word	0
	.word	1065353216
	.word	1065353216
	.space	4
	.word	0
	.word	-1082130432
	.word	1065353216
	.space	4
	.word	0
	.word	1065353216
	.word	-1082130432
	.space	4
	.word	0
	.word	-1082130432
	.word	-1082130432
	.space	4
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
