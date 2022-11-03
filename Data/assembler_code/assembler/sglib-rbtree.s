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
	.file	"rbtree.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_fix_left_insertion_discrepancy, %function
sglib___rbtree_fix_left_insertion_discrepancy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L2
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L8
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L4
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L5
.L4:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L8
.L5:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	mov	r2, #1
	strb	r2, [r3, #4]
	b	.L8
.L2:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L9
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L7
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	b	.L6
.L7:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L9
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L9
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-24]
	str	r2, [r3]
	b	.L9
.L8:
	nop
.L6:
.L9:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib___rbtree_fix_left_insertion_discrepancy, .-sglib___rbtree_fix_left_insertion_discrepancy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_fix_right_insertion_discrepancy, %function
sglib___rbtree_fix_right_insertion_discrepancy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L11
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L11
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L17
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L13
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L14
.L13:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L17
.L14:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	mov	r2, #1
	strb	r2, [r3, #4]
	b	.L17
.L11:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L18
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L16
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L16
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	b	.L15
.L16:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L18
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-24]
	str	r2, [r3]
	b	.L18
.L17:
	nop
.L15:
.L18:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib___rbtree_fix_right_insertion_discrepancy, .-sglib___rbtree_fix_right_insertion_discrepancy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_fix_left_deletion_discrepancy, %function
sglib___rbtree_fix_left_deletion_discrepancy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L20
	ldr	r3, [fp, #-16]
	mov	r2, #0
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L20:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L22
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L23
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L23:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L25
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L26
.L25:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L27
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L26
.L27:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	mov	r2, #1
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L26:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L28
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L28
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L29
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-44]
	str	r2, [r3]
	ldr	r3, [fp, #-44]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-48]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-52]
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L29:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L28:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L31
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L31
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-44]
	str	r2, [r3]
	ldr	r3, [fp, #-44]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-48]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-52]
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L31:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L22:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L32
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
.L32:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L34
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L33
.L34:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	mov	r2, #1
	strb	r2, [r3, #4]
	b	.L21
.L33:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L35
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L35
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L36
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L37
.L36:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L37:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L21
.L35:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	str	r2, [r3, #12]
	mov	r3, #0
	str	r3, [fp, #-8]
.L21:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib___rbtree_fix_left_deletion_discrepancy, .-sglib___rbtree_fix_left_deletion_discrepancy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_fix_right_deletion_discrepancy, %function
sglib___rbtree_fix_right_deletion_discrepancy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-56]
	ldr	r3, [fp, #-56]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L41
	ldr	r3, [fp, #-16]
	mov	r2, #0
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L41:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L43
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L44
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L44:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L46
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L47
.L46:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L48
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L47
.L48:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	mov	r2, #1
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L47:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L49
	ldr	r3, [fp, #-36]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L49
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L50
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L50
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-44]
	str	r2, [r3]
	ldr	r3, [fp, #-44]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-48]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-52]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L50:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-36]
	mov	r2, #0
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L49:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	beq	.L52
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L52
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-44]
	str	r2, [r3]
	ldr	r3, [fp, #-44]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-48]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-52]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L52:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L43:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L53
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L54
.L53:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L55
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L54
.L55:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	mov	r2, #1
	strb	r2, [r3, #4]
	b	.L42
.L54:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L56
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L56
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L58
.L57:
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-20]
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	strb	r2, [r3, #4]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L58:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L42
.L56:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r2, [r3, #4]	@ zero_extendqisi2
	ldr	r3, [fp, #-32]
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-40]
	str	r2, [r3, #8]
	mov	r3, #0
	str	r3, [fp, #-8]
.L42:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib___rbtree_fix_right_deletion_discrepancy, .-sglib___rbtree_fix_right_deletion_discrepancy
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_add_recursive, %function
sglib___rbtree_add_recursive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L62
	ldr	r3, [fp, #-20]
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	b	.L67
.L62:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L64
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L65
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bcs	.L65
.L64:
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib___rbtree_add_recursive
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L63
	ldr	r0, [fp, #-16]
	bl	sglib___rbtree_fix_left_insertion_discrepancy
	b	.L63
.L65:
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib___rbtree_add_recursive
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L67
	ldr	r0, [fp, #-16]
	bl	sglib___rbtree_fix_right_insertion_discrepancy
	b	.L67
.L63:
.L67:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib___rbtree_add_recursive, .-sglib___rbtree_add_recursive
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_delete_rightmost_leaf, %function
sglib___rbtree_delete_rightmost_leaf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L69
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L70
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L71
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L71
	mov	r3, #1
	str	r3, [fp, #-8]
.L71:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3]
	b	.L72
.L70:
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
	b	.L72
.L69:
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	sglib___rbtree_delete_rightmost_leaf
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L72
	ldr	r0, [fp, #-24]
	bl	sglib___rbtree_fix_right_deletion_discrepancy
	str	r0, [fp, #-8]
.L72:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib___rbtree_delete_rightmost_leaf, .-sglib___rbtree_delete_rightmost_leaf
	.align	2
	.global	sglib___rbtree_delete_recursive
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_delete_recursive, %function
sglib___rbtree_delete_recursive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L75
	ldr	r3, [fp, #-36]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L76
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L77
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcs	.L77
.L76:
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	ldr	r1, [fp, #-36]
	mov	r0, r3
	bl	sglib___rbtree_delete_recursive
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L75
	ldr	r0, [fp, #-32]
	bl	sglib___rbtree_fix_left_deletion_discrepancy
	str	r0, [fp, #-8]
	b	.L75
.L77:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bgt	.L79
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L80
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L80
.L79:
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	ldr	r1, [fp, #-36]
	mov	r0, r3
	bl	sglib___rbtree_delete_recursive
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L75
	ldr	r0, [fp, #-32]
	bl	sglib___rbtree_fix_right_deletion_discrepancy
	str	r0, [fp, #-8]
	b	.L75
.L80:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L82
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L83
	ldr	r3, [fp, #-32]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
	b	.L75
.L83:
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L84
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L84
	mov	r3, #1
	str	r3, [fp, #-8]
.L84:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-32]
	str	r2, [r3]
	b	.L75
.L82:
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	sub	r2, fp, #24
	mov	r1, r2
	mov	r0, r3
	bl	sglib___rbtree_delete_rightmost_leaf
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldr	r2, [r2, #12]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	strb	r2, [r3, #4]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L75
	ldr	r0, [fp, #-32]
	bl	sglib___rbtree_fix_left_deletion_discrepancy
	str	r0, [fp, #-8]
.L75:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib___rbtree_delete_recursive, .-sglib___rbtree_delete_recursive
	.align	2
	.global	sglib_rbtree_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_add, %function
sglib_rbtree_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib___rbtree_add_recursive
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r2, #0
	strb	r2, [r3, #4]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_add, .-sglib_rbtree_add
	.align	2
	.global	sglib_rbtree_delete
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_delete, %function
sglib_rbtree_delete:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib___rbtree_delete_recursive
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L89
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r2, #0
	strb	r2, [r3, #4]
.L89:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_delete, .-sglib_rbtree_delete
	.align	2
	.global	sglib_rbtree_find_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_find_member, %function
sglib_rbtree_find_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-8]
	b	.L91
.L95:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L92
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
	b	.L91
.L92:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L97
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-8]
.L91:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L95
	b	.L94
.L97:
	nop
.L94:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_rbtree_find_member, .-sglib_rbtree_find_member
	.align	2
	.global	sglib_rbtree_is_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_is_member, %function
sglib_rbtree_is_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	b	.L99
.L105:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	blt	.L100
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L101
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcs	.L101
.L100:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	b	.L99
.L101:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L102
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L103
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bls	.L103
.L102:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	b	.L99
.L103:
	mov	r3, #1
	b	.L104
.L99:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L105
	mov	r3, #0
.L104:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_rbtree_is_member, .-sglib_rbtree_is_member
	.align	2
	.global	sglib_rbtree_delete_if_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_delete_if_member, %function
sglib_rbtree_delete_if_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	sglib_rbtree_find_member
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L107
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-8]
	bl	sglib_rbtree_delete
	mov	r3, #1
	b	.L108
.L107:
	mov	r3, #0
.L108:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_delete_if_member, .-sglib_rbtree_delete_if_member
	.align	2
	.global	sglib_rbtree_add_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_add_if_not_member, %function
sglib_rbtree_add_if_not_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	sglib_rbtree_find_member
	mov	r2, r0
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L110
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib_rbtree_add
	mov	r3, #1
	b	.L111
.L110:
	mov	r3, #0
.L111:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_add_if_not_member, .-sglib_rbtree_add_if_not_member
	.align	2
	.global	sglib_rbtree_len
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_len, %function
sglib_rbtree_len:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1176
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #1168
	sub	sp, sp, #12
	str	r0, [fp, #-1176]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-1176]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L113
.L115:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-12]
	str	r2, [r3, #-1040]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-528]
	sub	r2, fp, #1168
	sub	r2, r2, #4
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L114:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L115
.L118:
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	str	r3, [fp, #-16]
	sub	r2, fp, #1168
	sub	r2, r2, #4
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L116
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-1040]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L116:
	sub	r2, fp, #1168
	sub	r2, r2, #4
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	and	r1, r3, #255
	sub	r2, fp, #1168
	sub	r2, r2, #4
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, r1
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	ble	.L117
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-528]
	cmp	r3, #0
	beq	.L118
.L117:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-528]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	mov	r2, #0
	str	r2, [r3, #-528]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L113:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L114
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_rbtree_len, .-sglib_rbtree_len
	.align	2
	.global	sglib__rbtree_it_compute_current_elem
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib__rbtree_it_compute_current_elem, %function
sglib__rbtree_it_compute_current_elem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #648]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #652]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-48]
	mov	r2, #0
	str	r2, [r3]
	b	.L122
.L141:
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	sub	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	blt	.L123
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L124
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	strh	r2, [r3]	@ movhi
	b	.L123
.L124:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L125
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	add	r3, r3, #32
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
	b	.L126
.L125:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	add	r3, r3, #32
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-8]
.L126:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L127
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L128
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	b	.L129
.L133:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bge	.L130
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
	b	.L129
.L130:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	ble	.L142
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-12]
.L129:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L133
	b	.L132
.L142:
	nop
.L132:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L127
.L128:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	b	.L134
.L138:
	ldr	r3, [fp, #-24]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-20]
	mov	lr, pc
	bx	r3
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bge	.L135
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	b	.L134
.L135:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	ble	.L143
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
.L134:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L138
	b	.L137
.L143:
	nop
.L137:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L127:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L139
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	add	r3, r3, #32
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	add	r3, r3, #4
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	strh	r2, [r3]	@ movhi
.L139:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	and	r1, r3, #255
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	add	r3, r3, #4
	mov	r2, r1
	strb	r2, [r3]
.L123:
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	cmp	r3, #0
	ble	.L122
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	add	r3, r3, #2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r1, r3
	bne	.L122
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, [fp, #-48]
	add	r3, r3, #32
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-48]
	str	r2, [r3]
.L122:
	ldr	r3, [fp, #-48]
	add	r3, r3, #644
	ldrsh	r3, [r3]
	cmp	r3, #0
	ble	.L144
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L141
.L144:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib__rbtree_it_compute_current_elem, .-sglib__rbtree_it_compute_current_elem
	.align	2
	.global	sglib__rbtree_it_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib__rbtree_it_init, %function
sglib__rbtree_it_init:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-32]
	add	r3, r3, #644
	add	r3, r3, #2
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #4]
	str	r2, [r3, #648]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	str	r2, [r3, #652]
	ldr	r3, [fp, #4]
	cmp	r3, #0
	bne	.L146
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-8]
	b	.L147
.L146:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L148
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-12]
	b	.L149
.L153:
	ldr	r3, [fp, #4]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L150
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
	b	.L149
.L150:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L163
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-12]
.L149:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L153
	b	.L152
.L163:
	nop
.L152:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L147
.L148:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-16]
	b	.L154
.L158:
	ldr	r3, [fp, #-44]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #4]
	mov	lr, pc
	bx	r3
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bge	.L155
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	b	.L154
.L155:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L164
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
.L154:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L158
	b	.L157
.L164:
	nop
.L157:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L147:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L159
	ldr	r3, [fp, #-32]
	add	r3, r3, #644
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-32]
	mov	r2, #0
	str	r2, [r3]
	b	.L160
.L159:
	ldr	r3, [fp, #-32]
	add	r3, r3, #644
	mov	r2, #1
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-32]
	mov	r2, #0
	strb	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #132]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L161
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	b	.L160
.L161:
	ldr	r0, [fp, #-32]
	bl	sglib__rbtree_it_compute_current_elem
.L160:
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib__rbtree_it_init, .-sglib__rbtree_it_init
	.align	2
	.global	sglib_rbtree_it_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_init, %function
sglib_rbtree_it_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #2
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib__rbtree_it_init
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_it_init, .-sglib_rbtree_it_init
	.align	2
	.global	sglib_rbtree_it_init_preorder
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_init_preorder, %function
sglib_rbtree_it_init_preorder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib__rbtree_it_init
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_it_init_preorder, .-sglib_rbtree_it_init_preorder
	.align	2
	.global	sglib_rbtree_it_init_inorder
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_init_inorder, %function
sglib_rbtree_it_init_inorder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #1
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib__rbtree_it_init
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_it_init_inorder, .-sglib_rbtree_it_init_inorder
	.align	2
	.global	sglib_rbtree_it_init_postorder
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_init_postorder, %function
sglib_rbtree_it_init_postorder:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	str	r3, [sp]
	mov	r3, #0
	mov	r2, #2
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib__rbtree_it_init
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_it_init_postorder, .-sglib_rbtree_it_init_postorder
	.align	2
	.global	sglib_rbtree_it_init_on_equal
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_init_on_equal, %function
sglib_rbtree_it_init_on_equal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [sp]
	ldr	r3, [fp, #-16]
	mov	r2, #1
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib__rbtree_it_init
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_it_init_on_equal, .-sglib_rbtree_it_init_on_equal
	.align	2
	.global	sglib_rbtree_it_current
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_current, %function
sglib_rbtree_it_current:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_rbtree_it_current, .-sglib_rbtree_it_current
	.align	2
	.global	sglib_rbtree_it_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_rbtree_it_next, %function
sglib_rbtree_it_next:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	sglib__rbtree_it_compute_current_elem
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_rbtree_it_next, .-sglib_rbtree_it_next
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_consistency_check_recursive, %function
sglib___rbtree_consistency_check_recursive:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L180
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	cmp	r3, #0
	bge	.L183
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	b	.L183
.L180:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #4]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L182
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	sglib___rbtree_consistency_check_recursive
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	sglib___rbtree_consistency_check_recursive
	b	.L183
.L182:
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #8]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r1, [fp, #-12]
	bl	sglib___rbtree_consistency_check_recursive
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #12]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	mov	r2, r3
	ldr	r1, [fp, #-12]
	bl	sglib___rbtree_consistency_check_recursive
.L183:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib___rbtree_consistency_check_recursive, .-sglib___rbtree_consistency_check_recursive
	.align	2
	.global	sglib___rbtree_consistency_check
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib___rbtree_consistency_check, %function
sglib___rbtree_consistency_check:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mvn	r3, #0
	str	r3, [fp, #-8]
	sub	r3, fp, #8
	mov	r2, #0
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	sglib___rbtree_consistency_check_recursive
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib___rbtree_consistency_check, .-sglib___rbtree_consistency_check
	.global	sglib_rbtree_array
	.data
	.align	2
	.type	sglib_rbtree_array, %object
	.size	sglib_rbtree_array, 400
sglib_rbtree_array:
	.word	14
	.word	66
	.word	12
	.word	41
	.word	86
	.word	69
	.word	19
	.word	77
	.word	68
	.word	38
	.word	26
	.word	42
	.word	37
	.word	23
	.word	17
	.word	29
	.word	55
	.word	13
	.word	90
	.word	92
	.word	76
	.word	99
	.word	10
	.word	54
	.word	57
	.word	83
	.word	40
	.word	44
	.word	75
	.word	33
	.word	24
	.word	28
	.word	80
	.word	18
	.word	78
	.word	32
	.word	93
	.word	89
	.word	52
	.word	11
	.word	21
	.word	96
	.word	50
	.word	15
	.word	48
	.word	63
	.word	87
	.word	20
	.word	8
	.word	85
	.word	43
	.word	16
	.word	94
	.word	88
	.word	53
	.word	84
	.word	74
	.word	91
	.word	67
	.word	36
	.word	95
	.word	61
	.word	64
	.word	5
	.word	30
	.word	82
	.word	72
	.word	46
	.word	59
	.word	9
	.word	7
	.word	3
	.word	39
	.word	31
	.word	4
	.word	73
	.word	70
	.word	60
	.word	58
	.word	81
	.word	56
	.word	51
	.word	45
	.word	1
	.word	6
	.word	49
	.word	27
	.word	47
	.word	34
	.word	35
	.word	62
	.word	97
	.word	2
	.word	79
	.word	98
	.word	25
	.word	22
	.word	65
	.word	71
	.word	0
	.bss
	.align	2
heap:
	.space	8192
	.size	heap, 8192
	.align	2
heap_ptr:
	.space	4
	.size	heap_ptr, 4
	.align	2
heap_end:
	.space	4
	.size	heap_end, 4
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_heap, %function
init_heap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L186
	ldr	r2, .L186+4
	str	r2, [r3]
	ldr	r3, .L186
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L186+8
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L187:
	.align	2
.L186:
	.word	heap_ptr
	.word	heap
	.word	heap_end
	.size	init_heap, .-init_heap
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	malloc_beebs, %function
malloc_beebs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L192
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L192
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L192+4
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L189
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L190
.L189:
	mov	r3, #0
	b	.L191
.L190:
	ldr	r3, .L192
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L192
	str	r3, [r2]
	ldr	r3, [fp, #-8]
.L191:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L193:
	.align	2
.L192:
	.word	heap_ptr
	.word	heap_end
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	free_beebs, %function
free_beebs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	free_beebs, .-free_beebs
	.align	2
	.global	beebs_sglib_rbtree_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_rbtree_initialise_benchmark, %function
beebs_sglib_rbtree_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	init_heap
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_sglib_rbtree_initialise_benchmark, .-beebs_sglib_rbtree_initialise_benchmark
	.align	2
	.global	beebs_sglib_rbtree_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_rbtree_benchmark, %function
beebs_sglib_rbtree_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 696
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #696
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L197
.L199:
	ldr	r2, .L205
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	sub	r2, fp, #36
	mov	r1, r2
	mov	r0, r3
	bl	sglib_rbtree_find_member
	mov	r3, r0
	cmp	r3, #0
	bne	.L198
	mov	r0, #16
	bl	malloc_beebs
	str	r0, [fp, #-20]
	ldr	r2, .L205
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	sub	r3, fp, #40
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_rbtree_add
.L198:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L197:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L199
	ldr	r2, [fp, #-40]
	sub	r3, fp, #696
	mov	r1, r2
	mov	r0, r3
	bl	sglib_rbtree_it_init_inorder
	str	r0, [fp, #-12]
	b	.L200
.L201:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	sub	r3, fp, #696
	mov	r0, r3
	bl	sglib_rbtree_it_next
	str	r0, [fp, #-12]
.L200:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L201
	ldr	r2, [fp, #-40]
	sub	r3, fp, #696
	mov	r1, r2
	mov	r0, r3
	bl	sglib_rbtree_it_init
	str	r0, [fp, #-12]
	b	.L202
.L203:
	ldr	r0, [fp, #-12]
	bl	free_beebs
	sub	r3, fp, #696
	mov	r0, r3
	bl	sglib_rbtree_it_next
	str	r0, [fp, #-12]
.L202:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L203
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L206:
	.align	2
.L205:
	.word	sglib_rbtree_array
	.size	beebs_sglib_rbtree_benchmark, .-beebs_sglib_rbtree_benchmark
	.align	2
	.global	beebs_sglib_rbtree_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_rbtree_verify_benchmark, %function
beebs_sglib_rbtree_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L210
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L208
	mov	r3, #0
	b	.L209
.L208:
	mov	r3, #1
.L209:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L211:
	.align	2
.L210:
	.word	4950
	.size	beebs_sglib_rbtree_verify_benchmark, .-beebs_sglib_rbtree_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
