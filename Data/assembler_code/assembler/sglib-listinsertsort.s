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
	.file	"listinsertsort.c"
	.text
	.global	sglib_listinsertsort_array
	.data
	.align	2
	.type	sglib_listinsertsort_array, %object
	.size	sglib_listinsertsort_array, 400
sglib_listinsertsort_array:
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
	.text
	.align	2
	.global	sglib_iListType_is_member
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_is_member, %function
sglib_iListType_is_member:
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
	b	.L2
.L4:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L5
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	sub	r3, r2, r3
	cmp	r3, #0
	blt	.L4
	b	.L5
.L7:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L6
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L6
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L7
.L6:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iListType_is_member, .-sglib_iListType_is_member
	.align	2
	.global	sglib_iListType_find_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_find_member, %function
sglib_iListType_find_member:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	b	.L10
.L12:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L11
	ldr	r3, [fp, #-12]
	ldr	r2, [r3]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L12
.L11:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L13
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L14
.L13:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
.L14:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iListType_find_member, .-sglib_iListType_find_member
	.align	2
	.global	sglib_iListType_add_if_not_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_add_if_not_member, %function
sglib_iListType_add_if_not_member:
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
	mvn	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L17
.L19:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L18
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L19
.L18:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	beq	.L20
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3]
	b	.L21
.L20:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	str	r2, [r3]
.L21:
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
	.size	sglib_iListType_add_if_not_member, .-sglib_iListType_add_if_not_member
	.align	2
	.global	sglib_iListType_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_add, %function
sglib_iListType_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mvn	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L24
.L26:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L25
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L26
.L25:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iListType_add, .-sglib_iListType_add
	.align	2
	.global	sglib_iListType_delete
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_delete, %function
sglib_iListType_delete:
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
	b	.L28
.L30:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L28:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bne	.L30
.L29:
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
	.size	sglib_iListType_delete, .-sglib_iListType_delete
	.align	2
	.global	sglib_iListType_delete_if_member
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_delete_if_member, %function
sglib_iListType_delete_if_member:
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
	mvn	r3, #0
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L32
.L34:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-8]
.L32:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L34
.L33:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L35
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-24]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	b	.L36
.L35:
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3]
.L36:
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
	.size	sglib_iListType_delete_if_member, .-sglib_iListType_delete_if_member
	.align	2
	.global	sglib_iListType_len
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_len, %function
sglib_iListType_len:
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
	b	.L39
.L40:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
.L39:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L40
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iListType_len, .-sglib_iListType_len
	.align	2
	.global	sglib_iListType_sort
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_sort, %function
sglib_iListType_sort:
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
	b	.L43
.L64:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-40]
	sub	r3, fp, #40
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L44
.L63:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	mov	r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-20]
	b	.L45
.L47:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
.L45:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L46
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L47
.L46:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L48
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	b	.L49
.L48:
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
	b	.L50
.L52:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-20]
.L50:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bge	.L51
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L52
.L51:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L53
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L55
.L53:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-20]
	mov	r2, #0
	str	r2, [r3, #4]
	b	.L55
.L58:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	sub	r3, r2, r3
	cmp	r3, #0
	bge	.L56
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L55
.L56:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
.L55:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L58
.L57:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L59
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	b	.L61
.L59:
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	b	.L61
.L62:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-24]
.L61:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L62
	mov	r3, #1
	str	r3, [fp, #-36]
.L44:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L63
.L49:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #1
	str	r3, [fp, #-32]
.L43:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L64
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-48]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iListType_sort, .-sglib_iListType_sort
	.align	2
	.global	sglib_iListType_it_init_on_equal
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_it_init_on_equal, %function
sglib_iListType_it_init_on_equal:
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
	bl	sglib_iListType_it_next
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_iListType_it_init_on_equal, .-sglib_iListType_it_init_on_equal
	.align	2
	.global	sglib_iListType_it_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_it_init, %function
sglib_iListType_it_init:
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
	bl	sglib_iListType_it_init_on_equal
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	sglib_iListType_it_init, .-sglib_iListType_it_init
	.align	2
	.global	sglib_iListType_it_current
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_it_current, %function
sglib_iListType_it_current:
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
	.size	sglib_iListType_it_current, .-sglib_iListType_it_current
	.align	2
	.global	sglib_iListType_it_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iListType_it_next, %function
sglib_iListType_it_next:
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
	beq	.L72
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-20]
	b	.L73
.L75:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L73:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-16]
	ldr	r0, [fp, #-8]
	mov	lr, pc
	bx	r3
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	blt	.L75
.L74:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L72
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	ble	.L72
	mov	r3, #0
	str	r3, [fp, #-8]
.L72:
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
	.size	sglib_iListType_it_next, .-sglib_iListType_it_next
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
	ldr	r3, .L79
	ldr	r2, .L79+4
	str	r2, [r3]
	ldr	r3, .L79
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L79+8
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L80:
	.align	2
.L79:
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
	ldr	r3, .L85
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L85
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L85+4
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L82
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L83
.L82:
	mov	r3, #0
	b	.L84
.L83:
	ldr	r3, .L85
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L85
	str	r3, [r2]
	ldr	r3, [fp, #-8]
.L84:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L86:
	.align	2
.L85:
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
	.global	beebs_sglib_listinsertsort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_listinsertsort_initialise_benchmark, %function
beebs_sglib_listinsertsort_initialise_benchmark:
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
	.size	beebs_sglib_listinsertsort_initialise_benchmark, .-beebs_sglib_listinsertsort_initialise_benchmark
	.align	2
	.global	beebs_sglib_listinsertsort_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_listinsertsort_benchmark, %function
beebs_sglib_listinsertsort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L90
.L91:
	mov	r0, #8
	bl	malloc_beebs
	str	r0, [fp, #-12]
	ldr	r2, .L97
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-12]
	str	r2, [r3]
	sub	r3, fp, #20
	ldr	r1, [fp, #-12]
	mov	r0, r3
	bl	sglib_iListType_add
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L90:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L91
	ldr	r2, [fp, #-20]
	sub	r3, fp, #36
	mov	r1, r2
	mov	r0, r3
	bl	sglib_iListType_it_init
	str	r0, [fp, #-12]
	b	.L92
.L93:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	sub	r3, fp, #36
	mov	r0, r3
	bl	sglib_iListType_it_next
	str	r0, [fp, #-12]
.L92:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L93
	ldr	r2, [fp, #-20]
	sub	r3, fp, #36
	mov	r1, r2
	mov	r0, r3
	bl	sglib_iListType_it_init
	str	r0, [fp, #-12]
	b	.L94
.L95:
	ldr	r0, [fp, #-12]
	bl	free_beebs
	sub	r3, fp, #36
	mov	r0, r3
	bl	sglib_iListType_it_next
	str	r0, [fp, #-12]
.L94:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L95
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L98:
	.align	2
.L97:
	.word	sglib_listinsertsort_array
	.size	beebs_sglib_listinsertsort_benchmark, .-beebs_sglib_listinsertsort_benchmark
	.align	2
	.global	beebs_sglib_listinsertsort_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_listinsertsort_verify_benchmark, %function
beebs_sglib_listinsertsort_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L102
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L100
	mov	r3, #0
	b	.L101
.L100:
	mov	r3, #1
.L101:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L103:
	.align	2
.L102:
	.word	4936
	.size	beebs_sglib_listinsertsort_verify_benchmark, .-beebs_sglib_listinsertsort_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
