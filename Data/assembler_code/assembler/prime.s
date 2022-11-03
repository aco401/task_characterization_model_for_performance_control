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
	.file	"libprime.c"
	.text
	.global	__aeabi_uidivmod
	.align	2
	.global	divides
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	divides, %function
divides:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	divides, .-divides
	.align	2
	.global	even
	.syntax unified
	.arm
	.fpu softvfp
	.type	even, %function
even:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r1, [fp, #-8]
	mov	r0, #2
	bl	divides
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	even, .-even
	.align	2
	.global	prime
	.syntax unified
	.arm
	.fpu softvfp
	.type	prime, %function
prime:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	even
	mov	r3, r0
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	b	.L7
.L6:
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L8
.L10:
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	bl	divides
	mov	r3, r0
	cmp	r3, #0
	beq	.L9
	mov	r3, #0
	b	.L7
.L9:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	mov	r2, r3
	mul	r2, r3, r2
	mov	r3, r2
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bcs	.L10
	ldr	r3, [fp, #-16]
	cmp	r3, #1
	movhi	r3, #1
	movls	r3, #0
	and	r3, r3, #255
.L7:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	prime, .-prime
	.align	2
	.global	swap
	.syntax unified
	.arm
	.fpu softvfp
	.type	swap, %function
swap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	swap, .-swap
	.global	prime_result
	.bss
	.align	2
	.type	prime_result, %object
	.size	prime_result, 4
prime_result:
	.space	4
	.global	prime_x
	.align	2
	.type	prime_x, %object
	.size	prime_x, 4
prime_x:
	.space	4
	.global	y
	.align	2
	.type	y, %object
	.size	y, 4
y:
	.space	4
	.text
	.align	2
	.global	beebs_prime_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_prime_benchmark, %function
beebs_prime_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r1, .L17
	ldr	r0, .L17+4
	bl	swap
	ldr	r3, .L17+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	prime
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	ldr	r3, .L17
	ldr	r3, [r3]
	mov	r0, r3
	bl	prime
	mov	r3, r0
	cmp	r3, #0
	bne	.L14
.L13:
	mov	r3, #1
	b	.L15
.L14:
	mov	r3, #0
.L15:
	ldr	r2, .L17+8
	str	r3, [r2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	y
	.word	prime_x
	.word	prime_result
	.size	beebs_prime_benchmark, .-beebs_prime_benchmark
	.align	2
	.global	beebs_prime_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_prime_initialise_benchmark, %function
beebs_prime_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L20
	ldr	r2, .L20+4
	str	r2, [r3]
	ldr	r3, .L20+8
	ldr	r2, .L20+12
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	prime_x
	.word	21649
	.word	y
	.word	513239
	.size	beebs_prime_initialise_benchmark, .-beebs_prime_initialise_benchmark
	.align	2
	.global	beebs_prime_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_prime_verify_benchmark, %function
beebs_prime_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, .L25
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	beq	.L23
	mov	r3, #0
	b	.L24
.L23:
	mov	r3, #1
.L24:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L26:
	.align	2
.L25:
	.word	prime_result
	.size	beebs_prime_verify_benchmark, .-beebs_prime_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
