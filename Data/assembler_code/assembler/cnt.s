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
	.file	"cnt.c"
	.text
	.global	cnt_Seed
	.bss
	.align	2
	.type	cnt_Seed, %object
	.size	cnt_Seed, 4
cnt_Seed:
	.space	4
	.global	cnt_Array
	.align	2
	.type	cnt_Array, %object
	.size	cnt_Array, 400
cnt_Array:
	.space	400
	.global	Postotal
	.align	2
	.type	Postotal, %object
	.size	Postotal, 4
Postotal:
	.space	4
	.global	Negtotal
	.align	2
	.type	Negtotal, %object
	.size	Negtotal, 4
Negtotal:
	.space	4
	.global	Poscnt
	.align	2
	.type	Poscnt, %object
	.size	Poscnt, 4
Poscnt:
	.space	4
	.global	Negcnt
	.align	2
	.type	Negcnt, %object
	.size	Negcnt, 4
Negcnt:
	.space	4
	.text
	.align	2
	.global	beebs_cnt_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_cnt_benchmark, %function
beebs_cnt_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L3
	bl	Test
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	cnt_Array
	.size	beebs_cnt_benchmark, .-beebs_cnt_benchmark
	.align	2
	.global	Test
	.syntax unified
	.arm
	.fpu softvfp
	.type	Test, %function
Test:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	Sum
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	Test, .-Test
	.align	2
	.global	Initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	Initialize, %function
Initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	mov	r5, #0
	b	.L8
.L11:
	mov	r4, #0
	b	.L9
.L10:
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-24]
	add	r6, r3, r2
	bl	RandomInteger
	mov	r3, r0
	str	r3, [r6, r4, lsl #2]
	add	r4, r4, #1
.L9:
	cmp	r4, #9
	ble	.L10
	add	r5, r5, #1
.L8:
	cmp	r5, #9
	ble	.L11
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, lr}
	bx	lr
	.size	Initialize, .-Initialize
	.align	2
	.global	InitSeed
	.syntax unified
	.arm
	.fpu softvfp
	.type	InitSeed, %function
InitSeed:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L15
	mov	r2, #0
	str	r2, [r3]
	mov	r3, #0
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	cnt_Seed
	.size	InitSeed, .-InitSeed
	.align	2
	.global	Sum
	.syntax unified
	.arm
	.fpu softvfp
	.type	Sum, %function
Sum:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, fp}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r5, #0
	b	.L18
.L23:
	mov	r4, #0
	b	.L19
.L22:
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r3, [r3, r4, lsl #2]
	cmp	r3, #0
	bge	.L20
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r3, [r3, r4, lsl #2]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	b	.L21
.L20:
	mov	r2, r5
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-32]
	add	r3, r3, r2
	ldr	r3, [r3, r4, lsl #2]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L21:
	add	r4, r4, #1
.L19:
	cmp	r4, #9
	ble	.L22
	add	r5, r5, #1
.L18:
	cmp	r5, #9
	ble	.L23
	ldr	r2, .L25
	ldr	r3, [fp, #-16]
	str	r3, [r2]
	ldr	r2, .L25+4
	ldr	r3, [fp, #-24]
	str	r3, [r2]
	ldr	r2, .L25+8
	ldr	r3, [fp, #-20]
	str	r3, [r2]
	ldr	r2, .L25+12
	ldr	r3, [fp, #-28]
	str	r3, [r2]
	ldr	r3, .L25+8
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, r5, fp}
	bx	lr
.L26:
	.align	2
.L25:
	.word	Postotal
	.word	Poscnt
	.word	Negtotal
	.word	Negcnt
	.size	Sum, .-Sum
	.align	2
	.global	RandomInteger
	.syntax unified
	.arm
	.fpu softvfp
	.type	RandomInteger, %function
RandomInteger:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L29
	ldr	r2, [r3]
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	add	r1, r3, #81
	ldr	r3, .L29+4
	smull	r2, r3, r1, r3
	asr	r2, r3, #9
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #6
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, .L29
	str	r2, [r3]
	ldr	r3, .L29
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L30:
	.align	2
.L29:
	.word	cnt_Seed
	.word	271652039
	.size	RandomInteger, .-RandomInteger
	.align	2
	.global	beebs_cnt_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_cnt_initialise_benchmark, %function
beebs_cnt_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	InitSeed
	ldr	r0, .L32
	bl	Initialize
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	cnt_Array
	.size	beebs_cnt_initialise_benchmark, .-beebs_cnt_initialise_benchmark
	.align	2
	.global	beebs_cnt_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_cnt_verify_benchmark, %function
beebs_cnt_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L37
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	beq	.L35
	mov	r3, #0
	b	.L36
.L35:
	mov	r3, #1
.L36:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L38:
	.align	2
.L37:
	.word	396675
	.size	beebs_cnt_verify_benchmark, .-beebs_cnt_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
