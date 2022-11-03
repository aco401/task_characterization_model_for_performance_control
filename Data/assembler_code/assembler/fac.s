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
	.file	"libfac.c"
	.text
	.align	2
	.global	fac
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fac, %function
fac:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	b	.L3
.L2:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	mov	r0, r3
	bl	fac
	mov	r2, r0
	ldr	r3, [fp, #-8]
	mul	r3, r2, r3
.L3:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	fac, .-fac
	.align	2
	.global	beebs_fac_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fac_initialise_benchmark, %function
beebs_fac_initialise_benchmark:
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
	.size	beebs_fac_initialise_benchmark, .-beebs_fac_initialise_benchmark
	.align	2
	.global	beebs_fac_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fac_benchmark, %function
beebs_fac_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #10
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r0, [fp, #-8]
	bl	fac
	mov	r2, r0
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	ble	.L7
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_fac_benchmark, .-beebs_fac_benchmark
	.align	2
	.global	beebs_fac_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fac_verify_benchmark, %function
beebs_fac_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L12
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L10
	mov	r3, #0
	b	.L11
.L10:
	mov	r3, #1
.L11:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L13:
	.align	2
.L12:
	.word	4037914
	.size	beebs_fac_verify_benchmark, .-beebs_fac_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
