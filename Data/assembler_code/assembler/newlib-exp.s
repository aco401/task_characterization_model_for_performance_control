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
	.file	"ef_exp.c"
	.text
	.section	.rodata
	.align	2
	.type	one, %object
	.size	one, 4
one:
	.word	1065353216
	.align	2
	.type	halF, %object
	.size	halF, 8
halF:
	.word	1056964608
	.word	-1090519040
	.align	2
	.type	huge, %object
	.size	huge, 4
huge:
	.word	1900671690
	.align	2
	.type	twom100, %object
	.size	twom100, 4
twom100:
	.word	226492416
	.align	2
	.type	ln2HI, %object
	.size	ln2HI, 8
ln2HI:
	.word	1060204928
	.word	-1087278720
	.align	2
	.type	ln2LO, %object
	.size	ln2LO, 8
ln2LO:
	.word	924317649
	.word	-1223165999
	.align	2
	.type	invln2, %object
	.size	invln2, 4
invln2:
	.word	1069066811
	.align	2
	.type	P1, %object
	.size	P1, 4
P1:
	.word	1042983595
	.align	2
	.type	P2, %object
	.size	P2, 4
P2:
	.word	-1154086047
	.align	2
	.type	P3, %object
	.size	P3, 4
P3:
	.word	948613973
	.align	2
	.type	P4, %object
	.size	P4, 4
P4:
	.word	-1243747826
	.align	2
	.type	P5, %object
	.size	P5, 4
P5:
	.word	858897228
	.global	__aeabi_fadd
	.global	__aeabi_fmul
	.global	__aeabi_fsub
	.global	__aeabi_f2iz
	.global	__aeabi_i2f
	.global	__aeabi_fcmpgt
	.global	__aeabi_fdiv
	.text
	.align	2
	.global	__ieee754_expf
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	__ieee754_expf, %function
__ieee754_expf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #72
	str	r0, [fp, #-80]	@ float
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-80]	@ float
	str	r3, [fp, #-60]	@ float
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	lsr	r3, r3, #31
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-28]
	bic	r3, r3, #-2147483648
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	ldr	r2, .L18
	cmp	r3, r2
	bls	.L2
	ldr	r3, [fp, #-80]	@ float
	mov	r1, r3
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	b	.L16
.L2:
	ldr	r3, [fp, #-36]
	ldr	r2, .L18
	cmp	r3, r2
	bne	.L4
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L5
	ldr	r3, [fp, #-80]	@ float
	b	.L16
.L5:
	mov	r3, #0
	b	.L16
.L4:
	ldr	r3, [fp, #-28]
	ldr	r2, .L18+4
	cmp	r3, r2
	ble	.L7
	ldr	r3, .L18+8
	ldr	r2, .L18+8
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	b	.L16
.L7:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bge	.L8
	ldr	r3, [fp, #-36]
	ldr	r2, .L18+12
	cmp	r3, r2
	bls	.L8
	mov	r3, #226492416
	mov	r2, #226492416
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	b	.L16
.L8:
	ldr	r3, [fp, #-36]
	ldr	r2, .L18+16
	cmp	r3, r2
	bls	.L9
	ldr	r3, [fp, #-36]
	ldr	r2, .L18+20
	cmp	r3, r2
	bhi	.L10
	ldr	r2, .L18+24
	ldr	r3, [fp, #-32]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r2, .L18+28
	ldr	r3, [fp, #-32]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-32]
	rsb	r2, r3, #1
	ldr	r3, [fp, #-32]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	b	.L11
.L10:
	ldr	r3, .L18+32
	ldr	r1, [fp, #-80]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	ldr	r2, .L18+36
	ldr	r3, [fp, #-32]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	__aeabi_i2f
	mov	r3, r0
	str	r3, [fp, #-40]	@ float
	ldr	r3, .L18+40
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r3, .L18+44
	mov	r1, r3
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
.L11:
	ldr	r1, [fp, #-20]	@ float
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-80]	@ float
	b	.L12
.L9:
	ldr	r3, [fp, #-36]
	cmp	r3, #830472192
	bcs	.L12
	ldr	r3, .L18+8
	ldr	r1, [fp, #-80]	@ float
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	mov	r2, r3
	mov	r3, #1065353216
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L12
	mov	r3, #1065353216
	ldr	r1, [fp, #-80]	@ float
	mov	r0, r3
	bl	__aeabi_fadd
	mov	r3, r0
	b	.L16
.L12:
	ldr	r1, [fp, #-80]	@ float
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-40]	@ float
	ldr	r3, .L18+48
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+52
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+56
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+60
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L18+64
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fadd
	mov	r3, r0
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L14
	mov	r4, #1065353216
	ldr	r1, [fp, #-44]	@ float
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	mov	r1, #1073741824
	ldr	r0, [fp, #-44]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fdiv
	mov	r3, r0
	ldr	r1, [fp, #-80]	@ float
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	b	.L16
.L14:
	mov	r4, #1065353216
	ldr	r1, [fp, #-44]	@ float
	ldr	r0, [fp, #-80]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r5, r3
	ldr	r1, [fp, #-44]	@ float
	mov	r0, #1073741824
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r5
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	ldr	r1, [fp, #-16]	@ float
	mov	r0, r3
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-24]
	cmn	r3, #125
	blt	.L15
	ldr	r3, [fp, #-48]	@ float
	str	r3, [fp, #-64]	@ float
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #23
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]	@ float
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-48]	@ float
	b	.L16
.L15:
	ldr	r3, [fp, #-48]	@ float
	str	r3, [fp, #-72]	@ float
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-24]
	add	r3, r3, #100
	lsl	r3, r3, #23
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]	@ float
	str	r3, [fp, #-48]	@ float
	mov	r3, #226492416
	ldr	r1, [fp, #-48]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
.L16:
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	2139095040
	.word	1118925335
	.word	1900671690
	.word	1120924085
	.word	1051816472
	.word	1065686417
	.word	ln2HI
	.word	ln2LO
	.word	1069066811
	.word	halF
	.word	1060204928
	.word	924317649
	.word	858897228
	.word	-1243747826
	.word	948613973
	.word	-1154086047
	.word	1042983595
	.size	__ieee754_expf, .-__ieee754_expf
	.global	newlib_exp_result
	.bss
	.align	2
	.type	newlib_exp_result, %object
	.size	newlib_exp_result, 4
newlib_exp_result:
	.space	4
	.text
	.align	2
	.global	beebs_newlib_exp_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_exp_verify_benchmark, %function
beebs_newlib_exp_verify_benchmark:
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
	.size	beebs_newlib_exp_verify_benchmark, .-beebs_newlib_exp_verify_benchmark
	.align	2
	.global	beebs_newlib_exp_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_exp_initialise_benchmark, %function
beebs_newlib_exp_initialise_benchmark:
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
	.size	beebs_newlib_exp_initialise_benchmark, .-beebs_newlib_exp_initialise_benchmark
	.align	2
	.global	beebs_newlib_exp_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_newlib_exp_benchmark, %function
beebs_newlib_exp_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #1065353216
	bl	__ieee754_expf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	mov	r0, #1073741824
	bl	__ieee754_expf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+4
	bl	__ieee754_expf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+8
	bl	__ieee754_expf
	mov	r3, r0
	ldr	r2, .L25
	str	r3, [r2]	@ float
	ldr	r0, .L25+12
	bl	__ieee754_expf
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
	.word	newlib_exp_result
	.word	1077936128
	.word	1082130432
	.word	1084227584
	.size	beebs_newlib_exp_benchmark, .-beebs_newlib_exp_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
