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
	.file	"compress_test.c"
	.text
	.align	2
	.global	compress1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	compress1, %function
compress1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-12]
	b	.L2
.L5:
	ldr	r3, [fp, #-20]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L3
	ldr	r3, [fp, #-16]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L4
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	orr	r3, r2, r3
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	str	r3, [fp, #-12]
.L3:
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	compress1, .-compress1
	.align	2
	.global	compress2
	.syntax unified
	.arm
	.fpu softvfp
	.type	compress2, %function
compress2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
.L8:
	ldr	r3, [fp, #-28]
	and	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r2, r3
	ldr	r2, [fp, #-8]
	orr	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	lsr	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L8
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	compress2, .-compress2
	.align	2
	.global	compress3
	.syntax unified
	.arm
	.fpu softvfp
	.type	compress3, %function
compress3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	ldr	r3, [fp, #-52]
	mvn	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L11
.L12:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-8]
	eor	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	eor	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-8]
	eor	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #8
	ldr	r2, [fp, #-8]
	eor	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #16
	ldr	r2, [fp, #-8]
	eor	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #1
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-36]
	ldr	r3, [fp, #-8]
	mvn	r3, r3
	ldr	r2, [fp, #-20]
	and	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-36]
	ldr	r2, [fp, #-12]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-16]
	lsl	r3, r1, r3
	ldr	r1, [fp, #-20]
	lsr	r3, r1, r3
	eor	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L11:
	ldr	r3, [fp, #-16]
	cmp	r3, #4
	ble	.L12
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	and	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-48]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #1
	eor	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-48]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #2
	eor	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-48]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #4
	eor	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-48]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #8
	eor	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-48]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	lsr	r3, r3, #16
	eor	r3, r3, r2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	compress3, .-compress3
	.align	2
	.global	compress4
	.syntax unified
	.arm
	.fpu softvfp
	.type	compress4, %function
compress4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	and	r3, r3, r2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	mvn	r3, r3
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L15
.L16:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-8]
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-16]
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #8
	ldr	r2, [fp, #-16]
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #16
	ldr	r2, [fp, #-16]
	eor	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	and	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-12]
	lsl	r3, r1, r3
	ldr	r1, [fp, #-20]
	lsr	r3, r1, r3
	orr	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	and	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	mov	r1, #1
	ldr	r3, [fp, #-12]
	lsl	r3, r1, r3
	ldr	r1, [fp, #-24]
	lsr	r3, r1, r3
	orr	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	mvn	r3, r3
	ldr	r2, [fp, #-8]
	and	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	ble	.L16
	ldr	r3, [fp, #-32]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	compress4, .-compress4
	.global	test
	.section	.rodata
	.align	2
	.type	test, %object
	.size	test, 216
test:
	.word	-1
	.word	-2147483648
	.word	1
	.word	-1
	.word	1050698
	.word	31
	.word	-1
	.word	1431655765
	.word	65535
	.word	-1
	.word	-1998581931
	.word	8191
	.word	19088743
	.word	65535
	.word	17767
	.word	19088743
	.word	-65536
	.word	291
	.word	-1
	.word	-1
	.word	-1
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-1
	.word	0
	.word	-1
	.word	0
	.word	0
	.word	-2147483648
	.word	-2147483648
	.word	1
	.word	1431655765
	.word	1431655765
	.word	65535
	.word	1431655765
	.word	-1431655766
	.word	0
	.word	2023406814
	.word	252645135
	.word	35534
	.word	2023406814
	.word	-252645136
	.word	31165
	.word	-1842063752
	.word	-2147483648
	.word	1
	.word	305419896
	.word	-268217003
	.word	1260
	.word	-2147483648
	.word	-268217003
	.word	8192
	.text
	.align	2
	.global	beebs_aha_compress_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_aha_compress_initialise_benchmark, %function
beebs_aha_compress_initialise_benchmark:
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
	.size	beebs_aha_compress_initialise_benchmark, .-beebs_aha_compress_initialise_benchmark
	.align	2
	.global	beebs_aha_compress_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_aha_compress_benchmark, %function
beebs_aha_compress_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #54
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L20
.L22:
	ldr	r2, .L33
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r1, .L33
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	mov	r0, r2
	bl	compress1
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldr	r2, .L33
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L21
	mov	r3, #1
	str	r3, [fp, #-8]
.L21:
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	str	r3, [fp, #-12]
.L20:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L22
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L23
.L25:
	ldr	r2, .L33
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r1, .L33
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	mov	r0, r2
	bl	compress2
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldr	r2, .L33
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L24
	mov	r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	str	r3, [fp, #-12]
.L23:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L25
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L26
.L28:
	ldr	r2, .L33
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r1, .L33
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	mov	r0, r2
	bl	compress3
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldr	r2, .L33
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L27
	mov	r3, #1
	str	r3, [fp, #-8]
.L27:
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	str	r3, [fp, #-12]
.L26:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L28
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L29
.L31:
	ldr	r2, .L33
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldr	r1, .L33
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	mov	r0, r2
	bl	compress4
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldr	r2, .L33
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L30
	mov	r3, #1
	str	r3, [fp, #-8]
.L30:
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	str	r3, [fp, #-12]
.L29:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	blt	.L31
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	test
	.size	beebs_aha_compress_benchmark, .-beebs_aha_compress_benchmark
	.align	2
	.global	beebs_aha_compress_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_aha_compress_verify_benchmark, %function
beebs_aha_compress_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L36
	mov	r3, #0
	b	.L37
.L36:
	mov	r3, #1
.L37:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_aha_compress_verify_benchmark, .-beebs_aha_compress_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
