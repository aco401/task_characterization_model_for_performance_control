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
	.file	"hashtable.c"
	.text
	.global	sglib_hashtable_htab
	.bss
	.align	2
	.type	sglib_hashtable_htab, %object
	.size	sglib_hashtable_htab, 80
sglib_hashtable_htab:
	.space	80
	.text
	.align	2
	.global	ilist_hash_function
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	ilist_hash_function, %function
ilist_hash_function:
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
	.size	ilist_hash_function, .-ilist_hash_function
	.align	2
	.global	sglib_ilist_is_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_is_member, %function
sglib_ilist_is_member:
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
	str	r3, [fp, #-8]
	b	.L4
.L6:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L5
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L6
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	movne	r3, #1
	moveq	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_is_member, .-sglib_ilist_is_member
	.align	2
	.global	sglib_ilist_find_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_find_member, %function
sglib_ilist_find_member:
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
	str	r3, [fp, #-8]
	b	.L9
.L11:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L9:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L11
.L10:
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_find_member, .-sglib_ilist_find_member
	.align	2
	.global	sglib_ilist_add_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_add_if_not_member, %function
sglib_ilist_add_if_not_member:
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
	ldr	r3, [r3, #4]
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
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L17
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
.L17:
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
	.size	sglib_ilist_add_if_not_member, .-sglib_ilist_add_if_not_member
	.align	2
	.global	sglib_ilist_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_add, %function
sglib_ilist_add:
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
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_add, .-sglib_ilist_add
	.align	2
	.global	sglib_ilist_concat
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_concat, %function
sglib_ilist_concat:
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
	bne	.L21
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	b	.L25
.L21:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	b	.L23
.L24:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L23:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	cmp	r3, #0
	bne	.L24
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
.L25:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_concat, .-sglib_ilist_concat
	.align	2
	.global	sglib_ilist_delete
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_delete, %function
sglib_ilist_delete:
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
	str	r3, [fp, #-8]
	b	.L27
.L29:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L27:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L28
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bne	.L29
.L28:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_delete, .-sglib_ilist_delete
	.align	2
	.global	sglib_ilist_delete_if_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_delete_if_member, %function
sglib_ilist_delete_if_member:
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
	str	r3, [fp, #-8]
	b	.L31
.L33:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L31:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L32
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L33
.L32:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L34
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
.L34:
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
	.size	sglib_ilist_delete_if_member, .-sglib_ilist_delete_if_member
	.align	2
	.global	sglib_ilist_sort
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_sort, %function
sglib_ilist_sort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	str	r3, [fp, #-40]
	mov	r3, #1
	str	r3, [fp, #-36]
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L37
.L58:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-40]
	sub	r3, fp, #40
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L38
.L57:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	b	.L39
.L41:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
.L39:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L40
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L41
.L40:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L42
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	b	.L43
.L42:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	str	r2, [r3, #4]
	mov	r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	b	.L44
.L46:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
.L44:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L45
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L46
.L45:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L47
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L49
.L47:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	str	r2, [r3, #4]
	b	.L49
.L52:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	sub	r3, r2, r3
	cmp	r3, #0
	bge	.L50
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L49
.L50:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
.L49:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L52
.L51:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L53
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	b	.L55
.L53:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	b	.L55
.L56:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-24]
.L55:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L56
	mov	r3, #1
	str	r3, [fp, #-36]
.L38:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L57
.L43:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #1
	str	r3, [fp, #-32]
.L37:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L58
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-48]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_sort, .-sglib_ilist_sort
	.align	2
	.global	sglib_ilist_len
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_len, %function
sglib_ilist_len:
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
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	b	.L60
.L61:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
.L60:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L61
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_len, .-sglib_ilist_len
	.align	2
	.global	sglib_ilist_reverse
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_reverse, %function
sglib_ilist_reverse:
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
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L64
.L65:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
.L64:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L65
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_ilist_reverse, .-sglib_ilist_reverse
	.align	2
	.global	sglib_ilist_it_init_on_equal
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_it_init_on_equal, %function
sglib_ilist_it_init_on_equal:
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
	str	r2, [r3, #8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r0, [fp, #-8]
	bl	sglib_ilist_it_next
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_ilist_it_init_on_equal, .-sglib_ilist_it_init_on_equal
	.align	2
	.global	sglib_ilist_it_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_it_init, %function
sglib_ilist_it_init:
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
	bl	sglib_ilist_it_init_on_equal
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_ilist_it_init, .-sglib_ilist_it_init
	.align	2
	.global	sglib_ilist_it_current
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_it_current, %function
sglib_ilist_it_current:
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
	.size	sglib_ilist_it_current, .-sglib_ilist_it_current
	.align	2
	.global	sglib_ilist_it_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_ilist_it_next, %function
sglib_ilist_it_next:
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
	ldr	r3, [r3, #8]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-16]
	b	.L74
.L75:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L74:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L73
	ldr	r3, [fp, #-16]
	ldr	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	mov	lr, pc
	bx	r3
	mov	r3, r0
	cmp	r3, #0
	bne	.L75
.L73:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L76
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-24]
	str	r2, [r3, #4]
.L76:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_ilist_it_next, .-sglib_ilist_it_next
	.align	2
	.global	sglib_hashed_ilist_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_init, %function
sglib_hashed_ilist_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L79
.L80:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L79:
	ldr	r3, [fp, #-8]
	cmp	r3, #19
	bls	.L80
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_hashed_ilist_init, .-sglib_hashed_ilist_init
	.align	2
	.global	sglib_hashed_ilist_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_add, %function
sglib_hashed_ilist_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	ilist_hash_function
	mov	r2, r0
	ldr	r3, .L82
	umull	r1, r3, r2, r3
	lsr	r1, r3, #4
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_ilist_add
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L83:
	.align	2
.L82:
	.word	-858993459
	.size	sglib_hashed_ilist_add, .-sglib_hashed_ilist_add
	.align	2
	.global	sglib_hashed_ilist_add_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_add_if_not_member, %function
sglib_hashed_ilist_add_if_not_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	ilist_hash_function
	mov	r2, r0
	ldr	r3, .L86
	umull	r1, r3, r2, r3
	lsr	r1, r3, #4
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_ilist_add_if_not_member
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L87:
	.align	2
.L86:
	.word	-858993459
	.size	sglib_hashed_ilist_add_if_not_member, .-sglib_hashed_ilist_add_if_not_member
	.align	2
	.global	sglib_hashed_ilist_delete
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_delete, %function
sglib_hashed_ilist_delete:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	ilist_hash_function
	mov	r2, r0
	ldr	r3, .L89
	umull	r1, r3, r2, r3
	lsr	r1, r3, #4
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_ilist_delete
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	-858993459
	.size	sglib_hashed_ilist_delete, .-sglib_hashed_ilist_delete
	.align	2
	.global	sglib_hashed_ilist_delete_if_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_delete_if_member, %function
sglib_hashed_ilist_delete_if_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	ilist_hash_function
	mov	r2, r0
	ldr	r3, .L93
	umull	r1, r3, r2, r3
	lsr	r1, r3, #4
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-24]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_ilist_delete_if_member
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L94:
	.align	2
.L93:
	.word	-858993459
	.size	sglib_hashed_ilist_delete_if_member, .-sglib_hashed_ilist_delete_if_member
	.align	2
	.global	sglib_hashed_ilist_is_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_is_member, %function
sglib_hashed_ilist_is_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	ilist_hash_function
	mov	r2, r0
	ldr	r3, .L97
	umull	r1, r3, r2, r3
	lsr	r1, r3, #4
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_ilist_is_member
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	-858993459
	.size	sglib_hashed_ilist_is_member, .-sglib_hashed_ilist_is_member
	.align	2
	.global	sglib_hashed_ilist_find_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_find_member, %function
sglib_hashed_ilist_find_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-20]
	bl	ilist_hash_function
	mov	r2, r0
	ldr	r3, .L101
	umull	r1, r3, r2, r3
	lsr	r1, r3, #4
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r1, [fp, #-20]
	mov	r0, r3
	bl	sglib_ilist_find_member
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L102:
	.align	2
.L101:
	.word	-858993459
	.size	sglib_hashed_ilist_find_member, .-sglib_hashed_ilist_find_member
	.align	2
	.global	sglib_hashed_ilist_it_init_on_equal
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_it_init_on_equal, %function
sglib_hashed_ilist_it_init_on_equal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #20]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #28]
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	bl	sglib_ilist_it_init_on_equal
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L104
	ldr	r0, [fp, #-16]
	bl	sglib_hashed_ilist_it_next
	str	r0, [fp, #-8]
.L104:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_hashed_ilist_it_init_on_equal, .-sglib_hashed_ilist_it_init_on_equal
	.align	2
	.global	sglib_hashed_ilist_it_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_it_init, %function
sglib_hashed_ilist_it_init:
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
	bl	sglib_hashed_ilist_it_init_on_equal
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_hashed_ilist_it_init, .-sglib_hashed_ilist_it_init
	.align	2
	.global	sglib_hashed_ilist_it_current
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_it_current, %function
sglib_hashed_ilist_it_current:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	bl	sglib_ilist_it_current
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_hashed_ilist_it_current, .-sglib_hashed_ilist_it_current
	.align	2
	.global	sglib_hashed_ilist_it_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_hashed_ilist_it_next, %function
sglib_hashed_ilist_it_next:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r0, r3
	bl	sglib_ilist_it_next
	str	r0, [fp, #-8]
	b	.L111
.L113:
	ldr	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r1, [r3]
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #28]
	bl	sglib_ilist_it_init_on_equal
	str	r0, [fp, #-8]
.L111:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L112
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	cmp	r3, #19
	ble	.L113
.L112:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_hashed_ilist_it_next, .-sglib_hashed_ilist_it_next
	.global	sglib_hashtable_array
	.data
	.align	2
	.type	sglib_hashtable_array, %object
	.size	sglib_hashtable_array, 400
sglib_hashtable_array:
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
	ldr	r3, .L116
	ldr	r2, .L116+4
	str	r2, [r3]
	ldr	r3, .L116
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L116+8
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L117:
	.align	2
.L116:
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
	ldr	r3, .L122
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L122
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L122+4
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L119
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L120
.L119:
	mov	r3, #0
	b	.L121
.L120:
	ldr	r3, .L122
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L122
	str	r3, [r2]
	ldr	r3, [fp, #-8]
.L121:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L123:
	.align	2
.L122:
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
	.global	beebs_sglib_hashtable_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_hashtable_verify_benchmark, %function
beebs_sglib_hashtable_verify_benchmark:
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
	.size	beebs_sglib_hashtable_verify_benchmark, .-beebs_sglib_hashtable_verify_benchmark
	.align	2
	.global	beebs_sglib_hashtable_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_hashtable_initialise_benchmark, %function
beebs_sglib_hashtable_initialise_benchmark:
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
	.size	beebs_sglib_hashtable_initialise_benchmark, .-beebs_sglib_hashtable_initialise_benchmark
	.align	2
	.global	beebs_sglib_hashtable_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_hashtable_benchmark, %function
beebs_sglib_hashtable_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #64
	mov	r3, #0
	str	r3, [fp, #-64]
	ldr	r0, .L137
	bl	sglib_hashed_ilist_init
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L129
.L131:
	ldr	r2, .L137+4
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-28]
	sub	r3, fp, #28
	mov	r1, r3
	ldr	r0, .L137
	bl	sglib_hashed_ilist_find_member
	mov	r3, r0
	cmp	r3, #0
	bne	.L130
	mov	r0, #8
	bl	malloc_beebs
	str	r0, [fp, #-20]
	ldr	r2, .L137+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r1, [fp, #-20]
	ldr	r0, .L137
	bl	sglib_hashed_ilist_add
.L130:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L129:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L131
	sub	r3, fp, #60
	ldr	r1, .L137
	mov	r0, r3
	bl	sglib_hashed_ilist_it_init
	str	r0, [fp, #-16]
	sub	r3, fp, #60
	ldr	r1, .L137
	mov	r0, r3
	bl	sglib_hashed_ilist_it_init
	str	r0, [fp, #-12]
	b	.L132
.L133:
	ldr	r3, [fp, #-16]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-16]
	sub	r3, fp, #60
	mov	r0, r3
	bl	sglib_hashed_ilist_it_next
	str	r0, [fp, #-12]
.L132:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L133
	sub	r3, fp, #60
	ldr	r1, .L137
	mov	r0, r3
	bl	sglib_hashed_ilist_it_init
	str	r0, [fp, #-12]
	b	.L134
.L135:
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r0, [fp, #-12]
	bl	free_beebs
	sub	r3, fp, #60
	mov	r0, r3
	bl	sglib_hashed_ilist_it_next
	str	r0, [fp, #-12]
.L134:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L135
	ldr	r3, [fp, #-64]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	sglib_hashtable_htab
	.word	sglib_hashtable_array
	.size	beebs_sglib_hashtable_benchmark, .-beebs_sglib_hashtable_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
