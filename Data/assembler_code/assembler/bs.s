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
	.file	"libbs.c"
	.text
	.global	data
	.data
	.align	2
	.type	data, %object
	.size	data, 120
data:
	.word	1
	.word	100
	.word	5
	.word	200
	.word	6
	.word	300
	.word	7
	.word	700
	.word	8
	.word	900
	.word	9
	.word	250
	.word	10
	.word	400
	.word	11
	.word	600
	.word	12
	.word	800
	.word	13
	.word	1500
	.word	14
	.word	1200
	.word	15
	.word	110
	.word	16
	.word	140
	.word	17
	.word	133
	.word	18
	.word	10
	.text
	.align	2
	.global	binary_search
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	binary_search, %function
binary_search:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #14
	str	r3, [fp, #-12]
	mvn	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, .L7
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #3]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bne	.L3
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, .L7
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r2, .L7
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #3]
	ldr	r2, [fp, #-24]
	cmp	r2, r3
	bge	.L4
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L4:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L5
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	data
	.size	binary_search, .-binary_search
	.align	2
	.global	beebs_bs_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_bs_verify_benchmark, %function
beebs_bs_verify_benchmark:
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
	.size	beebs_bs_verify_benchmark, .-beebs_bs_verify_benchmark
	.align	2
	.global	beebs_bs_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_bs_initialise_benchmark, %function
beebs_bs_initialise_benchmark:
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
	.size	beebs_bs_initialise_benchmark, .-beebs_bs_initialise_benchmark
	.align	2
	.global	beebs_bs_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_bs_benchmark, %function
beebs_bs_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #8
	bl	binary_search
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_bs_benchmark, .-beebs_bs_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
