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
	.file	"mont64.c"
	.text
	.align	2
	.global	mulul64
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	mulul64, %function
mulul64:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 168
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #168
	str	r0, [fp, #-108]
	str	r1, [fp, #-104]
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	mov	r8, r2
	mov	r9, #0
	str	r8, [fp, #-44]
	str	r9, [fp, #-40]
	sub	r3, fp, #116
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	sub	r3, fp, #116
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-164]
	mov	ip, #0
	str	ip, [fp, #-160]
	sub	r3, fp, #164
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-60]
	mul	r1, r3, r2
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-44]
	mul	r3, r2, r3
	add	r3, r1, r3
	ldr	r1, [fp, #-44]
	ldr	r2, [fp, #-60]
	umull	r4, r0, r1, r2
	mov	r5, r0
	add	r3, r3, r5
	mov	r5, r3
	str	r4, [fp, #-68]
	str	r5, [fp, #-64]
	str	r4, [fp, #-68]
	str	r5, [fp, #-64]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-172]
	str	ip, [fp, #-168]
	sub	r4, fp, #172
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-76]
	str	r4, [fp, #-72]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-84]
	str	r1, [fp, #-80]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-60]
	mul	r1, r3, r2
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-36]
	mul	r3, r2, r3
	add	r3, r1, r3
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-60]
	umull	r0, lr, r1, r2
	str	lr, [fp, #-120]
	str	r0, [fp, #-124]
	ldr	r2, [fp, #-120]
	add	r3, r3, r2
	str	r3, [fp, #-120]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	sub	r1, fp, #124
	ldmia	r1, {r0-r1}
	mov	lr, r0
	adds	lr, r2, lr
	str	lr, [fp, #-180]
	adc	r3, r3, r1
	str	r3, [fp, #-176]
	sub	r4, fp, #180
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-68]
	str	r4, [fp, #-64]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-188]
	str	ip, [fp, #-184]
	sub	r4, fp, #188
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-92]
	str	r4, [fp, #-88]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-52]
	mul	r1, r2, r3
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-44]
	mul	r3, r2, r3
	add	r2, r1, r3
	ldr	r1, [fp, #-44]
	ldr	r3, [fp, #-52]
	umull	r0, ip, r1, r3
	str	ip, [fp, #-128]
	str	r0, [fp, #-132]
	ldr	r3, [fp, #-128]
	add	r3, r2, r3
	str	r3, [fp, #-128]
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	sub	r1, fp, #132
	ldmia	r1, {r0-r1}
	mov	ip, r0
	adds	ip, r2, ip
	str	ip, [fp, #-196]
	adc	r3, r3, r1
	str	r3, [fp, #-192]
	sub	r4, fp, #196
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-68]
	str	r4, [fp, #-64]
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	mov	r2, r1
	mov	r3, #0
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	mov	r3, r0
	mov	r2, #0
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	adds	ip, r2, r0
	str	ip, [fp, #-140]
	adc	r3, r3, r1
	str	r3, [fp, #-136]
	ldr	r3, [fp, #8]
	sub	r2, fp, #140
	ldmia	r2, {r1-r2}
	stm	r3, {r1-r2}
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-52]
	mul	r2, r3, r2
	ldr	r3, [fp, #-48]
	ldr	r1, [fp, #-36]
	mul	r3, r1, r3
	add	r3, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r2, [fp, #-52]
	umull	r6, r0, r1, r2
	mov	r7, r0
	add	r3, r3, r7
	mov	r7, r3
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	adds	r1, r6, r2
	str	r1, [fp, #-148]
	adc	r3, r7, r3
	str	r3, [fp, #-144]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	sub	r1, fp, #148
	ldmia	r1, {r0-r1}
	mov	ip, r0
	adds	ip, ip, r2
	str	ip, [fp, #-156]
	adc	r3, r1, r3
	str	r3, [fp, #-152]
	ldr	r3, [fp, #4]
	sub	r2, fp, #156
	ldmia	r2, {r1-r2}
	stm	r3, {r1-r2}
	nop
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	mulul64, .-mulul64
	.align	2
	.global	modul64
	.syntax unified
	.arm
	.fpu softvfp
	.type	modul64, %function
modul64:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, fp}
	add	fp, sp, #24
	sub	sp, sp, #76
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r2, #1
	mov	r3, #0
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	b	.L4
.L6:
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	asr	r0, r3, #31
	asr	r1, r3, #31
	str	r0, [fp, #-44]
	str	r1, [fp, #-40]
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	adds	r1, r2, r2
	str	r1, [fp, #-68]
	adc	r3, r3, r3
	str	r3, [fp, #-64]
	sub	r5, fp, #68
	ldmia	r5, {r4-r5}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	lsr	r0, r3, #31
	mov	r1, #0
	orr	r8, r4, r0
	orr	r9, r5, r1
	str	r8, [fp, #-52]
	str	r9, [fp, #-48]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	adds	r1, r2, r2
	str	r1, [fp, #-76]
	adc	r3, r3, r3
	str	r3, [fp, #-72]
	sub	r4, fp, #76
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	orr	r6, r0, r2
	orr	r7, r1, r3
	ldmib	fp, {r2-r3}
	cmp	r6, r2
	sbcs	r3, r7, r3
	bcc	.L5
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	ldmib	fp, {r2-r3}
	subs	ip, r0, r2
	str	ip, [fp, #-84]
	sbc	r3, r1, r3
	str	r3, [fp, #-80]
	sub	r4, fp, #84
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	adds	r1, r2, #1
	str	r1, [fp, #-92]
	adc	r3, r3, #0
	str	r3, [fp, #-88]
	sub	r4, fp, #92
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
.L5:
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	adds	r1, r2, #1
	str	r1, [fp, #-100]
	adc	r3, r3, #0
	str	r3, [fp, #-96]
	sub	r4, fp, #100
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
.L4:
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	cmp	r2, #65
	sbcs	r3, r3, #0
	blt	.L6
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp}
	bx	lr
	.size	modul64, .-modul64
	.align	2
	.global	montmul
	.syntax unified
	.arm
	.fpu softvfp
	.type	montmul, %function
montmul:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #144
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
	sub	r3, fp, #76
	str	r3, [sp, #4]
	sub	r3, fp, #68
	str	r3, [sp]
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	bl	mulul64
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #16]
	mul	r2, r0, r3
	ldr	r3, [fp, #12]
	mul	r3, r1, r3
	add	r3, r2, r3
	ldr	r2, [fp, #12]
	umull	r4, ip, r2, r0
	mov	r5, ip
	add	r3, r3, r5
	mov	r5, r3
	str	r4, [fp, #-44]
	str	r5, [fp, #-40]
	str	r4, [fp, #-44]
	str	r5, [fp, #-40]
	sub	r3, fp, #92
	str	r3, [sp, #4]
	sub	r3, fp, #84
	str	r3, [sp]
	ldmib	fp, {r2-r3}
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	bl	mulul64
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	adds	ip, r0, r2
	str	ip, [fp, #-132]
	adc	r3, r1, r3
	str	r3, [fp, #-128]
	sub	r4, fp, #132
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	adds	ip, r0, r2
	str	ip, [fp, #-140]
	adc	r3, r1, r3
	str	r3, [fp, #-136]
	sub	r4, fp, #140
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	cmp	r2, r0
	sbcs	r3, r3, r1
	bcs	.L9
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	adds	r1, r2, #1
	str	r1, [fp, #-148]
	adc	r3, r3, #0
	str	r3, [fp, #-144]
	sub	r4, fp, #148
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
.L9:
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	cmp	r2, r0
	sbcs	r3, r3, r1
	movcc	r3, #1
	movcs	r3, #0
	and	r3, r3, #255
	mov	lr, r3
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	cmp	r3, r1
	cmpeq	r2, r0
	moveq	r3, #1
	movne	r3, #0
	and	ip, r3, #255
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	cmp	r2, r0
	sbcs	r3, r3, r1
	movcc	r3, #1
	movcs	r3, #0
	and	r3, r3, #255
	and	r3, r3, ip
	and	r3, r3, #255
	orr	r3, lr, r3
	asr	r2, r3, #31
	str	r3, [fp, #-156]
	str	r2, [fp, #-152]
	sub	r4, fp, #156
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	ldmib	fp, {r2-r3}
	cmp	r0, r2
	sbcs	r3, r1, r3
	movcs	r3, #1
	movcc	r3, #0
	and	r3, r3, #255
	and	r3, r3, #255
	mov	r2, #0
	str	r3, [fp, #-116]
	str	r2, [fp, #-112]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	mov	ip, r0
	orr	ip, ip, r2
	str	ip, [fp, #-124]
	orr	r3, r1, r3
	str	r3, [fp, #-120]
	sub	r4, fp, #124
	ldmia	r4, {r3-r4}
	mov	r2, r3
	rsbs	r8, r2, #0
	mov	r3, r4
	rsc	r9, r3, #0
	ldmib	fp, {r2-r3}
	and	r6, r8, r2
	and	r7, r9, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	subs	r1, r2, r6
	str	r1, [fp, #-164]
	sbc	r3, r3, r7
	str	r3, [fp, #-160]
	sub	r4, fp, #164
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	montmul, .-montmul
	.align	2
	.global	xbinGCD
	.syntax unified
	.arm
	.fpu softvfp
	.type	xbinGCD, %function
xbinGCD:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, r8, r9, fp}
	add	fp, sp, #24
	sub	sp, sp, #76
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	mov	r2, #1
	mov	r3, #0
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	b	.L12
.L14:
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsr	r3, r1, #1
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	and	r3, r2, #1
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-80]
	sub	r4, fp, #84
	ldmia	r4, {r3-r4}
	mov	r2, r3
	mov	r3, r4
	orrs	r3, r2, r3
	bne	.L13
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsr	r3, r1, #1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsr	r3, r1, #1
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	b	.L12
.L13:
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	eor	r6, r0, r2
	eor	r7, r1, r3
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r6, #1
	orr	r2, r2, r7, lsl #31
	lsr	r3, r7, #1
	sub	r5, fp, #36
	ldmia	r5, {r4-r5}
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	and	r8, r4, r0
	and	r9, r5, r1
	adds	r1, r2, r8
	str	r1, [fp, #-92]
	adc	r3, r3, r9
	str	r3, [fp, #-88]
	sub	r4, fp, #92
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-36]
	str	r4, [fp, #-32]
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #1
	orr	r2, r2, r1, lsl #31
	lsr	r3, r1, #1
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	adds	ip, r0, r2
	str	ip, [fp, #-100]
	adc	r3, r1, r3
	str	r3, [fp, #-96]
	sub	r4, fp, #100
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
.L12:
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	orrs	r3, r2, r3
	bne	.L14
	ldr	r1, [fp, #4]
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r1, [fp, #8]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	nop
	sub	sp, fp, #24
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp}
	bx	lr
	.size	xbinGCD, .-xbinGCD
	.bss
	.align	3
in_a:
	.space	8
	.size	in_a, 8
	.align	3
in_b:
	.space	8
	.size	in_b, 8
	.align	3
in_m:
	.space	8
	.size	in_m, 8
	.text
	.align	2
	.global	beebs_aha_mont64_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_aha_mont64_benchmark, %function
beebs_aha_mont64_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 136
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #152
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, .L20
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, .L20+4
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	ldr	r3, .L20+8
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	sub	r3, fp, #116
	str	r3, [sp, #4]
	sub	r3, fp, #108
	str	r3, [sp]
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	bl	mulul64
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	sub	r7, fp, #116
	ldmia	r7, {r6-r7}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, r6
	mov	r3, r7
	bl	modul64
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	sub	r3, fp, #116
	str	r3, [sp, #4]
	sub	r3, fp, #108
	str	r3, [sp]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	mulul64
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	sub	r7, fp, #116
	ldmia	r7, {r6-r7}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, r6
	mov	r3, r7
	bl	modul64
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	sub	r3, fp, #116
	str	r3, [sp, #4]
	sub	r3, fp, #108
	str	r3, [sp]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	bl	mulul64
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	sub	r7, fp, #116
	ldmia	r7, {r6-r7}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, r6
	mov	r3, r7
	bl	modul64
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	mov	r2, #0
	mov	r3, #-2147483648
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	sub	r3, fp, #148
	str	r3, [sp, #4]
	sub	r3, fp, #140
	str	r3, [sp]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	bl	xbinGCD
	sub	r3, fp, #140
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-76]
	mul	r0, r3, r1
	ldr	r1, [fp, #-72]
	mul	r1, r2, r1
	add	r1, r0, r1
	ldr	r0, [fp, #-76]
	umull	r4, ip, r0, r2
	mov	r5, ip
	add	r3, r1, r5
	mov	r5, r3
	adds	r3, r4, r4
	str	r3, [fp, #-164]
	adc	r3, r5, r5
	str	r3, [fp, #-160]
	sub	r1, fp, #164
	ldmia	r1, {r0-r1}
	sub	r3, fp, #148
	ldmia	r3, {r2-r3}
	ldr	ip, [fp, #-44]
	mul	lr, r3, ip
	ldr	ip, [fp, #-40]
	mul	ip, r2, ip
	add	ip, lr, ip
	ldr	lr, [fp, #-44]
	umull	r8, r4, lr, r2
	mov	r9, r4
	add	r3, ip, r9
	mov	r9, r3
	subs	r3, r0, r8
	str	r3, [fp, #-156]
	sbc	r3, r1, r9
	str	r3, [fp, #-152]
	sub	r2, fp, #156
	ldmia	r2, {r1-r2}
	mov	r3, r1
	sub	r3, r3, #1
	orrs	r3, r3, r2
	beq	.L17
	mov	r3, #1
	str	r3, [fp, #-32]
.L17:
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, #0
	mov	r3, #0
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	bl	modul64
	str	r0, [fp, #-84]
	str	r1, [fp, #-80]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, #0
	mov	r3, #0
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	bl	modul64
	str	r0, [fp, #-92]
	str	r1, [fp, #-88]
	sub	r3, fp, #148
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	sub	r1, fp, #84
	ldmia	r1, {r0-r1}
	bl	montmul
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	sub	r3, fp, #148
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	bl	montmul
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	sub	r3, fp, #148
	ldmia	r3, {r2-r3}
	str	r2, [sp, #8]
	str	r3, [sp, #12]
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	bl	montmul
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	sub	r3, fp, #140
	ldmia	r3, {r2-r3}
	sub	r1, fp, #132
	str	r1, [sp, #4]
	sub	r1, fp, #124
	str	r1, [sp]
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	bl	mulul64
	sub	r1, fp, #124
	ldmia	r1, {r0-r1}
	sub	r5, fp, #132
	ldmia	r5, {r4-r5}
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	stm	sp, {r2-r3}
	mov	r2, r4
	mov	r3, r5
	bl	modul64
	str	r0, [fp, #-100]
	str	r1, [fp, #-96]
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	cmp	r1, r3
	cmpeq	r0, r2
	beq	.L18
	mov	r3, #1
	str	r3, [fp, #-32]
.L18:
	ldr	r3, [fp, #-32]
	mov	r0, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	in_m
	.word	in_b
	.word	in_a
	.size	beebs_aha_mont64_benchmark, .-beebs_aha_mont64_benchmark
	.align	2
	.global	beebs_aha_mont64_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_aha_mont64_initialise_benchmark, %function
beebs_aha_mont64_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r1, .L23+24
	adr	r3, .L23
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r1, .L23+28
	adr	r3, .L23+8
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	ldr	r1, .L23+32
	adr	r3, .L23+16
	ldmia	r3, {r2-r3}
	stm	r1, {r2-r3}
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L24:
	.align	3
.L23:
	.word	958986399
	.word	-85440217
	.word	-1187838605
	.word	343109103
	.word	-2027716625
	.word	88684321
	.word	in_m
	.word	in_b
	.word	in_a
	.size	beebs_aha_mont64_initialise_benchmark, .-beebs_aha_mont64_initialise_benchmark
	.align	2
	.global	beebs_aha_mont64_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_aha_mont64_verify_benchmark, %function
beebs_aha_mont64_verify_benchmark:
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
	beq	.L26
	mov	r3, #0
	b	.L27
.L26:
	mov	r3, #1
.L27:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_aha_mont64_verify_benchmark, .-beebs_aha_mont64_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
