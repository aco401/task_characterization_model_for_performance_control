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
	.file	"ef_mod.c"
	.text
	.section	.rodata
	.align	2
	.type	one, %object
	.size	one, 4
one:
	.word	1065353216
	.align	2
	.type	Zero, %object
	.size	Zero, 8
Zero:
	.word	0
	.word	-2147483648
	.global	__aeabi_fmul
	.global	__aeabi_fdiv
	.text
	.align	2
	.global	__ieee754_fmodf
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	__ieee754_fmodf, %function
__ieee754_fmodf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #60
	str	r0, [fp, #-64]	@ float
	str	r1, [fp, #-68]	@ float
	ldr	r3, [fp, #-64]	@ float
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-68]	@ float
	str	r3, [fp, #-52]	@ float
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	and	r3, r3, #-2147483648
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	eor	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	bic	r3, r3, #-2147483648
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-20]
	ldr	r2, .L29
	cmp	r3, r2
	bgt	.L2
	ldr	r3, [fp, #-24]
	ldr	r2, .L29+4
	cmp	r3, r2
	ble	.L3
.L2:
	ldr	r1, [fp, #-68]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-68]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fdiv
	mov	r3, r0
	b	.L4
.L3:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bge	.L5
	ldr	r3, [fp, #-64]	@ float
	b	.L4
.L5:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bne	.L6
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #31
	ldr	r2, .L29+8
	ldr	r3, [r2, r3, lsl #2]	@ float
	b	.L4
.L6:
	ldr	r3, [fp, #-20]
	cmp	r3, #8388608
	bge	.L7
	mvn	r3, #125
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #8
	str	r3, [fp, #-36]
	b	.L8
.L9:
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #1
	str	r3, [fp, #-36]
.L8:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bgt	.L9
	b	.L10
.L7:
	ldr	r3, [fp, #-20]
	asr	r3, r3, #23
	sub	r3, r3, #127
	str	r3, [fp, #-28]
.L10:
	ldr	r3, [fp, #-24]
	cmp	r3, #8388608
	bge	.L11
	mvn	r3, #125
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #8
	str	r3, [fp, #-36]
	b	.L12
.L13:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #1
	str	r3, [fp, #-36]
.L12:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bge	.L13
	b	.L14
.L11:
	ldr	r3, [fp, #-24]
	asr	r3, r3, #23
	sub	r3, r3, #127
	str	r3, [fp, #-32]
.L14:
	ldr	r3, [fp, #-28]
	cmn	r3, #126
	blt	.L15
	ldr	r3, [fp, #-20]
	bic	r3, r3, #-16777216
	bic	r3, r3, #8388608
	orr	r3, r3, #8388608
	str	r3, [fp, #-20]
	b	.L16
.L15:
	ldr	r2, [fp, #-28]
	mvn	r3, #125
	sub	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	lsl	r3, r2, r3
	str	r3, [fp, #-20]
.L16:
	ldr	r3, [fp, #-32]
	cmn	r3, #126
	blt	.L17
	ldr	r3, [fp, #-24]
	bic	r3, r3, #-16777216
	bic	r3, r3, #8388608
	orr	r3, r3, #8388608
	str	r3, [fp, #-24]
	b	.L18
.L17:
	ldr	r2, [fp, #-32]
	mvn	r3, #125
	sub	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	lsl	r3, r2, r3
	str	r3, [fp, #-24]
.L18:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	b	.L19
.L22:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bge	.L20
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L19
.L20:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #31
	ldr	r2, .L29+8
	ldr	r3, [r2, r3, lsl #2]	@ float
	b	.L4
.L21:
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
.L19:
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	str	r2, [fp, #-16]
	cmp	r3, #0
	bne	.L22
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	blt	.L23
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-20]
.L23:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L25
	ldr	r3, [fp, #-40]
	lsr	r3, r3, #31
	ldr	r2, .L29+8
	ldr	r3, [r2, r3, lsl #2]	@ float
	b	.L4
.L26:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L25:
	ldr	r3, [fp, #-20]
	cmp	r3, #8388608
	blt	.L26
	ldr	r3, [fp, #-32]
	cmn	r3, #126
	blt	.L27
	ldr	r3, [fp, #-20]
	sub	r2, r3, #8388608
	ldr	r3, [fp, #-32]
	add	r3, r3, #127
	lsl	r3, r3, #23
	orr	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	orr	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]	@ float
	str	r3, [fp, #-64]	@ float
	b	.L28
.L27:
	ldr	r2, [fp, #-32]
	mvn	r3, #125
	sub	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	asr	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	orr	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]	@ float
	str	r3, [fp, #-64]	@ float
	mov	r3, #1065353216
	mov	r1, r3
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-64]	@ float
.L28:
	ldr	r3, [fp, #-64]	@ float
.L4:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	2139095039
	.word	2139095040
	.word	Zero
	.size	__ieee754_fmodf, .-__ieee754_fmodf
	.global	newlib_mod_result
	.bss
	.align	2
	.type	newlib_mod_result, %object
	.size	newlib_mod_result, 4
newlib_mod_result:
	.space	4
	.text
	.align	2
	.global	beebs_newlib_mod_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_mod_verify_benchmark, %function
beebs_newlib_mod_verify_benchmark:
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
	.size	beebs_newlib_mod_verify_benchmark, .-beebs_newlib_mod_verify_benchmark
	.align	2
	.global	beebs_newlib_mod_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_mod_initialise_benchmark, %function
beebs_newlib_mod_initialise_benchmark:
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
	.size	beebs_newlib_mod_initialise_benchmark, .-beebs_newlib_mod_initialise_benchmark
	.align	2
	.global	beebs_newlib_mod_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_mod_benchmark, %function
beebs_newlib_mod_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r1, .L36
	ldr	r0, .L36+4
	bl	__ieee754_fmodf
	mov	r3, r0
	ldr	r2, .L36+8
	str	r3, [r2]	@ float
	ldr	r1, .L36+12
	ldr	r0, .L36+16
	bl	__ieee754_fmodf
	mov	r3, r0
	ldr	r2, .L36+8
	str	r3, [r2]	@ float
	ldr	r1, .L36+20
	ldr	r0, .L36+24
	bl	__ieee754_fmodf
	mov	r3, r0
	ldr	r2, .L36+8
	str	r3, [r2]	@ float
	ldr	r1, .L36+28
	ldr	r0, .L36+32
	bl	__ieee754_fmodf
	mov	r3, r0
	ldr	r2, .L36+8
	str	r3, [r2]	@ float
	ldr	r1, .L36+36
	ldr	r0, .L36+40
	bl	__ieee754_fmodf
	mov	r3, r0
	ldr	r2, .L36+8
	str	r3, [r2]	@ float
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	1150963712
	.word	1074728744
	.word	newlib_mod_result
	.word	1158846874
	.word	1078990995
	.word	1163397939
	.word	1084090430
	.word	1166982758
	.word	1084718737
	.word	1169258291
	.word	1086817986
	.size	beebs_newlib_mod_benchmark, .-beebs_newlib_mod_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
