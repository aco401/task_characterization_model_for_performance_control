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
	.file	"libndes.c"
	.text
	.global	bit
	.bss
	.align	2
	.type	bit, %object
	.size	bit, 132
bit:
	.space	132
	.align	2
icd:
	.space	8
	.size	icd, 8
	.section	.rodata
	.align	2
	.type	ipc1, %object
	.size	ipc1, 57
ipc1:
	.ascii	"\00091)!\031\021\011\001:2*\"\032\022\012\002;3+#\033"
	.ascii	"\023\013\003<4,$?7/'\037\027\017\007>6.&\036\026\016"
	.ascii	"\006=5-%\035\025\015\005\034\024\014\004"
	.align	2
	.type	ipc2, %object
	.size	ipc2, 49
ipc2:
	.ascii	"\000\016\021\013\030\001\005\003\034\017\006\025\012"
	.ascii	"\027\023\014\004\032\010\020\007\033\024\015\002)4\037"
	.ascii	"%/7\036(3-!0,1'8\"5.*2$\035 "
	.text
	.align	2
	.global	des
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	des, %function
des:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #76
	sub	ip, fp, #68
	stm	ip, {r0, r1}
	sub	r1, fp, #76
	stm	r1, {r2, r3}
	ldr	r3, .L18
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L2
	ldr	r3, .L18
	mov	r2, #0
	str	r2, [r3]
	mov	r3, #1
	str	r3, [fp, #-28]
	ldr	r2, .L18+4
	ldr	r3, [fp, #-28]
	str	r3, [r2, #4]
	mov	r3, #2
	str	r3, [fp, #-20]
	b	.L3
.L4:
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r1, .L18+4
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-28]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L3:
	ldr	r3, [fp, #-20]
	cmp	r3, #32
	ble	.L4
.L2:
	ldr	r3, [fp, #4]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L5
	ldr	r3, [fp, #4]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L18+8
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L18+8
	ldr	r3, [r3]
	ldr	r2, .L18+8
	str	r3, [r2, #4]
	mov	r3, #28
	str	r3, [fp, #-20]
	mov	r3, #56
	str	r3, [fp, #-24]
	b	.L6
.L7:
	ldr	r3, .L18+8
	ldr	r3, [r3, #4]
	lsl	r4, r3, #1
	ldr	r2, .L18+12
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, #32
	sub	r1, fp, #76
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	orr	r3, r4, r3
	ldr	r2, .L18+8
	str	r3, [r2, #4]
	ldr	r3, .L18+8
	ldr	r3, [r3]
	lsl	r4, r3, #1
	ldr	r2, .L18+12
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, #32
	sub	r1, fp, #76
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	orr	r3, r4, r3
	ldr	r2, .L18+8
	str	r3, [r2]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L6:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L7
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L8
.L9:
	ldr	r1, .L18+16
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r2, r1, r3
	sub	r3, fp, #56
	ldm	r2, {r0, r1, r2}
	stm	r3, {r0, r1, r2}
	sub	r3, fp, #56
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	ks
	ldr	r1, .L18+16
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	mov	ip, r3
	sub	r3, fp, #56
	ldm	r3, {r0, r1, r2}
	stm	ip, {r0, r1, r2}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L8:
	ldr	r3, [fp, #-16]
	cmp	r3, #16
	ble	.L9
.L5:
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #32
	str	r3, [fp, #-20]
	mov	r3, #64
	str	r3, [fp, #-24]
	b	.L10
.L11:
	ldr	r3, [fp, #-40]
	lsl	r4, r3, #1
	ldr	r2, .L18+20
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, #32
	sub	r1, fp, #68
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	orr	r3, r4, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-44]
	lsl	r4, r3, #1
	ldr	r2, .L18+20
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, #32
	sub	r1, fp, #68
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	orr	r3, r4, r3
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L10:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L11
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L12
.L15:
	ldr	r3, [fp, #8]
	cmp	r3, #1
	bne	.L13
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #17
	b	.L14
.L13:
	ldr	r3, [fp, #-16]
.L14:
	str	r3, [fp, #-32]
	ldr	r0, [fp, #-44]
	ldr	r1, .L18+16
	ldr	r2, [fp, #-32]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r1, r3
	sub	r2, fp, #36
	str	r2, [sp]
	ldm	r3, {r1, r2, r3}
	bl	cyfun
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	eor	r3, r3, r2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L12:
	ldr	r3, [fp, #-16]
	cmp	r3, #16
	ble	.L15
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #12]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #12]
	ldr	r2, [r3]
	ldr	r3, [fp, #12]
	str	r2, [r3, #4]
	mov	r3, #32
	str	r3, [fp, #-20]
	mov	r3, #64
	str	r3, [fp, #-24]
	b	.L16
.L17:
	ldr	r3, [fp, #12]
	ldr	r3, [r3, #4]
	lsl	r4, r3, #1
	ldr	r2, .L18+24
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, #32
	sub	r1, fp, #44
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	orr	r2, r4, r3
	ldr	r3, [fp, #12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #12]
	ldr	r3, [r3]
	lsl	r4, r3, #1
	ldr	r2, .L18+24
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	mov	r3, #32
	sub	r1, fp, #44
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	orr	r2, r4, r3
	ldr	r3, [fp, #12]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L16:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L17
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	initflag.7
	.word	bit
	.word	icd
	.word	ipc1
	.word	kns.6
	.word	ip.5
	.word	ipm.4
	.size	des, .-des
	.align	2
	.global	getbit
	.syntax unified
	.arm
	.fpu softvfp
	.type	getbit, %function
getbit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	sub	ip, fp, #12
	stm	ip, {r0, r1}
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L21
	ldr	r2, .L27
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L22
	mov	r3, #1
	b	.L24
.L22:
	mov	r3, #0
	b	.L24
.L21:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	ldr	r2, .L27
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L25
	mov	r3, #1
	b	.L24
.L25:
	mov	r3, #0
.L24:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L28:
	.align	2
.L27:
	.word	bit
	.size	getbit, .-getbit
	.align	2
	.global	ks
	.syntax unified
	.arm
	.fpu softvfp
	.type	ks, %function
ks:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	beq	.L30
	ldr	r3, [fp, #-32]
	cmp	r3, #2
	beq	.L30
	ldr	r3, [fp, #-32]
	cmp	r3, #9
	beq	.L30
	ldr	r3, [fp, #-32]
	cmp	r3, #16
	bne	.L31
.L30:
	ldr	r3, .L37
	ldr	r2, [r3, #4]
	ldr	r3, .L37
	ldr	r3, [r3, #4]
	lsl	r3, r3, #28
	and	r3, r3, #268435456
	orr	r3, r2, r3
	lsr	r3, r3, #1
	ldr	r2, .L37
	str	r3, [r2, #4]
	ldr	r3, .L37
	ldr	r2, [r3]
	ldr	r3, .L37
	ldr	r3, [r3]
	lsl	r3, r3, #28
	and	r3, r3, #268435456
	orr	r3, r2, r3
	lsr	r3, r3, #1
	ldr	r2, .L37
	str	r3, [r2]
	b	.L32
.L31:
	mov	r3, #1
	str	r3, [fp, #-16]
	b	.L33
.L34:
	ldr	r3, .L37
	ldr	r2, [r3, #4]
	ldr	r3, .L37
	ldr	r3, [r3, #4]
	lsl	r3, r3, #28
	and	r3, r3, #268435456
	orr	r3, r2, r3
	lsr	r3, r3, #1
	ldr	r2, .L37
	str	r3, [r2, #4]
	ldr	r3, .L37
	ldr	r2, [r3]
	ldr	r3, .L37
	ldr	r3, [r3]
	lsl	r3, r3, #28
	and	r3, r3, #268435456
	orr	r3, r2, r3
	lsr	r3, r3, #1
	ldr	r2, .L37
	str	r3, [r2]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L33:
	ldr	r3, [fp, #-16]
	cmp	r3, #2
	ble	.L34
.L32:
	ldr	r3, [fp, #-36]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-36]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-36]
	str	r2, [r3, #8]
	mov	r3, #16
	str	r3, [fp, #-20]
	mov	r3, #32
	str	r3, [fp, #-24]
	mov	r3, #48
	str	r3, [fp, #-28]
	b	.L35
.L36:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #8]
	lsl	r4, r3, #1
	ldr	r2, .L37+4
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, .L37
	mov	r3, #28
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r2, r4, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #4]
	lsl	r4, r3, #1
	ldr	r2, .L37+4
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, .L37
	mov	r3, #28
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r2, r4, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	lsl	r4, r3, #1
	ldr	r2, .L37+4
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r1, .L37
	mov	r3, #28
	ldm	r1, {r0, r1}
	bl	getbit
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	orr	r2, r4, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
.L35:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L36
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	icd
	.word	ipc2
	.size	ks, .-ks
	.align	2
	.global	cyfun
	.syntax unified
	.arm
	.fpu softvfp
	.type	cyfun, %function
cyfun:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #92
	str	r0, [fp, #-80]
	sub	r0, fp, #92
	stm	r0, {r1, r2, r3}
	ldr	r3, .L56
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-52]
	mov	r3, #16
	str	r3, [fp, #-24]
	mov	r3, #32
	str	r3, [fp, #-28]
	mov	r3, #48
	str	r3, [fp, #-32]
	b	.L40
.L47:
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #1
	ldr	r1, .L56+4
	ldr	r2, [fp, #-24]
	ldr	r2, [r1, r2, lsl #2]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-36]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-80]
	and	r2, r2, r1
	cmp	r2, #0
	beq	.L41
	mov	r2, #1
	b	.L42
.L41:
	mov	r2, #0
.L42:
	orr	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #1
	ldr	r1, .L56+4
	ldr	r2, [fp, #-28]
	ldr	r2, [r1, r2, lsl #2]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-36]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-80]
	and	r2, r2, r1
	cmp	r2, #0
	beq	.L43
	mov	r2, #1
	b	.L44
.L43:
	mov	r2, #0
.L44:
	orr	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #1
	ldr	r1, .L56+4
	ldr	r2, [fp, #-32]
	ldr	r2, [r1, r2, lsl #2]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-36]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-80]
	and	r2, r2, r1
	cmp	r2, #0
	beq	.L45
	mov	r2, #1
	b	.L46
.L45:
	mov	r2, #0
.L46:
	orr	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L40:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L47
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-84]
	eor	r3, r3, r2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-88]
	eor	r3, r3, r2
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-92]
	eor	r3, r3, r2
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-56]
	lsl	r2, r3, #16
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-60]
	lsl	r2, r3, #8
	ldr	r3, [fp, #-56]
	lsr	r3, r3, #8
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r3, #1
	str	r3, [fp, #-24]
	mov	r3, #5
	str	r3, [fp, #-32]
	b	.L48
.L49:
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	and	r3, r3, #63
	and	r1, r3, #255
	sub	r2, fp, #72
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	and	r3, r3, #255
	and	r3, r3, #63
	and	r1, r3, #255
	sub	r2, fp, #72
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #6
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #6
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L48:
	ldr	r3, [fp, #-24]
	cmp	r3, #4
	ble	.L49
	mov	r3, #0
	str	r3, [fp, #-8]
	mov	r3, #8
	str	r3, [fp, #-20]
	b	.L50
.L51:
	sub	r2, fp, #72
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #1
	and	r2, r3, #2
	ldr	r3, [fp, #-24]
	asr	r3, r3, #5
	and	r3, r3, #1
	orr	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	and	r2, r3, #8
	ldr	r3, [fp, #-24]
	and	r3, r3, #4
	orr	r2, r2, r3
	ldr	r3, [fp, #-24]
	asr	r3, r3, #2
	and	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [fp, #-24]
	asr	r3, r3, #4
	and	r3, r3, #1
	add	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r0, .L56+8
	ldr	r3, [fp, #-40]
	ldr	r1, [fp, #-44]
	mov	r2, r3
	lsl	r2, r2, #3
	add	r2, r2, r3
	mov	r3, r1
	lsl	r3, r3, #3
	add	r3, r3, r1
	lsl	r3, r3, #2
	add	r3, r2, r3
	add	r2, r0, r3
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r1, .L56+12
	ldr	r2, [fp, #-48]
	add	r2, r1, r2
	ldrb	r2, [r2]	@ zero_extendqisi2
	orr	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L50:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bgt	.L51
	ldr	r3, [fp, #4]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L56
	str	r3, [fp, #-36]
	mov	r3, #32
	str	r3, [fp, #-24]
	b	.L52
.L55:
	ldr	r3, [fp, #4]
	ldr	r3, [r3]
	lsl	r3, r3, #1
	ldr	r1, .L56+16
	ldr	r2, [fp, #-24]
	ldr	r2, [r1, r2, lsl #2]
	lsl	r2, r2, #2
	ldr	r1, [fp, #-36]
	add	r2, r1, r2
	ldr	r1, [r2]
	ldr	r2, [fp, #-8]
	and	r2, r2, r1
	cmp	r2, #0
	beq	.L53
	mov	r2, #1
	b	.L54
.L53:
	mov	r2, #0
.L54:
	orr	r2, r2, r3
	ldr	r3, [fp, #4]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #1
	str	r3, [fp, #-24]
.L52:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L55
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L57:
	.align	2
.L56:
	.word	bit
	.word	iet.3
	.word	is.2
	.word	ibin.1
	.word	ipp.0
	.size	cyfun, .-cyfun
	.global	value
	.data
	.align	2
	.type	value, %object
	.size	value, 4
value:
	.word	1
	.global	ndes_out
	.bss
	.align	2
	.type	ndes_out, %object
	.size	ndes_out, 8
ndes_out:
	.space	8
	.align	2
inp:
	.space	8
	.size	inp, 8
	.align	2
key:
	.space	8
	.size	key, 8
	.align	2
newkey:
	.space	4
	.size	newkey, 4
	.align	2
isw:
	.space	4
	.size	isw, 4
	.text
	.align	2
	.global	beebs_ndes_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ndes_benchmark, %function
beebs_ndes_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r3, .L60
	ldr	r3, [r3]
	ldr	r2, .L60+4
	ldr	r1, .L60+8
	ldr	r0, .L60+12
	str	r0, [sp, #8]
	str	r3, [sp, #4]
	ldr	r3, .L60+16
	str	r3, [sp]
	ldm	r2, {r2, r3}
	ldm	r1, {r0, r1}
	bl	des
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L61:
	.align	2
.L60:
	.word	isw
	.word	key
	.word	inp
	.word	ndes_out
	.word	newkey
	.size	beebs_ndes_benchmark, .-beebs_ndes_benchmark
	.align	2
	.global	beebs_ndes_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ndes_initialise_benchmark, %function
beebs_ndes_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L63
	mov	r2, #35
	str	r2, [r3]
	ldr	r3, .L63
	mov	r2, #26
	str	r2, [r3, #4]
	ldr	r3, .L63+4
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, .L63+4
	mov	r2, #16
	str	r2, [r3, #4]
	ldr	r3, .L63+8
	ldr	r3, [r3]
	ldr	r2, .L63+12
	str	r3, [r2]
	ldr	r3, .L63+8
	ldr	r3, [r3]
	ldr	r2, .L63+16
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L64:
	.align	2
.L63:
	.word	inp
	.word	key
	.word	value
	.word	newkey
	.word	isw
	.size	beebs_ndes_initialise_benchmark, .-beebs_ndes_initialise_benchmark
	.align	2
	.global	beebs_ndes_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ndes_verify_benchmark, %function
beebs_ndes_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L69
	str	r3, [fp, #-8]
	ldr	r3, .L69+4
	str	r3, [fp, #-12]
	ldr	r3, .L69+8
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	beq	.L66
	mov	r3, #0
	b	.L67
.L66:
	ldr	r3, .L69+8
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	beq	.L68
	mov	r3, #0
	b	.L67
.L68:
	mov	r3, #1
.L67:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L70:
	.align	2
.L69:
	.word	-1805379403
	.word	1806503748
	.word	ndes_out
	.size	beebs_ndes_verify_benchmark, .-beebs_ndes_verify_benchmark
	.data
	.align	2
	.type	initflag.7, %object
	.size	initflag.7, 4
initflag.7:
	.word	1
	.bss
	.align	2
kns.6:
	.space	204
	.size	kns.6, 204
	.section	.rodata
	.align	2
	.type	ip.5, %object
	.size	ip.5, 65
ip.5:
	.ascii	"\000:2*\"\032\022\012\002<4,$\034\024\014\004>6.&\036"
	.ascii	"\026\016\006@80( \030\020\01091)!\031\021\011\001;3"
	.ascii	"+#\033\023\013\003=5-%\035\025\015\005?7/'\037\027\017"
	.ascii	"\007"
	.align	2
	.type	ipm.4, %object
	.size	ipm.4, 65
ipm.4:
	.ascii	"\000(\0100\0208\030@ '\007/\0177\027?\037&\006.\016"
	.ascii	"6\026>\036%\005-\0155\025=\035$\004,\0144\024<\034#"
	.ascii	"\003+\0133\023;\033\"\002*\0122\022:\032!\001)\0111"
	.ascii	"\0219\031"
	.align	2
	.type	iet.3, %object
	.size	iet.3, 196
iet.3:
	.word	0
	.word	32
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	8
	.word	9
	.word	10
	.word	11
	.word	12
	.word	13
	.word	12
	.word	13
	.word	14
	.word	15
	.word	16
	.word	17
	.word	16
	.word	17
	.word	18
	.word	19
	.word	20
	.word	21
	.word	20
	.word	21
	.word	22
	.word	23
	.word	24
	.word	25
	.word	24
	.word	25
	.word	26
	.word	27
	.word	28
	.word	29
	.word	28
	.word	29
	.word	30
	.word	31
	.word	32
	.word	1
	.align	2
	.type	is.2, %object
	.size	is.2, 576
is.2:
	.ascii	"\000\016\017\012\007\002\014\004\015"
	.ascii	"\000\000\003\015\015\016\012\015\001"
	.ascii	"\000\004\000\015\012\004\011\001\007"
	.ascii	"\000\017\015\001\003\013\004\006\002"
	.ascii	"\000\004\001\000\015\014\001\013\002"
	.ascii	"\000\017\015\007\010\013\017\000\017"
	.ascii	"\000\001\016\006\006\002\016\004\013"
	.ascii	"\000\014\010\012\017\010\003\013\001"
	.ascii	"\000\015\010\011\016\004\012\002\010"
	.ascii	"\000\007\004\000\013\002\004\013\015"
	.ascii	"\000\016\007\004\011\001\017\013\004"
	.ascii	"\000\010\012\015\000\014\002\015\016"
	.ascii	"\000\001\016\016\003\001\017\016\004"
	.ascii	"\000\004\007\011\005\014\002\007\010"
	.ascii	"\000\010\013\011\000\013\005\015\001"
	.ascii	"\000\002\001\000\006\007\014\010\007"
	.ascii	"\000\002\006\006\000\007\011\017\006"
	.ascii	"\000\016\017\003\006\004\007\004\012"
	.ascii	"\000\015\012\010\014\012\002\014\011"
	.ascii	"\000\004\003\006\012\001\011\001\004"
	.ascii	"\000\017\013\003\006\012\002\000\017"
	.ascii	"\000\002\002\004\017\007\014\011\003"
	.ascii	"\000\006\004\017\013\015\010\003\014"
	.ascii	"\000\011\017\011\001\016\005\004\012"
	.ascii	"\000\013\003\017\011\013\006\010\013"
	.ascii	"\000\015\010\006\000\015\011\001\007"
	.ascii	"\000\002\015\003\007\007\014\007\016"
	.ascii	"\000\001\004\010\015\002\017\012\010"
	.ascii	"\000\010\004\005\012\006\010\015\001"
	.ascii	"\000\001\016\012\003\001\005\012\004"
	.ascii	"\000\013\001\000\015\010\003\016\002"
	.ascii	"\000\007\002\007\010\015\012\007\015"
	.ascii	"\000\003\011\001\001\010\000\003\012"
	.ascii	"\000\012\014\002\004\005\006\016\014"
	.ascii	"\000\017\005\013\017\017\007\012\000"
	.ascii	"\000\005\013\004\011\006\013\011\017"
	.ascii	"\000\012\007\015\002\005\015\014\011"
	.ascii	"\000\006\000\010\007\000\001\003\005"
	.ascii	"\000\014\010\001\001\011\000\017\006"
	.ascii	"\000\013\006\017\004\017\016\005\014"
	.ascii	"\000\006\002\014\010\003\003\011\003"
	.ascii	"\000\014\001\005\002\017\015\005\006"
	.ascii	"\000\011\014\002\003\014\004\006\012"
	.ascii	"\000\003\007\016\005\000\001\000\011"
	.ascii	"\000\014\015\007\005\017\004\007\016"
	.ascii	"\000\013\012\016\014\012\016\014\013"
	.ascii	"\000\007\006\014\016\005\012\010\015"
	.ascii	"\000\016\014\003\013\011\007\017\000"
	.ascii	"\000\005\014\013\013\015\016\005\005"
	.ascii	"\000\011\006\014\001\003\000\002\000"
	.ascii	"\000\003\011\005\005\006\001\000\017"
	.ascii	"\000\012\000\013\014\012\006\016\003"
	.ascii	"\000\011\000\004\014\000\007\012\000"
	.ascii	"\000\005\011\013\012\011\013\017\016"
	.ascii	"\000\012\003\012\002\003\015\005\003"
	.ascii	"\000\000\005\005\007\004\000\002\005"
	.ascii	"\000\000\005\002\004\016\005\006\014"
	.ascii	"\000\003\013\017\016\010\003\010\011"
	.ascii	"\000\005\002\016\010\000\013\011\005"
	.ascii	"\000\006\016\002\002\005\010\003\006"
	.ascii	"\000\007\012\010\017\011\013\001\007"
	.ascii	"\000\010\005\001\011\006\010\006\002"
	.ascii	"\000\000\017\007\004\016\006\002\010"
	.ascii	"\000\015\011\014\016\003\015\014\013"
	.data
	.align	2
	.type	ibin.1, %object
	.size	ibin.1, 16
ibin.1:
	.ascii	"\000\010\004\014\002\012\006\016\001\011\005\015\003"
	.ascii	"\013\007\017"
	.section	.rodata
	.align	2
	.type	ipp.0, %object
	.size	ipp.0, 132
ipp.0:
	.word	0
	.word	16
	.word	7
	.word	20
	.word	21
	.word	29
	.word	12
	.word	28
	.word	17
	.word	1
	.word	15
	.word	23
	.word	26
	.word	5
	.word	18
	.word	31
	.word	10
	.word	2
	.word	8
	.word	24
	.word	14
	.word	32
	.word	27
	.word	3
	.word	9
	.word	19
	.word	13
	.word	30
	.word	6
	.word	22
	.word	11
	.word	4
	.word	25
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
