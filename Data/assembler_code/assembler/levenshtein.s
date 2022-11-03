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
	.file	"liblevenshtein.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	min, %function
min:
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
	cmp	r2, r3
	movlt	r3, r2
	movge	r3, r3
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	min, .-min
	.align	2
	.global	levenshtein_distance
	.syntax unified
	.arm
	.fpu softvfp
	.type	levenshtein_distance, %function
levenshtein_distance:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	add	fp, sp, #32
	sub	sp, sp, #76
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, sp
	mov	r10, r3
	ldr	r0, [fp, #-72]
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-48]
	ldr	r0, [fp, #-76]
	bl	strlen
	mov	r3, r0
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	add	r1, r3, #1
	ldr	r3, [fp, #-48]
	add	r0, r3, #1
	sub	r3, r1, #1
	str	r3, [fp, #-56]
	mov	r2, r1
	mov	r3, #0
	mov	r6, r2
	mov	r7, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r7, #5
	orr	r3, r3, r6, lsr #27
	lsl	r2, r6, #5
	mov	r3, r1
	lsl	r6, r3, #2
	sub	r3, r0, #1
	str	r3, [fp, #-60]
	mov	r2, r1
	mov	r3, #0
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	mov	r2, r0
	mov	r3, #0
	str	r2, [fp, #-92]
	str	r3, [fp, #-88]
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-92]
	mul	r2, r3, r2
	ldr	r3, [fp, #-88]
	ldr	ip, [fp, #-84]
	mul	r3, ip, r3
	add	r3, r2, r3
	ldr	ip, [fp, #-84]
	ldr	lr, [fp, #-92]
	umull	r8, r2, ip, lr
	mov	r9, r2
	add	r3, r3, r9
	mov	r9, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r9, #5
	orr	r3, r3, r8, lsr #27
	lsl	r2, r8, #5
	mov	r2, r1
	mov	r3, #0
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
	mov	r2, r0
	mov	r3, #0
	str	r2, [fp, #-100]
	str	r3, [fp, #-96]
	sub	r8, fp, #108
	ldmia	r8, {r7-r8}
	mov	r2, r8
	ldr	r3, [fp, #-100]
	mul	r2, r3, r2
	ldr	r3, [fp, #-96]
	mov	ip, r7
	mul	r3, ip, r3
	add	r3, r2, r3
	mov	ip, r7
	ldr	lr, [fp, #-100]
	umull	r4, r2, ip, lr
	mov	r5, r2
	add	r3, r3, r5
	mov	r5, r3
	mov	r2, #0
	mov	r3, #0
	lsl	r3, r5, #5
	orr	r3, r3, r4, lsr #27
	lsl	r2, r4, #5
	mov	r3, r1
	mov	r2, r0
	mul	r3, r2, r3
	lsl	r3, r3, #2
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #3
	lsr	r3, r3, #2
	lsl	r3, r3, #2
	str	r3, [fp, #-64]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L4
.L5:
	lsr	r2, r6, #2
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-44]
	mul	r2, r1, r2
	ldr	r1, [fp, #-44]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L4:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L5
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L6
.L7:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-40]
	ldr	r1, [fp, #-40]
	str	r1, [r3, r2, lsl #2]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L6:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	ble	.L7
	mov	r3, #1
	str	r3, [fp, #-40]
	b	.L8
.L13:
	mov	r3, #1
	str	r3, [fp, #-44]
	b	.L9
.L12:
	ldr	r3, [fp, #-44]
	sub	r3, r3, #1
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-40]
	sub	r3, r3, #1
	ldr	r1, [fp, #-76]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	bne	.L10
	lsr	r0, r6, #2
	ldr	r3, [fp, #-44]
	sub	ip, r3, #1
	ldr	r3, [fp, #-40]
	sub	r1, r3, #1
	lsr	r2, r6, #2
	ldr	r3, [fp, #-64]
	mul	r0, ip, r0
	add	r1, r0, r1
	ldr	r1, [r3, r1, lsl #2]
	ldr	r3, [fp, #-64]
	ldr	r0, [fp, #-44]
	mul	r0, r2, r0
	ldr	r2, [fp, #-40]
	add	r2, r0, r2
	str	r1, [r3, r2, lsl #2]
	b	.L11
.L10:
	lsr	r2, r6, #2
	ldr	r3, [fp, #-44]
	sub	r1, r3, #1
	ldr	r3, [fp, #-64]
	mul	r1, r2, r1
	ldr	r2, [fp, #-40]
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	add	r5, r3, #1
	lsr	r1, r6, #2
	ldr	r3, [fp, #-40]
	sub	r2, r3, #1
	ldr	r3, [fp, #-64]
	ldr	r0, [fp, #-44]
	mul	r1, r0, r1
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	add	ip, r3, #1
	lsr	r1, r6, #2
	ldr	r3, [fp, #-44]
	sub	r0, r3, #1
	ldr	r3, [fp, #-40]
	sub	r2, r3, #1
	ldr	r3, [fp, #-64]
	mul	r1, r0, r1
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	add	r3, r3, #1
	mov	r1, r3
	mov	r0, ip
	bl	min
	mov	r3, r0
	lsr	r4, r6, #2
	mov	r1, r3
	mov	r0, r5
	bl	min
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-44]
	mul	r1, r2, r4
	ldr	r2, [fp, #-40]
	add	r2, r1, r2
	str	r0, [r3, r2, lsl #2]
.L11:
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
.L9:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L12
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L8:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	ble	.L13
	lsr	r2, r6, #2
	ldr	r3, [fp, #-64]
	ldr	r1, [fp, #-48]
	mul	r1, r2, r1
	ldr	r2, [fp, #-52]
	add	r2, r1, r2
	ldr	r3, [r3, r2, lsl #2]
	mov	sp, r10
	mov	r0, r3
	sub	sp, fp, #32
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
	.size	levenshtein_distance, .-levenshtein_distance
	.global	strings
	.section	.rodata
	.align	2
.LC0:
	.ascii	"srrjngre\000"
	.align	2
.LC1:
	.ascii	"asfcjnsdkj\000"
	.align	2
.LC2:
	.ascii	"string\000"
	.align	2
.LC3:
	.ascii	"msd\000"
	.align	2
.LC4:
	.ascii	"strings\000"
	.data
	.align	2
	.type	strings, %object
	.size	strings, 20
strings:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.text
	.align	2
	.global	beebs_levenshtein_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_levenshtein_initialise_benchmark, %function
beebs_levenshtein_initialise_benchmark:
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
	.size	beebs_levenshtein_initialise_benchmark, .-beebs_levenshtein_initialise_benchmark
	.align	2
	.global	beebs_levenshtein_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_levenshtein_benchmark, %function
beebs_levenshtein_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L17
.L20:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L18
.L19:
	ldr	r2, .L22
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r1, .L22
	ldr	r3, [fp, #-12]
	ldr	r3, [r1, r3, lsl #2]
	mov	r1, r3
	mov	r0, r2
	bl	levenshtein_distance
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L18:
	ldr	r3, [fp, #-12]
	cmp	r3, #4
	ble	.L19
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L17:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L20
	ldr	r3, [fp, #-16]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	strings
	.size	beebs_levenshtein_benchmark, .-beebs_levenshtein_benchmark
	.align	2
	.global	beebs_levenshtein_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_levenshtein_verify_benchmark, %function
beebs_levenshtein_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #122
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L25
	mov	r3, #0
	b	.L26
.L25:
	mov	r3, #1
.L26:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_levenshtein_verify_benchmark, .-beebs_levenshtein_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
