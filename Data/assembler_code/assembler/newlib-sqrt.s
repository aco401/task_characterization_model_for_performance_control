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
	.file	"ef_sqrt.c"
	.text
	.section	.rodata
	.align	2
	.type	one, %object
	.size	one, 4
one:
	.word	1065353216
	.align	2
	.type	tiny, %object
	.size	tiny, 4
tiny:
	.word	228737632
	.global	__aeabi_fmul
	.global	__aeabi_fadd
	.global	__aeabi_fsub
	.global	__aeabi_fdiv
	.global	__aeabi_fcmpge
	.global	__aeabi_fcmpgt
	.text
	.align	2
	.global	__ieee754_sqrtf
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	__ieee754_sqrtf, %function
__ieee754_sqrtf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #60
	str	r0, [fp, #-64]	@ float
	ldr	r3, [fp, #-64]	@ float
	str	r3, [fp, #-52]	@ float
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	bic	r3, r3, #-2147483648
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r2, .L21
	cmp	r3, r2
	bls	.L2
	ldr	r1, [fp, #-64]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	ldr	r1, [fp, #-64]	@ float
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	b	.L17
.L2:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L4
	ldr	r3, [fp, #-64]	@ float
	b	.L17
.L4:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L5
	ldr	r1, [fp, #-64]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-64]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fdiv
	mov	r3, r0
	b	.L17
.L5:
	ldr	r3, [fp, #-20]
	asr	r3, r3, #23
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	cmp	r3, #8388608
	bcs	.L6
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L7
.L8:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L7:
	ldr	r3, [fp, #-20]
	and	r3, r3, #8388608
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	ldr	r2, [fp, #-32]
	sub	r3, r2, r3
	str	r3, [fp, #-32]
.L6:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #127
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	bic	r3, r3, #-16777216
	bic	r3, r3, #8388608
	orr	r3, r3, #8388608
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L9
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
.L9:
	ldr	r3, [fp, #-32]
	asr	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, #16777216
	str	r3, [fp, #-16]
	b	.L10
.L12:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L11
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-48]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-28]
.L11:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #1
	str	r3, [fp, #-16]
.L10:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L12
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L13
	mov	r3, #1065353216
	ldr	r2, .L21+4
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-44]	@ float
	mov	r3, #1065353216
	mov	r1, r3
	ldr	r0, [fp, #-44]	@ float
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	mov	r3, #1065353216
	ldr	r2, .L21+4
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-44]	@ float
	mov	r3, #1065353216
	mov	r1, r3
	ldr	r0, [fp, #-44]	@ float
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	b	.L13
.L20:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	bic	r3, r3, #1
	str	r3, [fp, #-28]
.L13:
	ldr	r3, [fp, #-28]
	asr	r3, r3, #1
	add	r3, r3, #1056964608
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #23
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]	@ float
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-44]	@ float
.L17:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	2139095039
	.word	228737632
	.size	__ieee754_sqrtf, .-__ieee754_sqrtf
	.global	newlib_sqrt_result
	.bss
	.align	2
	.type	newlib_sqrt_result, %object
	.size	newlib_sqrt_result, 24
newlib_sqrt_result:
	.space	24
	.align	2
a:
	.space	4
	.size	a, 4
	.align	2
b:
	.space	4
	.size	b, 4
	.align	2
c:
	.space	4
	.size	c, 4
	.align	2
d:
	.space	4
	.size	d, 4
	.align	2
e:
	.space	4
	.size	e, 4
	.align	2
f:
	.space	4
	.size	f, 4
	.global	__aeabi_i2f
	.text
	.align	2
	.global	beebs_newlib_sqrt_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_sqrt_benchmark, %function
beebs_newlib_sqrt_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L25
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__ieee754_sqrtf
	mov	r3, r0
	ldr	r2, .L25+4
	str	r3, [r2]	@ float
	ldr	r3, .L25+8
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__ieee754_sqrtf
	mov	r3, r0
	ldr	r2, .L25+4
	str	r3, [r2, #4]	@ float
	ldr	r3, .L25+12
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__ieee754_sqrtf
	mov	r3, r0
	ldr	r2, .L25+4
	str	r3, [r2, #8]	@ float
	ldr	r3, .L25+16
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__ieee754_sqrtf
	mov	r3, r0
	ldr	r2, .L25+4
	str	r3, [r2, #12]	@ float
	ldr	r3, .L25+20
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__ieee754_sqrtf
	mov	r3, r0
	ldr	r2, .L25+4
	str	r3, [r2, #16]	@ float
	ldr	r3, .L25+24
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	mov	r0, r3
	bl	__ieee754_sqrtf
	mov	r3, r0
	ldr	r2, .L25+4
	str	r3, [r2, #20]	@ float
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	a
	.word	newlib_sqrt_result
	.word	b
	.word	c
	.word	d
	.word	e
	.word	f
	.size	beebs_newlib_sqrt_benchmark, .-beebs_newlib_sqrt_benchmark
	.align	2
	.global	beebs_newlib_sqrt_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_sqrt_initialise_benchmark, %function
beebs_newlib_sqrt_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L28
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L28+4
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L28+8
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, .L28+12
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, .L28+16
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, .L28+20
	mov	r2, #8
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	a
	.word	b
	.word	c
	.word	d
	.word	e
	.word	f
	.size	beebs_newlib_sqrt_initialise_benchmark, .-beebs_newlib_sqrt_initialise_benchmark
	.global	__aeabi_fcmpeq
	.section	.rodata
	.align	2
.LC0:
	.word	1068827891
	.word	1071494103
	.word	1074731965
	.word	1075627121
	.word	1076450301
	.word	1077216499
	.text
	.align	2
	.global	beebs_newlib_sqrt_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_sqrt_verify_benchmark, %function
beebs_newlib_sqrt_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	ldr	r3, .L39
	sub	ip, fp, #32
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L31
.L35:
	ldr	r2, .L39+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-28]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L38
	mov	r3, #0
	b	.L36
.L38:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L31:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L35
	mov	r3, #1
.L36:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	.LC0
	.word	newlib_sqrt_result
	.size	beebs_newlib_sqrt_verify_benchmark, .-beebs_newlib_sqrt_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
