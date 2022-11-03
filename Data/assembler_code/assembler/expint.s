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
	.file	"libexpint.c"
	.text
	.align	2
	.global	foo
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	foo, %function
foo:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mul	r2, r3, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #4
	lsl	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	foo, .-foo
	.global	__aeabi_idiv
	.align	2
	.global	expint
	.syntax unified
	.arm
	.fpu softvfp
	.type	expint, %function
expint:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	ldr	r3, [fp, #-56]
	sub	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	ble	.L4
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, .L18
	str	r3, [fp, #-20]
	ldr	r3, .L18+4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L5
.L8:
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-8]
	add	r2, r1, r2
	mul	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-24]
	mul	r2, r3, r2
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-52]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-28]
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldr	r2, .L18+8
	cmp	r3, r2
	bgt	.L6
	ldr	r3, [fp, #-60]
	rsb	r2, r3, #0
	ldr	r3, [fp, #-36]
	mul	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	b	.L7
.L6:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #100
	ble	.L8
	b	.L9
.L4:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L10
	mov	r3, #2
	b	.L11
.L10:
	mov	r3, #1000
.L11:
	str	r3, [fp, #-44]
	mov	r3, #1
	str	r3, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L12
.L17:
	ldr	r3, [fp, #-60]
	rsb	r3, r3, #0
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-32]
	mul	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	beq	.L13
	ldr	r3, [fp, #-32]
	rsb	r0, r3, #0
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-48]
	sub	r3, r2, r3
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	str	r3, [fp, #-28]
	b	.L14
.L13:
	mov	r3, #255
	str	r3, [fp, #-40]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L15
.L16:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L16
	ldr	r0, [fp, #-60]
	bl	foo
	mov	r2, r0
	ldr	r3, [fp, #-32]
	mul	r3, r2, r3
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-28]
.L14:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r3, [fp, #-8]
	cmp	r3, #100
	ble	.L17
.L9:
	ldr	r3, [fp, #-44]
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	2000000
	.word	30000000
	.word	9999
	.size	expint, .-expint
	.global	benchmark_result
	.bss
	.align	2
	.type	benchmark_result, %object
	.size	benchmark_result, 4
benchmark_result:
	.space	4
	.align	2
n:
	.space	4
	.size	n, 4
	.align	2
x:
	.space	4
	.size	x, 4
	.text
	.align	2
	.global	beebs_expint_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_expint_benchmark, %function
beebs_expint_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L22
	ldr	r3, [r3]
	ldr	r2, .L22+4
	ldr	r2, [r2]
	mov	r1, r2
	mov	r0, r3
	bl	expint
	mov	r3, r0
	ldr	r2, .L22+8
	str	r3, [r2]
	ldr	r3, .L22+8
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	n
	.word	x
	.word	benchmark_result
	.size	beebs_expint_benchmark, .-beebs_expint_benchmark
	.align	2
	.global	beebs_expint_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_expint_initialise_benchmark, %function
beebs_expint_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L25
	mov	r2, #50
	str	r2, [r3]
	ldr	r3, .L25+4
	mov	r2, #1
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L26:
	.align	2
.L25:
	.word	n
	.word	x
	.size	beebs_expint_initialise_benchmark, .-beebs_expint_initialise_benchmark
	.align	2
	.global	beebs_expint_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_expint_verify_benchmark, %function
beebs_expint_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L30
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L28
	mov	r3, #0
	b	.L29
.L28:
	mov	r3, #1
.L29:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	3883
	.size	beebs_expint_verify_benchmark, .-beebs_expint_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
