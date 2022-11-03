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
	.file	"libduff.c"
	.text
	.align	2
	.global	duffcopy
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	duffcopy, %function
duffcopy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #7
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	movge	r3, r3
	asr	r3, r3, #3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	rsbs	r2, r3, #0
	and	r3, r3, #7
	and	r2, r2, #7
	rsbpl	r3, r2, #0
	cmp	r3, #7
	ldrls	pc, [pc, r3, asl #2]
	b	.L12
.L4:
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L5
	.word	.L3
.L13:
	nop
.L11:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L3:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L5:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L6:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L7:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L8:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L9:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L10:
	ldr	r2, [fp, #-20]
	add	r3, r2, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r1, r3, #1
	str	r1, [fp, #-16]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L13
.L12:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	duffcopy, .-duffcopy
	.global	source
	.bss
	.align	2
	.type	source, %object
	.size	source, 100
source:
	.space	100
	.global	target
	.align	2
	.type	target, %object
	.size	target, 100
target:
	.space	100
	.text
	.align	2
	.global	beebs_duff_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_duff_benchmark, %function
beebs_duff_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r2, #43
	ldr	r1, .L16
	ldr	r0, .L16+4
	bl	duffcopy
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	target
	.word	source
	.size	beebs_duff_benchmark, .-beebs_duff_benchmark
	.align	2
	.global	beebs_duff_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_duff_initialise_benchmark, %function
beebs_duff_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L19
.L20:
	ldr	r3, [fp, #-8]
	and	r3, r3, #255
	rsb	r3, r3, #100
	and	r1, r3, #255
	ldr	r2, .L21
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L20
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	source
	.size	beebs_duff_initialise_benchmark, .-beebs_duff_initialise_benchmark
	.align	2
	.global	beebs_duff_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_duff_verify_benchmark, %function
beebs_duff_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L27:
	ldr	r2, .L28
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r1, .L28+4
	ldr	r3, [fp, #-8]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L25
	mov	r3, #0
	b	.L26
.L25:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #42
	ble	.L27
	mov	r3, #1
.L26:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L29:
	.align	2
.L28:
	.word	source
	.word	target
	.size	beebs_duff_verify_benchmark, .-beebs_duff_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
