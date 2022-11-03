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
	.file	"ef_log.c"
	.text
	.section	.rodata
	.align	2
	.type	ln2_hi, %object
	.size	ln2_hi, 4
ln2_hi:
	.word	1060204928
	.align	2
	.type	ln2_lo, %object
	.size	ln2_lo, 4
ln2_lo:
	.word	924317649
	.align	2
	.type	two25, %object
	.size	two25, 4
two25:
	.word	1275068416
	.align	2
	.type	Lg1, %object
	.size	Lg1, 4
Lg1:
	.word	1059760811
	.align	2
	.type	Lg2, %object
	.size	Lg2, 4
Lg2:
	.word	1053609165
	.align	2
	.type	Lg3, %object
	.size	Lg3, 4
Lg3:
	.word	1049774373
	.align	2
	.type	Lg4, %object
	.size	Lg4, 4
Lg4:
	.word	1046711849
	.align	2
	.type	Lg5, %object
	.size	Lg5, 4
Lg5:
	.word	1044001573
	.align	2
	.type	Lg6, %object
	.size	Lg6, 4
Lg6:
	.word	1042075727
	.align	2
	.type	Lg7, %object
	.size	Lg7, 4
Lg7:
	.word	1041729687
	.align	2
	.type	zero, %object
	.size	zero, 4
zero:
	.space	4
	.global	__aeabi_fdiv
	.global	__aeabi_fsub
	.global	__aeabi_fadd
	.global	__aeabi_fmul
	.global	__aeabi_fcmpeq
	.global	__aeabi_i2f
	.text
	.align	2
	.global	__ieee754_logf
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	__ieee754_logf, %function
__ieee754_logf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #72
	str	r0, [fp, #-80]	@ float
	ldr	r3, [fp, #-80]	@ float
	str	r3, [fp, #-68]	@ float
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	bic	r3, r3, #-2147483648
	cmp	r3, #0
	bne	.L2
	mov	r3, #1275068416
	eor	r3, r3, #-2147483648
	mov	r2, #0
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	b	.L15
.L2:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L4
	ldr	r1, [fp, #-80]	@ float
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r2, r3
	mov	r3, #0
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fdiv
	mov	r3, r0
	b	.L15
.L4:
	ldr	r3, [fp, #-20]
	ldr	r2, .L18
	cmp	r3, r2
	ble	.L5
	ldr	r3, [fp, #-80]	@ float
	mov	r1, r3
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	b	.L15
.L5:
	ldr	r3, [fp, #-20]
	cmp	r3, #8388608
	bge	.L6
	ldr	r3, [fp, #-16]
	sub	r3, r3, #25
	str	r3, [fp, #-16]
	mov	r3, #1275068416
	mov	r1, r3
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-80]	@ float
	ldr	r3, [fp, #-80]	@ float
	str	r3, [fp, #-76]	@ float
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-20]
.L6:
	ldr	r3, [fp, #-20]
	asr	r3, r3, #23
	sub	r3, r3, #127
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	bic	r3, r3, #-16777216
	bic	r3, r3, #8388608
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, .L18+4
	add	r3, r2, r3
	and	r3, r3, #8388608
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	eor	r2, r3, #1065353216
	ldr	r3, [fp, #-20]
	orr	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]	@ float
	str	r3, [fp, #-80]	@ float
	ldr	r3, [fp, #-24]
	asr	r3, r3, #23
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r1, #1065353216
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-28]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #15
	bic	r3, r3, #-268435441
	bic	r3, r3, #260046848
	cmp	r3, #0
	bne	.L7
	mov	r3, #0
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L10
	mov	r3, #0
	b	.L15
.L10:
	ldr	r0, [fp, #-16]
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [fp, #-36]	@ float
	ldr	r3, .L18+8
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r3, .L18+12
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fadd
	mov	r3, r0
	b	.L15
.L17:
	ldr	r1, [fp, #-28]	@ float
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r1, .L18+16
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, #1056964608
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-60]	@ float
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L11
	ldr	r1, [fp, #-60]	@ float
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	b	.L15
.L11:
	ldr	r0, [fp, #-16]
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [fp, #-36]	@ float
	ldr	r3, .L18+8
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r3, .L18+12
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-60]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-28]	@ float
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	b	.L15
.L7:
	mov	r1, #1073741824
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	str	r3, [fp, #-32]	@ float
	ldr	r0, [fp, #-16]
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [fp, #-36]	@ float
	ldr	r1, [fp, #-32]	@ float
	ldr	r0, [fp, #-32]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-40]	@ float
	ldr	r2, [fp, #-20]
	ldr	r3, .L18+20
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-40]	@ float
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #3522560
	add	r3, r3, #648
	str	r3, [fp, #-48]
	ldr	r3, .L18+24
	ldr	r1, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+28
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+32
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-44]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-52]	@ float
	ldr	r3, .L18+36
	ldr	r1, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+40
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+44
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-44]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+48
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-56]	@ float
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-48]
	orr	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r1, [fp, #-52]	@ float
	ldr	r0, [fp, #-56]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-60]	@ float
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L12
	mov	r1, #1056964608
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-64]	@ float
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L13
	ldr	r1, [fp, #-60]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-32]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	b	.L15
.L13:
	ldr	r3, .L18+8
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-60]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-32]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	ldr	r3, .L18+12
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-28]	@ float
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	b	.L15
.L12:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L14
	ldr	r1, [fp, #-60]	@ float
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-32]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	b	.L15
.L14:
	ldr	r3, .L18+8
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r1, [fp, #-60]	@ float
	ldr	r0, [fp, #-28]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-32]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	ldr	r3, .L18+12
	ldr	r1, [fp, #-36]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-28]	@ float
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
.L15:
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	2139095039
	.word	4913952
	.word	1060204928
	.word	924317649
	.word	1051372203
	.word	-3187664
	.word	1042075727
	.word	1046711849
	.word	1053609165
	.word	1041729687
	.word	1044001573
	.word	1049774373
	.word	1059760811
	.size	__ieee754_logf, .-__ieee754_logf
	.global	newlib_log_result
	.bss
	.align	2
	.type	newlib_log_result, %object
	.size	newlib_log_result, 4
newlib_log_result:
	.space	4
	.text
	.align	2
	.global	beebs_newlib_log_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_log_verify_benchmark, %function
beebs_newlib_log_verify_benchmark:
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
	.size	beebs_newlib_log_verify_benchmark, .-beebs_newlib_log_verify_benchmark
	.align	2
	.global	beebs_newlib_log_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_log_initialise_benchmark, %function
beebs_newlib_log_initialise_benchmark:
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
	.size	beebs_newlib_log_initialise_benchmark, .-beebs_newlib_log_initialise_benchmark
	.align	2
	.global	beebs_newlib_log_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_log_benchmark, %function
beebs_newlib_log_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #1073741824
	bl	__ieee754_logf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+4
	bl	__ieee754_logf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+8
	bl	__ieee754_logf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+12
	bl	__ieee754_logf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+16
	bl	__ieee754_logf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	newlib_log_result
	.word	1077936128
	.word	1082130432
	.word	1084227584
	.word	1086324736
	.size	beebs_newlib_log_benchmark, .-beebs_newlib_log_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
