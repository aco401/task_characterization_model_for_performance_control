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
	.file	"libmergesort.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	rand_beebs, %function
rand_beebs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L3
	ldr	r3, [r3]
	ldr	r2, .L3+4
	mul	r3, r2, r3
	add	r3, r3, #12288
	add	r3, r3, #57
	bic	r3, r3, #-2147483648
	ldr	r2, .L3
	str	r3, [r2]
	ldr	r3, .L3
	ldr	r3, [r3]
	asr	r3, r3, #16
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L4:
	.align	2
.L3:
	.word	seed.0
	.word	1103515245
	.size	rand_beebs, .-rand_beebs
	.align	2
	.global	Min
	.syntax unified
	.arm
	.fpu softvfp
	.type	Min, %function
Min:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bge	.L6
	ldr	r3, [fp, #-8]
	b	.L7
.L6:
	ldr	r3, [fp, #-12]
.L7:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Min, .-Min
	.align	2
	.global	Max
	.syntax unified
	.arm
	.fpu softvfp
	.type	Max, %function
Max:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	ble	.L9
	ldr	r3, [fp, #-8]
	b	.L10
.L9:
	ldr	r3, [fp, #-12]
.L10:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Max, .-Max
	.align	2
	.global	Range_length
	.syntax unified
	.arm
	.fpu softvfp
	.type	Range_length, %function
Range_length:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	sub	r3, fp, #12
	stm	r3, {r0, r1}
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Range_length, .-Range_length
	.align	2
	.global	MakeRange
	.syntax unified
	.arm
	.fpu softvfp
	.type	MakeRange, %function
MakeRange:
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
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	mov	r2, r3
	sub	r3, fp, #12
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	ldr	r0, [fp, #-16]
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	MakeRange, .-MakeRange
	.align	2
	.global	mergesort_TestCompare
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestCompare, %function
mergesort_TestCompare:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	sub	ip, fp, #12
	stm	ip, {r0, r1}
	sub	r1, fp, #20
	stm	r1, {r2, r3}
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	movlt	r3, #1
	movge	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	mergesort_TestCompare, .-mergesort_TestCompare
	.align	2
	.global	BinaryLast
	.syntax unified
	.arm
	.fpu softvfp
	.type	BinaryLast, %function
BinaryLast:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	sub	r1, fp, #44
	stm	r1, {r2, r3}
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-40]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
	b	.L18
.L20:
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r3, [fp, #-24]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r4, [fp, #4]
	ldm	r3, {r2, r3}
	ldm	r1, {r0, r1}
	mov	lr, pc
	bx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	.L19
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L18
.L19:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-20]
.L18:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L20
	ldr	r3, [fp, #-40]
	sub	r3, r3, #1
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L21
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r4, [fp, #4]
	ldm	r3, {r2, r3}
	ldm	r1, {r0, r1}
	mov	lr, pc
	bx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L21:
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	BinaryLast, .-BinaryLast
	.align	2
	.global	mergesort_InsertionSort
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_InsertionSort, %function
mergesort_InsertionSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	sub	r0, fp, #40
	stm	r0, {r1, r2}
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L24
.L28:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r2, r2, r3
	sub	r3, fp, #28
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-20]
	b	.L25
.L27:
	ldr	r3, [fp, #-20]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r1, r2, r3
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, r1
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-20]
	sub	r3, r3, #1
	str	r3, [fp, #-20]
.L25:
	ldr	r3, [fp, #-40]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	ble	.L26
	ldr	r3, [fp, #-20]
	sub	r3, r3, #-536870911
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r4, [fp, #-44]
	ldm	r3, {r2, r3}
	sub	r1, fp, #28
	ldm	r1, {r0, r1}
	mov	lr, pc
	bx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	.L27
.L26:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	mov	r2, r3
	sub	r3, fp, #28
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L24:
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	blt	.L28
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
	.size	mergesort_InsertionSort, .-mergesort_InsertionSort
	.align	2
	.global	MergeSortR
	.syntax unified
	.arm
	.fpu softvfp
	.type	MergeSortR, %function
MergeSortR:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #64
	str	r0, [fp, #-48]
	sub	r0, fp, #56
	stm	r0, {r1, r2}
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-24]
	sub	r3, fp, #56
	ldm	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	cmp	r3, #31
	bgt	.L30
	ldr	r3, [fp, #-60]
	sub	r2, fp, #56
	ldm	r2, {r1, r2}
	ldr	r0, [fp, #-48]
	bl	mergesort_InsertionSort
	b	.L29
.L30:
	ldr	r2, [fp, #-56]
	ldr	r1, [fp, #-52]
	ldr	r3, [fp, #-56]
	sub	r3, r1, r3
	lsr	r1, r3, #31
	add	r3, r1, r3
	asr	r3, r3, #1
	add	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r1, [fp, #-56]
	sub	r3, fp, #36
	ldr	r2, [fp, #-28]
	mov	r0, r3
	bl	MakeRange
	ldr	r2, [fp, #-52]
	sub	r3, fp, #44
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	MakeRange
	ldr	r3, [fp, #4]
	str	r3, [sp]
	ldr	r3, [fp, #-60]
	sub	r2, fp, #36
	ldm	r2, {r1, r2}
	ldr	r0, [fp, #-48]
	bl	MergeSortR
	ldr	r3, [fp, #4]
	str	r3, [sp]
	ldr	r3, [fp, #-60]
	sub	r2, fp, #44
	ldm	r2, {r1, r2}
	ldr	r0, [fp, #-48]
	bl	MergeSortR
	ldr	r1, [fp, #-44]
	ldr	r3, [fp, #-60]
	str	r3, [sp]
	sub	r3, fp, #36
	ldm	r3, {r2, r3}
	ldr	r0, [fp, #-48]
	bl	BinaryLast
	mov	r1, r0
	ldr	r2, [fp, #-32]
	sub	r3, fp, #68
	mov	r0, r3
	bl	MakeRange
	sub	r3, fp, #36
	sub	r2, fp, #68
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r4, r2, r3
	sub	r3, fp, #36
	ldm	r3, {r0, r1}
	bl	Range_length
	mov	r3, r0
	lsl	r3, r3, #3
	mov	r2, r3
	mov	r1, r4
	ldr	r0, [fp, #4]
	bl	memcpy
	b	.L32
.L36:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r1, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #4]
	add	r3, r2, r3
	ldr	r4, [fp, #-60]
	ldm	r3, {r2, r3}
	ldm	r1, {r0, r1}
	mov	lr, pc
	bx	r4
	mov	r3, r0
	cmp	r3, #0
	bne	.L33
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #4]
	add	r1, r2, r3
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	mov	r2, r1
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L34
.L33:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r1, r2, r3
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r3, r2, r3
	mov	r2, r1
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L34:
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
.L32:
	sub	r3, fp, #36
	ldm	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [fp, #-16]
	cmp	r3, r2
	bge	.L35
	sub	r3, fp, #44
	ldm	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	blt	.L36
.L35:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	lsl	r3, r3, #3
	ldr	r2, [fp, #-48]
	add	r4, r2, r3
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	ldr	r2, [fp, #4]
	add	r5, r2, r3
	sub	r3, fp, #36
	ldm	r3, {r0, r1}
	bl	Range_length
	mov	r2, r0
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	lsl	r3, r3, #3
	mov	r2, r3
	mov	r1, r5
	mov	r0, r4
	bl	memcpy
.L29:
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
	.size	MergeSortR, .-MergeSortR
	.align	2
	.global	MergeSort
	.syntax unified
	.arm
	.fpu softvfp
	.type	MergeSort, %function
MergeSort:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #3
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	add	r3, sp, #8
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	str	r3, [fp, #-8]
	sub	r3, fp, #16
	ldr	r2, [fp, #-28]
	mov	r1, #0
	mov	r0, r3
	bl	MakeRange
	ldr	r3, [fp, #-8]
	str	r3, [sp]
	ldr	r3, [fp, #-32]
	sub	r2, fp, #16
	ldm	r2, {r1, r2}
	ldr	r0, [fp, #-24]
	bl	MergeSortR
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	MergeSort, .-MergeSort
	.align	2
	.global	mergesort_TestingPathological
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingPathological, %function
mergesort_TestingPathological:
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
	cmp	r3, #0
	bne	.L39
	mov	r3, #10
	b	.L40
.L39:
	ldr	r3, [fp, #-12]
	lsr	r2, r3, #31
	add	r3, r2, r3
	asr	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	bge	.L41
	mov	r3, #11
	b	.L40
.L41:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bne	.L42
	mov	r3, #10
	b	.L40
.L42:
	mov	r3, #9
.L40:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	mergesort_TestingPathological, .-mergesort_TestingPathological
	.align	2
	.global	mergesort_TestingRandom
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingRandom, %function
mergesort_TestingRandom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	mergesort_TestingRandom, .-mergesort_TestingRandom
	.global	__aeabi_i2d
	.global	__aeabi_ddiv
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_dsub
	.global	__aeabi_d2iz
	.align	2
	.global	mergesort_TestingMostlyDescending
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingMostlyDescending, %function
mergesort_TestingMostlyDescending:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r4, r0
	mov	r5, r1
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, #0
	ldr	r3, .L47
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L47+4
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L47+8
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	1088421824
	.word	1075052544
	.word	1074003968
	.size	mergesort_TestingMostlyDescending, .-mergesort_TestingMostlyDescending
	.align	2
	.global	mergesort_TestingMostlyAscending
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingMostlyAscending, %function
mergesort_TestingMostlyAscending:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	__aeabi_i2d
	mov	r4, r0
	mov	r5, r1
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, #0
	ldr	r3, .L51
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L51+4
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L51+8
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	1088421824
	.word	1075052544
	.word	1074003968
	.size	mergesort_TestingMostlyAscending, .-mergesort_TestingMostlyAscending
	.align	2
	.global	mergesort_TestingAscending
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingAscending, %function
mergesort_TestingAscending:
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
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	mergesort_TestingAscending, .-mergesort_TestingAscending
	.align	2
	.global	mergesort_TestingDescending
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingDescending, %function
mergesort_TestingDescending:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r2, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	mergesort_TestingDescending, .-mergesort_TestingDescending
	.align	2
	.global	mergesort_TestingEqual
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingEqual, %function
mergesort_TestingEqual:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	mov	r3, #1000
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	mergesort_TestingEqual, .-mergesort_TestingEqual
	.global	__aeabi_dcmple
	.align	2
	.global	mergesort_TestingJittered
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingJittered, %function
mergesort_TestingJittered:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, #0
	ldr	r3, .L66+8
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adr	r3, .L66
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L65
	ldr	r3, [fp, #-8]
	b	.L63
.L65:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #2
.L63:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L67:
	.align	3
.L66:
	.word	-858993459
	.word	1072483532
	.word	1088421824
	.size	mergesort_TestingJittered, .-mergesort_TestingJittered
	.align	2
	.global	mergesort_TestingMostlyEqual
	.syntax unified
	.arm
	.fpu softvfp
	.type	mergesort_TestingMostlyEqual, %function
mergesort_TestingMostlyEqual:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	rand_beebs
	mov	r3, r0
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, #0
	ldr	r3, .L70
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L70+4
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L70+8
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	1088421824
	.word	1074790400
	.word	1083129856
	.size	mergesort_TestingMostlyEqual, .-mergesort_TestingMostlyEqual
	.global	max_size
	.section	.rodata
	.align	2
	.type	max_size, %object
	.size	max_size, 4
max_size:
	.word	100
	.global	array1
	.bss
	.align	2
	.type	array1, %object
	.size	array1, 800
array1:
	.space	800
	.text
	.align	2
	.global	beebs_mergesort_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_mergesort_initialise_benchmark, %function
beebs_mergesort_initialise_benchmark:
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
	.size	beebs_mergesort_initialise_benchmark, .-beebs_mergesort_initialise_benchmark
	.section	.rodata
	.align	2
.LC0:
	.word	mergesort_TestingPathological
	.word	mergesort_TestingRandom
	.word	mergesort_TestingMostlyDescending
	.word	mergesort_TestingMostlyAscending
	.word	mergesort_TestingAscending
	.word	mergesort_TestingDescending
	.word	mergesort_TestingEqual
	.word	mergesort_TestingJittered
	.word	mergesort_TestingMostlyEqual
	.text
	.align	2
	.global	beebs_mergesort_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_mergesort_benchmark, %function
beebs_mergesort_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #64
	ldr	r3, .L79
	str	r3, [fp, #-16]
	ldr	r3, .L79+4
	sub	ip, fp, #56
	mov	lr, r3
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [lr]
	str	r3, [ip]
	mov	r3, #100
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L74
.L77:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L75
.L76:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-52]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-8]
	mov	lr, pc
	bx	r3
	mov	r3, r0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-60]
	ldr	r2, .L79+8
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	sub	r2, fp, #64
	ldm	r2, {r0, r1}
	stm	r3, {r0, r1}
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L75:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	blt	.L76
	ldr	r2, [fp, #-16]
	ldr	r1, [fp, #-20]
	ldr	r0, .L79+8
	bl	MergeSort
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L74:
	ldr	r3, [fp, #-12]
	cmp	r3, #8
	bls	.L77
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L80:
	.align	2
.L79:
	.word	mergesort_TestCompare
	.word	.LC0
	.word	array1
	.size	beebs_mergesort_benchmark, .-beebs_mergesort_benchmark
	.section	.rodata
	.align	2
.LC1:
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1000
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1001
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1002
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.word	1003
	.align	2
.LC2:
	.word	0
	.word	9
	.word	14
	.word	16
	.word	17
	.word	19
	.word	21
	.word	29
	.word	35
	.word	36
	.word	38
	.word	42
	.word	46
	.word	49
	.word	51
	.word	65
	.word	76
	.word	77
	.word	78
	.word	80
	.word	84
	.word	85
	.word	90
	.word	97
	.word	98
	.word	5
	.word	6
	.word	8
	.word	20
	.word	23
	.word	24
	.word	26
	.word	30
	.word	34
	.word	43
	.word	44
	.word	45
	.word	47
	.word	52
	.word	53
	.word	54
	.word	56
	.word	63
	.word	71
	.word	72
	.word	86
	.word	87
	.word	91
	.word	95
	.word	1
	.word	2
	.word	3
	.word	4
	.word	10
	.word	11
	.word	12
	.word	13
	.word	28
	.word	32
	.word	37
	.word	39
	.word	41
	.word	48
	.word	50
	.word	55
	.word	57
	.word	58
	.word	60
	.word	62
	.word	64
	.word	66
	.word	68
	.word	69
	.word	70
	.word	73
	.word	75
	.word	79
	.word	81
	.word	82
	.word	83
	.word	88
	.word	92
	.word	94
	.word	99
	.word	7
	.word	15
	.word	18
	.word	22
	.word	25
	.word	27
	.word	31
	.word	33
	.word	40
	.word	59
	.word	61
	.word	67
	.word	74
	.word	89
	.word	93
	.word	96
	.text
	.align	2
	.global	beebs_mergesort_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_mergesort_verify_benchmark, %function
beebs_mergesort_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 816
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #816
	str	r0, [fp, #-816]
	ldr	r2, .L90
	sub	r3, fp, #408
	mov	r1, r2
	mov	r2, #400
	mov	r0, r3
	bl	memcpy
	ldr	r2, .L90+4
	sub	r3, fp, #808
	mov	r1, r2
	mov	r2, #400
	mov	r0, r3
	bl	memcpy
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L82
.L85:
	ldr	r2, .L90+8
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-404]
	cmp	r2, r3
	beq	.L83
	ldr	r3, [fp, #-8]
	b	.L89
.L83:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L82:
	mov	r2, #100
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	blt	.L85
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L86
.L88:
	ldr	r2, .L90+8
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-804]
	cmp	r2, r3
	beq	.L87
	mov	r3, #3
	b	.L89
.L87:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L86:
	mov	r2, #100
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	blt	.L88
	mov	r3, #1
.L89:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	.LC1
	.word	.LC2
	.word	array1
	.size	beebs_mergesort_verify_benchmark, .-beebs_mergesort_verify_benchmark
	.bss
	.align	2
seed.0:
	.space	4
	.size	seed.0, 4
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
