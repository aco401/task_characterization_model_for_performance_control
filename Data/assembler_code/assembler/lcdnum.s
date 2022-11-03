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
	.file	"liblcdnum.c"
	.text
	.align	2
	.global	num_to_lcd
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	num_to_lcd, %function
num_to_lcd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #15
	ldrls	pc, [pc, r3, asl #2]
	b	.L2
.L4:
	.word	.L19
	.word	.L18
	.word	.L17
	.word	.L16
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L12
	.word	.L11
	.word	.L10
	.word	.L9
	.word	.L8
	.word	.L7
	.word	.L6
	.word	.L5
	.word	.L3
.L19:
	mov	r3, #0
	b	.L20
.L18:
	mov	r3, #36
	b	.L20
.L17:
	mov	r3, #93
	b	.L20
.L16:
	mov	r3, #109
	b	.L20
.L15:
	mov	r3, #46
	b	.L20
.L14:
	mov	r3, #93
	b	.L20
.L13:
	mov	r3, #123
	b	.L20
.L12:
	mov	r3, #37
	b	.L20
.L11:
	mov	r3, #127
	b	.L20
.L10:
	mov	r3, #111
	b	.L20
.L9:
	mov	r3, #63
	b	.L20
.L8:
	mov	r3, #122
	b	.L20
.L7:
	mov	r3, #83
	b	.L20
.L6:
	mov	r3, #124
	b	.L20
.L5:
	mov	r3, #91
	b	.L20
.L3:
	mov	r3, #27
	b	.L20
.L2:
	mov	r3, #0
.L20:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	num_to_lcd, .-num_to_lcd
	.global	IN
	.bss
	.type	IN, %object
	.size	IN, 1
IN:
	.space	1
	.global	OUT
	.type	OUT, %object
	.size	OUT, 1
OUT:
	.space	1
	.text
	.align	2
	.global	beebs_lcdnum_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_lcdnum_verify_benchmark, %function
beebs_lcdnum_verify_benchmark:
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
	.size	beebs_lcdnum_verify_benchmark, .-beebs_lcdnum_verify_benchmark
	.align	2
	.global	beebs_lcdnum_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_lcdnum_initialise_benchmark, %function
beebs_lcdnum_initialise_benchmark:
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
	.size	beebs_lcdnum_initialise_benchmark, .-beebs_lcdnum_initialise_benchmark
	.align	2
	.global	beebs_lcdnum_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_lcdnum_benchmark, %function
beebs_lcdnum_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #10
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L25
.L27:
	ldr	r3, .L29
	ldrb	r3, [r3]
	strb	r3, [fp, #-13]
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	bgt	.L26
	ldrb	r3, [fp, #-13]
	and	r3, r3, #15
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	mov	r0, r3
	bl	num_to_lcd
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L29+4
	strb	r2, [r3]
.L26:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L25:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	blt	.L27
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	IN
	.word	OUT
	.size	beebs_lcdnum_benchmark, .-beebs_lcdnum_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
