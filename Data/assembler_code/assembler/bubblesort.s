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
	.file	"libbubblesort.c"
	.text
	.global	Array
	.bss
	.align	2
	.type	Array, %object
	.size	Array, 404
Array:
	.space	404
	.global	Seed
	.align	2
	.type	Seed, %object
	.size	Seed, 4
Seed:
	.space	4
	.global	factor
	.align	2
	.type	factor, %object
	.size	factor, 4
factor:
	.space	4
	.text
	.align	2
	.global	beebs_bubblesort_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_bubblesort_benchmark, %function
beebs_bubblesort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L3
	bl	BubbleSort
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	Array
	.size	beebs_bubblesort_benchmark, .-beebs_bubblesort_benchmark
	.align	2
	.global	beebs_bubblesort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_bubblesort_initialise_benchmark, %function
beebs_bubblesort_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	ldr	r3, .L8
	mvn	r2, #0
	str	r2, [r3]
	ldr	r3, .L8
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L6
.L7:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	mul	r2, r3, r2
	ldr	r1, .L8+4
	ldr	r3, [fp, #-8]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L6:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L7
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	factor
	.word	Array
	.size	beebs_bubblesort_initialise_benchmark, .-beebs_bubblesort_initialise_benchmark
	.align	2
	.global	BubbleSort
	.syntax unified
	.arm
	.fpu softvfp
	.type	BubbleSort, %function
BubbleSort:
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
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L11
.L19:
	mov	r3, #1
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L12
.L16:
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #100
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bge	.L20
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L15
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-24]
	add	r3, r1, r3
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-8]
.L15:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-12]
	cmp	r3, #99
	ble	.L16
	b	.L14
.L20:
	nop
.L14:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L11:
	ldr	r3, [fp, #-16]
	cmp	r3, #99
	ble	.L19
	b	.L22
.L21:
	nop
.L22:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	BubbleSort, .-BubbleSort
	.section	.rodata
	.align	2
.LC0:
	.word	-99
	.word	-98
	.word	-97
	.word	-96
	.word	-95
	.word	-94
	.word	-93
	.word	-92
	.word	-91
	.word	-90
	.word	-89
	.word	-88
	.word	-87
	.word	-86
	.word	-85
	.word	-84
	.word	-83
	.word	-82
	.word	-81
	.word	-80
	.word	-79
	.word	-78
	.word	-77
	.word	-76
	.word	-75
	.word	-74
	.word	-73
	.word	-72
	.word	-71
	.word	-70
	.word	-69
	.word	-68
	.word	-67
	.word	-66
	.word	-65
	.word	-64
	.word	-63
	.word	-62
	.word	-61
	.word	-60
	.word	-59
	.word	-58
	.word	-57
	.word	-56
	.word	-55
	.word	-54
	.word	-53
	.word	-52
	.word	-51
	.word	-50
	.word	-49
	.word	-48
	.word	-47
	.word	-46
	.word	-45
	.word	-44
	.word	-43
	.word	-42
	.word	-41
	.word	-40
	.word	-39
	.word	-38
	.word	-37
	.word	-36
	.word	-35
	.word	-34
	.word	-33
	.word	-32
	.word	-31
	.word	-30
	.word	-29
	.word	-28
	.word	-27
	.word	-26
	.word	-25
	.word	-24
	.word	-23
	.word	-22
	.word	-21
	.word	-20
	.word	-19
	.word	-18
	.word	-17
	.word	-16
	.word	-15
	.word	-14
	.word	-13
	.word	-12
	.word	-11
	.word	-10
	.word	-9
	.word	-8
	.word	-7
	.word	-6
	.word	-5
	.word	-4
	.word	-3
	.word	-2
	.word	-1
	.word	0
	.text
	.align	2
	.global	beebs_bubblesort_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_bubblesort_verify_benchmark, %function
beebs_bubblesort_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 416
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #416
	str	r0, [fp, #-416]
	ldr	r2, .L29
	sub	r3, fp, #408
	mov	r1, r2
	mov	r2, #400
	mov	r0, r3
	bl	memcpy
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L27:
	ldr	r2, .L29+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-404]
	cmp	r2, r3
	beq	.L25
	mov	r3, #0
	b	.L28
.L25:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L27
	mov	r3, #1
.L28:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LC0
	.word	Array
	.size	beebs_bubblesort_verify_benchmark, .-beebs_bubblesort_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
