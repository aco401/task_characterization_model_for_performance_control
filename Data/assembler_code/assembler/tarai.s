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
	.file	"libtarai.c"
	.text
	.align	2
	.global	tarai
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	tarai, %function
tarai:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	b	.L2
.L5:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	tarai
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	tarai
	str	r0, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	ble	.L7
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	tarai
	str	r0, [fp, #-24]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L5
	b	.L4
.L7:
	nop
.L4:
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	tarai, .-tarai
	.global	tarai_x
	.bss
	.align	2
	.type	tarai_x, %object
	.size	tarai_x, 4
tarai_x:
	.space	4
	.global	tarai_y
	.align	2
	.type	tarai_y, %object
	.size	tarai_y, 4
tarai_y:
	.space	4
	.global	tarai_z
	.align	2
	.type	tarai_z, %object
	.size	tarai_z, 4
tarai_z:
	.space	4
	.text
	.align	2
	.global	beebs_tarai_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_tarai_benchmark, %function
beebs_tarai_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, .L10
	ldr	r3, [r3]
	ldr	r2, .L10+4
	ldr	r1, [r2]
	ldr	r2, .L10+8
	ldr	r2, [r2]
	mov	r0, r3
	bl	tarai
	mov	r3, r0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	tarai_x
	.word	tarai_y
	.word	tarai_z
	.size	beebs_tarai_benchmark, .-beebs_tarai_benchmark
	.align	2
	.global	beebs_tarai_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_tarai_initialise_benchmark, %function
beebs_tarai_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L13
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L13+4
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, .L13+8
	mov	r2, #3
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	tarai_x
	.word	tarai_y
	.word	tarai_z
	.size	beebs_tarai_initialise_benchmark, .-beebs_tarai_initialise_benchmark
	.align	2
	.global	beebs_tarai_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_tarai_verify_benchmark, %function
beebs_tarai_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #9
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L16
	mov	r3, #0
	b	.L17
.L16:
	mov	r3, #1
.L17:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_tarai_verify_benchmark, .-beebs_tarai_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
