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
	.file	"libludcmp.c"
	.text
	.global	ludcmp_a
	.bss
	.align	2
	.type	ludcmp_a, %object
	.size	ludcmp_a, 288
ludcmp_a:
	.space	288
	.global	ludcmp_b
	.align	2
	.type	ludcmp_b, %object
	.size	ludcmp_b, 24
ludcmp_b:
	.space	24
	.global	x
	.align	2
	.type	x, %object
	.size	x, 24
x:
	.space	24
	.global	__aeabi_fcmpge
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	ludcmp_fabs, %function
ludcmp_fabs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]	@ float
	mov	r1, #0
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-16]	@ float
	str	r3, [fp, #-8]	@ float
	b	.L4
.L7:
	ldr	r3, [fp, #-16]
	eor	r3, r3, #-2147483648
	str	r3, [fp, #-8]	@ float
.L4:
	ldr	r3, [fp, #-8]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	ludcmp_fabs, .-ludcmp_fabs
	.global	__aeabi_fcmple
	.global	__aeabi_fmul
	.global	__aeabi_fsub
	.global	__aeabi_fdiv
	.align	2
	.global	ludcmp
	.syntax unified
	.arm
	.fpu softvfp
	.type	ludcmp, %function
ludcmp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #64
	str	r0, [fp, #-64]
	str	r1, [fp, #-68]	@ float
	ldr	r3, [fp, #-64]
	cmp	r3, #99
	bgt	.L9
	mov	r1, #0
	ldr	r0, [fp, #-68]	@ float
	bl	__aeabi_fcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L36
.L9:
	ldr	r3, .L38
	b	.L34
.L36:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L25:
	ldr	r1, .L38+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]	@ float
	mov	r0, r3
	bl	ludcmp_fabs
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-68]	@ float
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	beq	.L37
	mov	r3, #1
	b	.L34
.L37:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L16
.L20:
	ldr	r1, .L38+4
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L17
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L18
.L19:
	ldr	r1, .L38+4
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r0, [r1, r3, lsl #2]	@ float
	ldr	r1, .L38+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L18:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L19
.L17:
	ldr	r1, .L38+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L38+4
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	str	r0, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L16:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	ble	.L20
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L21
.L24:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r1, .L38+4
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L22
.L23:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r1, .L38+4
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r0, [r1, r3, lsl #2]	@ float
	ldr	r1, .L38+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L22:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	ble	.L23
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r1, .L38+4
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L21:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	ble	.L24
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	blt	.L25
	ldr	r3, .L38+8
	ldr	r3, [r3]	@ float
	str	r3, [fp, #-60]	@ float
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L26
.L29:
	ldr	r2, .L38+8
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L27
.L28:
	ldr	r1, .L38+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-56]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L27:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L28
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-20]	@ float
	str	r2, [r3, #-56]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L26:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	ble	.L29
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r0, [r3, #-56]	@ float
	ldr	r1, .L38+4
	ldr	r2, [fp, #-64]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r1, r3
	ldr	r2, .L38+12
	ldr	r3, [fp, #-64]
	str	r1, [r2, r3, lsl #2]	@ float
	ldr	r3, [fp, #-64]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L30
.L33:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-56]	@ float
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L31
.L32:
	ldr	r1, .L38+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L38+12
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fsub
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L31:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	ble	.L32
	ldr	r1, .L38+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r1, r3
	ldr	r2, .L38+12
	ldr	r3, [fp, #-8]
	str	r1, [r2, r3, lsl #2]	@ float
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L33
	mov	r3, #0
.L34:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	999
	.word	ludcmp_a
	.word	ludcmp_b
	.word	x
	.size	ludcmp, .-ludcmp
	.global	chkerr
	.bss
	.align	2
	.type	chkerr, %object
	.size	chkerr, 4
chkerr:
	.space	4
	.text
	.align	2
	.global	beebs_ludcmp_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ludcmp_initialise_benchmark, %function
beebs_ludcmp_initialise_benchmark:
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
	.size	beebs_ludcmp_initialise_benchmark, .-beebs_ludcmp_initialise_benchmark
	.global	__aeabi_i2f
	.global	__aeabi_fadd
	.align	2
	.global	beebs_ludcmp_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ludcmp_benchmark, %function
beebs_ludcmp_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #5
	str	r3, [fp, #-20]
	ldr	r3, .L48
	str	r3, [fp, #-24]	@ float
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L46:
	mov	r3, #0
	str	r3, [fp, #-16]	@ float
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L43
.L45:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	add	r3, r2, r3
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r1, r0
	ldr	r0, .L48+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]	@ float
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L44
	ldr	r1, .L48+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	ldr	r1, .L48+8
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L48+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r0, [r1, r3, lsl #2]	@ float
.L44:
	ldr	r1, .L48+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-16]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-16]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L43:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L45
	ldr	r1, .L48+12
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L42:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L46
	ldr	r1, [fp, #-24]	@ float
	ldr	r0, [fp, #-20]
	bl	ludcmp
	mov	r3, r0
	ldr	r2, .L48+16
	str	r3, [r2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	897988541
	.word	ludcmp_a
	.word	1092616192
	.word	ludcmp_b
	.word	chkerr
	.size	beebs_ludcmp_benchmark, .-beebs_ludcmp_benchmark
	.global	__aeabi_fcmpeq
	.section	.rodata
	.align	2
.LC0:
	.word	1101004800
	.word	1077936128
	.word	1082130432
	.word	1084227584
	.word	1086324736
	.word	1088421888
	.word	0
	.word	0
	.word	0
	.word	1041865114
	.word	1109275443
	.word	1082969293
	.word	1084751872
	.word	1086534451
	.word	1088317030
	.word	0
	.word	0
	.word	0
	.word	1045220557
	.word	1038342111
	.word	1114298252
	.word	1085099851
	.word	1086579258
	.word	1088058664
	.word	0
	.word	0
	.word	0
	.word	1048576000
	.word	1040707040
	.word	1035791501
	.word	1117461347
	.word	1086588100
	.word	1087787865
	.word	0
	.word	0
	.word	0
	.word	1050253722
	.word	1042149329
	.word	1037404195
	.word	1034011397
	.word	1119897137
	.word	1087556312
	.word	0
	.word	0
	.word	0
	.word	1051931443
	.word	1043591618
	.word	1039016888
	.word	1035001487
	.word	1032606702
	.word	1122304670
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.align	2
.LC1:
	.word	1110704128
	.word	1116340224
	.word	1119485952
	.word	1122631680
	.word	1124925440
	.word	1126498304
	.align	2
.LC2:
	.word	1065353216
	.word	1065353216
	.word	1065353213
	.word	1065353216
	.word	1065353217
	.word	1065353216
	.text
	.align	2
	.global	beebs_ludcmp_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ludcmp_verify_benchmark, %function
beebs_ludcmp_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 352
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #352
	str	r0, [fp, #-352]
	ldr	r2, .L71
	sub	r3, fp, #300
	mov	r1, r2
	mov	r2, #288
	mov	r0, r3
	bl	memcpy
	ldr	r3, .L71+4
	sub	ip, fp, #324
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	ldr	r3, .L71+8
	sub	ip, fp, #348
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1}
	stm	ip, {r0, r1}
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L51
.L57:
	ldr	r2, .L71+12
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-320]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L68
	mov	r3, #0
	b	.L64
.L68:
	ldr	r2, .L71+16
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-344]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L69
	mov	r3, #0
	b	.L64
.L69:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L51:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L57
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L58
.L63:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L59
.L62:
	ldr	r1, .L71+20
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r0, [r1, r3, lsl #2]	@ float
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-296]	@ float
	mov	r1, r3
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L70
	mov	r3, #0
	b	.L64
.L70:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L59:
	ldr	r3, [fp, #-12]
	cmp	r3, #8
	ble	.L62
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L58:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L63
	mov	r3, #1
.L64:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	ludcmp_b
	.word	x
	.word	ludcmp_a
	.size	beebs_ludcmp_verify_benchmark, .-beebs_ludcmp_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
