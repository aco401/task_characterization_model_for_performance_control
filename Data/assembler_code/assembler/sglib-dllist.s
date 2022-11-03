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
	.file	"dllist.c"
	.text
	.align	2
	.global	sglib_dllist_add
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_add, %function
sglib_dllist_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L2
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	str	r3, [r2, #4]
	b	.L4
.L2:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L4
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
.L4:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_add, .-sglib_dllist_add
	.align	2
	.global	sglib_dllist_add_after
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_add_after, %function
sglib_dllist_add_after:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L6
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	str	r3, [r2, #4]
	b	.L8
.L6:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L8
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
.L8:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_add_after, .-sglib_dllist_add_after
	.align	2
	.global	sglib_dllist_add_before
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_add_before, %function
sglib_dllist_add_before:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L10
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	str	r3, [r2, #4]
	b	.L12
.L10:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L12
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
.L12:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_add_before, .-sglib_dllist_add_before
	.align	2
	.global	sglib_dllist_add_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_add_if_not_member, %function
sglib_dllist_add_if_not_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L14
.L16:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L14:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L15
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L16
.L15:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L17
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L18
.L19:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L17
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L19
.L17:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L20
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r2, [fp, #-16]
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	str	r3, [r2, #4]
	b	.L20
.L21:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
.L20:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_add_if_not_member, .-sglib_dllist_add_if_not_member
	.align	2
	.global	sglib_dllist_add_after_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_add_after_if_not_member, %function
sglib_dllist_add_after_if_not_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L24
.L26:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L25
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L26
.L25:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L27
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L27
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L28
.L29:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L28:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L27
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L29
.L27:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L30
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L31
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r2, [fp, #-16]
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	str	r3, [r2, #4]
	b	.L30
.L31:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L30
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
.L30:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_add_after_if_not_member, .-sglib_dllist_add_after_if_not_member
	.align	2
	.global	sglib_dllist_add_before_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_add_before_if_not_member, %function
sglib_dllist_add_before_if_not_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L34
.L36:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L34:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L35
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L36
.L35:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L37
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L38
.L39:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L38:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L37
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L39
.L37:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L40
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L41
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r2, [fp, #-16]
	ldr	r2, [r2]
	ldr	r3, [r3, #8]
	str	r3, [r2, #4]
	b	.L40
.L41:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L40
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
.L40:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_add_before_if_not_member, .-sglib_dllist_add_before_if_not_member
	.align	2
	.global	sglib_dllist_concat
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_concat, %function
sglib_dllist_concat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L44
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	b	.L49
.L44:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L49
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L46
.L47:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L46:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L47
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L48
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	b	.L49
.L48:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L49
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #8]
.L49:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_concat, .-sglib_dllist_concat
	.align	2
	.global	sglib_dllist_delete
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_delete, %function
sglib_dllist_delete:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L51
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L52
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
	b	.L51
.L52:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L51:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L53
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-20]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
.L53:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L54
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-20]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
.L54:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_delete, .-sglib_dllist_delete
	.align	2
	.global	sglib_dllist_delete_if_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_delete_if_member, %function
sglib_dllist_delete_if_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L56
.L58:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L56:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L58
.L57:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L59
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L60
.L61:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L60:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L61
.L59:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L62
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bne	.L63
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L64
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
	b	.L63
.L64:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
.L63:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	beq	.L65
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
.L65:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
.L66:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
.L62:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_delete_if_member, .-sglib_dllist_delete_if_member
	.align	2
	.global	sglib_dllist_is_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_is_member, %function
sglib_dllist_is_member:
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
	str	r3, [fp, #-12]
	b	.L69
.L71:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
.L69:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L70
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L71
.L70:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L72
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L72
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L73
.L75:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
.L73:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L74
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L75
.L74:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-8]
.L72:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_is_member, .-sglib_dllist_is_member
	.align	2
	.global	sglib_dllist_find_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_find_member, %function
sglib_dllist_find_member:
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
	str	r3, [fp, #-12]
	b	.L78
.L80:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-12]
.L78:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L80
.L79:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L81
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L81
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-16]
	b	.L82
.L84:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
.L82:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L83
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L84
.L83:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L81:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_find_member, .-sglib_dllist_find_member
	.align	2
	.global	sglib_dllist_get_first
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_get_first, %function
sglib_dllist_get_first:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L87
	b	.L88
.L89:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L88:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L89
.L87:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_get_first, .-sglib_dllist_get_first
	.align	2
	.global	sglib_dllist_get_last
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_get_last, %function
sglib_dllist_get_last:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L92
	b	.L93
.L94:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L93:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L94
.L92:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_get_last, .-sglib_dllist_get_last
	.align	2
	.global	sglib_dllist_sort
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_sort, %function
sglib_dllist_sort:
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
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L124
	b	.L98
.L99:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L98:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	cmp	r3, #0
	bne	.L99
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-52]
	mov	r3, #1
	str	r3, [fp, #-40]
	mov	r3, #1
	str	r3, [fp, #-36]
	b	.L100
.L121:
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-52]
	sub	r3, fp, #52
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L101
.L120:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-24]
	b	.L102
.L104:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
.L102:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bge	.L103
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L104
.L103:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L105
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	b	.L106
.L105:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #4]
	mov	r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
	b	.L107
.L109:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-24]
.L107:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bge	.L108
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L109
.L108:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L110
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L112
.L110:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #4]
	b	.L112
.L115:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	sub	r3, r2, r3
	cmp	r3, #0
	bge	.L113
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	b	.L112
.L113:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
.L112:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L114
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L115
.L114:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L116
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	b	.L118
.L116:
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	b	.L118
.L119:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-28]
.L118:
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L119
	mov	r3, #1
	str	r3, [fp, #-40]
.L101:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L120
.L106:
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #1
	str	r3, [fp, #-36]
.L100:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L121
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-48]
	b	.L122
.L123:
	ldr	r3, [fp, #-48]
	ldr	r2, [fp, #-44]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-48]
.L122:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	bne	.L123
	ldr	r3, [fp, #-56]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
.L124:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_sort, .-sglib_dllist_sort
	.align	2
	.global	sglib_dllist_len
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_len, %function
sglib_dllist_len:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-40]
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L126
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L127
.L126:
	mov	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-20]
	b	.L128
.L129:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
.L128:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L129
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	b	.L130
.L131:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-24]
.L130:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bne	.L131
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L127:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_len, .-sglib_dllist_len
	.align	2
	.global	sglib_dllist_reverse
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_reverse, %function
sglib_dllist_reverse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L139
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	b	.L135
.L136:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-8]
.L135:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L136
	b	.L137
.L138:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
.L137:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L138
.L139:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_dllist_reverse, .-sglib_dllist_reverse
	.align	2
	.global	sglib_dllist_it_init_on_equal
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_it_init_on_equal, %function
sglib_dllist_it_init_on_equal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L141
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #8]
.L141:
	ldr	r0, [fp, #-8]
	bl	sglib_dllist_it_next
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_dllist_it_init_on_equal, .-sglib_dllist_it_init_on_equal
	.align	2
	.global	sglib_dllist_it_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_it_init, %function
sglib_dllist_it_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #0
	mov	r2, #0
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	sglib_dllist_it_init_on_equal
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_dllist_it_init, .-sglib_dllist_it_init
	.align	2
	.global	sglib_dllist_it_current
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_it_current, %function
sglib_dllist_it_current:
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
	.size	sglib_dllist_it_current, .-sglib_dllist_it_current
	.align	2
	.global	sglib_dllist_it_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_dllist_it_next, %function
sglib_dllist_it_next:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L148
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	b	.L149
.L150:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L149:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L148
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-12]
	mov	lr, pc
	bx	r3
	mov	r3, r0
	cmp	r3, #0
	bne	.L150
.L148:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L151
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #4]
	b	.L152
.L151:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	beq	.L153
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	b	.L154
.L155:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L154:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L153
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	mov	lr, pc
	bx	r3
	mov	r3, r0
	cmp	r3, #0
	bne	.L155
.L153:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L152
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #8]
.L152:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_dllist_it_next, .-sglib_dllist_it_next
	.global	array
	.data
	.align	2
	.type	array, %object
	.size	array, 400
array:
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
	ldr	r3, .L158
	ldr	r2, .L158+4
	str	r2, [r3]
	ldr	r3, .L158
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L158+8
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L159:
	.align	2
.L158:
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
	ldr	r3, .L164
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L164
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L164+4
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L161
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L162
.L161:
	mov	r3, #0
	b	.L163
.L162:
	ldr	r3, .L164
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L164
	str	r3, [r2]
	ldr	r3, [fp, #-8]
.L163:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L165:
	.align	2
.L164:
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
	.global	beebs_sglib_dllist_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_dllist_verify_benchmark, %function
beebs_sglib_dllist_verify_benchmark:
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
	.size	beebs_sglib_dllist_verify_benchmark, .-beebs_sglib_dllist_verify_benchmark
	.align	2
	.global	beebs_sglib_dllist_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_dllist_initialise_benchmark, %function
beebs_sglib_dllist_initialise_benchmark:
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
	.size	beebs_sglib_dllist_initialise_benchmark, .-beebs_sglib_dllist_initialise_benchmark
	.align	2
	.global	beebs_sglib_dllist_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_dllist_benchmark, %function
beebs_sglib_dllist_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L171
.L172:
	mov	r0, #12
	bl	malloc_beebs
	str	r0, [fp, #-8]
	ldr	r2, .L180
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	sub	r3, fp, #24
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	sglib_dllist_add
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L171:
	ldr	r3, [fp, #-16]
	cmp	r3, #99
	ble	.L172
	sub	r3, fp, #24
	mov	r0, r3
	bl	sglib_dllist_sort
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	sglib_dllist_get_first
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	sglib_dllist_get_first
	str	r0, [fp, #-8]
	b	.L173
.L174:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L173:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L174
	ldr	r3, [fp, #-24]
	mov	r0, r3
	bl	sglib_dllist_get_last
	str	r0, [fp, #-8]
	b	.L175
.L176:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
.L175:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L176
	ldr	r2, [fp, #-24]
	sub	r3, fp, #44
	mov	r1, r2
	mov	r0, r3
	bl	sglib_dllist_it_init
	str	r0, [fp, #-8]
	b	.L177
.L178:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r0, [fp, #-8]
	bl	free_beebs
	sub	r3, fp, #44
	mov	r0, r3
	bl	sglib_dllist_it_next
	str	r0, [fp, #-8]
.L177:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L178
	ldr	r3, [fp, #-20]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L181:
	.align	2
.L180:
	.word	array
	.size	beebs_sglib_dllist_benchmark, .-beebs_sglib_dllist_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
