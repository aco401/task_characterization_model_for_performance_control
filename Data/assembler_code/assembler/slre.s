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
	.file	"libslre.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	is_metacharacter, %function
is_metacharacter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, .L3
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	mov	r0, r2
	bl	strchr
	mov	r3, r0
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	metacharacters.0
	.size	is_metacharacter, .-is_metacharacter
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	op_len, %function
op_len:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #92
	bne	.L6
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #120
	beq	.L7
.L6:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #92
	bne	.L8
	mov	r3, #2
	b	.L11
.L8:
	mov	r3, #1
	b	.L11
.L7:
	mov	r3, #4
.L11:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	op_len, .-op_len
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	set_len, %function
set_len:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L15:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r0, r3
	bl	op_len
	mov	r2, r0
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
.L13:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L14
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #93
	bne	.L15
.L14:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L16
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	b	.L18
.L16:
	mvn	r3, #0
.L18:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	set_len, .-set_len
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	get_op_len, %function
get_op_len:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #91
	bne	.L20
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	set_len
	mov	r3, r0
	add	r3, r3, #1
	b	.L22
.L20:
	ldr	r0, [fp, #-8]
	bl	op_len
	mov	r3, r0
.L22:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	get_op_len, .-get_op_len
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	is_quantifier, %function
is_quantifier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #42
	beq	.L24
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #43
	beq	.L24
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #63
	bne	.L25
.L24:
	mov	r3, #1
	b	.L27
.L25:
	mov	r3, #0
.L27:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	is_quantifier, .-is_quantifier
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	toi, %function
toi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, .L32
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-8]
	sub	r3, r3, #48
	b	.L31
.L29:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #87
.L31:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L33:
	.align	2
.L32:
	.word	_ctype_
	.size	toi, .-toi
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	hextoi, %function
hextoi:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L40
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L35
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #32
	b	.L36
.L35:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
.L36:
	mov	r0, r3
	bl	toi
	mov	r3, r0
	lsl	r4, r3, #4
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #1]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L40
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L37
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #32
	b	.L38
.L37:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
.L38:
	mov	r0, r3
	bl	toi
	mov	r3, r0
	orr	r3, r4, r3
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	_ctype_
	.size	hextoi, .-hextoi
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	match_op, %function
match_op:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #124
	beq	.L67
	cmp	r3, #124
	bgt	.L44
	cmp	r3, #92
	beq	.L45
	cmp	r3, #92
	bgt	.L44
	cmp	r3, #36
	beq	.L68
	cmp	r3, #46
	beq	.L47
	b	.L44
.L45:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #120
	beq	.L48
	cmp	r3, #120
	bgt	.L49
	cmp	r3, #115
	beq	.L50
	cmp	r3, #115
	bgt	.L49
	cmp	r3, #83
	beq	.L51
	cmp	r3, #100
	beq	.L52
	b	.L49
.L51:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L69
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	beq	.L53
	mvn	r3, #0
	b	.L54
.L53:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L55
.L50:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L69
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #8
	cmp	r3, #0
	bne	.L56
	mvn	r3, #0
	b	.L54
.L56:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L55
.L52:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L69
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #4
	cmp	r3, #0
	bne	.L57
	mvn	r3, #0
	b	.L54
.L57:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L55
.L48:
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	mov	r0, r3
	bl	hextoi
	mov	r2, r0
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L58
	mvn	r3, #0
	b	.L54
.L58:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L55
.L49:
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L59
	mvn	r3, #0
	b	.L54
.L59:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	nop
.L55:
	b	.L60
.L67:
	mvn	r3, #3
	b	.L54
.L68:
	mvn	r3, #0
	b	.L54
.L47:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L60
.L44:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2416]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L61
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]
	strb	r3, [fp, #-9]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L69
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L62
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	add	r2, r3, #32
	b	.L63
.L62:
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
.L63:
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]
	strb	r3, [fp, #-10]
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r1, .L69
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L64
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
	add	r3, r3, #32
	b	.L65
.L64:
	ldrb	r3, [fp, #-10]	@ zero_extendqisi2
.L65:
	cmp	r2, r3
	beq	.L66
	mvn	r3, #0
	b	.L54
.L61:
	ldr	r3, [fp, #-16]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L66
	mvn	r3, #0
	b	.L54
.L66:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	nop
.L60:
	ldr	r3, [fp, #-8]
.L54:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L70:
	.align	2
.L69:
	.word	_ctype_
	.size	match_op, .-match_op
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	match_set, %function
match_set:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	str	r2, [fp, #-48]
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-8]
	mvn	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #94
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-44]
	sub	r3, r3, #1
	str	r3, [fp, #-44]
	b	.L73
.L90:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #45
	beq	.L74
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #45
	bne	.L74
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #93
	beq	.L74
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-52]
	ldr	r3, [r3, #2416]
	cmp	r3, #0
	beq	.L75
	ldr	r3, [fp, #-48]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-40]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L76
	ldr	r3, [fp, #-48]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldr	r1, [fp, #-40]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bhi	.L76
	mov	r3, #1
	b	.L78
.L76:
	mov	r3, #0
	b	.L78
.L75:
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	ldr	r2, .L96
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L79
	ldr	r3, [fp, #-20]
	add	r2, r3, #32
	b	.L80
.L79:
	ldr	r2, [fp, #-20]
.L80:
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-40]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldr	r1, .L96
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L81
	ldr	r3, [fp, #-24]
	add	r3, r3, #32
	b	.L82
.L81:
	ldr	r3, [fp, #-24]
.L82:
	cmp	r2, r3
	blt	.L83
	ldr	r3, [fp, #-48]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldr	r2, .L96
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L84
	ldr	r3, [fp, #-28]
	add	r2, r3, #32
	b	.L85
.L84:
	ldr	r2, [fp, #-28]
.L85:
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldr	r1, [fp, #-40]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	ldr	r1, .L96
	add	r3, r3, r1
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #3
	cmp	r3, #1
	bne	.L86
	ldr	r3, [fp, #-32]
	add	r3, r3, #32
	b	.L87
.L86:
	ldr	r3, [fp, #-32]
.L87:
	cmp	r2, r3
	bgt	.L83
	mov	r3, #1
	b	.L78
.L83:
	mov	r3, #0
.L78:
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #3
	str	r3, [fp, #-8]
	b	.L73
.L74:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [fp, #-52]
	ldr	r1, [fp, #-48]
	mov	r0, r3
	bl	match_op
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	mov	r0, r3
	bl	op_len
	mov	r2, r0
	ldr	r3, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-8]
.L73:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bgt	.L89
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #93
	beq	.L89
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L90
.L89:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L91
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bgt	.L92
.L91:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L93
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bgt	.L93
.L92:
	mov	r3, #1
	b	.L95
.L93:
	mvn	r3, #0
.L95:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	_ctype_
	.size	match_set, .-match_set
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	bar, %function
bar:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #72
	str	r0, [fp, #-56]
	str	r1, [fp, #-60]
	str	r2, [fp, #-64]
	str	r3, [fp, #-68]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L99
.L137:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #40
	bne	.L100
	ldr	r3, [fp, #8]
	add	r3, r3, #1
	ldr	r2, [fp, #4]
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	add	r3, r3, #2
	b	.L101
.L100:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	mov	r1, r3
	bl	get_op_len
	mov	r3, r0
.L101:
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	mov	r0, r3
	bl	is_quantifier
	mov	r3, r0
	cmp	r3, #0
	beq	.L102
	mvn	r3, #1
	b	.L103
.L102:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bgt	.L104
	mvn	r3, #4
	b	.L103
.L104:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-60]
	cmp	r2, r3
	ble	.L105
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	mov	r0, r3
	bl	is_quantifier
	mov	r3, r0
	cmp	r3, #0
	beq	.L105
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #63
	bne	.L106
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-64]
	add	r1, r2, r3
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-12]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r1
	ldr	r1, [fp, #-44]
	bl	bar
	str	r0, [fp, #-52]
	ldr	r3, [fp, #-52]
	bic	r3, r3, r3, asr #31
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L138
.L106:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #43
	beq	.L108
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #42
	bne	.L138
.L108:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-24]
	mvn	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bge	.L116
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #63
	bne	.L116
	mov	r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L116:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-64]
	add	r1, r2, r3
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-20]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	mov	r3, r2
	mov	r2, r1
	ldr	r1, [fp, #-44]
	bl	bar
	str	r0, [fp, #-48]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ble	.L110
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-48]
	add	r3, r2, r3
	str	r3, [fp, #-20]
.L110:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #43
	bne	.L111
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	blt	.L139
.L111:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	blt	.L113
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	b	.L114
.L113:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-32]
	sub	r1, r2, r3
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-64]
	add	ip, r2, r3
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-20]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	mov	r3, r2
	mov	r2, ip
	bl	bar
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L114
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-24]
.L114:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L115
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L140
.L115:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bgt	.L116
	b	.L112
.L139:
	nop
	b	.L112
.L140:
	nop
.L112:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bge	.L117
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #42
	bne	.L117
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-32]
	sub	r1, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-64]
	add	ip, r2, r3
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-12]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	mov	r3, r2
	mov	r2, ip
	bl	bar
	str	r0, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L117
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-24]
.L117:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-56]
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #43
	bne	.L118
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L118
	mvn	r3, #0
	b	.L103
.L118:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L119
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bge	.L119
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bge	.L119
	mvn	r3, #0
	b	.L103
.L119:
	ldr	r3, [fp, #-24]
	b	.L103
.L105:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #91
	bne	.L121
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldr	r2, [fp, #-60]
	sub	r1, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	bl	match_set
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L122
	mvn	r3, #0
	b	.L103
.L122:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L120
.L121:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #40
	bne	.L123
	mvn	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #8]
	add	r3, r3, #1
	str	r3, [fp, #8]
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	ldr	r2, [fp, #8]
	cmp	r2, r3
	blt	.L124
	mvn	r3, #3
	b	.L103
.L124:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-60]
	sub	r3, r2, r3
	cmp	r3, #0
	bgt	.L125
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-64]
	add	r0, r2, r3
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-12]
	sub	r1, r2, r3
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #4]
	bl	doh
	str	r0, [fp, #-16]
	b	.L126
.L125:
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L127
.L129:
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-64]
	add	r0, r2, r3
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [fp, #-68]
	sub	r1, r2, r3
	ldr	r3, [fp, #8]
	ldr	r2, [fp, #4]
	bl	doh
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L128
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	ldr	r2, [fp, #-60]
	sub	r1, r2, r3
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-64]
	add	ip, r2, r3
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-68]
	sub	r2, r2, r3
	ldr	r3, [fp, #8]
	str	r3, [sp, #4]
	ldr	r3, [fp, #4]
	str	r3, [sp]
	mov	r3, r2
	mov	r2, ip
	bl	bar
	mov	r3, r0
	cmp	r3, #0
	bge	.L141
.L128:
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L127:
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	ble	.L129
	b	.L126
.L141:
	nop
.L126:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L130
	ldr	r3, [fp, #-16]
	b	.L103
.L130:
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2408]
	cmp	r3, #0
	beq	.L131
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #4]
	ldr	r1, [r3, #2408]
	ldr	r3, [fp, #8]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r1, [fp, #-64]
	add	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #4]
	ldr	r2, [r3, #2408]
	ldr	r3, [fp, #8]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
.L131:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L120
.L123:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #94
	bne	.L132
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L120
	mvn	r3, #0
	b	.L103
.L132:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #36
	bne	.L133
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	beq	.L120
	mvn	r3, #0
	b	.L103
.L133:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	blt	.L134
	mvn	r3, #0
	b	.L103
.L134:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-56]
	add	r0, r2, r3
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-64]
	add	r3, r2, r3
	ldr	r2, [fp, #4]
	mov	r1, r3
	bl	match_op
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L135
	ldr	r3, [fp, #-16]
	b	.L103
.L135:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L120
.L138:
	nop
.L120:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-44]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L99:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-60]
	cmp	r2, r3
	bge	.L136
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	ble	.L137
.L136:
	ldr	r3, [fp, #-12]
.L103:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	bar, .-bar
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	doh, %function
doh:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #4
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
.L150:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L143
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	b	.L144
.L143:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	sub	r3, r3, #1
	ldr	r2, [fp, #-40]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r3, [r3, #8]
	add	r3, r3, #1
.L144:
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L145
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	b	.L146
.L145:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bne	.L147
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	ldr	r2, [r2, #4]
	add	r2, r3, r2
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	b	.L146
.L147:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r2, [fp, #-40]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
.L146:
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-44]
	str	r3, [sp, #4]
	ldr	r3, [fp, #-40]
	str	r3, [sp]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	bar
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bgt	.L149
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r2, [r2, #12]
	cmp	r3, r2
	blt	.L150
.L149:
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	doh, .-doh
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	baz, %function
baz:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mvn	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #94
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L153
.L157:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r0, r2, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	sub	r1, r2, r3
	mov	r3, #0
	ldr	r2, [fp, #-32]
	bl	doh
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L154
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L155
.L154:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L159
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L153:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	ble	.L157
	b	.L155
.L159:
	nop
.L155:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	baz, .-baz
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	setup_branch_points, %function
setup_branch_points:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L161
.L165:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L162
.L164:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldr	r3, [r3, #4]
	cmp	r2, r3
	ble	.L163
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r2, r3
	sub	r2, fp, #20
	add	r3, r3, #4
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	add	r2, r2, #200
	lsl	r2, r2, #3
	add	r2, r3, r2
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r1, r3
	add	r2, r2, #4
	add	r3, r3, #4
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r2, r3
	add	r3, r3, #4
	sub	r2, fp, #20
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
.L163:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L162:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2404]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	blt	.L164
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L161:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2404]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L165
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L166
.L170:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	b	.L167
.L169:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r3, [r3, #12]
	add	r2, r3, #1
	ldr	r1, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	add	r3, r1, r3
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L167:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #2404]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bge	.L168
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	beq	.L169
.L168:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L166:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #1600]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L170
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	setup_branch_points, .-setup_branch_points
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	foo, %function
foo:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #-24]
	str	r2, [r3]
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #4]
	ldr	r3, [fp, #4]
	mov	r2, #1
	str	r2, [r3, #1600]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L172
.L189:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r0, r2, r3
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	mov	r1, r3
	bl	get_op_len
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #124
	bne	.L173
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2404]
	cmp	r3, #99
	ble	.L174
	mvn	r3, #7
	b	.L175
.L174:
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	sub	r3, r3, #1
	ldr	r2, [fp, #4]
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	cmn	r3, #1
	bne	.L176
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	sub	r2, r3, #1
	b	.L177
.L176:
	ldr	r2, [fp, #-12]
.L177:
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2404]
	ldr	r1, [fp, #4]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r1, r3
	str	r2, [r3, #4]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2404]
	ldr	r1, [fp, #-24]
	add	r2, r1, r2
	ldr	r1, [fp, #4]
	add	r3, r3, #200
	lsl	r3, r3, #3
	add	r3, r1, r3
	str	r2, [r3, #8]
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2404]
	add	r2, r3, #1
	ldr	r3, [fp, #4]
	str	r2, [r3, #2404]
	b	.L178
.L173:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #92
	bne	.L179
	ldr	r3, [fp, #-28]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L180
	mvn	r3, #5
	b	.L175
.L180:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #120
	bne	.L181
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #120
	bne	.L182
	ldr	r3, [fp, #-28]
	sub	r3, r3, #3
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	blt	.L182
	mvn	r3, #5
	b	.L175
.L182:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #120
	bne	.L178
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L191
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #68
	cmp	r3, #0
	beq	.L183
	ldr	r3, [fp, #-8]
	add	r3, r3, #3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	ldr	r2, .L191
	add	r3, r3, r2
	ldrb	r3, [r3]	@ zero_extendqisi2
	and	r3, r3, #68
	cmp	r3, #0
	bne	.L178
.L183:
	mvn	r3, #5
	b	.L175
.L181:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	mov	r0, r3
	bl	is_metacharacter
	mov	r3, r0
	cmp	r3, #0
	bne	.L178
	mvn	r3, #5
	b	.L175
.L179:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #40
	bne	.L184
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	cmp	r3, #99
	ble	.L185
	mvn	r3, #8
	b	.L175
.L185:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, [fp, #4]
	ldr	r2, [r2, #1600]
	ldr	r1, [fp, #-24]
	add	r1, r1, r3
	ldr	r3, [fp, #4]
	str	r1, [r3, r2, lsl #4]
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	ldr	r2, [fp, #4]
	lsl	r3, r3, #4
	add	r3, r2, r3
	mvn	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	add	r2, r3, #1
	ldr	r3, [fp, #4]
	str	r2, [r3, #1600]
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2412]
	cmp	r3, #0
	ble	.L178
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	sub	r2, r3, #1
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #2412]
	cmp	r2, r3
	ble	.L178
	mvn	r3, #6
	b	.L175
.L184:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #41
	bne	.L178
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	sub	r3, r3, #1
	ldr	r2, [fp, #4]
	lsl	r3, r3, #4
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	cmn	r3, #1
	bne	.L186
	ldr	r3, [fp, #4]
	ldr	r3, [r3, #1600]
	sub	r3, r3, #1
	b	.L187
.L186:
	ldr	r3, [fp, #-12]
.L187:
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	ldr	r1, [fp, #-20]
	ldr	r3, [r3, r1, lsl #4]
	sub	r2, r2, r3
	ldr	r1, [fp, #4]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #4
	add	r3, r1, r3
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L188
	mvn	r3, #2
	b	.L175
.L188:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L178
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #40
	bne	.L178
	mvn	r3, #0
	b	.L175
.L178:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L172:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	blt	.L189
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L190
	mvn	r3, #2
	b	.L175
.L190:
	ldr	r0, [fp, #4]
	bl	setup_branch_points
	ldr	r2, [fp, #4]
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-32]
	bl	baz
	mov	r3, r0
.L175:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L192:
	.align	2
.L191:
	.word	_ctype_
	.size	foo, .-foo
	.section	.rodata
	.align	2
.LC0:
	.ascii	"(?i)\000"
	.text
	.align	2
	.global	slre_match
	.syntax unified
	.arm
	.fpu softvfp
	.type	slre_match, %function
slre_match:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 2440
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #2448
	str	r0, [fp, #-2432]
	str	r1, [fp, #-2436]
	str	r2, [fp, #-2440]
	str	r3, [fp, #-2444]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-824]
	ldr	r3, [fp, #-824]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #4]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-2444]
	str	r3, [fp, #-16]
	mov	r2, #4
	ldr	r1, .L196
	ldr	r0, [fp, #-2432]
	bl	memcmp
	mov	r3, r0
	cmp	r3, #0
	bne	.L194
	ldr	r3, [fp, #-8]
	orr	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-2432]
	add	r3, r3, #4
	str	r3, [fp, #-2432]
.L194:
	ldr	r0, [fp, #-2432]
	bl	strlen
	mov	r3, r0
	mov	r1, r3
	sub	r3, fp, #2416
	sub	r3, r3, #4
	sub	r3, r3, #4
	str	r3, [sp]
	ldr	r3, [fp, #-2440]
	ldr	r2, [fp, #-2436]
	ldr	r0, [fp, #-2432]
	bl	foo
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L197:
	.align	2
.L196:
	.word	.LC0
	.size	slre_match, .-slre_match
	.global	slre_text
	.data
	.align	2
	.type	slre_text, %object
	.size	slre_text, 46
slre_text:
	.ascii	"abbbababaabccababcacbcbcbabbabcbabcabcbbcbbac\000"
	.global	regexes
	.section	.rodata
	.align	2
.LC1:
	.ascii	"(ab)+\000"
	.align	2
.LC2:
	.ascii	"(b.+)+\000"
	.align	2
.LC3:
	.ascii	"a[ab]*\000"
	.align	2
.LC4:
	.ascii	"([ab^c][ab^c])+\000"
	.data
	.align	2
	.type	regexes, %object
	.size	regexes, 16
regexes:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.text
	.align	2
	.global	beebs_slre_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_slre_initialise_benchmark, %function
beebs_slre_initialise_benchmark:
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
	.size	beebs_slre_initialise_benchmark, .-beebs_slre_initialise_benchmark
	.align	2
	.global	beebs_slre_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_slre_benchmark, %function
beebs_slre_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	ldr	r0, .L203
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L200
.L201:
	ldr	r2, .L203+4
	ldr	r3, [fp, #-8]
	ldr	r0, [r2, r3, lsl #2]
	sub	r3, fp, #20
	mov	r2, #1
	str	r2, [sp]
	ldr	r2, [fp, #-12]
	ldr	r1, .L203
	bl	slre_match
	mov	r2, r0
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L200:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L201
	ldr	r3, [fp, #-24]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L204:
	.align	2
.L203:
	.word	slre_text
	.word	regexes
	.size	beebs_slre_benchmark, .-beebs_slre_benchmark
	.align	2
	.global	beebs_slre_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_slre_verify_benchmark, %function
beebs_slre_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #102
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L206
	mov	r3, #0
	b	.L207
.L206:
	mov	r3, #1
.L207:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_slre_verify_benchmark, .-beebs_slre_verify_benchmark
	.section	.rodata
	.align	2
.LC5:
	.ascii	"^$().[]*+?|\\Ssd\000"
	.data
	.align	2
	.type	metacharacters.0, %object
	.size	metacharacters.0, 4
metacharacters.0:
	.word	.LC5
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
