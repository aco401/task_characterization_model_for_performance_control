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
	.file	"nettle-sha256.c"
	.text
	.align	2
	.global	_nettle_write_be32
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	_nettle_write_be32, %function
_nettle_write_be32:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	lsr	r3, r3, #2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	and	r3, r3, #3
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsr	r3, r3, #24
	and	r2, r3, #255
	ldr	r3, [fp, #-36]
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsr	r2, r3, #16
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	lsr	r2, r3, #8
	ldr	r3, [fp, #-36]
	add	r3, r3, #2
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	add	r3, r3, #3
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	add	r3, r3, #4
	str	r3, [fp, #-36]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcc	.L3
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L9
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	beq	.L5
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	bhi	.L6
	ldr	r3, [fp, #-20]
	cmp	r3, #1
	beq	.L7
	ldr	r3, [fp, #-20]
	cmp	r3, #2
	beq	.L8
.L6:
	bl	abort
.L5:
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #8
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	and	r2, r2, #255
	strb	r2, [r3]
.L8:
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #16
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	and	r2, r2, #255
	strb	r2, [r3]
.L7:
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #24
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	and	r2, r2, #255
	strb	r2, [r3]
.L9:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	_nettle_write_be32, .-_nettle_write_be32
	.align	2
	.global	_nettle_sha256_compress
	.syntax unified
	.arm
	.fpu softvfp
	.type	_nettle_sha256_compress, %function
_nettle_sha256_compress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 120
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #124
	str	r0, [fp, #-112]
	str	r1, [fp, #-116]
	str	r2, [fp, #-120]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L11
.L12:
	ldr	r3, [fp, #-116]
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r2, r3, #24
	ldr	r3, [fp, #-116]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #16
	orr	r2, r2, r3
	ldr	r3, [fp, #-116]
	add	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #8
	orr	r3, r2, r3
	ldr	r2, [fp, #-116]
	add	r2, r2, #3
	ldrb	r2, [r2]	@ zero_extendqisi2
	orr	r2, r3, r2
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-104]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-116]
	add	r3, r3, #4
	str	r3, [fp, #-116]
.L11:
	ldr	r3, [fp, #-40]
	cmp	r3, #15
	bls	.L12
	ldr	r3, [fp, #-112]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #24]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-112]
	ldr	r3, [r3, #28]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-40]
	sub	r3, fp, #108
	str	r3, [fp, #-44]
	b	.L13
.L14:
	ldr	r3, [fp, #-24]
	ror	r2, r3, #6
	ldr	r3, [fp, #-24]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	and	r1, r1, r3
	ldr	r3, [fp, #-32]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ror	r2, r3, #2
	ldr	r3, [fp, #-8]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	and	r1, r1, r3
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	eor	r0, r0, r3
	ldr	r3, [fp, #-16]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-20]
	ror	r2, r3, #6
	ldr	r3, [fp, #-20]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	and	r1, r1, r3
	ldr	r3, [fp, #-28]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #4
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #4
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ror	r2, r3, #2
	ldr	r3, [fp, #-36]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-8]
	and	r1, r1, r3
	ldr	r0, [fp, #-36]
	ldr	r3, [fp, #-8]
	eor	r0, r0, r3
	ldr	r3, [fp, #-12]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	ror	r2, r3, #6
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	and	r1, r1, r3
	ldr	r3, [fp, #-24]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #8
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #8
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	ror	r2, r3, #2
	ldr	r3, [fp, #-32]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	and	r1, r1, r3
	ldr	r0, [fp, #-32]
	ldr	r3, [fp, #-36]
	eor	r0, r0, r3
	ldr	r3, [fp, #-8]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	ror	r2, r3, #6
	ldr	r3, [fp, #-12]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	and	r1, r1, r3
	ldr	r3, [fp, #-20]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #12
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #12
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	ror	r2, r3, #2
	ldr	r3, [fp, #-28]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	and	r1, r1, r3
	ldr	r0, [fp, #-28]
	ldr	r3, [fp, #-32]
	eor	r0, r0, r3
	ldr	r3, [fp, #-36]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ror	r2, r3, #6
	ldr	r3, [fp, #-8]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	and	r1, r1, r3
	ldr	r3, [fp, #-16]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #16
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #16
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	ror	r2, r3, #2
	ldr	r3, [fp, #-24]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	and	r1, r1, r3
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-28]
	eor	r0, r0, r3
	ldr	r3, [fp, #-32]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ror	r2, r3, #6
	ldr	r3, [fp, #-36]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	and	r1, r1, r3
	ldr	r3, [fp, #-12]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #20
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #20
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	ror	r2, r3, #2
	ldr	r3, [fp, #-20]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	and	r1, r1, r3
	ldr	r0, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r0, r0, r3
	ldr	r3, [fp, #-28]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	ror	r2, r3, #6
	ldr	r3, [fp, #-32]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-8]
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	and	r1, r1, r3
	ldr	r3, [fp, #-8]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #24
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #24
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ror	r2, r3, #2
	ldr	r3, [fp, #-16]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	and	r1, r1, r3
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r0, r0, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	ror	r2, r3, #6
	ldr	r3, [fp, #-28]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	and	r1, r1, r3
	ldr	r3, [fp, #-36]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #28
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r3, r3, #28
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	ror	r2, r3, #2
	ldr	r3, [fp, #-12]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	and	r1, r1, r3
	ldr	r0, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r0, r0, r3
	ldr	r3, [fp, #-20]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r3, #8
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-120]
	add	r3, r3, #32
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-44]
	add	r3, r3, #32
	str	r3, [fp, #-44]
.L13:
	ldr	r3, [fp, #-40]
	cmp	r3, #15
	bls	.L14
	b	.L15
.L16:
	ldr	r3, [fp, #-24]
	ror	r2, r3, #6
	ldr	r3, [fp, #-24]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	and	r1, r1, r3
	ldr	r3, [fp, #-32]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-108]
	ldr	r3, [fp, #-52]
	ror	r0, r3, #17
	ldr	r3, [fp, #-52]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-52]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-72]
	add	r0, r0, r3
	ldr	r3, [fp, #-104]
	ror	ip, r3, #7
	ldr	r3, [fp, #-104]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-104]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ror	r2, r3, #2
	ldr	r3, [fp, #-8]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	and	r1, r1, r3
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	eor	r0, r0, r3
	ldr	r3, [fp, #-16]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-20]
	ror	r2, r3, #6
	ldr	r3, [fp, #-20]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	and	r1, r1, r3
	ldr	r3, [fp, #-28]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #4
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-104]
	ldr	r3, [fp, #-48]
	ror	r0, r3, #17
	ldr	r3, [fp, #-48]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-48]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-68]
	add	r0, r0, r3
	ldr	r3, [fp, #-100]
	ror	ip, r3, #7
	ldr	r3, [fp, #-100]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-100]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-104]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ror	r2, r3, #2
	ldr	r3, [fp, #-36]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-8]
	and	r1, r1, r3
	ldr	r0, [fp, #-36]
	ldr	r3, [fp, #-8]
	eor	r0, r0, r3
	ldr	r3, [fp, #-12]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	ror	r2, r3, #6
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	and	r1, r1, r3
	ldr	r3, [fp, #-24]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #8
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-100]
	ldr	r3, [fp, #-108]
	ror	r0, r3, #17
	ldr	r3, [fp, #-108]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-108]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-64]
	add	r0, r0, r3
	ldr	r3, [fp, #-96]
	ror	ip, r3, #7
	ldr	r3, [fp, #-96]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-96]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	ror	r2, r3, #2
	ldr	r3, [fp, #-32]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	and	r1, r1, r3
	ldr	r0, [fp, #-32]
	ldr	r3, [fp, #-36]
	eor	r0, r0, r3
	ldr	r3, [fp, #-8]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	ror	r2, r3, #6
	ldr	r3, [fp, #-12]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	and	r1, r1, r3
	ldr	r3, [fp, #-20]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #12
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-96]
	ldr	r3, [fp, #-104]
	ror	r0, r3, #17
	ldr	r3, [fp, #-104]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-104]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-60]
	add	r0, r0, r3
	ldr	r3, [fp, #-92]
	ror	ip, r3, #7
	ldr	r3, [fp, #-92]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-92]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	ror	r2, r3, #2
	ldr	r3, [fp, #-28]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	and	r1, r1, r3
	ldr	r0, [fp, #-28]
	ldr	r3, [fp, #-32]
	eor	r0, r0, r3
	ldr	r3, [fp, #-36]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ror	r2, r3, #6
	ldr	r3, [fp, #-8]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	and	r1, r1, r3
	ldr	r3, [fp, #-16]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #16
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-92]
	ldr	r3, [fp, #-100]
	ror	r0, r3, #17
	ldr	r3, [fp, #-100]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-100]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-56]
	add	r0, r0, r3
	ldr	r3, [fp, #-88]
	ror	ip, r3, #7
	ldr	r3, [fp, #-88]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-88]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	ror	r2, r3, #2
	ldr	r3, [fp, #-24]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	and	r1, r1, r3
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-28]
	eor	r0, r0, r3
	ldr	r3, [fp, #-32]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ror	r2, r3, #6
	ldr	r3, [fp, #-36]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	and	r1, r1, r3
	ldr	r3, [fp, #-12]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #20
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-88]
	ldr	r3, [fp, #-96]
	ror	r0, r3, #17
	ldr	r3, [fp, #-96]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-96]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-52]
	add	r0, r0, r3
	ldr	r3, [fp, #-84]
	ror	ip, r3, #7
	ldr	r3, [fp, #-84]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-84]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	ror	r2, r3, #2
	ldr	r3, [fp, #-20]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	and	r1, r1, r3
	ldr	r0, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r0, r0, r3
	ldr	r3, [fp, #-28]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	ror	r2, r3, #6
	ldr	r3, [fp, #-32]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-8]
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	and	r1, r1, r3
	ldr	r3, [fp, #-8]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #24
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-84]
	ldr	r3, [fp, #-92]
	ror	r0, r3, #17
	ldr	r3, [fp, #-92]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-92]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-48]
	add	r0, r0, r3
	ldr	r3, [fp, #-80]
	ror	ip, r3, #7
	ldr	r3, [fp, #-80]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-80]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ror	r2, r3, #2
	ldr	r3, [fp, #-16]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	and	r1, r1, r3
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r0, r0, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	ror	r2, r3, #6
	ldr	r3, [fp, #-28]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	and	r1, r1, r3
	ldr	r3, [fp, #-36]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #28
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-80]
	ldr	r3, [fp, #-88]
	ror	r0, r3, #17
	ldr	r3, [fp, #-88]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-88]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-108]
	add	r0, r0, r3
	ldr	r3, [fp, #-76]
	ror	ip, r3, #7
	ldr	r3, [fp, #-76]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-76]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	ror	r2, r3, #2
	ldr	r3, [fp, #-12]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	and	r1, r1, r3
	ldr	r0, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r0, r0, r3
	ldr	r3, [fp, #-20]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	ror	r2, r3, #6
	ldr	r3, [fp, #-24]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	eor	r1, r1, r3
	ldr	r3, [fp, #-24]
	and	r1, r1, r3
	ldr	r3, [fp, #-32]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #32
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-76]
	ldr	r3, [fp, #-84]
	ror	r0, r3, #17
	ldr	r3, [fp, #-84]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-84]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-104]
	add	r0, r0, r3
	ldr	r3, [fp, #-72]
	ror	ip, r3, #7
	ldr	r3, [fp, #-72]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-72]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ror	r2, r3, #2
	ldr	r3, [fp, #-8]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	and	r1, r1, r3
	ldr	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	eor	r0, r0, r3
	ldr	r3, [fp, #-16]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-20]
	ror	r2, r3, #6
	ldr	r3, [fp, #-20]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	eor	r1, r1, r3
	ldr	r3, [fp, #-20]
	and	r1, r1, r3
	ldr	r3, [fp, #-28]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #36
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-72]
	ldr	r3, [fp, #-80]
	ror	r0, r3, #17
	ldr	r3, [fp, #-80]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-80]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-100]
	add	r0, r0, r3
	ldr	r3, [fp, #-68]
	ror	ip, r3, #7
	ldr	r3, [fp, #-68]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-68]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ror	r2, r3, #2
	ldr	r3, [fp, #-36]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-8]
	and	r1, r1, r3
	ldr	r0, [fp, #-36]
	ldr	r3, [fp, #-8]
	eor	r0, r0, r3
	ldr	r3, [fp, #-12]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	ror	r2, r3, #6
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r1, r1, r3
	ldr	r3, [fp, #-16]
	and	r1, r1, r3
	ldr	r3, [fp, #-24]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #40
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-68]
	ldr	r3, [fp, #-76]
	ror	r0, r3, #17
	ldr	r3, [fp, #-76]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-76]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-96]
	add	r0, r0, r3
	ldr	r3, [fp, #-64]
	ror	ip, r3, #7
	ldr	r3, [fp, #-64]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-64]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	ror	r2, r3, #2
	ldr	r3, [fp, #-32]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	and	r1, r1, r3
	ldr	r0, [fp, #-32]
	ldr	r3, [fp, #-36]
	eor	r0, r0, r3
	ldr	r3, [fp, #-8]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	ror	r2, r3, #6
	ldr	r3, [fp, #-12]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r1, r1, r3
	ldr	r3, [fp, #-12]
	and	r1, r1, r3
	ldr	r3, [fp, #-20]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #44
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-64]
	ldr	r3, [fp, #-72]
	ror	r0, r3, #17
	ldr	r3, [fp, #-72]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-72]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-92]
	add	r0, r0, r3
	ldr	r3, [fp, #-60]
	ror	ip, r3, #7
	ldr	r3, [fp, #-60]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-60]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	ror	r2, r3, #2
	ldr	r3, [fp, #-28]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-28]
	ldr	r3, [fp, #-32]
	and	r1, r1, r3
	ldr	r0, [fp, #-28]
	ldr	r3, [fp, #-32]
	eor	r0, r0, r3
	ldr	r3, [fp, #-36]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ror	r2, r3, #6
	ldr	r3, [fp, #-8]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-8]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r1, r1, r3
	ldr	r3, [fp, #-8]
	and	r1, r1, r3
	ldr	r3, [fp, #-16]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #48
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-60]
	ldr	r3, [fp, #-68]
	ror	r0, r3, #17
	ldr	r3, [fp, #-68]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-68]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-88]
	add	r0, r0, r3
	ldr	r3, [fp, #-56]
	ror	ip, r3, #7
	ldr	r3, [fp, #-56]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-56]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	ror	r2, r3, #2
	ldr	r3, [fp, #-24]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-28]
	and	r1, r1, r3
	ldr	r0, [fp, #-24]
	ldr	r3, [fp, #-28]
	eor	r0, r0, r3
	ldr	r3, [fp, #-32]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-36]
	ror	r2, r3, #6
	ldr	r3, [fp, #-36]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-8]
	ldr	r3, [fp, #-12]
	eor	r1, r1, r3
	ldr	r3, [fp, #-36]
	and	r1, r1, r3
	ldr	r3, [fp, #-12]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #52
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-56]
	ldr	r3, [fp, #-64]
	ror	r0, r3, #17
	ldr	r3, [fp, #-64]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-64]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-84]
	add	r0, r0, r3
	ldr	r3, [fp, #-52]
	ror	ip, r3, #7
	ldr	r3, [fp, #-52]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-52]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-20]
	ror	r2, r3, #2
	ldr	r3, [fp, #-20]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-20]
	ldr	r3, [fp, #-24]
	and	r1, r1, r3
	ldr	r0, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r0, r0, r3
	ldr	r3, [fp, #-28]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	ror	r2, r3, #6
	ldr	r3, [fp, #-32]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-36]
	ldr	r3, [fp, #-8]
	eor	r1, r1, r3
	ldr	r3, [fp, #-32]
	and	r1, r1, r3
	ldr	r3, [fp, #-8]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #56
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-52]
	ldr	r3, [fp, #-60]
	ror	r0, r3, #17
	ldr	r3, [fp, #-60]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-60]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-80]
	add	r0, r0, r3
	ldr	r3, [fp, #-48]
	ror	ip, r3, #7
	ldr	r3, [fp, #-48]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-48]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ror	r2, r3, #2
	ldr	r3, [fp, #-16]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-16]
	ldr	r3, [fp, #-20]
	and	r1, r1, r3
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r0, r0, r3
	ldr	r3, [fp, #-24]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-28]
	ror	r2, r3, #6
	ldr	r3, [fp, #-28]
	ror	r3, r3, #11
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	ror	r3, r3, #25
	eor	r2, r2, r3
	ldr	r1, [fp, #-32]
	ldr	r3, [fp, #-36]
	eor	r1, r1, r3
	ldr	r3, [fp, #-28]
	and	r1, r1, r3
	ldr	r3, [fp, #-36]
	eor	r3, r3, r1
	add	r2, r2, r3
	ldr	r3, [fp, #-120]
	add	r3, r3, #60
	ldr	r3, [r3]
	add	r2, r2, r3
	ldr	r1, [fp, #-48]
	ldr	r3, [fp, #-56]
	ror	r0, r3, #17
	ldr	r3, [fp, #-56]
	ror	r3, r3, #19
	eor	r0, r0, r3
	ldr	r3, [fp, #-56]
	lsr	r3, r3, #10
	eor	r0, r0, r3
	ldr	r3, [fp, #-76]
	add	r0, r0, r3
	ldr	r3, [fp, #-108]
	ror	ip, r3, #7
	ldr	r3, [fp, #-108]
	ror	r3, r3, #18
	eor	ip, ip, r3
	ldr	r3, [fp, #-108]
	lsr	r3, r3, #3
	eor	r3, r3, ip
	add	r3, r0, r3
	add	r3, r1, r3
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	ror	r2, r3, #2
	ldr	r3, [fp, #-12]
	ror	r3, r3, #13
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	ror	r3, r3, #22
	eor	r2, r2, r3
	ldr	r1, [fp, #-12]
	ldr	r3, [fp, #-16]
	and	r1, r1, r3
	ldr	r0, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r0, r0, r3
	ldr	r3, [fp, #-20]
	and	r3, r3, r0
	eor	r3, r3, r1
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-40]
	add	r3, r3, #16
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-120]
	add	r3, r3, #64
	str	r3, [fp, #-120]
.L15:
	ldr	r3, [fp, #-40]
	cmp	r3, #63
	bls	.L16
	ldr	r3, [fp, #-112]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-112]
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #4
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #4
	ldr	r2, [fp, #-12]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #8
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #8
	ldr	r2, [fp, #-16]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #12
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #12
	ldr	r2, [fp, #-20]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #16
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #16
	ldr	r2, [fp, #-24]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #20
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #20
	ldr	r2, [fp, #-28]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #24
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #24
	ldr	r2, [fp, #-32]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #28
	ldr	r1, [r3]
	ldr	r3, [fp, #-112]
	add	r3, r3, #28
	ldr	r2, [fp, #-36]
	add	r2, r1, r2
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	_nettle_sha256_compress, .-_nettle_sha256_compress
	.section	.rodata
	.align	2
	.type	K, %object
	.size	K, 256
K:
	.word	1116352408
	.word	1899447441
	.word	-1245643825
	.word	-373957723
	.word	961987163
	.word	1508970993
	.word	-1841331548
	.word	-1424204075
	.word	-670586216
	.word	310598401
	.word	607225278
	.word	1426881987
	.word	1925078388
	.word	-2132889090
	.word	-1680079193
	.word	-1046744716
	.word	-459576895
	.word	-272742522
	.word	264347078
	.word	604807628
	.word	770255983
	.word	1249150122
	.word	1555081692
	.word	1996064986
	.word	-1740746414
	.word	-1473132947
	.word	-1341970488
	.word	-1084653625
	.word	-958395405
	.word	-710438585
	.word	113926993
	.word	338241895
	.word	666307205
	.word	773529912
	.word	1294757372
	.word	1396182291
	.word	1695183700
	.word	1986661051
	.word	-2117940946
	.word	-1838011259
	.word	-1564481375
	.word	-1474664885
	.word	-1035236496
	.word	-949202525
	.word	-778901479
	.word	-694614492
	.word	-200395387
	.word	275423344
	.word	430227734
	.word	506948616
	.word	659060556
	.word	883997877
	.word	958139571
	.word	1322822218
	.word	1537002063
	.word	1747873779
	.word	1955562222
	.word	2024104815
	.word	-2067236844
	.word	-1933114872
	.word	-1866530822
	.word	-1538233109
	.word	-1090935817
	.word	-965641998
	.text
	.align	2
	.global	sha256_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sha256_init, %function
sha256_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #32
	ldr	r1, .L18
	mov	r0, r3
	bl	memcpy
	ldr	r1, [fp, #-8]
	mov	r2, #0
	mov	r3, #0
	str	r2, [r1, #32]
	str	r3, [r1, #36]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #104]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	H0.1
	.size	sha256_init, .-sha256_init
	.align	2
	.global	sha256_update
	.syntax unified
	.arm
	.fpu softvfp
	.type	sha256_update, %function
sha256_update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #24
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #104]
	cmp	r3, #0
	beq	.L24
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #104]
	rsb	r3, r3, #64
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bcs	.L22
	ldr	r3, [fp, #-32]
	add	r2, r3, #40
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #104]
	add	r3, r2, r3
	ldr	r2, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r0, r3
	bl	memcpy
	ldr	r3, [fp, #-32]
	ldr	r2, [r3, #104]
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #104]
	b	.L23
.L22:
	ldr	r3, [fp, #-32]
	add	r2, r3, #40
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #104]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-40]
	mov	r0, r3
	bl	memcpy
	ldr	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	add	r3, r3, #40
	ldr	r2, .L26
	mov	r1, r3
	bl	_nettle_sha256_compress
	ldr	r3, [fp, #-32]
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	adds	r6, r2, #1
	adc	r7, r3, #0
	ldr	r3, [fp, #-32]
	str	r6, [r3, #32]
	str	r7, [r3, #36]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	b	.L24
.L25:
	ldr	r3, [fp, #-32]
	ldr	r2, .L26
	ldr	r1, [fp, #-40]
	mov	r0, r3
	bl	_nettle_sha256_compress
	ldr	r3, [fp, #-32]
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	adds	r4, r2, #1
	adc	r5, r3, #0
	ldr	r3, [fp, #-32]
	str	r4, [r3, #32]
	str	r5, [r3, #36]
	ldr	r3, [fp, #-40]
	add	r3, r3, #64
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #64
	str	r3, [fp, #-36]
.L24:
	ldr	r3, [fp, #-36]
	cmp	r3, #63
	bhi	.L25
	ldr	r3, [fp, #-32]
	add	r3, r3, #40
	ldr	r2, [fp, #-36]
	ldr	r1, [fp, #-40]
	mov	r0, r3
	bl	memcpy
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #104]
	nop
.L23:
	nop
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	K
	.size	sha256_update, .-sha256_update
	.section	.rodata
	.align	2
.LC0:
	.ascii	"length <= SHA256_DIGEST_SIZE\000"
	.align	2
.LC1:
	.ascii	"/home/tobi/RIOT_ARBEIT/BME68x/RIOT/build/pkg/beebs/"
	.ascii	"src/nettle-sha256/nettle-sha256.c\000"
	.align	2
.LC2:
	.ascii	"__md_i < sizeof((ctx)->block)\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sha256_write_digest, %function
sha256_write_digest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #32
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	ldr	r3, [fp, #-44]
	cmp	r3, #32
	bls	.L29
	ldr	r3, .L32
	ldr	r2, .L32+4
	ldr	r1, .L32+8
	ldr	r0, .L32+12
	bl	__assert_func
.L29:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #104]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #63
	bls	.L30
	ldr	r3, .L32+16
	ldr	r2, .L32+4
	mov	r1, #356
	ldr	r0, .L32+12
	bl	__assert_func
.L30:
	ldr	r3, [fp, #-24]
	add	r2, r3, #1
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	mvn	r2, #127
	strb	r2, [r3, #40]
	ldr	r3, [fp, #-24]
	cmp	r3, #56
	bls	.L31
	ldr	r3, [fp, #-40]
	add	r2, r3, #40
	ldr	r3, [fp, #-24]
	add	r0, r2, r3
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #64
	mov	r2, r3
	mov	r1, #0
	bl	memset
	ldr	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	add	r3, r3, #40
	ldr	r2, .L32+20
	mov	r1, r3
	bl	_nettle_sha256_compress
	mov	r3, #0
	str	r3, [fp, #-24]
.L31:
	ldr	r3, [fp, #-40]
	add	r2, r3, #40
	ldr	r3, [fp, #-24]
	add	r0, r2, r3
	ldr	r3, [fp, #-24]
	rsb	r3, r3, #56
	mov	r2, r3
	mov	r1, #0
	bl	memset
	ldr	r3, [fp, #-40]
	add	r1, r3, #32
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r1, #9
	orr	r3, r3, r0, lsr #23
	lsl	r2, r0, #9
	ldr	r1, [fp, #-40]
	ldr	r1, [r1, #104]
	lsl	r1, r1, #3
	mov	r0, #0
	mov	r4, r1
	mov	r5, r0
	orr	r6, r2, r4
	orr	r7, r3, r5
	str	r6, [fp, #-36]
	str	r7, [fp, #-32]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r1, #24
	mov	r3, #0
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #96]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r1, #16
	mov	r3, #0
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #97]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r1, #8
	mov	r3, #0
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #98]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	mov	r2, r1
	mov	r3, #0
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #99]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #24
	orr	r2, r2, r1, lsl #8
	lsr	r3, r1, #24
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #100]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #16
	orr	r2, r2, r1, lsl #16
	lsr	r3, r1, #16
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #101]
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	lsr	r2, r0, #8
	orr	r2, r2, r1, lsl #24
	lsr	r3, r1, #8
	and	r2, r2, #255
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #102]
	ldrb	r2, [fp, #-36]	@ zero_extendqisi2
	ldr	r3, [fp, #-40]
	strb	r2, [r3, #103]
	ldr	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	add	r3, r3, #40
	ldr	r2, .L32+20
	mov	r1, r3
	bl	_nettle_sha256_compress
	ldr	r3, [fp, #-40]
	mov	r2, r3
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-44]
	bl	_nettle_write_be32
	nop
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
.L33:
	.align	2
.L32:
	.word	.LC0
	.word	__func__.0
	.word	354
	.word	.LC1
	.word	.LC2
	.word	K
	.size	sha256_write_digest, .-sha256_write_digest
	.align	2
	.global	sha256_digest
	.syntax unified
	.arm
	.fpu softvfp
	.type	sha256_digest, %function
sha256_digest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sha256_write_digest
	ldr	r0, [fp, #-8]
	bl	sha256_init
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sha256_digest, .-sha256_digest
	.global	nettle_sha256
	.section	.rodata
	.align	2
.LC3:
	.ascii	"sha256\000"
	.align	2
	.type	nettle_sha256, %object
	.size	nettle_sha256, 28
nettle_sha256:
	.word	.LC3
	.word	112
	.word	32
	.word	64
	.word	sha256_init
	.word	sha256_update
	.word	sha256_digest
	.global	msg
	.data
	.align	2
	.type	msg, %object
	.size	msg, 56
msg:
	.ascii	"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomno"
	.ascii	"pnopq"
	.global	hash
	.align	2
	.type	hash, %object
	.size	hash, 32
hash:
	.ascii	"$\215ja\322\0068\270\345\300&\223\014>`9\243<\344Yd"
	.ascii	"\377!g\366\354\355\324\031\333\006\301"
	.global	buffer
	.bss
	.align	2
	.type	buffer, %object
	.size	buffer, 32
buffer:
	.space	32
	.text
	.align	2
	.global	beebs_nettle_sha256_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_sha256_verify_benchmark, %function
beebs_nettle_sha256_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #1
	strb	r3, [fp, #-5]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L36
.L38:
	ldr	r2, .L40
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r1, .L40+4
	ldr	r3, [fp, #-12]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L37
	mov	r3, #0
	strb	r3, [fp, #-5]
.L37:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L36:
	ldr	r3, [fp, #-12]
	cmp	r3, #7
	bls	.L38
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L41:
	.align	2
.L40:
	.word	hash
	.word	buffer
	.size	beebs_nettle_sha256_verify_benchmark, .-beebs_nettle_sha256_verify_benchmark
	.align	2
	.global	beebs_nettle_sha256_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_sha256_initialise_benchmark, %function
beebs_nettle_sha256_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r2, #32
	mov	r1, #0
	ldr	r0, .L43
	bl	memset
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	buffer
	.size	beebs_nettle_sha256_initialise_benchmark, .-beebs_nettle_sha256_initialise_benchmark
	.align	2
	.global	beebs_nettle_sha256_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_sha256_benchmark, %function
beebs_nettle_sha256_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 112
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #116
	ldr	r2, .L47
	sub	r3, fp, #124
	mov	r0, r3
	mov	lr, pc
	bx	r2
	ldr	r4, .L47+4
	sub	r3, fp, #124
	ldr	r2, .L47+8
	mov	r1, #56
	mov	r0, r3
	mov	lr, pc
	bx	r4
	ldr	r4, .L47+12
	mov	r1, #32
	sub	r3, fp, #124
	ldr	r2, .L47+16
	mov	r0, r3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	sha256_init
	.word	sha256_update
	.word	msg
	.word	sha256_digest
	.word	buffer
	.size	beebs_nettle_sha256_benchmark, .-beebs_nettle_sha256_benchmark
	.section	.rodata
	.align	2
	.type	H0.1, %object
	.size	H0.1, 32
H0.1:
	.word	1779033703
	.word	-1150833019
	.word	1013904242
	.word	-1521486534
	.word	1359893119
	.word	-1694144372
	.word	528734635
	.word	1541459225
	.align	2
	.type	__func__.0, %object
	.size	__func__.0, 20
__func__.0:
	.ascii	"sha256_write_digest\000"
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
