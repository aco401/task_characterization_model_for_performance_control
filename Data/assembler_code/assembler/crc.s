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
	.file	"libcrc.c"
	.text
	.global	lin
	.section	.rodata
	.align	2
	.type	lin, %object
	.size	lin, 256
lin:
	.ascii	"asdffeagewaHAFEFaeDsFEawFdsFaefaeerdjgp\000"
	.space	216
	.text
	.align	2
	.global	icrc1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	icrc1, %function
icrc1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	mov	r2, r1
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, r2
	strb	r3, [fp, #-15]
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldrsh	r3, [fp, #-14]
	eor	r3, r3, r2
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L5:
	ldrsh	r3, [fp, #-10]
	cmp	r3, #0
	bge	.L3
	ldrh	r3, [fp, #-10]	@ movhi
	lsl	r3, r3, #1
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r3, [fp, #-10]	@ movhi
	eor	r3, r3, #4096
	eor	r3, r3, #33
	strh	r3, [fp, #-10]	@ movhi
	b	.L4
.L3:
	ldrh	r3, [fp, #-10]	@ movhi
	lsl	r3, r3, #1
	strh	r3, [fp, #-10]	@ movhi
.L4:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L5
	ldrh	r3, [fp, #-10]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	icrc1, .-icrc1
	.align	2
	.global	icrc
	.syntax unified
	.arm
	.fpu softvfp
	.type	icrc, %function
icrc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r1, [fp, #-28]
	str	r3, [fp, #-32]
	mov	r3, r0	@ movhi
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, r2	@ movhi
	strh	r3, [fp, #-24]	@ movhi
	ldrh	r3, [fp, #-22]	@ movhi
	strh	r3, [fp, #-20]	@ movhi
	ldr	r3, .L20
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L8
	ldr	r3, .L20
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-18]	@ movhi
	b	.L9
.L10:
	ldrh	r3, [fp, #-18]	@ movhi
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldrh	r4, [fp, #-18]
	mov	r1, #0
	mov	r0, r3
	bl	icrc1
	mov	r3, r0
	mov	r1, r3
	ldr	r2, .L20+4
	lsl	r3, r4, #1
	add	r3, r2, r3
	strh	r1, [r3]	@ movhi
	ldrh	r3, [fp, #-18]
	and	r3, r3, #15
	ldr	r2, .L20+8
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	lsl	r3, r3, #4
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldrh	r3, [fp, #-18]
	lsr	r3, r3, #4
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r1, r3
	ldr	r3, .L20+8
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	orr	r3, r2, r3
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldrh	r3, [fp, #-18]
	and	r1, r2, #255
	ldr	r2, .L20+12
	strb	r1, [r2, r3]
	ldrh	r3, [fp, #-18]
	add	r3, r3, #1
	strh	r3, [fp, #-18]	@ movhi
.L9:
	ldrh	r3, [fp, #-18]
	cmp	r3, #255
	bls	.L10
.L8:
	ldrsh	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L11
	ldrh	r3, [fp, #-24]	@ movhi
	and	r3, r3, #255
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldrh	r3, [fp, #-24]	@ movhi
	and	r3, r3, #255
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [fp, #-20]	@ movhi
	b	.L12
.L11:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bge	.L12
	ldrh	r3, [fp, #-20]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L20+12
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldrh	r3, [fp, #-20]	@ movhi
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L20+12
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [fp, #-20]	@ movhi
.L12:
	mov	r3, #1
	strh	r3, [fp, #-18]	@ movhi
	b	.L13
.L16:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bge	.L14
	ldrh	r3, [fp, #-18]
	ldr	r2, .L20+16
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L20+12
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldrh	r3, [fp, #-20]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #255
	eor	r3, r3, r2
	and	r3, r3, #255
	strh	r3, [fp, #-14]	@ movhi
	b	.L15
.L14:
	ldrh	r3, [fp, #-18]
	ldr	r2, .L20+16
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	ldrh	r3, [fp, #-20]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #255
	eor	r3, r3, r2
	and	r3, r3, #255
	strh	r3, [fp, #-14]	@ movhi
.L15:
	ldrh	r3, [fp, #-14]
	ldr	r2, .L20+4
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldrh	r3, [fp, #-20]	@ movhi
	and	r3, r3, #255
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	eor	r3, r3, r2
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [fp, #-20]	@ movhi
	ldrh	r3, [fp, #-18]
	add	r3, r3, #1
	strh	r3, [fp, #-18]	@ movhi
.L13:
	ldrh	r3, [fp, #-18]
	ldr	r2, [fp, #-28]
	cmp	r2, r3
	bcs	.L16
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	blt	.L17
	ldrh	r3, [fp, #-20]	@ movhi
	strh	r3, [fp, #-16]	@ movhi
	b	.L18
.L17:
	ldrh	r3, [fp, #-20]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r2, r3
	ldr	r3, .L20+12
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldrh	r3, [fp, #-20]	@ movhi
	and	r3, r3, #255
	mov	r1, r3
	ldr	r3, .L20+12
	ldrb	r3, [r3, r1]	@ zero_extendqisi2
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [fp, #-16]	@ movhi
.L18:
	ldrh	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	init.3
	.word	icrctb.2
	.word	it.1
	.word	rchr.0
	.word	lin
	.size	icrc, .-icrc
	.align	2
	.global	beebs_crc_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_crc_verify_benchmark, %function
beebs_crc_verify_benchmark:
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
	.size	beebs_crc_verify_benchmark, .-beebs_crc_verify_benchmark
	.align	2
	.global	beebs_crc_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_crc_initialise_benchmark, %function
beebs_crc_initialise_benchmark:
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
	.size	beebs_crc_initialise_benchmark, .-beebs_crc_initialise_benchmark
	.align	2
	.global	beebs_crc_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_crc_benchmark, %function
beebs_crc_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #40
	str	r3, [fp, #-8]
	mov	r3, #1
	mov	r2, #0
	ldr	r1, [fp, #-8]
	mov	r0, #0
	bl	icrc
	mov	r3, r0
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, [fp, #-8]
	add	r1, r3, #2
	ldrh	r0, [fp, #-10]
	mov	r3, #1
	mov	r2, #0
	bl	icrc
	mov	r3, r0
	strh	r3, [fp, #-12]	@ movhi
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_crc_benchmark, .-beebs_crc_benchmark
	.bss
	.align	1
init.3:
	.space	2
	.size	init.3, 2
	.align	2
icrctb.2:
	.space	512
	.size	icrctb.2, 512
	.data
	.align	2
	.type	it.1, %object
	.size	it.1, 16
it.1:
	.ascii	"\000\010\004\014\002\012\006\016\001\011\005\015\003"
	.ascii	"\013\007\017"
	.bss
	.align	2
rchr.0:
	.space	256
	.size	rchr.0, 256
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
