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
	.file	"libwhetstone.c"
	.text
	.global	T
	.bss
	.align	3
	.type	T, %object
	.size	T, 8
T:
	.space	8
	.global	T1
	.align	3
	.type	T1, %object
	.size	T1, 8
T1:
	.space	8
	.global	T2
	.align	3
	.type	T2, %object
	.size	T2, 8
T2:
	.space	8
	.global	E1
	.align	3
	.type	E1, %object
	.size	E1, 40
E1:
	.space	40
	.global	J
	.align	2
	.type	J, %object
	.size	J, 4
J:
	.space	4
	.global	K
	.align	2
	.type	K, %object
	.size	K, 4
K:
	.space	4
	.global	L
	.align	2
	.type	L, %object
	.size	L, 4
L:
	.space	4
	.text
	.align	2
	.global	beebs_whetstone_verify_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_whetstone_verify_benchmark, %function
beebs_whetstone_verify_benchmark:
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
	.size	beebs_whetstone_verify_benchmark, .-beebs_whetstone_verify_benchmark
	.align	2
	.global	beebs_whetstone_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_whetstone_initialise_benchmark, %function
beebs_whetstone_initialise_benchmark:
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
	.size	beebs_whetstone_initialise_benchmark, .-beebs_whetstone_initialise_benchmark
	.global	__aeabi_dadd
	.global	__aeabi_dsub
	.global	__aeabi_dmul
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.align	2
	.global	beebs_whetstone_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_whetstone_benchmark, %function
beebs_whetstone_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #128
	ldr	r1, .L34+28
	adr	r3, .L34
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r1, .L34+60
	adr	r3, .L34+8
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r1, .L34+24
	mov	r2, #0
	mov	r3, #1073741824
	stm	r1, {r2-r3}
	mov	r3, #1
	str	r3, [fp, #-84]
	mov	r3, #1
	str	r3, [fp, #-88]
	mov	r3, #1
	str	r3, [fp, #-80]
.L5:
	mov	r3, #0
	str	r3, [fp, #-92]
	ldr	r2, [fp, #-84]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	str	r3, [fp, #-96]
	ldr	r2, [fp, #-84]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-100]
	ldr	r2, [fp, #-84]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r2, r3, #4
	sub	r3, r2, r3
	str	r3, [fp, #-104]
	ldr	r2, [fp, #-84]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r2, r3, #4
	sub	r2, r2, r3
	lsl	r3, r2, #1
	mov	r2, r3
	str	r2, [fp, #-108]
	ldr	r3, [fp, #-84]
	lsl	r3, r3, #5
	str	r3, [fp, #-112]
	ldr	r2, [fp, #-84]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #5
	sub	r3, r2, r3
	str	r3, [fp, #-116]
	ldr	r3, [fp, #-84]
	mov	r2, #616
	mul	r3, r2, r3
	str	r3, [fp, #-120]
	mov	r3, #0
	str	r3, [fp, #-124]
	ldr	r2, [fp, #-84]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	sub	r3, r2, r3
	str	r3, [fp, #-128]
	mov	r2, #0
	ldr	r3, .L34+36
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r2, #0
	ldr	r3, .L34+16
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r2, #0
	ldr	r3, .L34+16
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	mov	r2, #0
	ldr	r3, .L34+16
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L6
.L7:
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L6:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-92]
	cmp	r2, r3
	ble	.L7
	ldr	r1, .L34+40
	mov	r2, #0
	ldr	r3, .L34+36
	str	r2, [r1, #8]
	str	r3, [r1, #12]
	ldr	r1, .L34+40
	mov	r2, #0
	ldr	r3, .L34+16
	str	r2, [r1, #16]
	str	r3, [r1, #20]
	ldr	r1, .L34+40
	mov	r2, #0
	ldr	r3, .L34+16
	str	r2, [r1, #24]
	str	r3, [r1, #28]
	ldr	r1, .L34+40
	mov	r2, #0
	ldr	r3, .L34+16
	str	r2, [r1, #32]
	str	r3, [r1, #36]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L8
.L35:
	.align	3
.L34:
	.word	611603343
	.word	1071644567
	.word	1236950581
	.word	1071645196
	.word	-1074790400
	.word	1071644672
	.word	T2
	.word	T
	.word	L
	.word	1072693248
	.word	E1
	.word	1074266112
	.word	J
	.word	K
	.word	1072168960
	.word	T1
.L9:
	ldr	r3, .L34+40
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	ldr	r3, .L34+40
	add	r3, r3, #16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L34+40
	str	r2, [r1, #8]
	str	r3, [r1, #12]
	ldr	r3, .L34+40
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	ldr	r3, .L34+40
	add	r3, r3, #16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L34+40
	str	r2, [r1, #16]
	str	r3, [r1, #20]
	ldr	r3, .L34+40
	add	r1, r3, #8
	ldmia	r1, {r0-r1}
	ldr	r3, .L34+40
	add	r3, r3, #16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L34+40
	str	r2, [r1, #24]
	str	r3, [r1, #28]
	ldr	r3, .L34+40
	add	r1, r3, #16
	ldmia	r1, {r0-r1}
	ldr	r3, .L34+40
	add	r3, r3, #8
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+40
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	ldr	r1, .L34+40
	str	r2, [r1, #32]
	str	r3, [r1, #36]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L8:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	ble	.L9
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L10
.L11:
	ldr	r0, .L34+40
	bl	PA
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L10:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-100]
	cmp	r2, r3
	ble	.L11
	ldr	r3, .L34+48
	mov	r2, #1
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L12
.L19:
	ldr	r3, .L34+48
	ldr	r3, [r3]
	cmp	r3, #1
	bne	.L13
	ldr	r3, .L34+48
	mov	r2, #2
	str	r2, [r3]
	b	.L14
.L13:
	ldr	r3, .L34+48
	mov	r2, #3
	str	r2, [r3]
.L14:
	ldr	r3, .L34+48
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L15
	ldr	r3, .L34+48
	mov	r2, #0
	str	r2, [r3]
	b	.L16
.L15:
	ldr	r3, .L34+48
	mov	r2, #1
	str	r2, [r3]
.L16:
	ldr	r3, .L34+48
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L17
	ldr	r3, .L34+48
	mov	r2, #1
	str	r2, [r3]
	b	.L18
.L17:
	ldr	r3, .L34+48
	mov	r2, #0
	str	r2, [r3]
.L18:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L12:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-104]
	cmp	r2, r3
	ble	.L19
	ldr	r3, .L34+48
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L34+52
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L34+32
	mov	r2, #3
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L20
.L21:
	ldr	r3, .L34+52
	ldr	r2, [r3]
	ldr	r3, .L34+48
	ldr	r3, [r3]
	sub	r3, r2, r3
	ldr	r2, .L34+48
	ldr	r2, [r2]
	mul	r3, r2, r3
	ldr	r2, .L34+32
	ldr	r1, [r2]
	ldr	r2, .L34+52
	ldr	r2, [r2]
	sub	r2, r1, r2
	mul	r3, r2, r3
	ldr	r2, .L34+48
	str	r3, [r2]
	ldr	r3, .L34+32
	ldr	r3, [r3]
	ldr	r2, .L34+52
	ldr	r2, [r2]
	mul	r2, r3, r2
	ldr	r3, .L34+32
	ldr	r1, [r3]
	ldr	r3, .L34+48
	ldr	r3, [r3]
	sub	r3, r1, r3
	ldr	r1, .L34+52
	ldr	r1, [r1]
	mul	r3, r1, r3
	sub	r3, r2, r3
	ldr	r2, .L34+52
	str	r3, [r2]
	ldr	r3, .L34+32
	ldr	r2, [r3]
	ldr	r3, .L34+52
	ldr	r3, [r3]
	sub	r3, r2, r3
	ldr	r2, .L34+52
	ldr	r1, [r2]
	ldr	r2, .L34+48
	ldr	r2, [r2]
	add	r2, r1, r2
	mul	r3, r2, r3
	ldr	r2, .L34+32
	str	r3, [r2]
	ldr	r3, .L34+48
	ldr	r2, [r3]
	ldr	r3, .L34+52
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L34+32
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, .L34+32
	ldr	r3, [r3]
	sub	r4, r3, #1
	mov	r0, r2
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L34+40
	lsl	r1, r4, #3
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, .L34+48
	ldr	r3, [r3]
	ldr	r2, .L34+52
	ldr	r2, [r2]
	mul	r3, r2, r3
	ldr	r2, .L34+32
	ldr	r2, [r2]
	mul	r2, r3, r2
	ldr	r3, .L34+52
	ldr	r3, [r3]
	sub	r4, r3, #1
	mov	r0, r2
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	ldr	r0, .L34+40
	lsl	r1, r4, #3
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L20:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-108]
	cmp	r2, r3
	ble	.L21
	mov	r2, #0
	ldr	r3, .L34+20
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r2, #0
	ldr	r3, .L34+20
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L22
.L23:
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	sin
	ldr	r3, .L34+24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r4, r0
	mov	r5, r1
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L34+36
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	atan
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	sin
	ldr	r3, .L34+24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r4, r0
	mov	r5, r1
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	cos
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L34+36
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	atan
	ldr	r3, .L34+28
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L22:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-112]
	cmp	r2, r3
	ble	.L23
	mov	r2, #0
	ldr	r3, .L34+36
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r2, #0
	ldr	r3, .L34+36
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	mov	r2, #0
	ldr	r3, .L34+36
	str	r2, [fp, #-140]
	str	r3, [fp, #-136]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L24
.L25:
	sub	r3, fp, #140
	str	r3, [sp]
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	P3
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L24:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-116]
	cmp	r2, r3
	ble	.L25
	ldr	r3, .L34+48
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L34+52
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L34+32
	mov	r2, #3
	str	r2, [r3]
	ldr	r1, .L34+40
	mov	r2, #0
	ldr	r3, .L34+36
	str	r2, [r1, #8]
	str	r3, [r1, #12]
	ldr	r1, .L34+40
	mov	r2, #0
	mov	r3, #1073741824
	str	r2, [r1, #16]
	str	r3, [r1, #20]
	ldr	r1, .L34+40
	mov	r2, #0
	ldr	r3, .L34+44
	str	r2, [r1, #24]
	str	r3, [r1, #28]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L26
.L27:
	bl	P0
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L26:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-120]
	cmp	r2, r3
	ble	.L27
	ldr	r3, .L34+48
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L34+52
	mov	r2, #3
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L28
.L29:
	ldr	r3, .L34+48
	ldr	r2, [r3]
	ldr	r3, .L34+52
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L34+48
	str	r3, [r2]
	ldr	r3, .L34+48
	ldr	r2, [r3]
	ldr	r3, .L34+52
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L34+52
	str	r3, [r2]
	ldr	r3, .L34+52
	ldr	r2, [r3]
	ldr	r3, .L34+48
	ldr	r3, [r3]
	sub	r3, r2, r3
	ldr	r2, .L34+48
	str	r3, [r2]
	ldr	r3, .L34+52
	ldr	r2, [r3]
	ldr	r3, .L34+48
	ldr	r3, [r3]
	sub	r2, r2, r3
	ldr	r3, .L34+48
	ldr	r3, [r3]
	sub	r3, r2, r3
	ldr	r2, .L34+52
	str	r3, [r2]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L28:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-124]
	cmp	r2, r3
	ble	.L29
	mov	r2, #0
	ldr	r3, .L34+56
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L30
.L31:
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	log
	ldr	r3, .L34+60
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	exp
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L30:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-128]
	cmp	r2, r3
	ble	.L31
	ldr	r3, [fp, #-80]
	add	r3, r3, #1
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-88]
	cmp	r2, r3
	bgt	.L32
	b	.L5
.L32:
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
	.size	beebs_whetstone_benchmark, .-beebs_whetstone_benchmark
	.align	2
	.global	PA
	.syntax unified
	.arm
	.fpu softvfp
	.type	PA, %function
PA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r6, r7, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, .L40
	mov	r2, #0
	str	r2, [r3]
.L37:
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-24]
	add	r3, r3, #16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, .L40+4
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-24]
	add	r4, r1, #8
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-24]
	add	r3, r3, #16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, .L40+4
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-24]
	add	r4, r1, #16
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-24]
	add	r3, r3, #16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, .L40+4
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-24]
	add	r4, r1, #24
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	ldr	r3, [fp, #-24]
	add	r3, r3, #16
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #24
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, [fp, #-24]
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, .L40+8
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-24]
	add	r4, r1, #32
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	stm	r4, {r2-r3}
	ldr	r3, .L40
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L40
	str	r3, [r2]
	ldr	r3, .L40
	ldr	r3, [r3]
	cmp	r3, #5
	bgt	.L39
	b	.L37
.L39:
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r6, r7, fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	J
	.word	T
	.word	T2
	.size	PA, .-PA
	.align	2
	.global	P0
	.syntax unified
	.arm
	.fpu softvfp
	.type	P0, %function
P0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L43
	ldr	r3, [r3]
	ldr	r2, .L43+4
	ldr	r1, [r2]
	ldr	r2, .L43+8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	ldr	r0, .L43+8
	lsl	r1, r1, #3
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, .L43+12
	ldr	r3, [r3]
	ldr	r2, .L43
	ldr	r1, [r2]
	ldr	r2, .L43+8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	ldr	r0, .L43+8
	lsl	r1, r1, #3
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, .L43+4
	ldr	r3, [r3]
	ldr	r2, .L43+12
	ldr	r1, [r2]
	ldr	r2, .L43+8
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	ldr	r0, .L43+8
	lsl	r1, r1, #3
	add	r1, r0, r1
	stm	r1, {r2-r3}
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L44:
	.align	2
.L43:
	.word	K
	.word	J
	.word	E1
	.word	L
	.size	P0, .-P0
	.align	2
	.global	P3
	.syntax unified
	.arm
	.fpu softvfp
	.type	P3, %function
P3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-12]
	str	r3, [fp, #-8]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L46
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-12]
	str	r3, [fp, #-8]
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L46
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	sub	r1, fp, #12
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	ldr	r3, .L46+4
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #4]
	stm	r1, {r2-r3}
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	T
	.word	T2
	.size	P3, .-P3
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
