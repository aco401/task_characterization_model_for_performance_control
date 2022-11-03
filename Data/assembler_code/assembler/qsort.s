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
	.file	"libqsort.c"
	.text
	.global	arr
	.data
	.align	2
	.type	arr, %object
	.size	arr, 80
arr:
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
	.word	1118945935
	.global	istack
	.bss
	.align	2
	.type	istack, %object
	.size	istack, 400
istack:
	.space	400
	.global	__aeabi_fcmpge
	.global	__aeabi_fcmpgt
	.global	__aeabi_fcmplt
	.text
	.align	2
	.global	sort
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sort, %function
sort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
.L27:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	cmp	r3, #6
	bhi	.L2
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L3
.L9:
	ldr	r2, .L36
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L4
.L8:
	ldr	r2, .L36
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-36]	@ float
	bl	__aeabi_fcmpge
	mov	r3, r0
	cmp	r3, #0
	bne	.L33
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r2, [fp, #-8]
	ldr	r2, [r1, r2, lsl #2]	@ float
	ldr	r1, .L36
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bcs	.L8
	b	.L7
.L33:
	nop
.L7:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L3:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L9
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L34
	ldr	r3, [fp, #-24]
	sub	r2, r3, #1
	str	r2, [fp, #-24]
	ldr	r2, .L36+4
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	sub	r2, r3, #1
	str	r2, [fp, #-24]
	ldr	r2, .L36+4
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-20]
	b	.L27
.L2:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsr	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r2, .L36
	ldr	r3, [fp, #-28]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L36
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-28]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r2, [fp, #-32]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r2, .L36
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L13
	ldr	r2, .L36
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r2, .L36
	ldr	r3, [fp, #-12]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-20]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L13:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L36
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L15
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L36
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r2, [fp, #-12]
	ldr	r2, [r1, r2, lsl #2]	@ float
	ldr	r1, .L36
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L15:
	ldr	r2, .L36
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r3, [r1, r3, lsl #2]	@ float
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	beq	.L17
	ldr	r2, .L36
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L36
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-20]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r2, [fp, #-32]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
.L17:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L36
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-36]	@ float
.L25:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L19
.L20:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L19:
	ldr	r2, .L36
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-36]	@ float
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L20
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L21
.L22:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
.L21:
	ldr	r2, .L36
	ldr	r3, [fp, #-16]
	ldr	r3, [r2, r3, lsl #2]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-36]	@ float
	bl	__aeabi_fcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L22
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bcc	.L35
	ldr	r2, .L36
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]	@ float
	str	r3, [fp, #-32]	@ float
	ldr	r2, .L36
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-32]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	b	.L25
.L35:
	nop
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r1, .L36
	ldr	r2, [fp, #-16]
	ldr	r2, [r1, r2, lsl #2]	@ float
	ldr	r1, .L36
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r1, .L36
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-36]	@ float
	str	r2, [r1, r3, lsl #2]	@ float
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	add	r2, r3, #1
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r1, r3
	cmp	r2, r3
	bcc	.L26
	ldr	r2, [fp, #-12]
	ldr	r1, .L36+4
	ldr	r3, [fp, #-24]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	ldr	r1, .L36+4
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L27
.L26:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	mov	r1, r3
	ldr	r2, .L36+4
	ldr	r3, [fp, #-24]
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	ldr	r2, [fp, #-20]
	ldr	r1, .L36+4
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	b	.L27
.L34:
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	arr
	.word	istack
	.size	sort, .-sort
	.align	2
	.global	beebs_qsort_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_qsort_verify_benchmark, %function
beebs_qsort_verify_benchmark:
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
	.size	beebs_qsort_verify_benchmark, .-beebs_qsort_verify_benchmark
	.align	2
	.global	beebs_qsort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_qsort_initialise_benchmark, %function
beebs_qsort_initialise_benchmark:
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
	.size	beebs_qsort_initialise_benchmark, .-beebs_qsort_initialise_benchmark
	.align	2
	.global	beebs_qsort_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_qsort_benchmark, %function
beebs_qsort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #20
	bl	sort
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_qsort_benchmark, .-beebs_qsort_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
