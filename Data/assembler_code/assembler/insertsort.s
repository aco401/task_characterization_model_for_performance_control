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
	.file	"libinsertsort.c"
	.text
	.global	a
	.bss
	.align	2
	.type	a, %object
	.size	a, 44
a:
	.space	44
	.text
	.align	2
	.global	beebs_insertsort_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_insertsort_benchmark, %function
beebs_insertsort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L2
.L5:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	b	.L3
.L4:
	ldr	r2, .L7
	ldr	r3, [fp, #-12]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r2, .L7
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L7
	ldr	r3, [fp, #-12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r2, [fp, #-16]
	ldr	r1, .L7
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r2, .L7
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r1, .L7
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bcc	.L4
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L5
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	a
	.size	beebs_insertsort_benchmark, .-beebs_insertsort_benchmark
	.align	2
	.global	beebs_insertsort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_insertsort_initialise_benchmark, %function
beebs_insertsort_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L10
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L10
	mov	r2, #11
	str	r2, [r3, #4]
	ldr	r3, .L10
	mov	r2, #10
	str	r2, [r3, #8]
	ldr	r3, .L10
	mov	r2, #9
	str	r2, [r3, #12]
	ldr	r3, .L10
	mov	r2, #8
	str	r2, [r3, #16]
	ldr	r3, .L10
	mov	r2, #7
	str	r2, [r3, #20]
	ldr	r3, .L10
	mov	r2, #6
	str	r2, [r3, #24]
	ldr	r3, .L10
	mov	r2, #5
	str	r2, [r3, #28]
	ldr	r3, .L10
	mov	r2, #4
	str	r2, [r3, #32]
	ldr	r3, .L10
	mov	r2, #3
	str	r2, [r3, #36]
	ldr	r3, .L10
	mov	r2, #2
	str	r2, [r3, #40]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L11:
	.align	2
.L10:
	.word	a
	.size	beebs_insertsort_initialise_benchmark, .-beebs_insertsort_initialise_benchmark
	.section	.rodata
	.align	2
.LC0:
	.word	0
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.text
	.align	2
	.global	beebs_insertsort_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_insertsort_verify_benchmark, %function
beebs_insertsort_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #56
	str	r0, [fp, #-56]
	ldr	r3, .L18
	sub	ip, fp, #52
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L16:
	ldr	r2, .L18+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-48]
	cmp	r2, r3
	beq	.L14
	mov	r3, #0
	b	.L17
.L14:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	ble	.L16
	mov	r3, #1
.L17:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LC0
	.word	a
	.size	beebs_insertsort_verify_benchmark, .-beebs_insertsort_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
