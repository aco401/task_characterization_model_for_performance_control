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
	.file	"libsqrt.c"
	.text
	.global	__aeabi_fcmplt
	.align	2
	.global	fabs_float
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fabs_float, %function
fabs_float:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]	@ float
	mov	r1, #0
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-8]
	eor	r3, r3, #-2147483648
	b	.L4
.L6:
	ldr	r3, [fp, #-8]	@ float
.L4:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	fabs_float, .-fabs_float
	.global	__aeabi_fdiv
	.global	__aeabi_fcmpeq
	.global	__aeabi_fmul
	.global	__aeabi_fsub
	.global	__aeabi_f2d
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_d2f
	.global	__aeabi_fadd
	.global	__aeabi_dcmpge
	.align	2
	.global	sqrtfcn
	.syntax unified
	.arm
	.fpu softvfp
	.type	sqrtfcn, %function
sqrtfcn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #48
	str	r0, [fp, #-56]	@ float
	ldr	r1, .L19+8
	ldr	r0, [fp, #-56]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	adr	r3, .L19
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r1, #0
	ldr	r0, [fp, #-56]	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L18
	mov	r3, #0
	str	r3, [fp, #-16]	@ float
	b	.L10
.L18:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L11
.L14:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L12
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-56]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2f
	mov	r3, r0
	str	r3, [fp, #-40]	@ float
	ldr	r1, [fp, #-40]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-56]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_d2f
	mov	r3, r0
	mov	r0, r3
	bl	fabs_float
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2d
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
	mov	r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L11:
	ldr	r3, [fp, #-20]
	cmp	r3, #19
	ble	.L14
.L10:
	ldr	r3, [fp, #-16]	@ float
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L20:
	.align	3
.L19:
	.word	-1998362383
	.word	1055193269
	.word	1092616192
	.size	sqrtfcn, .-sqrtfcn
	.align	2
	.global	beebs_sqrt_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sqrt_initialise_benchmark, %function
beebs_sqrt_initialise_benchmark:
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
	.size	beebs_sqrt_initialise_benchmark, .-beebs_sqrt_initialise_benchmark
	.global	__aeabi_f2iz
	.align	2
	.global	beebs_sqrt_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sqrt_benchmark, %function
beebs_sqrt_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]	@ float
	mov	r3, #0
	str	r3, [fp, #-12]	@ float
	mov	r3, #0
	str	r3, [fp, #-8]	@ float
	b	.L23
.L24:
	ldr	r0, [fp, #-8]	@ float
	bl	sqrtfcn
	mov	r2, r0
	ldr	r3, [fp, #-12]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-12]	@ float
	ldr	r1, .L26
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-8]	@ float
.L23:
	ldr	r1, .L26+4
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L24
	ldr	r3, [fp, #-12]	@ float
	ldr	r1, .L26+8
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	1120403456
	.word	1176256512
	.word	1203982336
	.size	beebs_sqrt_benchmark, .-beebs_sqrt_benchmark
	.align	2
	.global	beebs_sqrt_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sqrt_verify_benchmark, %function
beebs_sqrt_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L31
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L29
	mov	r3, #0
	b	.L30
.L29:
	mov	r3, #1
.L30:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
	.word	661462912
	.size	beebs_sqrt_verify_benchmark, .-beebs_sqrt_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
