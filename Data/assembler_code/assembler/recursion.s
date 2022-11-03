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
	.file	"librecursion.c"
	.text
	.align	2
	.global	recursion_fib
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	recursion_fib, %function
recursion_fib:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	b	.L3
.L2:
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	bne	.L4
	mov	r3, #1
	b	.L3
.L4:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r0, r3
	bl	recursion_fib
	mov	r4, r0
	ldr	r3, [fp, #-16]
	sub	r3, r3, #2
	mov	r0, r3
	bl	recursion_fib
	mov	r3, r0
	add	r3, r4, r3
.L3:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	recursion_fib, .-recursion_fib
	.align	2
	.global	kalle
	.syntax unified
	.arm
	.fpu softvfp
	.type	kalle, %function
kalle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L6
	mov	r3, #0
	b	.L7
.L6:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	mov	r0, r3
	bl	anka
	mov	r3, r0
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	kalle, .-kalle
	.align	2
	.global	anka
	.syntax unified
	.arm
	.fpu softvfp
	.type	anka, %function
anka:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L9
	mov	r3, #1
	b	.L10
.L9:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	mov	r0, r3
	bl	kalle
	mov	r3, r0
.L10:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	anka, .-anka
	.global	In
	.bss
	.align	2
	.type	In, %object
	.size	In, 4
In:
	.space	4
	.align	2
n:
	.space	4
	.size	n, 4
	.text
	.align	2
	.global	beebs_recursion_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_recursion_benchmark, %function
beebs_recursion_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L13
	ldr	r3, [r3]
	mov	r0, r3
	bl	recursion_fib
	mov	r3, r0
	ldr	r2, .L13+4
	str	r3, [r2]
	ldr	r3, .L13+4
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	n
	.word	In
	.size	beebs_recursion_benchmark, .-beebs_recursion_benchmark
	.align	2
	.global	beebs_recursion_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_recursion_initialise_benchmark, %function
beebs_recursion_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L16
	mov	r2, #10
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	n
	.size	beebs_recursion_initialise_benchmark, .-beebs_recursion_initialise_benchmark
	.align	2
	.global	beebs_recursion_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_recursion_verify_benchmark, %function
beebs_recursion_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #89
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L19
	mov	r3, #0
	b	.L20
.L19:
	mov	r3, #1
.L20:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_recursion_verify_benchmark, .-beebs_recursion_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
