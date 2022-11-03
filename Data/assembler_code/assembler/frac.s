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
	.file	"libfrac.c"
	.text
	.global	__aeabi_dcmplt
	.global	__aeabi_dcmpgt
	.global	__aeabi_d2iz
	.global	__aeabi_ddiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_dcmpeq
	.global	__aeabi_dsub
	.global	__aeabi_dcmple
	.global	__aeabi_dadd
	.align	2
	.global	frac
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	frac, %function
frac:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #56
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	str	r2, [fp, #-72]
	str	r3, [fp, #-76]
	adr	r3, .L32
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L2
	mov	r2, #536870912
	ldr	r3, .L32+8
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L2
	mov	r2, #0
	mov	r3, #0
	ldmib	fp, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L25
.L2:
	mov	r2, #0
	ldr	r3, .L32+12
	b	.L5
.L25:
	mov	r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-76]
	ldr	r2, [fp, #-24]
	str	r2, [r3]
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	__aeabi_d2iz
	mov	r2, r0
	ldr	r3, [fp, #-72]
	str	r2, [r3]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	b	.L6
.L31:
	nop
.L7:
	mov	r2, #0
	ldr	r3, .L32+20
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L27
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	mov	r0, #0
	ldr	r1, .L32+20
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	b	.L10
.L27:
	nop
.L10:
	ldr	r3, [fp, #-72]
	ldr	r4, [r3]
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_d2iz
	mov	r3, r0
	mul	r3, r4, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-76]
	ldr	r4, [r3]
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_d2iz
	mov	r3, r0
	mul	r3, r4, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-72]
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	str	r2, [r3]
	ldr	r3, [fp, #-76]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	str	r2, [r3]
.L6:
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-76]
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	ldr	r3, [fp, #-72]
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L28
	ldr	r0, [fp, #-28]
	bl	__aeabi_i2d
	mov	r4, r0
	mov	r5, r1
	ldr	r0, [fp, #-24]
	bl	__aeabi_i2d
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	ldr	r3, [fp, #-76]
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, [fp, #-72]
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r2, #0
	ldr	r3, .L32+20
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L29
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-56]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-76]
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-76]
	ldr	r2, [fp, #-56]
	str	r2, [r3]
	b	.L13
.L28:
	nop
	b	.L13
.L33:
	.align	3
.L32:
	.word	-480129460
	.word	1039441319
	.word	1109565535
	.word	-1074790400
	.word	1076101120
	.word	1072693248
	.word	1071644672
.L29:
	nop
.L13:
	ldr	r3, [fp, #-72]
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r4, r0
	mov	r5, r1
	ldr	r3, [fp, #-76]
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2d
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, #0
	ldr	r1, .L32+20
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r1, r2
	str	r1, [fp, #-36]
	bic	r3, r3, #-2147483648
	str	r3, [fp, #-32]
	ldmib	fp, {r2-r3}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	bne	.L30
	mov	r2, #0
	ldr	r3, .L32+20
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
.L19:
	mov	r2, #0
	ldr	r3, .L32+16
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L32+20
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L19
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	mov	r0, #0
	ldr	r1, .L32+20
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L32+24
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	b	.L18
.L30:
	nop
.L18:
	ldmib	fp, {r2-r3}
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L26
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	b	.L5
.L26:
	mov	r2, #0
	mov	r3, #0
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L31
	mov	r2, #0
	mov	r3, #0
.L5:
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
	.size	frac, .-frac
	.global	frac_nums
	.data
	.align	3
	.type	frac_nums, %object
	.size	frac_nums, 80
frac_nums:
	.word	0
	.word	0
	.word	-1386759041
	.word	1072822348
	.word	-1717986918
	.word	1086556185
	.word	0
	.word	1083359232
	.word	-1065151889
	.word	1074340298
	.word	1293080650
	.word	1074340347
	.word	-56294995
	.word	1076101119
	.word	-316109593
	.word	1076379149
	.word	-200440970
	.word	1051992565
	.word	208632331
	.word	1072693249
	.text
	.align	2
	.global	beebs_frac_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_frac_initialise_benchmark, %function
beebs_frac_initialise_benchmark:
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
	.size	beebs_frac_initialise_benchmark, .-beebs_frac_initialise_benchmark
	.align	2
	.global	beebs_frac_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_frac_benchmark, %function
beebs_frac_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	adr	r3, .L39
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L36
.L37:
	ldr	r2, .L39+8
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	sub	lr, fp, #28
	sub	ip, fp, #24
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r3, lr
	mov	r2, ip
	bl	frac
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L36:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L37
	ldr	r3, [fp, #-28]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L40:
	.align	3
.L39:
	.word	-640172613
	.word	1037794527
	.word	frac_nums
	.size	beebs_frac_benchmark, .-beebs_frac_benchmark
	.align	2
	.global	beebs_frac_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_frac_verify_benchmark, %function
beebs_frac_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L44
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L42
	mov	r3, #0
	b	.L43
.L42:
	mov	r3, #1
.L43:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L45:
	.align	2
.L44:
	.word	1000000
	.size	beebs_frac_verify_benchmark, .-beebs_frac_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
