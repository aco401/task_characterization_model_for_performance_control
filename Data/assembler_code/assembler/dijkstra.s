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
	.file	"dijkstra_small.c"
	.text
	.global	qHead
	.bss
	.align	2
	.type	qHead, %object
	.size	qHead, 4
qHead:
	.space	4
	.global	AdjMatrix
	.data
	.align	2
	.type	AdjMatrix, %object
	.size	AdjMatrix, 400
AdjMatrix:
	.word	32
	.word	32
	.word	54
	.word	12
	.word	52
	.word	56
	.word	8
	.word	30
	.word	44
	.word	94
	.word	76
	.word	54
	.word	65
	.word	14
	.word	89
	.word	69
	.word	4
	.word	16
	.word	24
	.word	47
	.word	38
	.word	31
	.word	75
	.word	40
	.word	61
	.word	21
	.word	84
	.word	51
	.word	86
	.word	41
	.word	80
	.word	16
	.word	53
	.word	14
	.word	94
	.word	29
	.word	77
	.word	99
	.word	16
	.word	29
	.word	59
	.word	7
	.word	14
	.word	78
	.word	79
	.word	45
	.word	54
	.word	83
	.word	8
	.word	94
	.word	94
	.word	41
	.word	3
	.word	61
	.word	27
	.word	19
	.word	33
	.word	35
	.word	78
	.word	38
	.word	3
	.word	55
	.word	41
	.word	76
	.word	49
	.word	68
	.word	83
	.word	23
	.word	67
	.word	15
	.word	68
	.word	28
	.word	47
	.word	12
	.word	82
	.word	6
	.word	26
	.word	96
	.word	98
	.word	75
	.word	7
	.word	1
	.word	46
	.word	39
	.word	12
	.word	68
	.word	41
	.word	28
	.word	31
	.word	0
	.word	82
	.word	97
	.word	72
	.word	61
	.word	39
	.word	48
	.word	11
	.word	99
	.word	38
	.word	49
	.global	g_qCount
	.bss
	.align	2
	.type	g_qCount, %object
	.size	g_qCount, 4
g_qCount:
	.space	4
	.global	rgnNodes
	.align	2
	.type	rgnNodes, %object
	.size	rgnNodes, 80
rgnNodes:
	.space	80
	.global	ch
	.align	2
	.type	ch, %object
	.size	ch, 4
ch:
	.space	4
	.global	iPrev
	.align	2
	.type	iPrev, %object
	.size	iPrev, 4
iPrev:
	.space	4
	.global	iNode
	.align	2
	.type	iNode, %object
	.size	iNode, 4
iNode:
	.space	4
	.global	i
	.align	2
	.type	i, %object
	.size	i, 4
i:
	.space	4
	.global	iCost
	.align	2
	.type	iCost, %object
	.size	iCost, 4
iCost:
	.space	4
	.global	iDist
	.align	2
	.type	iDist, %object
	.size	iDist, 4
iDist:
	.space	4
	.align	2
qheap:
	.space	8192
	.size	qheap, 8192
	.align	2
qfree_list:
	.space	4
	.size	qfree_list, 4
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	qinit_heap, %function
qinit_heap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	ldr	r3, .L4
	mov	r2, #0
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, .L4
	ldr	r2, [r3]
	ldr	r1, .L4+4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	add	r3, r1, r3
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #4
	ldr	r2, .L4+4
	add	r3, r3, r2
	ldr	r2, .L4
	str	r3, [r2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #512
	bcc	.L3
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	qfree_list
	.word	qheap
	.size	qinit_heap, .-qinit_heap
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	qmalloc_beebs, %function
qmalloc_beebs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #16
	bne	.L7
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L8
.L7:
	mov	r3, #0
	b	.L9
.L8:
	ldr	r3, .L11
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L10
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	ldr	r2, .L11
	str	r3, [r2]
.L10:
	ldr	r3, [fp, #-8]
.L9:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	qfree_list
	.size	qmalloc_beebs, .-qmalloc_beebs
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	qfree_beebs, %function
qfree_beebs:
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
	ldr	r3, .L14
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #12]
	ldr	r2, .L14
	ldr	r3, [fp, #-8]
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	qfree_list
	.size	qfree_beebs, .-qfree_beebs
	.align	2
	.global	enqueue
	.syntax unified
	.arm
	.fpu softvfp
	.type	enqueue, %function
enqueue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	mov	r0, #16
	bl	qmalloc_beebs
	str	r0, [fp, #-12]
	ldr	r3, .L21
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-20]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L19
	ldr	r2, .L21
	ldr	r3, [fp, #-12]
	str	r3, [r2]
	b	.L18
.L20:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-8]
.L19:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L20
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #12]
.L18:
	ldr	r3, .L21+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L21+4
	str	r3, [r2]
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	qHead
	.word	g_qCount
	.size	enqueue, .-enqueue
	.align	2
	.global	dequeue
	.syntax unified
	.arm
	.fpu softvfp
	.type	dequeue, %function
dequeue:
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
	ldr	r3, .L26
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L26
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L24
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-20]
	str	r2, [r3]
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r2, [r3, #8]
	ldr	r3, [fp, #-24]
	str	r2, [r3]
	ldr	r3, .L26
	ldr	r3, [r3]
	ldr	r3, [r3, #12]
	ldr	r2, .L26
	str	r3, [r2]
	ldr	r3, .L26+4
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L26+4
	str	r3, [r2]
	ldr	r3, [fp, #-8]
	b	.L25
.L24:
	mov	r3, #0
.L25:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	qHead
	.word	g_qCount
	.size	dequeue, .-dequeue
	.align	2
	.global	qcount
	.syntax unified
	.arm
	.fpu softvfp
	.type	qcount, %function
qcount:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L30
	ldr	r3, [r3]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L31:
	.align	2
.L30:
	.word	g_qCount
	.size	qcount, .-qcount
	.align	2
	.global	dijkstra
	.syntax unified
	.arm
	.fpu softvfp
	.type	dijkstra, %function
dijkstra:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L44
	mov	r2, #0
	str	r2, [r3]
	b	.L33
.L34:
	ldr	r3, .L44
	ldr	r3, [r3]
	ldr	r2, .L44+4
	ldr	r1, .L44+8
	str	r1, [r2, r3, lsl #3]
	ldr	r3, .L44
	ldr	r3, [r3]
	ldr	r2, .L44+4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, .L44+8
	str	r2, [r3, #4]
	ldr	r3, .L44
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L44
	str	r3, [r2]
.L33:
	ldr	r3, .L44
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L34
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bne	.L35
	mov	r3, #0
	b	.L36
.L35:
	ldr	r2, .L44+4
	ldr	r3, [fp, #-16]
	mov	r1, #0
	str	r1, [r2, r3, lsl #3]
	ldr	r2, .L44+4
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, .L44+8
	str	r2, [r3, #4]
	ldr	r2, .L44+8
	mov	r1, #0
	ldr	r0, [fp, #-16]
	bl	enqueue
	b	.L37
.L43:
	ldr	r2, .L44+12
	ldr	r1, .L44+16
	ldr	r0, .L44+20
	bl	dequeue
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L38
	ldr	r0, [fp, #-8]
	bl	qfree_beebs
.L38:
	ldr	r3, .L44+24
	mov	r2, #0
	str	r2, [r3]
	b	.L39
.L42:
	ldr	r3, .L44+20
	ldr	r2, [r3]
	ldr	r3, .L44+24
	ldr	r1, [r3]
	ldr	r0, .L44+28
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r1
	ldr	r3, [r0, r3, lsl #2]
	ldr	r2, .L44+32
	str	r3, [r2]
	ldr	r3, .L44+32
	ldr	r3, [r3]
	ldr	r2, .L44+8
	cmp	r3, r2
	beq	.L40
	ldr	r3, .L44+24
	ldr	r3, [r3]
	ldr	r2, .L44+4
	ldr	r3, [r2, r3, lsl #3]
	ldr	r2, .L44+8
	cmp	r3, r2
	beq	.L41
	ldr	r3, .L44+24
	ldr	r3, [r3]
	ldr	r2, .L44+4
	ldr	r2, [r2, r3, lsl #3]
	ldr	r3, .L44+32
	ldr	r1, [r3]
	ldr	r3, .L44+16
	ldr	r3, [r3]
	add	r3, r1, r3
	cmp	r2, r3
	ble	.L40
.L41:
	ldr	r3, .L44+16
	ldr	r1, [r3]
	ldr	r3, .L44+32
	ldr	r2, [r3]
	ldr	r3, .L44+24
	ldr	r3, [r3]
	add	r2, r1, r2
	ldr	r1, .L44+4
	str	r2, [r1, r3, lsl #3]
	ldr	r3, .L44+24
	ldr	r3, [r3]
	ldr	r2, .L44+20
	ldr	r2, [r2]
	ldr	r1, .L44+4
	lsl	r3, r3, #3
	add	r3, r1, r3
	str	r2, [r3, #4]
	ldr	r3, .L44+24
	ldr	r0, [r3]
	ldr	r3, .L44+16
	ldr	r2, [r3]
	ldr	r3, .L44+32
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L44+20
	ldr	r2, [r2]
	mov	r1, r3
	bl	enqueue
.L40:
	ldr	r3, .L44+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L44+24
	str	r3, [r2]
.L39:
	ldr	r3, .L44+24
	ldr	r3, [r3]
	cmp	r3, #9
	ble	.L42
.L37:
	bl	qcount
	mov	r3, r0
	cmp	r3, #0
	bgt	.L43
	ldr	r2, .L44+4
	ldr	r3, [fp, #-20]
	ldr	r3, [r2, r3, lsl #3]
.L36:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	ch
	.word	rgnNodes
	.word	9999
	.word	iPrev
	.word	iDist
	.word	iNode
	.word	i
	.word	AdjMatrix
	.word	iCost
	.size	dijkstra, .-dijkstra
	.global	dijkstra_output
	.bss
	.align	2
	.type	dijkstra_output, %object
	.size	dijkstra_output, 400
dijkstra_output:
	.space	400
	.global	output_count
	.align	2
	.type	output_count, %object
	.size	output_count, 4
output_count:
	.space	4
	.text
	.align	2
	.global	beebs_dijkstra_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_dijkstra_initialise_benchmark, %function
beebs_dijkstra_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	qinit_heap
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_dijkstra_initialise_benchmark, .-beebs_dijkstra_initialise_benchmark
	.align	2
	.global	beebs_dijkstra_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_dijkstra_benchmark, %function
beebs_dijkstra_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	ldr	r3, .L53
	mov	r2, #0
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L48
.L51:
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L49
.L50:
	ldr	r3, .L53
	ldr	r4, [r3]
	ldr	r1, [fp, #-20]
	ldr	r0, [fp, #-16]
	bl	dijkstra
	mov	r3, r0
	ldr	r2, .L53+4
	str	r3, [r2, r4, lsl #2]
	ldr	r3, .L53
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L53
	str	r3, [r2]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L49:
	ldr	r3, [fp, #-16]
	cmp	r3, #9
	ble	.L50
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L48:
	ldr	r3, [fp, #-20]
	cmp	r3, #9
	ble	.L51
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	output_count
	.word	dijkstra_output
	.size	beebs_dijkstra_benchmark, .-beebs_dijkstra_benchmark
	.section	.rodata
	.align	2
.LC0:
	.word	0
	.word	7
	.word	38
	.word	23
	.word	14
	.word	36
	.word	3
	.word	29
	.word	7
	.word	14
	.word	28
	.word	0
	.word	31
	.word	16
	.word	7
	.word	34
	.word	31
	.word	28
	.word	1
	.word	39
	.word	39
	.word	25
	.word	0
	.word	32
	.word	14
	.word	3
	.word	32
	.word	9
	.word	26
	.word	43
	.word	12
	.word	14
	.word	40
	.word	0
	.word	21
	.word	43
	.word	15
	.word	12
	.word	15
	.word	26
	.word	40
	.word	36
	.word	48
	.word	28
	.word	0
	.word	27
	.word	43
	.word	33
	.word	12
	.word	39
	.word	36
	.word	22
	.word	21
	.word	29
	.word	29
	.word	0
	.word	29
	.word	6
	.word	23
	.word	40
	.word	8
	.word	4
	.word	35
	.word	20
	.word	11
	.word	33
	.word	0
	.word	26
	.word	5
	.word	11
	.word	30
	.word	16
	.word	47
	.word	32
	.word	23
	.word	35
	.word	23
	.word	0
	.word	17
	.word	34
	.word	28
	.word	24
	.word	55
	.word	16
	.word	8
	.word	35
	.word	31
	.word	28
	.word	0
	.word	38
	.word	23
	.word	19
	.word	41
	.word	16
	.word	8
	.word	35
	.word	15
	.word	28
	.word	0
	.word	0
	.text
	.align	2
	.global	beebs_dijkstra_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_dijkstra_verify_benchmark, %function
beebs_dijkstra_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 416
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #416
	str	r0, [fp, #-416]
	ldr	r2, .L61
	sub	r3, fp, #408
	mov	r1, r2
	mov	r2, #400
	mov	r0, r3
	bl	memcpy
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L56
.L59:
	ldr	r2, .L61+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-404]
	cmp	r2, r3
	beq	.L57
	mov	r3, #0
	b	.L60
.L57:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L56:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L59
	mov	r3, #1
.L60:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L62:
	.align	2
.L61:
	.word	.LC0
	.word	dijkstra_output
	.size	beebs_dijkstra_verify_benchmark, .-beebs_dijkstra_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
