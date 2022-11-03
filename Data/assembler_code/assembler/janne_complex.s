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
	.file	"libjanne_complex.c"
	.text
	.align	2
	.global	complex
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	complex, %function
complex:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	b	.L2
.L7:
	ldr	r3, [fp, #-12]
	cmp	r3, #5
	ble	.L4
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	str	r3, [fp, #-12]
	b	.L5
.L4:
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
.L5:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	ble	.L6
	ldr	r3, [fp, #-12]
	cmp	r3, #12
	bgt	.L6
	ldr	r3, [fp, #-8]
	add	r3, r3, #10
	str	r3, [fp, #-8]
	b	.L3
.L6:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L3:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L7
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #10
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #29
	ble	.L3
	mov	r3, #1
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	complex, .-complex
	.bss
	.align	2
a:
	.space	4
	.size	a, 4
	.align	2
b:
	.space	4
	.size	b, 4
	.text
	.align	2
	.global	beebs_janne_complex_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_janne_complex_benchmark, %function
beebs_janne_complex_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, .L12
	ldr	r3, [r3]
	ldr	r2, .L12+4
	ldr	r2, [r2]
	mov	r1, r2
	mov	r0, r3
	bl	complex
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	a
	.word	b
	.size	beebs_janne_complex_benchmark, .-beebs_janne_complex_benchmark
	.align	2
	.global	beebs_janne_complex_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_janne_complex_initialise_benchmark, %function
beebs_janne_complex_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L15
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L15+4
	mov	r2, #1
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	a
	.word	b
	.size	beebs_janne_complex_initialise_benchmark, .-beebs_janne_complex_initialise_benchmark
	.align	2
	.global	beebs_janne_complex_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_janne_complex_verify_benchmark, %function
beebs_janne_complex_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #1
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L18
	mov	r3, #0
	b	.L19
.L18:
	mov	r3, #1
.L19:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_janne_complex_verify_benchmark, .-beebs_janne_complex_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
