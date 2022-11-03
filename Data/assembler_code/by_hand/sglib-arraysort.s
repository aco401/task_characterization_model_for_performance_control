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
	.file	"arraysort.c"
	.text
	.global	sglib_arraysort_array
	.data
	.align	2
	.type	sglib_arraysort_array, %object
	.size	sglib_arraysort_array, 400
sglib_arraysort_array:
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
	.global	array2
	.bss
	.align	2
	.type	array2, %object
	.size	array2, 400
array2:
	.space	400
	.text
	.align	2
	.global	beebs_sglib_arraysort_verify_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_arraysort_verify_benchmark, %function
beebs_sglib_arraysort_verify_benchmark:
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
	.size	beebs_sglib_arraysort_verify_benchmark, .-beebs_sglib_arraysort_verify_benchmark
	.align	2
	.global	beebs_sglib_arraysort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_arraysort_initialise_benchmark, %function
beebs_sglib_arraysort_initialise_benchmark:
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
	.size	beebs_sglib_arraysort_initialise_benchmark, .-beebs_sglib_arraysort_initialise_benchmark
	.align	2
	.global	beebs_sglib_arraysort_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_sglib_arraysort_benchmark, %function
beebs_sglib_arraysort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	mov	r3, #0
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	ldr	r2, .L20
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L6
	mov	r3, #50
	str	r3, [fp, #-12]
	b	.L7
.L12:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-16]
.L11:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-48]
	cmp	r3, #99
	bgt	.L8
	ldr	r2, .L20+4
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-48]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bgt	.L9
	ldr	r2, .L20+4
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-48]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bge	.L9
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-16]
.L9:
	ldr	r3, [fp, #-52]
	cmp	r3, #99
	bgt	.L8
	ldr	r2, .L20+4
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-52]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bgt	.L8
	ldr	r2, .L20+4
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-52]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bge	.L8
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-16]
.L8:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	beq	.L10
	ldr	r2, .L20+4
	ldr	r3, [fp, #-44]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-56]
	ldr	r2, .L20+4
	ldr	r3, [fp, #-16]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-44]
	str	r2, [r1, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-56]
	str	r2, [r1, r3, lsl #2]
.L10:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bne	.L11
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L7:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L12
	mov	r3, #99
	str	r3, [fp, #-12]
	b	.L13
.L18:
	ldr	r3, .L20+4
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r2, .L20+4
	ldr	r3, [fp, #-12]
	ldr	r3, [r2, r3, lsl #2]
	ldr	r2, .L20+4
	str	r3, [r2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	str	r2, [r1, r3, lsl #2]
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
.L17:
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #1
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L14
	ldr	r2, .L20+4
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-32]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bgt	.L15
	ldr	r2, .L20+4
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-32]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bge	.L15
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-20]
.L15:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L14
	ldr	r2, .L20+4
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-36]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bgt	.L14
	ldr	r2, .L20+4
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-36]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bge	.L14
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-20]
.L14:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L16
	ldr	r2, .L20+4
	ldr	r3, [fp, #-28]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-40]
	ldr	r2, .L20+4
	ldr	r3, [fp, #-20]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-28]
	str	r2, [r1, r3, lsl #2]
	ldr	r1, .L20+4
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-40]
	str	r2, [r1, r3, lsl #2]
.L16:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L17
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L13:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L18
	ldr	r3, [fp, #-60]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L21:
	.align	2
.L20:
	.word	sglib_arraysort_array
	.word	array2
	.size	beebs_sglib_arraysort_benchmark, .-beebs_sglib_arraysort_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
