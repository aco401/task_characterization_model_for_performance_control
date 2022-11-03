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
	.file	"libst.c"
	.text
	.global	st_Seed
	.bss
	.align	2
	.type	st_Seed, %object
	.size	st_Seed, 4
st_Seed:
	.space	4
	.global	ArrayA
	.align	3
	.type	ArrayA, %object
	.size	ArrayA, 800
ArrayA:
	.space	800
	.global	ArrayB
	.align	3
	.type	ArrayB, %object
	.size	ArrayB, 800
ArrayB:
	.space	800
	.global	SumA
	.align	3
	.type	SumA, %object
	.size	SumA, 8
SumA:
	.space	8
	.global	SumB
	.align	3
	.type	SumB, %object
	.size	SumB, 8
SumB:
	.space	8
	.global	Coef
	.align	3
	.type	Coef, %object
	.size	Coef, 8
Coef:
	.space	8
	.text
	.align	2
	.global	beebs_st_initialise_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_st_initialise_benchmark, %function
beebs_st_initialise_benchmark:
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
	.size	beebs_st_initialise_benchmark, .-beebs_st_initialise_benchmark
	.align	2
	.global	beebs_st_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_st_benchmark, %function
beebs_st_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	bl	st_InitSeed
	ldr	r0, .L4
	bl	st_Initialize
	sub	r3, fp, #12
	mov	r2, r3
	ldr	r1, .L4+4
	ldr	r0, .L4
	bl	Calc_Sum_Mean
	sub	r3, fp, #12
	ldmia	r3, {r2-r3}
	sub	r1, fp, #44
	str	r1, [sp, #4]
	sub	r1, fp, #28
	str	r1, [sp]
	ldr	r0, .L4
	bl	Calc_Var_Stddev
	ldr	r0, .L4+8
	bl	st_Initialize
	sub	r3, fp, #20
	mov	r2, r3
	ldr	r1, .L4+12
	ldr	r0, .L4+8
	bl	Calc_Sum_Mean
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	sub	r1, fp, #52
	str	r1, [sp, #4]
	sub	r1, fp, #36
	str	r1, [sp]
	ldr	r0, .L4+8
	bl	Calc_Var_Stddev
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L4+8
	ldr	r0, .L4
	bl	Calc_LinCorrCoef
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	ArrayA
	.word	SumA
	.word	ArrayB
	.word	SumB
	.size	beebs_st_benchmark, .-beebs_st_benchmark
	.align	2
	.global	st_InitSeed
	.syntax unified
	.arm
	.fpu softvfp
	.type	st_InitSeed, %function
st_InitSeed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L7
	mov	r2, #0
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	st_Seed
	.size	st_InitSeed, .-st_InitSeed
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.align	2
	.global	Calc_Sum_Mean
	.syntax unified
	.arm
	.fpu softvfp
	.type	Calc_Sum_Mean, %function
Calc_Sum_Mean:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	mov	r2, #0
	mov	r3, #0
	stm	r1, {r2-r3}
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L10
.L11:
	ldr	r3, [fp, #-20]
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #-20]
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L11
	ldr	r3, [fp, #-20]
	ldmia	r3, {r0-r1}
	mov	r2, #0
	ldr	r3, .L12
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #-24]
	stm	r1, {r2-r3}
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	1079574528
	.size	Calc_Sum_Mean, .-Calc_Sum_Mean
	.global	__aeabi_dmul
	.align	2
	.global	Square
	.syntax unified
	.arm
	.fpu softvfp
	.type	Square, %function
Square:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-12]
	str	r1, [fp, #-8]
	sub	r3, fp, #12
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	Square, .-Square
	.global	__aeabi_dsub
	.align	2
	.global	Calc_Var_Stddev
	.syntax unified
	.arm
	.fpu softvfp
	.type	Calc_Var_Stddev, %function
Calc_Var_Stddev:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L17
.L18:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	Square
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L18
	mov	r2, #0
	ldr	r3, .L19
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #4]
	stm	r1, {r2-r3}
	ldr	r3, [fp, #4]
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #8]
	stm	r1, {r2-r3}
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	1079574528
	.size	Calc_Var_Stddev, .-Calc_Var_Stddev
	.align	2
	.global	Calc_LinCorrCoef
	.syntax unified
	.arm
	.fpu softvfp
	.type	Calc_LinCorrCoef, %function
Calc_LinCorrCoef:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L22
.L23:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	ldmib	fp, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	Square
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	ldmib	fp, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	Square
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L22:
	ldr	r3, [fp, #-16]
	cmp	r3, #99
	ble	.L23
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	sqrt
	mov	r4, r0
	mov	r5, r1
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	sqrt
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L24
	stm	r1, {r2-r3}
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	Coef
	.size	Calc_LinCorrCoef, .-Calc_LinCorrCoef
	.global	__aeabi_i2d
	.align	2
	.global	st_Initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	st_Initialize, %function
st_Initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #8
	str	r0, [fp, #-24]
	mov	r4, #0
	b	.L27
.L28:
	mov	r0, r4
	bl	__aeabi_i2d
	mov	r6, r0
	mov	r7, r1
	bl	st_RandomInteger
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, #0
	ldr	r3, .L29
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r3, r4
	lsl	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r5, r2, r3
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	stm	r5, {r2-r3}
	add	r4, r4, #1
.L27:
	cmp	r4, #99
	ble	.L28
	nop
	nop
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	1086299904
	.size	st_Initialize, .-st_Initialize
	.align	2
	.global	st_RandomInteger
	.syntax unified
	.arm
	.fpu softvfp
	.type	st_RandomInteger, %function
st_RandomInteger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L33
	ldr	r2, [r3]
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	add	r1, r3, #81
	ldr	r3, .L33+4
	smull	r2, r3, r1, r3
	asr	r2, r3, #9
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #6
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, .L33
	str	r2, [r3]
	ldr	r3, .L33
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	st_Seed
	.word	271652039
	.size	st_RandomInteger, .-st_RandomInteger
	.global	__aeabi_dcmpeq
	.align	2
	.global	beebs_st_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_st_verify_benchmark, %function
beebs_st_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	adr	r3, .L49
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-12]
	str	r3, [fp, #-8]
	adr	r3, .L49+8
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	adr	r3, .L49+16
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, .L49+24
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L46
	mov	r3, #0
	b	.L38
.L46:
	ldr	r3, .L49+28
	ldmia	r3, {r2-r3}
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L47
	mov	r3, #0
	b	.L38
.L47:
	ldr	r3, .L49+32
	ldmia	r3, {r2-r3}
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L48
	mov	r3, #0
	b	.L38
.L48:
	mov	r3, #1
.L38:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L50:
	.align	3
.L49:
	.word	-1578446906
	.word	1085507328
	.word	-700352914
	.word	1085506775
	.word	1717284165
	.word	1072693038
	.word	SumA
	.word	SumB
	.word	Coef
	.size	beebs_st_verify_benchmark, .-beebs_st_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
