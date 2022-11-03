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
	.file	"listsort.c"
	.text
	.global	sglib_listsort_array
	.data
	.align	2
	.type	sglib_listsort_array, %object
	.size	sglib_listsort_array, 400
sglib_listsort_array:
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
	.arch armv4t
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
	ldr	r3, .L2
	ldr	r2, .L2+4
	str	r2, [r3]
	ldr	r3, .L2
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L2+8
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
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
	ldr	r3, .L8
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L8+4
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L5
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L6
.L5:
	mov	r3, #0
	b	.L7
.L6:
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L8
	str	r3, [r2]
	ldr	r3, [fp, #-8]
.L7:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
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
	.global	beebs_sglib_listsort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_listsort_initialise_benchmark, %function
beebs_sglib_listsort_initialise_benchmark:
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
	.size	beebs_sglib_listsort_initialise_benchmark, .-beebs_sglib_listsort_initialise_benchmark
	.align	2
	.global	beebs_sglib_listsort_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_listsort_benchmark, %function
beebs_sglib_listsort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L13
.L14:
	mov	r0, #8
	bl	malloc_beebs
	str	r0, [fp, #-80]
	ldr	r2, .L44
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-80]
	str	r2, [r3]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-80]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L13:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L14
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L15
.L16:
	ldr	r3, [fp, #-20]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-20]
.L15:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L16
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-84]
	mov	r3, #1
	str	r3, [fp, #-56]
	mov	r3, #1
	str	r3, [fp, #-52]
	b	.L17
.L38:
	ldr	r3, [fp, #-84]
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-84]
	sub	r3, fp, #84
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L18
.L37:
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-28]
	mov	r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-40]
	b	.L19
.L21:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-40]
.L19:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bge	.L20
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L21
.L20:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L22
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	b	.L23
.L22:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-40]
	mov	r2, #0
	str	r2, [r3, #4]
	mov	r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-40]
	b	.L24
.L26:
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-40]
.L24:
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bge	.L25
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L26
.L25:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	bne	.L27
	mov	r3, #0
	str	r3, [fp, #-36]
	b	.L29
.L27:
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-40]
	mov	r2, #0
	str	r2, [r3, #4]
	b	.L29
.L32:
	ldr	r3, [fp, #-28]
	ldr	r2, [r3]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	sub	r3, r2, r3
	cmp	r3, #0
	bge	.L30
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-28]
	b	.L29
.L30:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #4
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
.L29:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L31
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L32
.L31:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L33
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	b	.L35
.L33:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-32]
	str	r2, [r3]
	b	.L35
.L36:
	ldr	r3, [fp, #-44]
	ldr	r3, [r3]
	add	r3, r3, #4
	str	r3, [fp, #-44]
.L35:
	ldr	r3, [fp, #-44]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L36
	mov	r3, #1
	str	r3, [fp, #-56]
.L18:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bne	.L37
.L23:
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #1
	str	r3, [fp, #-52]
.L17:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	bne	.L38
	ldr	r3, [fp, #-84]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-60]
	b	.L39
.L40:
	ldr	r3, [fp, #-60]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-60]
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-72]
	str	r3, [fp, #-60]
.L39:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L40
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-64]
	b	.L41
.L42:
	ldr	r3, [fp, #-64]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-68]
	ldr	r0, [fp, #-64]
	bl	free_beebs
	ldr	r3, [fp, #-68]
	str	r3, [fp, #-64]
.L41:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L42
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	sglib_listsort_array
	.size	beebs_sglib_listsort_benchmark, .-beebs_sglib_listsort_benchmark
	.align	2
	.global	beebs_sglib_listsort_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_listsort_verify_benchmark, %function
beebs_sglib_listsort_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L49
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L47
	mov	r3, #0
	b	.L48
.L47:
	mov	r3, #1
.L48:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L50:
	.align	2
.L49:
	.word	4950
	.size	beebs_sglib_listsort_verify_benchmark, .-beebs_sglib_listsort_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
