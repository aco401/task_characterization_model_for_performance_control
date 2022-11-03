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
	.file	"basicmath_small.c"
	.text
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.global	__aeabi_dsub
	.global	__aeabi_dadd
	.global	__aeabi_dcmple
	.global	__aeabi_dcmplt
	.align	2
	.global	SolveCubic
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	SolveCubic, %function
SolveCubic:
	@ Function supports interworking.
	@ args = 24, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #72
	str	r0, [fp, #-84]
	str	r1, [fp, #-80]
	str	r2, [fp, #-92]
	str	r3, [fp, #-88]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	sub	r1, fp, #92
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	ldmib	fp, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	add	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	ldr	r3, .L13+24
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L13+28
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	ldr	r3, .L13+28
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	ldr	r3, .L13+32
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L13+36
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r2, #0
	mov	r3, #0
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #20]
	mov	r2, #3
	str	r2, [r3]
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	acos
	str	r0, [fp, #-76]
	str	r1, [fp, #-72]
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	sqrt
	mov	r2, #0
	mov	r3, #-1073741824
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	ldr	r3, .L13+24
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	mov	r2, #0
	ldr	r3, .L13+24
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #24]
	stm	r1, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	sqrt
	mov	r2, #0
	mov	r3, #-1073741824
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	adr	r3, .L13
	ldmia	r3, {r2-r3}
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L13+24
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	ldr	r3, .L13+24
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #24]
	add	r4, r3, #8
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	sqrt
	mov	r2, #0
	mov	r3, #-1073741824
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	adr	r3, .L13+8
	ldmia	r3, {r2-r3}
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L13+24
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	ldr	r3, .L13+24
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #24]
	add	r4, r3, #16
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	b	.L12
.L10:
	ldr	r3, [fp, #20]
	mov	r2, #1
	str	r2, [r3]
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	sqrt
	ldr	r4, [fp, #-60]
	ldr	r3, [fp, #-56]
	bic	r5, r3, #-2147483648
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adr	r3, .L13+16
	ldmia	r3, {r2-r3}
	bl	pow
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #24]
	stm	r1, {r2-r3}
	ldr	r3, [fp, #24]
	ldmia	r3, {r4-r5}
	ldr	r3, [fp, #24]
	ldmia	r3, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #24]
	stm	r1, {r2-r3}
	ldr	r3, [fp, #24]
	ldmia	r3, {r4-r5}
	mov	r2, #0
	mov	r3, #0
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L11
	mov	r0, #0
	ldr	r1, .L13+40
	b	.L7
.L11:
	mov	r0, #0
	ldr	r1, .L13+44
.L7:
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #24]
	stm	r1, {r2-r3}
	ldr	r3, [fp, #24]
	ldmia	r3, {r4-r5}
	mov	r2, #0
	ldr	r3, .L13+24
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #24]
	stm	r1, {r2-r3}
.L12:
	nop
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
.L14:
	.align	3
.L13:
	.word	1413754136
	.word	1075388923
	.word	1413754136
	.word	1076437499
	.word	1431655765
	.word	1070945621
	.word	1074266112
	.word	1075970048
	.word	1077608448
	.word	1078657024
	.word	1072693248
	.word	-1074790400
	.size	SolveCubic, .-SolveCubic
	.align	2
	.global	beebs_cubic_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_cubic_verify_benchmark, %function
beebs_cubic_verify_benchmark:
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
	.size	beebs_cubic_verify_benchmark, .-beebs_cubic_verify_benchmark
	.align	2
	.global	beebs_cubic_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_cubic_initialise_benchmark, %function
beebs_cubic_initialise_benchmark:
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
	.size	beebs_cubic_initialise_benchmark, .-beebs_cubic_initialise_benchmark
	.global	__aeabi_dcmpgt
	.align	2
	.global	beebs_cubic_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_cubic_benchmark, %function
beebs_cubic_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 520
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #544
	mov	r2, #0
	ldr	r3, .L28+8
	str	r2, [fp, #-12]
	str	r3, [fp, #-8]
	mov	r2, #0
	ldr	r3, .L28+12
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	mov	r2, #0
	ldr	r3, .L28+16
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r2, #0
	ldr	r3, .L28+20
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r2, #0
	ldr	r3, .L28+8
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r2, #0
	ldr	r3, .L28+24
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	mov	r2, #0
	ldr	r3, .L28+28
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r2, #0
	ldr	r3, .L28+20
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r2, #0
	ldr	r3, .L28+8
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	mov	r2, #0
	ldr	r3, .L28+32
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	mov	r2, #0
	ldr	r3, .L28+36
	str	r2, [fp, #-92]
	str	r3, [fp, #-88]
	mov	r2, #0
	ldr	r3, .L28+40
	str	r2, [fp, #-100]
	str	r3, [fp, #-96]
	mov	r2, #0
	ldr	r3, .L28+8
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
	adr	r3, .L28
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	mov	r2, #0
	ldr	r3, .L28+8
	str	r2, [fp, #-124]
	str	r3, [fp, #-120]
	mov	r2, #0
	ldr	r3, .L28+44
	str	r2, [fp, #-132]
	str	r3, [fp, #-128]
	sub	r3, fp, #524
	mov	r2, #384
	mov	r1, #0
	mov	r0, r3
	bl	memset
	sub	r3, fp, #524
	str	r3, [fp, #-136]
	sub	r3, fp, #524
	str	r3, [sp, #20]
	sub	r3, fp, #140
	str	r3, [sp, #16]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	SolveCubic
	sub	r3, fp, #524
	str	r3, [sp, #20]
	sub	r3, fp, #140
	str	r3, [sp, #16]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	SolveCubic
	sub	r3, fp, #524
	str	r3, [sp, #20]
	sub	r3, fp, #140
	str	r3, [sp, #16]
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	SolveCubic
	sub	r3, fp, #524
	str	r3, [sp, #20]
	sub	r3, fp, #140
	str	r3, [sp, #16]
	sub	r3, fp, #132
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #116
	ldmia	r3, {r2-r3}
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	SolveCubic
	mov	r2, #0
	ldr	r3, .L28+8
	str	r2, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L19
.L26:
	mov	r2, #0
	ldr	r3, .L28+48
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L20
.L25:
	mov	r2, #0
	ldr	r3, .L28+52
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	b	.L21
.L24:
	mov	r2, #0
	ldr	r3, .L28+56
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	b	.L22
.L23:
	ldr	r3, [fp, #-136]
	str	r3, [sp, #20]
	sub	r3, fp, #140
	str	r3, [sp, #16]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	SolveCubic
	mov	r2, #0
	ldr	r3, .L28+8
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
.L22:
	mov	r2, #0
	ldr	r3, .L28+60
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L23
	mov	r2, #0
	ldr	r3, .L28+64
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
.L21:
	mov	r2, #0
	ldr	r3, .L28+68
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L24
	mov	r2, #0
	ldr	r3, .L28+8
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
.L20:
	mov	r2, #0
	ldr	r3, .L28+72
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L25
	mov	r2, #0
	ldr	r3, .L28+8
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-12]
	str	r3, [fp, #-8]
.L19:
	mov	r2, #0
	ldr	r3, .L28+76
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L26
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L29:
	.align	3
.L28:
	.word	1717986918
	.word	-1070897562
	.word	1072693248
	.word	-1071316992
	.word	1077936128
	.word	-1069678592
	.word	-1072562176
	.word	1076953088
	.word	-1072955392
	.word	1077280768
	.word	-1069613056
	.word	-1069449216
	.word	1076101120
	.word	1075052544
	.word	-1074790400
	.word	-1073217536
	.word	1071644672
	.word	1075314688
	.word	1075838976
	.word	1074266112
	.size	beebs_cubic_benchmark, .-beebs_cubic_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
