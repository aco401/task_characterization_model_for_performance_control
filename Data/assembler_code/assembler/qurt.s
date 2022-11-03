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
	.file	"libqurt.c"
	.text
	.global	qurt_a
	.bss
	.align	2
	.type	qurt_a, %object
	.size	qurt_a, 4
qurt_a:
	.space	4
	.global	x1
	.align	2
	.type	x1, %object
	.size	x1, 8
x1:
	.space	8
	.global	x2
	.align	2
	.type	x2, %object
	.size	x2, 8
x2:
	.space	8
	.global	flag
	.align	2
	.type	flag, %object
	.size	flag, 4
flag:
	.space	4
	.global	__aeabi_fcmpge
	.text
	.align	2
	.global	qurt_fabs
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	qurt_fabs, %function
qurt_fabs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]	@ float
	mov	r1, #0
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-16]	@ float
	str	r3, [fp, #-8]	@ float
	b	.L4
.L7:
	ldr	r3, [fp, #-16]
	eor	r3, r3, #-2147483648
	str	r3, [fp, #-8]	@ float
.L4:
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	qurt_fabs, .-qurt_fabs
	.global	__aeabi_fdiv
	.global	__aeabi_fcmpeq
	.global	__aeabi_fmul
	.global	__aeabi_fsub
	.global	__aeabi_f2d
	.global	__aeabi_dadd
	.global	__aeabi_ddiv
	.global	__aeabi_d2f
	.global	__aeabi_fadd
	.align	2
	.global	qurt_sqrt
	.syntax unified
	.arm
	.fpu softvfp
	.type	qurt_sqrt, %function
qurt_sqrt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #32
	str	r0, [fp, #-40]	@ float
	ldr	r1, .L20
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r3, .L20+4
	str	r3, [fp, #-28]	@ float
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r1, #0
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L19
	mov	r3, #0
	str	r3, [fp, #-16]	@ float
	b	.L11
.L19:
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L12
.L15:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L13
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-40]	@ float
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
	str	r3, [fp, #-32]	@ float
	ldr	r1, [fp, #-32]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r1, [fp, #-16]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-36]	@ float
	ldr	r0, [fp, #-36]	@ float
	bl	qurt_fabs
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	mov	r3, #1
	str	r3, [fp, #-24]
.L13:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L12:
	ldr	r3, [fp, #-20]
	cmp	r3, #19
	ble	.L15
.L11:
	ldr	r3, [fp, #-16]	@ float
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	1092616192
	.word	925353388
	.size	qurt_sqrt, .-qurt_sqrt
	.global	__aeabi_fcmpgt
	.align	2
	.global	qurt
	.syntax unified
	.arm
	.fpu softvfp
	.type	qurt, %function
qurt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3]	@ float
	mov	r1, #0
	mov	r0, r3
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L33
	ldr	r3, .L36+4
	b	.L25
.L33:
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #4
	ldr	r2, [r3]	@ float
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #4
	ldr	r3, [r3]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3]	@ float
	ldr	r1, .L36+8
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #8
	ldr	r3, [r3]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r3, .L36
	ldr	r3, [r3]
	ldr	r3, [r3]	@ float
	mov	r1, r3
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	qurt_fabs
	mov	r3, r0
	mov	r0, r3
	bl	qurt_sqrt
	str	r0, [fp, #-24]	@ float
	mov	r1, #0
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L34
	ldr	r3, .L36+12
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #4
	ldr	r3, [r3]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-24]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-20]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L36+16
	str	r2, [r3]	@ float
	ldr	r3, .L36+16
	mov	r2, #0
	str	r2, [r3, #4]	@ float
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #4
	ldr	r3, [r3]	@ float
	eor	r3, r3, #-2147483648
	ldr	r1, [fp, #-24]	@ float
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-20]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L36+20
	str	r2, [r3]	@ float
	ldr	r3, .L36+20
	mov	r2, #0
	str	r2, [r3, #4]	@ float
	mov	r3, #0
	b	.L25
.L34:
	mov	r1, #0
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L35
	ldr	r3, .L36+12
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #4
	ldr	r3, [r3]	@ float
	eor	r3, r3, #-2147483648
	ldr	r1, [fp, #-20]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L36+16
	str	r2, [r3]	@ float
	ldr	r3, .L36+16
	mov	r2, #0
	str	r2, [r3, #4]	@ float
	ldr	r3, .L36+16
	ldr	r3, [r3]	@ float
	ldr	r2, .L36+20
	str	r3, [r2]	@ float
	ldr	r3, .L36+20
	mov	r2, #0
	str	r2, [r3, #4]	@ float
	mov	r3, #0
	b	.L25
.L35:
	ldr	r3, .L36+12
	mvn	r2, #0
	str	r2, [r3]
	ldr	r1, [fp, #-20]	@ float
	ldr	r0, [fp, #-24]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-24]	@ float
	ldr	r3, .L36
	ldr	r3, [r3]
	add	r3, r3, #4
	ldr	r3, [r3]	@ float
	eor	r3, r3, #-2147483648
	ldr	r1, [fp, #-20]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L36+16
	str	r2, [r3]	@ float
	ldr	r2, .L36+16
	ldr	r3, [fp, #-24]	@ float
	str	r3, [r2, #4]	@ float
	ldr	r3, .L36+16
	ldr	r3, [r3]	@ float
	ldr	r2, .L36+20
	str	r3, [r2]	@ float
	ldr	r3, [fp, #-24]
	eor	r3, r3, #-2147483648
	ldr	r2, .L36+20
	str	r3, [r2, #4]	@ float
	mov	r3, #0
.L25:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	qurt_a
	.word	999
	.word	1082130432
	.word	flag
	.word	x1
	.word	x2
	.size	qurt, .-qurt
	.global	qurt_result
	.bss
	.align	2
	.type	qurt_result, %object
	.size	qurt_result, 4
qurt_result:
	.space	4
	.data
	.align	2
	.type	in1, %object
	.size	in1, 12
in1:
	.word	1065353216
	.word	-1069547520
	.word	1073741824
	.align	2
	.type	in2, %object
	.size	in2, 12
in2:
	.word	1065353216
	.word	-1073741824
	.word	1065353216
	.align	2
	.type	in3, %object
	.size	in3, 12
in3:
	.word	1065353216
	.word	-1065353216
	.word	1090519040
	.text
	.align	2
	.global	beebs_qurt_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_qurt_verify_benchmark, %function
beebs_qurt_verify_benchmark:
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
	.size	beebs_qurt_verify_benchmark, .-beebs_qurt_verify_benchmark
	.align	2
	.global	beebs_qurt_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_qurt_initialise_benchmark, %function
beebs_qurt_initialise_benchmark:
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
	.size	beebs_qurt_initialise_benchmark, .-beebs_qurt_initialise_benchmark
	.align	2
	.global	beebs_qurt_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_qurt_benchmark, %function
beebs_qurt_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L43
	ldr	r2, .L43+4
	str	r2, [r3]
	bl	qurt
	mov	r3, r0
	ldr	r2, .L43+8
	str	r3, [r2]
	ldr	r3, .L43
	ldr	r2, .L43+12
	str	r2, [r3]
	bl	qurt
	mov	r3, r0
	ldr	r2, .L43+8
	str	r3, [r2]
	ldr	r3, .L43
	ldr	r2, .L43+16
	str	r2, [r3]
	bl	qurt
	mov	r3, r0
	ldr	r2, .L43+8
	str	r3, [r2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	qurt_a
	.word	in1
	.word	qurt_result
	.word	in2
	.word	in3
	.size	beebs_qurt_benchmark, .-beebs_qurt_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
