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
	.file	"arcfour.c"
	.text
	.section	.rodata
	.align	2
	.type	key, %object
	.size	key, 16
key:
	.ascii	"\017\016\015\014\013\012\011\010\007\006\005\004\003"
	.ascii	"\002\001\000"
	.align	2
	.type	data, %object
	.size	data, 16
data:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013\014"
	.ascii	"\015\016\017"
	.bss
	.align	2
result:
	.space	16
	.size	result, 16
	.global	arcfour_ctx
	.align	2
	.type	arcfour_ctx, %object
	.size	arcfour_ctx, 258
arcfour_ctx:
	.space	258
	.global	__aeabi_uidivmod
	.text
	.align	2
	.global	arcfour_set_key
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	arcfour_set_key, %function
arcfour_set_key:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	and	r1, r3, #255
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #255
	bls	.L3
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L4
.L5:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r1, r3
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	and	r1, r3, #255
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	ldr	r2, [fp, #-28]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-8]
	cmp	r3, #255
	bls	.L5
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #257]
	ldr	r3, [fp, #-24]
	ldrb	r2, [r3, #257]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	strb	r2, [r3, #256]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	arcfour_set_key, .-arcfour_set_key
	.align	2
	.global	arcfour_crypt
	.syntax unified
	.arm
	.fpu softvfp
	.type	arcfour_crypt, %function
arcfour_crypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, r7, fp}
	add	fp, sp, #16
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-24]
	ldrb	r6, [r3, #256]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	ldrb	r4, [r3, #257]	@ zero_extendqisi2
	b	.L7
.L8:
	mov	r3, r6
	add	r3, r3, #1
	and	r6, r3, #255
	mov	r2, r6
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	mov	r5, r3
	and	r3, r5, #255
	add	r3, r4, r3
	and	r4, r3, #255
	mov	r1, r4
	mov	r3, r6
	ldr	r2, [fp, #-24]
	ldrb	r1, [r2, r1]	@ zero_extendqisi2
	ldr	r2, [fp, #-24]
	strb	r1, [r2, r3]
	ldr	r2, [fp, #-24]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r7, r3
	mov	r2, r4
	and	r1, r5, #255
	ldr	r3, [fp, #-24]
	strb	r1, [r3, r2]
	ldr	r3, [fp, #-36]
	add	r2, r3, #1
	str	r2, [fp, #-36]
	ldrb	r1, [r3]	@ zero_extendqisi2
	add	r3, r5, r7
	and	r3, r3, #255
	ldr	r2, [fp, #-24]
	ldrb	r2, [r2, r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	add	r0, r3, #1
	str	r0, [fp, #-32]
	eor	r2, r2, r1
	and	r2, r2, #255
	strb	r2, [r3]
.L7:
	ldr	r3, [fp, #-28]
	sub	r2, r3, #1
	str	r2, [fp, #-28]
	cmp	r3, #0
	bne	.L8
	ldr	r3, [fp, #-24]
	mov	r2, r6
	strb	r2, [r3, #256]
	ldr	r3, [fp, #-24]
	mov	r2, r4
	strb	r2, [r3, #257]
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, fp}
	bx	lr
	.size	arcfour_crypt, .-arcfour_crypt
	.align	2
	.global	beebs_nettle_arcfour_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_arcfour_initialise_benchmark, %function
beebs_nettle_arcfour_initialise_benchmark:
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
	.size	beebs_nettle_arcfour_initialise_benchmark, .-beebs_nettle_arcfour_initialise_benchmark
	.align	2
	.global	beebs_nettle_arcfour_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_arcfour_benchmark, %function
beebs_nettle_arcfour_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L12
	mov	r1, #16
	ldr	r0, .L12+4
	bl	arcfour_set_key
	ldr	r3, .L12+8
	ldr	r2, .L12+12
	mov	r1, #16
	ldr	r0, .L12+4
	bl	arcfour_crypt
	ldr	r2, .L12
	mov	r1, #16
	ldr	r0, .L12+4
	bl	arcfour_set_key
	ldr	r3, .L12+12
	ldr	r2, .L12+12
	mov	r1, #16
	ldr	r0, .L12+4
	bl	arcfour_crypt
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	key
	.word	arcfour_ctx
	.word	data
	.word	result
	.size	beebs_nettle_arcfour_benchmark, .-beebs_nettle_arcfour_benchmark
	.section	.rodata
	.align	2
.LC0:
	.word	0
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	14
	.word	15
	.text
	.align	2
	.global	beebs_nettle_arcfour_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_arcfour_verify_benchmark, %function
beebs_nettle_arcfour_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	str	r0, [fp, #-80]
	ldr	r3, .L20
	sub	ip, fp, #72
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L15
.L18:
	ldr	r2, .L20+4
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-68]
	cmp	r2, r3
	beq	.L16
	mov	r3, #0
	b	.L19
.L16:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L15:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	ble	.L18
	mov	r3, #1
.L19:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LC0
	.word	result
	.size	beebs_nettle_arcfour_verify_benchmark, .-beebs_nettle_arcfour_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
