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
	.file	"md5.c"
	.text
	.data
	.align	2
	.type	input, %object
	.size	input, 64
input:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013\014"
	.ascii	"\015\016\017\000\001\002\003\004\005\006\007\010\011"
	.ascii	"\012\013\014\015\016\017\000\001\002\003\004\005\006"
	.ascii	"\007\010\011\012\013\014\015\016\017\000\001\002\003"
	.ascii	"\004\005\006\007\010\011\012\013\014\015\016\017"
	.text
	.align	2
	.global	_nettle_md5_compress
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	_nettle_md5_compress, %function
_nettle_md5_compress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #100
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-100]
	add	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r2, r3, #24
	ldr	r3, [fp, #-100]
	add	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #16
	orr	r2, r2, r3
	ldr	r3, [fp, #-100]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #8
	orr	r3, r2, r3
	ldr	r2, [fp, #-100]
	ldrb	r2, [r2]	@ zero_extendqisi2
	orr	r2, r3, r2
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-84]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-100]
	add	r3, r3, #4
	str	r3, [fp, #-100]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	bls	.L3
	ldr	r3, [fp, #-96]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-88]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+4
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #20
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+8
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #15
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+12
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #10
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+16
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+20
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #20
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+24
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #15
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+28
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #10
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+32
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+36
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #20
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	sub	r3, r3, #41984
	sub	r3, r3, #79
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #15
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+40
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #10
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+44
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #25
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+48
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #20
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+52
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #15
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+56
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #10
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+60
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #27
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+64
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #23
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+68
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #18
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-88]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+72
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #12
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+76
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #27
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+80
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #23
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+84
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #18
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+88
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #12
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+92
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #27
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+96
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #23
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+100
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #18
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+104
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #12
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	and	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+108
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #27
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	and	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+112
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #23
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	and	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+116
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #18
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	and	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+120
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #12
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+124
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #28
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+128
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #21
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+132
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+136
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #9
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+140
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #28
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+144
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #21
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+148
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+152
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #9
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+156
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #28
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-88]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+160
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #21
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+164
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+168
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #9
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+172
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #28
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+176
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #21
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+180
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #16
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+184
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #9
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mvn	r2, r3
	ldr	r3, [fp, #-16]
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-88]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+188
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #26
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	mvn	r2, r3
	ldr	r3, [fp, #-12]
	orr	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-60]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+192
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	mvn	r2, r3
	ldr	r3, [fp, #-24]
	orr	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-32]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+196
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	b	.L5
.L6:
	.align	2
.L4:
	.word	-680876936
	.word	-389564586
	.word	606105819
	.word	-1044525330
	.word	-176418897
	.word	1200080426
	.word	-1473231341
	.word	-45705983
	.word	1770035416
	.word	-1958414417
	.word	-1990404162
	.word	1804603682
	.word	-40341101
	.word	-1502002290
	.word	1236535329
	.word	-165796510
	.word	-1069501632
	.word	643717713
	.word	-373897302
	.word	-701558691
	.word	38016083
	.word	-660478335
	.word	-405537848
	.word	568446438
	.word	-1019803690
	.word	-187363961
	.word	1163531501
	.word	-1444681467
	.word	-51403784
	.word	1735328473
	.word	-1926607734
	.word	-378558
	.word	-2022574463
	.word	1839030562
	.word	-35309556
	.word	-1530992060
	.word	1272893353
	.word	-155497632
	.word	-1094730640
	.word	681279174
	.word	-358537222
	.word	-722521979
	.word	76029189
	.word	-640364487
	.word	-421815835
	.word	530742520
	.word	-995338651
	.word	-198630844
	.word	1126891415
	.word	-1416354905
	.word	-57434055
	.word	1700485571
	.word	-1894986606
	.word	-1051523
	.word	-2054922799
	.word	1873313359
	.word	-30611744
	.word	-1560198380
	.word	1309151649
	.word	-145523070
	.word	-1120210379
	.word	718787259
	.word	-343485551
.L5:
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	mvn	r2, r3
	ldr	r3, [fp, #-20]
	orr	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+200
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mvn	r2, r3
	ldr	r3, [fp, #-16]
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-40]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+204
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #26
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	mvn	r2, r3
	ldr	r3, [fp, #-12]
	orr	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+208
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	mvn	r2, r3
	ldr	r3, [fp, #-24]
	orr	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-48]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+212
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	mvn	r2, r3
	ldr	r3, [fp, #-20]
	orr	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-84]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+216
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mvn	r2, r3
	ldr	r3, [fp, #-16]
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-56]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+220
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #26
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	mvn	r2, r3
	ldr	r3, [fp, #-12]
	orr	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-28]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+224
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	mvn	r2, r3
	ldr	r3, [fp, #-24]
	orr	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+228
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	mvn	r2, r3
	ldr	r3, [fp, #-20]
	orr	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-36]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+232
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mvn	r2, r3
	ldr	r3, [fp, #-16]
	orr	r2, r2, r3
	ldr	r3, [fp, #-20]
	eor	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, .L4+236
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ror	r3, r3, #26
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	mvn	r2, r3
	ldr	r3, [fp, #-12]
	orr	r2, r2, r3
	ldr	r3, [fp, #-16]
	eor	r2, r2, r3
	ldr	r3, [fp, #-44]
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, .L4+240
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ror	r3, r3, #22
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-16]
	mvn	r2, r3
	ldr	r3, [fp, #-24]
	orr	r2, r2, r3
	ldr	r3, [fp, #-12]
	eor	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r2, r2, r3
	ldr	r3, .L4+244
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ror	r3, r3, #17
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	mvn	r2, r3
	ldr	r3, [fp, #-20]
	orr	r2, r2, r3
	ldr	r3, [fp, #-24]
	eor	r2, r2, r3
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L4+248
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ror	r3, r3, #11
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-96]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r2, r2, r3
	ldr	r3, [fp, #-96]
	str	r2, [r3]
	ldr	r3, [fp, #-96]
	add	r3, r3, #4
	ldr	r1, [r3]
	ldr	r3, [fp, #-96]
	add	r3, r3, #4
	ldr	r2, [fp, #-16]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-96]
	add	r3, r3, #8
	ldr	r1, [r3]
	ldr	r3, [fp, #-96]
	add	r3, r3, #8
	ldr	r2, [fp, #-20]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-96]
	add	r3, r3, #12
	ldr	r1, [r3]
	ldr	r3, [fp, #-96]
	add	r3, r3, #12
	ldr	r2, [fp, #-24]
	add	r2, r1, r2
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	_nettle_md5_compress, .-_nettle_md5_compress
	.section	.rodata
	.align	2
	.type	digest_ref, %object
	.size	digest_ref, 16
digest_ref:
	.word	1732584193
	.word	-271733879
	.word	-1732584194
	.word	271733878
	.global	digest
	.bss
	.align	2
	.type	digest, %object
	.size	digest, 16
digest:
	.space	16
	.text
	.align	2
	.global	beebs_nettle_md5_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_md5_initialise_benchmark, %function
beebs_nettle_md5_initialise_benchmark:
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
	.size	beebs_nettle_md5_initialise_benchmark, .-beebs_nettle_md5_initialise_benchmark
	.align	2
	.global	beebs_nettle_md5_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_md5_benchmark, %function
beebs_nettle_md5_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L10
	ldr	r3, .L10+4
	mov	ip, r2
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r1, .L10+8
	ldr	r0, .L10
	bl	_nettle_md5_compress
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	digest
	.word	digest_ref
	.word	input
	.size	beebs_nettle_md5_benchmark, .-beebs_nettle_md5_benchmark
	.section	.rodata
	.align	2
.LC0:
	.word	-575698923
	.word	558484367
	.word	-1663207939
	.word	346308135
	.text
	.align	2
	.global	beebs_nettle_md5_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_md5_verify_benchmark, %function
beebs_nettle_md5_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, .L14
	sub	ip, fp, #20
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	sub	r3, fp, #20
	mov	r2, #16
	mov	r1, r3
	ldr	r0, .L14+4
	bl	memcmp
	mov	r3, r0
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC0
	.word	digest
	.size	beebs_nettle_md5_verify_benchmark, .-beebs_nettle_md5_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
