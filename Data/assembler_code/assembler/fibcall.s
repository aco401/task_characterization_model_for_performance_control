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
	.file	"libfibcall.c"
	.text
	.align	2
	.global	fib
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fib, %function
fib:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L2
.L4:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #30
	bgt	.L3
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	ble	.L4
.L3:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	fib, .-fib
	.align	2
	.global	beebs_fibcall_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fibcall_initialise_benchmark, %function
beebs_fibcall_initialise_benchmark:
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
	.size	beebs_fibcall_initialise_benchmark, .-beebs_fibcall_initialise_benchmark
	.align	2
	.global	beebs_fibcall_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fibcall_benchmark, %function
beebs_fibcall_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #30
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	fib
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_fibcall_benchmark, .-beebs_fibcall_benchmark
	.align	2
	.global	beebs_fibcall_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fibcall_verify_benchmark, %function
beebs_fibcall_verify_benchmark:
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
	.word	832040
	.size	beebs_fibcall_verify_benchmark, .-beebs_fibcall_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
