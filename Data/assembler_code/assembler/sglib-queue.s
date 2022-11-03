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
	.file	"queue.c"
	.text
	.align	2
	.global	sglib_iq_init
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_init, %function
sglib_iq_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #408]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #408]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #404]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iq_init, .-sglib_iq_init
	.align	2
	.global	sglib_iq_is_empty
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_is_empty, %function
sglib_iq_is_empty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #404]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #408]
	cmp	r2, r3
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iq_is_empty, .-sglib_iq_is_empty
	.align	2
	.global	sglib_iq_is_full
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_is_full, %function
sglib_iq_is_full:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r0, [r3, #404]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #408]
	add	r1, r3, #1
	ldr	r3, .L6
	smull	r2, r3, r1, r3
	asr	r2, r3, #4
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	ip, r3, #2
	add	r3, r3, ip
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	cmp	r0, r2
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	680390859
	.size	sglib_iq_is_full, .-sglib_iq_is_full
	.align	2
	.global	sglib_iq_first_element
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_first_element, %function
sglib_iq_first_element:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #404]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, r2, lsl #2]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iq_first_element, .-sglib_iq_first_element
	.align	2
	.global	sglib_iq_first_element_ptr
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_first_element_ptr, %function
sglib_iq_first_element_ptr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #404]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	sglib_iq_first_element_ptr, .-sglib_iq_first_element_ptr
	.align	2
	.global	sglib_iq_add_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_add_next, %function
sglib_iq_add_next:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #408]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #408]
	add	r1, r3, #1
	ldr	r3, .L13
	smull	r2, r3, r1, r3
	asr	r2, r3, #4
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #408]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	680390859
	.size	sglib_iq_add_next, .-sglib_iq_add_next
	.align	2
	.global	sglib_iq_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_add, %function
sglib_iq_add:
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
	ldr	r2, [r3, #408]
	ldr	r3, [fp, #-8]
	ldr	r1, [fp, #-12]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #408]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #408]
	add	r1, r3, #1
	ldr	r3, .L16
	smull	r2, r3, r1, r3
	asr	r2, r3, #4
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #408]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L17:
	.align	2
.L16:
	.word	680390859
	.size	sglib_iq_add, .-sglib_iq_add
	.align	2
	.global	sglib_iq_delete_first
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_delete_first, %function
sglib_iq_delete_first:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #404]
	add	r1, r3, #1
	ldr	r3, .L19
	smull	r2, r3, r1, r3
	asr	r2, r3, #4
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #404]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	680390859
	.size	sglib_iq_delete_first, .-sglib_iq_delete_first
	.align	2
	.global	sglib_iq_delete
	.syntax unified
	.arm
	.fpu softvfp
	.type	sglib_iq_delete, %function
sglib_iq_delete:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #404]
	add	r1, r3, #1
	ldr	r3, .L22
	smull	r2, r3, r1, r3
	asr	r2, r3, #4
	asr	r3, r1, #31
	sub	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r2
	sub	r2, r1, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #404]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	680390859
	.size	sglib_iq_delete, .-sglib_iq_delete
	.global	sglib_queue_array
	.data
	.align	2
	.type	sglib_queue_array, %object
	.size	sglib_queue_array, 400
sglib_queue_array:
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
	.global	beebs_sglib_queue_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_queue_initialise_benchmark, %function
beebs_sglib_queue_initialise_benchmark:
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
	.size	beebs_sglib_queue_initialise_benchmark, .-beebs_sglib_queue_initialise_benchmark
	.align	2
	.global	beebs_sglib_queue_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_queue_benchmark, %function
beebs_sglib_queue_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 456
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #460
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L26
.L27:
	ldr	r2, .L42
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-48]
	str	r2, [r3, #-452]
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	ldr	r3, .L42+4
	smull	r1, r3, r2, r3
	asr	r1, r3, #4
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r1
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L26:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L27
	b	.L28
.L29:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r2, r3, #1
	ldr	r3, .L42+4
	smull	r1, r3, r2, r3
	asr	r1, r3, #4
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r0, r3, #2
	add	r3, r3, r0
	lsl	r3, r3, #2
	add	r3, r3, r1
	sub	r3, r2, r3
	str	r3, [fp, #-12]
.L28:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bne	.L29
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L30
.L34:
	ldr	r2, .L42
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-48]
	str	r2, [r3, #-452]
	ldr	r3, [fp, #-12]
	add	r2, r3, #1
	str	r2, [fp, #-12]
	str	r3, [fp, #-24]
	b	.L31
.L33:
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r1, r3
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	lsl	r3, r1, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-452]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-52]
	str	r2, [r3, #-452]
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	str	r3, [fp, #-24]
.L31:
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L32
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	cmp	r2, r3
	bgt	.L32
	ldr	r3, [fp, #-24]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	cmp	r2, r3
	blt	.L33
.L32:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L34
	b	.L35
.L40:
	ldr	r3, [fp, #-456]
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	str	r3, [fp, #-456]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-28]
.L39:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L36
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	cmp	r2, r3
	bgt	.L37
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	cmp	r2, r3
	bge	.L37
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-28]
.L37:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L36
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	cmp	r2, r3
	bgt	.L36
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	cmp	r2, r3
	bge	.L36
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-28]
.L36:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	beq	.L38
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-452]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-452]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-452]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-44]
	str	r2, [r3, #-452]
.L38:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	bne	.L39
.L35:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L40
	ldr	r3, [fp, #-20]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L43:
	.align	2
.L42:
	.word	sglib_queue_array
	.word	680390859
	.size	beebs_sglib_queue_benchmark, .-beebs_sglib_queue_benchmark
	.align	2
	.global	beebs_sglib_queue_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_queue_verify_benchmark, %function
beebs_sglib_queue_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L47
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L45
	mov	r3, #0
	b	.L46
.L45:
	mov	r3, #1
.L46:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L48:
	.align	2
.L47:
	.word	9900
	.size	beebs_sglib_queue_verify_benchmark, .-beebs_sglib_queue_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
