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
	.file	"libselect.c"
	.text
	.global	select_arr
	.data
	.align	2
	.type	select_arr, %object
	.size	select_arr, 80
select_arr:
	.word	1084227584
	.word	1082130432
	.word	1092930765
	.word	1066192077
	.word	1085695590
	.word	1120403456
	.word	1130823680
	.word	1121845248
	.word	1111883776
	.word	1120272384
	.word	1092616192
	.word	1125515264
	.word	1130248274
	.word	1120534528
	.word	1117388800
	.word	1110441984
	.word	1108082688
	.word	1101287916
	.word	1120402145
	.word	1147025490
	.global	__aeabi_fcmplt
	.global	__aeabi_fcmpgt
	.text
	.align	2
	.global	select
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	select, %function
select:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	mov	r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	b	.L2
.L20:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bhi	.L3
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L4
	ldr	r2, .L26
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-20]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L4
	ldr	r2, .L26
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r2, .L26
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-20]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L4:
	mov	r3, #1
	str	r3, [fp, #-24]
	b	.L2
.L3:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L2
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsr	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r2, .L26
	ldr	r3, [fp, #-32]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L26
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-32]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L26
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L26
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L6
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L26
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L26
	ldr	r2, [fp, #-12]
	ldr	r2, [r1, r2, lsl #2]	@ float
	ldr	r1, .L26
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L6:
	ldr	r2, .L26
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L8
	ldr	r2, .L26
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r2, .L26
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-20]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L8:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L26
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-20]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L26
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L26
	ldr	r2, [fp, #-20]
	ldr	r2, [r1, r2, lsl #2]	@ float
	ldr	r1, .L26
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L10:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	ldr	r2, .L26
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-40]	@ float
	b	.L12
.L18:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L13
.L14:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r2, .L26
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L14
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L15
.L16:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L15:
	ldr	r2, .L26
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-40]	@ float
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L16
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bcs	.L17
	mov	r3, #1
	str	r3, [fp, #-28]
.L17:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L12
	ldr	r2, .L26
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r2, .L26
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L12:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L18
	ldr	r2, .L26
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-20]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L26
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-40]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	bcc	.L19
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L19:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	bhi	.L2
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
.L2:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L20
	ldr	r2, .L26
	ldr	r3, [fp, #-48]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	select_arr
	.size	select, .-select
	.bss
	.align	2
x:
	.space	4
	.size	x, 4
	.align	2
y:
	.space	4
	.size	y, 4
	.text
	.align	2
	.global	beebs_select_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_select_benchmark, %function
beebs_select_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L30
	ldr	r3, [r3]
	mov	r2, r3
	ldr	r3, .L30+4
	ldr	r3, [r3]
	mov	r1, r3
	mov	r0, r2
	bl	select
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L31:
	.align	2
.L30:
	.word	x
	.word	y
	.size	beebs_select_benchmark, .-beebs_select_benchmark
	.align	2
	.global	beebs_select_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_select_initialise_benchmark, %function
beebs_select_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L33
	mov	r2, #10
	str	r2, [r3]
	ldr	r3, .L33+4
	mov	r2, #20
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	x
	.word	y
	.size	beebs_select_initialise_benchmark, .-beebs_select_initialise_benchmark
	.align	2
	.global	beebs_select_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_select_verify_benchmark, %function
beebs_select_verify_benchmark:
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
	.size	beebs_select_verify_benchmark, .-beebs_select_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
