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
	.file	"libminver.c"
	.text
	.data
	.align	2
	.type	a, %object
	.size	a, 36
a:
	.word	1077936128
	.word	-1061158912
	.word	1088421888
	.word	1091567616
	.word	0
	.word	-1063256064
	.word	1084227584
	.word	-1056964608
	.word	1086324736
	.global	minver_b
	.bss
	.align	2
	.type	minver_b, %object
	.size	minver_b, 36
minver_b:
	.space	36
	.global	c
	.align	2
	.type	c, %object
	.size	c, 36
c:
	.space	36
	.global	aa
	.align	2
	.type	aa, %object
	.size	aa, 36
aa:
	.space	36
	.global	a_i
	.align	2
	.type	a_i, %object
	.size	a_i, 36
a_i:
	.space	36
	.global	e
	.align	2
	.type	e, %object
	.size	e, 36
e:
	.space	36
	.global	det
	.align	2
	.type	det, %object
	.size	det, 4
det:
	.space	4
	.global	__aeabi_fcmpge
	.text
	.align	2
	.global	minver_fabs
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	minver_fabs, %function
minver_fabs:
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
	.size	minver_fabs, .-minver_fabs
	.global	__aeabi_fmul
	.global	__aeabi_fadd
	.align	2
	.global	mmul
	.syntax unified
	.arm
	.fpu softvfp
	.type	mmul, %function
mmul:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L9
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	ble	.L9
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L9
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	beq	.L10
.L9:
	ldr	r3, .L18
	b	.L11
.L10:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L12
.L17:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L13
.L16:
	mov	r3, #0
	str	r3, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L14
.L15:
	ldr	r1, .L18+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r0, [r1, r3, lsl #2]	@ float
	ldr	r1, .L18+8
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-20]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L14:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L15
	ldr	r1, .L18+12
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L13:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L16
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L12:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	blt	.L17
	mov	r3, #0
.L11:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	999
	.word	a
	.word	minver_b
	.word	c
	.size	mmul, .-mmul
	.global	data_sink
	.bss
	.align	2
	.type	data_sink, %object
	.size	data_sink, 4
data_sink:
	.space	4
	.global	__aeabi_f2iz
	.global	__aeabi_fcmple
	.global	__aeabi_fcmpgt
	.global	__aeabi_fdiv
	.global	__aeabi_fcmpeq
	.global	__aeabi_fsub
	.text
	.align	2
	.global	minver
	.syntax unified
	.arm
	.fpu softvfp
	.type	minver, %function
minver:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 2072
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #2064
	sub	sp, sp, #12
	str	r0, [fp, #-2072]
	str	r1, [fp, #-2076]
	str	r2, [fp, #-2080]	@ float
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-40]	@ float
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_f2iz
	mov	r3, r0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-2072]
	cmp	r3, #1
	ble	.L21
	ldr	r3, [fp, #-2072]
	cmp	r3, #500
	bgt	.L21
	mov	r1, #0
	ldr	r0, [fp, #-2080]	@ float
	bl	__aeabi_fcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L57
.L21:
	ldr	r3, .L61
	b	.L53
.L57:
	mov	r3, #1065353216
	str	r3, [fp, #-48]	@ float
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L25
.L26:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r2, [fp, #-16]
	str	r2, [r3, #-2056]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L25:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L26
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L27
.L46:
	mov	r3, #0
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-16]
	b	.L28
.L31:
	ldr	r1, .L61+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r0, r3
	bl	minver_fabs
	str	r0, [fp, #-40]	@ float
	ldr	r1, [fp, #-44]	@ float
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-40]	@ float
	str	r3, [fp, #-44]	@ float
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-28]
.L29:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L28:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L31
	ldr	r1, .L61+4
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	str	r3, [fp, #-60]	@ float
	ldr	r0, [fp, #-60]	@ float
	bl	minver_fabs
	str	r0, [fp, #-64]	@ float
	ldr	r1, [fp, #-2080]	@ float
	ldr	r0, [fp, #-64]	@ float
	bl	__aeabi_fcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L58
	ldr	r2, .L61+8
	ldr	r3, [fp, #-48]	@ float
	str	r3, [r2]	@ float
	mov	r3, #1
	b	.L53
.L58:
	ldr	r1, [fp, #-60]	@ float
	ldr	r0, [fp, #-48]	@ float
	bl	__aeabi_fmul
	mov	r3, r0
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-2076]
	mul	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-2076]
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L34
	ldr	r3, [fp, #-40]
	eor	r3, r3, #-2147483648
	str	r3, [fp, #-48]	@ float
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r3, [r3, #-2056]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r2, [r3, #-2056]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	str	r2, [r3, #-2056]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r2, [fp, #-52]
	str	r2, [r3, #-2056]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L35
.L36:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r1, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	str	r3, [fp, #-40]	@ float
	ldr	r1, .L61+4
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	ldr	r1, [r1, r3, lsl #2]	@ float
	ldr	r0, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]	@ float
	ldr	r1, .L61+4
	ldr	r2, [fp, #-28]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	ldr	r2, [fp, #-40]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L35:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L36
.L34:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L37
.L38:
	ldr	r1, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	ldr	r1, [fp, #-60]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	str	r0, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L37:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L38
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L39
.L45:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L40
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-2076]
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r1, .L61+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-24]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	str	r3, [fp, #-40]	@ float
	mov	r1, #0
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L42
.L44:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	beq	.L43
	ldr	r1, .L61+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	ldr	r4, [r1, r3, lsl #2]	@ float
	ldr	r1, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	ldr	r1, [fp, #-40]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fsub
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L61+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	add	r3, r3, r2
	str	r0, [r1, r3, lsl #2]	@ float
.L43:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L42:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L44
	ldr	r3, [fp, #-40]
	eor	r3, r3, #-2147483648
	ldr	r1, [fp, #-60]	@ float
	mov	r0, r3
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L61+4
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-24]
	add	r3, r3, r2
	str	r0, [r1, r3, lsl #2]	@ float
.L40:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L39:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L45
	ldr	r1, [fp, #-60]	@ float
	mov	r0, #1065353216
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r1, r3
	ldr	r2, .L61+4
	ldr	r3, [fp, #-24]
	str	r1, [r2, r3, lsl #4]	@ float
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L27:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L46
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L47
.L52:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r3, [r3, #-2056]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L60
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r3, [r3, #-2056]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r2, [r3, #-2056]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	str	r2, [r3, #-2056]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #12
	add	r3, r3, fp
	ldr	r2, [fp, #-52]
	str	r2, [r3, #-2056]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L50
.L51:
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-2076]
	mul	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r1, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]	@ float
	str	r3, [fp, #-40]	@ float
	ldr	r2, .L61+4
	ldr	r3, [fp, #-24]
	ldr	r1, [r2, r3, lsl #4]	@ float
	ldr	r0, .L61+4
	ldr	r2, [fp, #-24]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]	@ float
	ldr	r1, .L61+4
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-40]	@ float
	str	r2, [r1, r3, lsl #4]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L50:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L51
	b	.L52
.L60:
	nop
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L47:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-2072]
	cmp	r2, r3
	blt	.L52
	ldr	r2, .L61+8
	ldr	r3, [fp, #-48]	@ float
	str	r3, [r2]	@ float
	ldr	r2, .L61+12
	ldr	r3, [fp, #-36]
	str	r3, [r2]
	ldr	r2, .L61+12
	ldr	r3, [fp, #-32]
	str	r3, [r2]
	mov	r3, #0
.L53:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	999
	.word	a
	.word	det
	.word	data_sink
	.size	minver, .-minver
	.align	2
	.global	beebs_minver_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_minver_verify_benchmark, %function
beebs_minver_verify_benchmark:
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
	.size	beebs_minver_verify_benchmark, .-beebs_minver_verify_benchmark
	.align	2
	.global	beebs_minver_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_minver_initialise_benchmark, %function
beebs_minver_initialise_benchmark:
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
	.size	beebs_minver_initialise_benchmark, .-beebs_minver_initialise_benchmark
	.align	2
	.global	beebs_minver_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_minver_benchmark, %function
beebs_minver_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r3, .L76
	str	r3, [fp, #-16]	@ float
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L67
.L70:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L68
.L69:
	ldr	r1, .L76+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r1, [r1, r3, lsl #2]	@ float
	ldr	r0, .L76+8
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L68:
	ldr	r3, [fp, #-12]
	cmp	r3, #2
	ble	.L69
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L67:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L70
	ldr	r2, [fp, #-16]	@ float
	mov	r1, #3
	mov	r0, #3
	bl	minver
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L71
.L74:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L72
.L73:
	ldr	r1, .L76+4
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r1, [r1, r3, lsl #2]	@ float
	ldr	r0, .L76+12
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L72:
	ldr	r3, [fp, #-12]
	cmp	r3, #2
	ble	.L73
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L71:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L74
	mov	r3, #3
	mov	r2, #3
	mov	r1, #3
	mov	r0, #3
	bl	mmul
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	897988541
	.word	a
	.word	aa
	.word	a_i
	.size	beebs_minver_benchmark, .-beebs_minver_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
