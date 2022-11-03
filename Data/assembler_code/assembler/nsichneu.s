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
	.file	"libnsichneu.c"
	.text
	.global	P1_is_marked
	.data
	.align	2
	.type	P1_is_marked, %object
	.size	P1_is_marked, 4
P1_is_marked:
	.word	3
	.global	P1_marking_member_0
	.bss
	.align	2
	.type	P1_marking_member_0, %object
	.size	P1_marking_member_0, 12
P1_marking_member_0:
	.space	12
	.global	P2_is_marked
	.data
	.align	2
	.type	P2_is_marked, %object
	.size	P2_is_marked, 4
P2_is_marked:
	.word	5
	.global	P2_marking_member_0
	.bss
	.align	2
	.type	P2_marking_member_0, %object
	.size	P2_marking_member_0, 20
P2_marking_member_0:
	.space	20
	.global	P3_is_marked
	.align	2
	.type	P3_is_marked, %object
	.size	P3_is_marked, 4
P3_is_marked:
	.space	4
	.global	P3_marking_member_0
	.align	2
	.type	P3_marking_member_0, %object
	.size	P3_marking_member_0, 24
P3_marking_member_0:
	.space	24
	.text
	.align	2
	.global	beebs_nsichneu_initialise_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nsichneu_initialise_benchmark, %function
beebs_nsichneu_initialise_benchmark:
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
	.size	beebs_nsichneu_initialise_benchmark, .-beebs_nsichneu_initialise_benchmark
	.align	2
	.global	beebs_nsichneu_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nsichneu_benchmark, %function
beebs_nsichneu_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 1520
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #1520
	sub	sp, sp, #4
	mov	r3, #2
	str	r3, [fp, #-8]
	b	.L3
.L129:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, .L131
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L4
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L4
	ldr	r3, .L131+8
	ldr	r2, [r3, #4]
	ldr	r3, .L131+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L4
	ldr	r3, .L131+8
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, .L131+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L4
	ldr	r3, .L131
	ldr	r3, [r3]
	sub	r3, r3, #3
	ldr	r2, .L131
	str	r3, [r2]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-16]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-20]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L4:
	ldr	r3, .L131
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L5
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L5
	ldr	r3, .L131+8
	ldr	r2, [r3, #8]
	ldr	r3, .L131+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L5
	ldr	r3, .L131+8
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r3, .L131+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bge	.L5
	ldr	r3, .L131
	ldr	r3, [r3]
	sub	r3, r3, #3
	ldr	r2, .L131
	str	r3, [r2]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-28]
	sub	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-24]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-28]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-32]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L5:
	ldr	r3, .L131
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L6
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L6
	ldr	r3, .L131+8
	ldr	r2, [r3]
	ldr	r3, .L131+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L6
	ldr	r3, .L131+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-36]
	ldr	r3, .L131+8
	ldr	r3, [r3]
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bge	.L6
	ldr	r3, .L131
	ldr	r3, [r3]
	sub	r3, r3, #3
	ldr	r2, .L131
	str	r3, [r2]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	sub	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-36]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-40]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-44]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L6:
	ldr	r3, .L131
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L7
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L7
	ldr	r3, .L131+8
	ldr	r2, [r3, #8]
	ldr	r3, .L131+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L7
	ldr	r3, .L131+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-48]
	ldr	r3, .L131+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	cmp	r2, r3
	bge	.L7
	ldr	r3, .L131
	ldr	r3, [r3]
	sub	r3, r3, #3
	ldr	r2, .L131
	str	r3, [r2]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-52]
	sub	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-48]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-52]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-56]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L7:
	ldr	r3, .L131
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L8
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L8
	ldr	r3, .L131+8
	ldr	r2, [r3]
	ldr	r3, .L131+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L8
	ldr	r3, .L131+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-60]
	ldr	r3, .L131+8
	ldr	r3, [r3]
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-64]
	cmp	r2, r3
	bge	.L8
	ldr	r3, .L131
	ldr	r3, [r3]
	sub	r3, r3, #3
	ldr	r2, .L131
	str	r3, [r2]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-64]
	sub	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-60]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-64]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-68]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L8:
	ldr	r3, .L131
	ldr	r3, [r3]
	cmp	r3, #2
	ble	.L9
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L9
	ldr	r3, .L131+8
	ldr	r2, [r3, #4]
	ldr	r3, .L131+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L9
	ldr	r3, .L131+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-72]
	ldr	r3, .L131+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bge	.L9
	ldr	r3, .L131
	ldr	r3, [r3]
	sub	r3, r3, #3
	ldr	r2, .L131
	str	r3, [r2]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-76]
	sub	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-72]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-76]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-80]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L9:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L10
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L10
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L10
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L10
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-84]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-88]
	ldr	r2, [fp, #-88]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	ble	.L10
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-88]
	add	r3, r2, r3
	str	r3, [fp, #-92]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-84]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-88]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-92]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L10:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L11
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L11
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L11
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L11
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-96]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-100]
	ldr	r2, [fp, #-100]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	ble	.L11
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-96]
	ldr	r3, [fp, #-100]
	add	r3, r2, r3
	str	r3, [fp, #-104]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-96]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-100]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-104]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L11:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L12
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L12
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L12
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L12
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-108]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-112]
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-108]
	cmp	r2, r3
	ble	.L12
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-108]
	ldr	r3, [fp, #-112]
	add	r3, r2, r3
	str	r3, [fp, #-116]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-108]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-112]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-116]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L12:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L13
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L13
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L13
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L13
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-120]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-124]
	ldr	r2, [fp, #-124]
	ldr	r3, [fp, #-120]
	cmp	r2, r3
	ble	.L13
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-120]
	ldr	r3, [fp, #-124]
	add	r3, r2, r3
	str	r3, [fp, #-128]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-120]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-124]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-128]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L13:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L14
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L14
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L14
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L14
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-132]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-136]
	ldr	r2, [fp, #-136]
	ldr	r3, [fp, #-132]
	cmp	r2, r3
	ble	.L14
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-132]
	ldr	r3, [fp, #-136]
	add	r3, r2, r3
	str	r3, [fp, #-140]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-132]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-136]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-140]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L14:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L15
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L15
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L15
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L15
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-144]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-148]
	ldr	r2, [fp, #-148]
	ldr	r3, [fp, #-144]
	cmp	r2, r3
	ble	.L15
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-144]
	ldr	r3, [fp, #-148]
	add	r3, r2, r3
	str	r3, [fp, #-152]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-144]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-148]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-152]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L15:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L16
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L16
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L16
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L16
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-156]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-160]
	ldr	r2, [fp, #-160]
	ldr	r3, [fp, #-156]
	cmp	r2, r3
	ble	.L16
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-156]
	ldr	r3, [fp, #-160]
	add	r3, r2, r3
	str	r3, [fp, #-164]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-156]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-160]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-164]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L16:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L17
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L17
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L17
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L17
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-168]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-172]
	ldr	r2, [fp, #-172]
	ldr	r3, [fp, #-168]
	cmp	r2, r3
	ble	.L17
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-168]
	ldr	r3, [fp, #-172]
	add	r3, r2, r3
	str	r3, [fp, #-176]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-168]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-172]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-176]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L17:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L18
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L18
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L18
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L18
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-180]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-184]
	ldr	r2, [fp, #-184]
	ldr	r3, [fp, #-180]
	cmp	r2, r3
	ble	.L18
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-180]
	ldr	r3, [fp, #-184]
	add	r3, r2, r3
	str	r3, [fp, #-188]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-180]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-184]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-188]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L18:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L19
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L19
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L19
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L19
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-192]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-196]
	ldr	r2, [fp, #-196]
	ldr	r3, [fp, #-192]
	cmp	r2, r3
	ble	.L19
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-192]
	ldr	r3, [fp, #-196]
	add	r3, r2, r3
	str	r3, [fp, #-200]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-192]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-196]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-200]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L19:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L20
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L20
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L20
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L20
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-204]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-208]
	ldr	r2, [fp, #-208]
	ldr	r3, [fp, #-204]
	cmp	r2, r3
	ble	.L20
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-204]
	ldr	r3, [fp, #-208]
	add	r3, r2, r3
	str	r3, [fp, #-212]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-204]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-208]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-212]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+4
	str	r3, [r2]
.L20:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L21
	ldr	r3, .L131+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L21
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L21
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L21
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	b	.L132
.L133:
	.align	2
.L131:
	.word	P1_is_marked
	.word	P3_is_marked
	.word	P1_marking_member_0
	.word	P2_marking_member_0
	.word	P2_is_marked
	.word	P3_marking_member_0
	.word	P3_is_marked
.L132:
	str	r3, [fp, #-216]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-220]
	ldr	r2, [fp, #-220]
	ldr	r3, [fp, #-216]
	cmp	r2, r3
	ble	.L21
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-216]
	ldr	r3, [fp, #-220]
	add	r3, r2, r3
	str	r3, [fp, #-224]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-216]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-220]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-224]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L21:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L22
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L22
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L22
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L22
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-228]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-232]
	ldr	r2, [fp, #-232]
	ldr	r3, [fp, #-228]
	cmp	r2, r3
	ble	.L22
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-228]
	ldr	r3, [fp, #-232]
	add	r3, r2, r3
	str	r3, [fp, #-236]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-228]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-232]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-236]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L22:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L23
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L23
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L23
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L23
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-240]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-244]
	ldr	r2, [fp, #-244]
	ldr	r3, [fp, #-240]
	cmp	r2, r3
	ble	.L23
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-240]
	ldr	r3, [fp, #-244]
	add	r3, r2, r3
	str	r3, [fp, #-248]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-240]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-244]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-248]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L23:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L24
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L24
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L24
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L24
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-252]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-256]
	ldr	r2, [fp, #-256]
	ldr	r3, [fp, #-252]
	cmp	r2, r3
	ble	.L24
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-252]
	ldr	r3, [fp, #-256]
	add	r3, r2, r3
	str	r3, [fp, #-260]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-252]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-256]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-260]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L24:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L25
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L25
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L25
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L25
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-264]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-268]
	ldr	r2, [fp, #-268]
	ldr	r3, [fp, #-264]
	cmp	r2, r3
	ble	.L25
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-264]
	ldr	r3, [fp, #-268]
	add	r3, r2, r3
	str	r3, [fp, #-272]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-264]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-268]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-272]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L25:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L26
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L26
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L26
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L26
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-276]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-280]
	ldr	r2, [fp, #-280]
	ldr	r3, [fp, #-276]
	cmp	r2, r3
	ble	.L26
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-276]
	ldr	r3, [fp, #-280]
	add	r3, r2, r3
	str	r3, [fp, #-284]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-276]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-280]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-284]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L26:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L27
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L27
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L27
	ldr	r3, .L131+12
	ldr	r2, [r3, #12]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L27
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-288]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-292]
	ldr	r2, [fp, #-292]
	ldr	r3, [fp, #-288]
	cmp	r2, r3
	ble	.L27
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-288]
	ldr	r3, [fp, #-292]
	add	r3, r2, r3
	str	r3, [fp, #-296]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-288]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-292]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-296]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L27:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L28
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L28
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L28
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L28
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-300]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-304]
	ldr	r2, [fp, #-304]
	ldr	r3, [fp, #-300]
	cmp	r2, r3
	ble	.L28
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-300]
	ldr	r3, [fp, #-304]
	add	r3, r2, r3
	str	r3, [fp, #-308]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-300]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-304]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-308]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L28:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L29
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L29
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L29
	ldr	r3, .L131+12
	ldr	r2, [r3]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L29
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-312]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-316]
	ldr	r2, [fp, #-316]
	ldr	r3, [fp, #-312]
	cmp	r2, r3
	ble	.L29
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-312]
	ldr	r3, [fp, #-316]
	add	r3, r2, r3
	str	r3, [fp, #-320]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-312]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-316]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-320]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L29:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L30
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L30
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L30
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L30
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-324]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-328]
	ldr	r2, [fp, #-328]
	ldr	r3, [fp, #-324]
	cmp	r2, r3
	ble	.L30
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-324]
	ldr	r3, [fp, #-328]
	add	r3, r2, r3
	str	r3, [fp, #-332]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-324]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-328]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-332]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L30:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L31
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L31
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L31
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L31
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-336]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-340]
	ldr	r2, [fp, #-340]
	ldr	r3, [fp, #-336]
	cmp	r2, r3
	ble	.L31
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-336]
	ldr	r3, [fp, #-340]
	add	r3, r2, r3
	str	r3, [fp, #-344]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-336]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-340]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-344]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L31:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L32
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L32
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L32
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L32
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-348]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-352]
	ldr	r2, [fp, #-352]
	ldr	r3, [fp, #-348]
	cmp	r2, r3
	ble	.L32
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-348]
	ldr	r3, [fp, #-352]
	add	r3, r2, r3
	str	r3, [fp, #-356]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-348]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-352]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-356]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L32:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #3
	ble	.L33
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L33
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L33
	ldr	r3, .L131+12
	ldr	r2, [r3, #8]
	ldr	r3, .L131+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L33
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-360]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-364]
	ldr	r2, [fp, #-364]
	ldr	r3, [fp, #-360]
	cmp	r2, r3
	ble	.L33
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-360]
	ldr	r3, [fp, #-364]
	add	r3, r2, r3
	str	r3, [fp, #-368]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-360]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-364]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-368]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L33:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L34
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L34
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L34
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L34
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-372]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-376]
	ldr	r2, [fp, #-376]
	ldr	r3, [fp, #-372]
	cmp	r2, r3
	ble	.L34
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	ldr	r2, .L131+12
	str	r3, [r2]
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-372]
	ldr	r3, [fp, #-376]
	add	r3, r2, r3
	str	r3, [fp, #-380]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-372]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-376]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-380]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L34:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L35
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L35
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L35
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L35
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-384]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-388]
	ldr	r2, [fp, #-388]
	ldr	r3, [fp, #-384]
	cmp	r2, r3
	ble	.L35
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	ldr	r2, .L131+12
	str	r3, [r2]
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-384]
	ldr	r3, [fp, #-388]
	add	r3, r2, r3
	str	r3, [fp, #-392]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-384]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-388]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-392]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L35:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L36
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L36
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L36
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L36
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-396]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-400]
	ldr	r2, [fp, #-400]
	ldr	r3, [fp, #-396]
	cmp	r2, r3
	ble	.L36
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	ldr	r2, .L131+12
	str	r3, [r2]
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-396]
	ldr	r3, [fp, #-400]
	add	r3, r2, r3
	str	r3, [fp, #-404]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-396]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-400]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L131+20
	ldr	r2, [fp, #-404]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L131+24
	str	r3, [r2]
.L36:
	ldr	r3, .L131+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L37
	ldr	r3, .L131+24
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L37
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L37
	ldr	r3, .L131+12
	ldr	r2, [r3, #4]
	ldr	r3, .L131+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L37
	ldr	r3, .L131+12
	ldr	r3, [r3]
	str	r3, [fp, #-408]
	ldr	r3, .L131+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-412]
	ldr	r2, [fp, #-412]
	ldr	r3, [fp, #-408]
	cmp	r2, r3
	ble	.L37
	ldr	r3, .L131+12
	ldr	r3, [r3, #8]
	ldr	r2, .L131+12
	str	r3, [r2]
	ldr	r3, .L131+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L131+16
	str	r3, [r2]
	ldr	r2, [fp, #-408]
	ldr	r3, [fp, #-412]
	add	r3, r2, r3
	str	r3, [fp, #-416]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	ldr	r1, .L131+20
	ldr	r2, [fp, #-408]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L131+20
	ldr	r2, [fp, #-412]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L131+24
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-416]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L37:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L38
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L38
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L38
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L38
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-420]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-424]
	ldr	r2, [fp, #-424]
	ldr	r3, [fp, #-420]
	cmp	r2, r3
	ble	.L38
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-420]
	ldr	r3, [fp, #-424]
	add	r3, r2, r3
	str	r3, [fp, #-428]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-420]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-424]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-428]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L38:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L39
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L39
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L39
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L39
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-432]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-436]
	ldr	r2, [fp, #-436]
	ldr	r3, [fp, #-432]
	cmp	r2, r3
	ble	.L39
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-432]
	ldr	r3, [fp, #-436]
	add	r3, r2, r3
	str	r3, [fp, #-440]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-432]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-436]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-440]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L39:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L40
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L40
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L40
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L40
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-444]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-448]
	ldr	r2, [fp, #-448]
	ldr	r3, [fp, #-444]
	cmp	r2, r3
	ble	.L40
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-444]
	ldr	r3, [fp, #-448]
	add	r3, r2, r3
	str	r3, [fp, #-452]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-444]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-448]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-452]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L40:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L41
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L41
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L41
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L41
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-456]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-460]
	ldr	r2, [fp, #-460]
	ldr	r3, [fp, #-456]
	cmp	r2, r3
	ble	.L41
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-456]
	ldr	r3, [fp, #-460]
	add	r3, r2, r3
	str	r3, [fp, #-464]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-456]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-460]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-464]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L41:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L42
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L42
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L42
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L42
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-468]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-472]
	ldr	r2, [fp, #-472]
	ldr	r3, [fp, #-468]
	cmp	r2, r3
	ble	.L42
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-468]
	ldr	r3, [fp, #-472]
	add	r3, r2, r3
	str	r3, [fp, #-476]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-468]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-472]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-476]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L42:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L43
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L43
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L43
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L43
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-480]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-484]
	ldr	r2, [fp, #-484]
	ldr	r3, [fp, #-480]
	cmp	r2, r3
	ble	.L43
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-480]
	ldr	r3, [fp, #-484]
	add	r3, r2, r3
	str	r3, [fp, #-488]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-480]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-484]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-488]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L43:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L44
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L44
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L44
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L44
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-492]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-496]
	ldr	r2, [fp, #-496]
	ldr	r3, [fp, #-492]
	cmp	r2, r3
	ble	.L44
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-492]
	ldr	r3, [fp, #-496]
	add	r3, r2, r3
	str	r3, [fp, #-500]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-492]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-496]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-500]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L44:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L45
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L45
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L45
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L45
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-504]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-508]
	ldr	r2, [fp, #-508]
	ldr	r3, [fp, #-504]
	cmp	r2, r3
	ble	.L45
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-504]
	ldr	r3, [fp, #-508]
	add	r3, r2, r3
	str	r3, [fp, #-512]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-504]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-508]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-512]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L45:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L46
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L46
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L46
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L46
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-516]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-520]
	ldr	r2, [fp, #-520]
	ldr	r3, [fp, #-516]
	cmp	r2, r3
	ble	.L46
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-516]
	ldr	r3, [fp, #-520]
	add	r3, r2, r3
	str	r3, [fp, #-524]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-516]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-520]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-524]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L46:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L47
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L47
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L47
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L47
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-528]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-532]
	ldr	r2, [fp, #-532]
	ldr	r3, [fp, #-528]
	cmp	r2, r3
	ble	.L47
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-528]
	ldr	r3, [fp, #-532]
	add	r3, r2, r3
	str	r3, [fp, #-536]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-528]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-532]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-536]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L47:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L48
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L48
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L48
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L48
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-540]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-544]
	ldr	r2, [fp, #-544]
	ldr	r3, [fp, #-540]
	cmp	r2, r3
	ble	.L48
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-540]
	ldr	r3, [fp, #-544]
	add	r3, r2, r3
	str	r3, [fp, #-548]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-540]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-544]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-548]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L48:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L49
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L49
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L49
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L49
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-552]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-556]
	ldr	r2, [fp, #-556]
	ldr	r3, [fp, #-552]
	cmp	r2, r3
	ble	.L49
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-552]
	ldr	r3, [fp, #-556]
	add	r3, r2, r3
	str	r3, [fp, #-560]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-552]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-556]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-560]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L49:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L50
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L50
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L50
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L50
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-564]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-568]
	ldr	r2, [fp, #-568]
	ldr	r3, [fp, #-564]
	cmp	r2, r3
	ble	.L50
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-564]
	ldr	r3, [fp, #-568]
	add	r3, r2, r3
	str	r3, [fp, #-572]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-564]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-568]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-572]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L50:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L51
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L51
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L51
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L51
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-576]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-580]
	ldr	r2, [fp, #-580]
	ldr	r3, [fp, #-576]
	cmp	r2, r3
	ble	.L51
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-576]
	ldr	r3, [fp, #-580]
	add	r3, r2, r3
	str	r3, [fp, #-584]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-576]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-580]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-584]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L51:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L52
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L52
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L52
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L52
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-588]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-592]
	ldr	r2, [fp, #-592]
	ldr	r3, [fp, #-588]
	cmp	r2, r3
	ble	.L52
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-588]
	ldr	r3, [fp, #-592]
	add	r3, r2, r3
	str	r3, [fp, #-596]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	ldr	r1, .L134
	ldr	r2, [fp, #-588]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134
	ldr	r2, [fp, #-592]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134
	ldr	r2, [fp, #-596]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+4
	str	r3, [r2]
.L52:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L53
	ldr	r3, .L134+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L53
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L53
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L53
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-600]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-604]
	ldr	r2, [fp, #-604]
	ldr	r3, [fp, #-600]
	cmp	r2, r3
	ble	.L53
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-600]
	b	.L135
.L136:
	.align	2
.L134:
	.word	P3_marking_member_0
	.word	P3_is_marked
	.word	P3_marking_member_0
	.word	P2_marking_member_0
	.word	P2_is_marked
	.word	P3_is_marked
.L135:
	ldr	r3, [fp, #-604]
	add	r3, r2, r3
	str	r3, [fp, #-608]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-600]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-604]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-608]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L53:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L54
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L54
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L54
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L54
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-612]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-616]
	ldr	r2, [fp, #-616]
	ldr	r3, [fp, #-612]
	cmp	r2, r3
	ble	.L54
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-612]
	ldr	r3, [fp, #-616]
	add	r3, r2, r3
	str	r3, [fp, #-620]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-612]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-616]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-620]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L54:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L55
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L55
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L55
	ldr	r3, .L134+12
	ldr	r2, [r3]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L55
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-624]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	str	r3, [fp, #-628]
	ldr	r2, [fp, #-628]
	ldr	r3, [fp, #-624]
	cmp	r2, r3
	ble	.L55
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-624]
	ldr	r3, [fp, #-628]
	add	r3, r2, r3
	str	r3, [fp, #-632]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-624]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-628]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-632]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L55:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L56
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L56
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L56
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L56
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-636]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-640]
	ldr	r2, [fp, #-640]
	ldr	r3, [fp, #-636]
	cmp	r2, r3
	ble	.L56
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-636]
	ldr	r3, [fp, #-640]
	add	r3, r2, r3
	str	r3, [fp, #-644]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-636]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-640]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-644]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L56:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L57
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L57
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L57
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L57
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-648]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-652]
	ldr	r2, [fp, #-652]
	ldr	r3, [fp, #-648]
	cmp	r2, r3
	ble	.L57
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-648]
	ldr	r3, [fp, #-652]
	add	r3, r2, r3
	str	r3, [fp, #-656]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-648]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-652]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-656]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L57:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L58
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L58
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L58
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L58
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-660]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-664]
	ldr	r2, [fp, #-664]
	ldr	r3, [fp, #-660]
	cmp	r2, r3
	ble	.L58
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-660]
	ldr	r3, [fp, #-664]
	add	r3, r2, r3
	str	r3, [fp, #-668]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-660]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-664]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-668]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L58:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L59
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L59
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L59
	ldr	r3, .L134+12
	ldr	r2, [r3, #8]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L59
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-672]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	str	r3, [fp, #-676]
	ldr	r2, [fp, #-676]
	ldr	r3, [fp, #-672]
	cmp	r2, r3
	ble	.L59
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-672]
	ldr	r3, [fp, #-676]
	add	r3, r2, r3
	str	r3, [fp, #-680]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-672]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-676]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-680]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L59:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L60
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L60
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L60
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L60
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-684]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-688]
	ldr	r2, [fp, #-688]
	ldr	r3, [fp, #-684]
	cmp	r2, r3
	ble	.L60
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-684]
	ldr	r3, [fp, #-688]
	add	r3, r2, r3
	str	r3, [fp, #-692]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-684]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-688]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-692]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L60:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L61
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L61
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L61
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L61
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-696]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-700]
	ldr	r2, [fp, #-700]
	ldr	r3, [fp, #-696]
	cmp	r2, r3
	ble	.L61
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-696]
	ldr	r3, [fp, #-700]
	add	r3, r2, r3
	str	r3, [fp, #-704]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-696]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-700]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-704]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L61:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L62
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L62
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L62
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L62
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-708]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-712]
	ldr	r2, [fp, #-712]
	ldr	r3, [fp, #-708]
	cmp	r2, r3
	ble	.L62
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-708]
	ldr	r3, [fp, #-712]
	add	r3, r2, r3
	str	r3, [fp, #-716]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-708]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-712]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-716]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L62:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L63
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L63
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L63
	ldr	r3, .L134+12
	ldr	r2, [r3, #12]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L63
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-720]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	str	r3, [fp, #-724]
	ldr	r2, [fp, #-724]
	ldr	r3, [fp, #-720]
	cmp	r2, r3
	ble	.L63
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-720]
	ldr	r3, [fp, #-724]
	add	r3, r2, r3
	str	r3, [fp, #-728]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-720]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-724]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-728]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L63:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L64
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L64
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L64
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L64
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-732]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-736]
	ldr	r2, [fp, #-736]
	ldr	r3, [fp, #-732]
	cmp	r2, r3
	ble	.L64
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-732]
	ldr	r3, [fp, #-736]
	add	r3, r2, r3
	str	r3, [fp, #-740]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-732]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-736]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-740]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L64:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L65
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L65
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L65
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L65
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-744]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-748]
	ldr	r2, [fp, #-748]
	ldr	r3, [fp, #-744]
	cmp	r2, r3
	ble	.L65
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-744]
	ldr	r3, [fp, #-748]
	add	r3, r2, r3
	str	r3, [fp, #-752]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-744]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-748]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-752]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L65:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L66
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L66
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L66
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L66
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-756]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-760]
	ldr	r2, [fp, #-760]
	ldr	r3, [fp, #-756]
	cmp	r2, r3
	ble	.L66
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-756]
	ldr	r3, [fp, #-760]
	add	r3, r2, r3
	str	r3, [fp, #-764]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-756]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-760]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-764]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L66:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L67
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L67
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L67
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L67
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-768]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-772]
	ldr	r2, [fp, #-772]
	ldr	r3, [fp, #-768]
	cmp	r2, r3
	ble	.L67
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-768]
	ldr	r3, [fp, #-772]
	add	r3, r2, r3
	str	r3, [fp, #-776]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-768]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-772]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-776]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L67:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L68
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L68
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L68
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L68
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-780]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-784]
	ldr	r2, [fp, #-784]
	ldr	r3, [fp, #-780]
	cmp	r2, r3
	ble	.L68
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	ldr	r2, .L134+12
	str	r3, [r2]
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-780]
	ldr	r3, [fp, #-784]
	add	r3, r2, r3
	str	r3, [fp, #-788]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L134+8
	ldr	r2, [fp, #-780]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L134+8
	ldr	r2, [fp, #-784]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L134+8
	ldr	r2, [fp, #-788]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L134+20
	str	r3, [r2]
.L68:
	ldr	r3, .L134+16
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L69
	ldr	r3, .L134+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L69
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L69
	ldr	r3, .L134+12
	ldr	r2, [r3, #16]
	ldr	r3, .L134+12
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L69
	ldr	r3, .L134+12
	ldr	r3, [r3, #4]
	str	r3, [fp, #-792]
	ldr	r3, .L134+12
	ldr	r3, [r3, #16]
	str	r3, [fp, #-796]
	ldr	r2, [fp, #-796]
	ldr	r3, [fp, #-792]
	cmp	r2, r3
	ble	.L69
	ldr	r3, .L134+16
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L134+16
	str	r3, [r2]
	ldr	r2, [fp, #-792]
	ldr	r3, [fp, #-796]
	add	r3, r2, r3
	str	r3, [fp, #-800]
	ldr	r3, .L134+20
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-792]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-796]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-800]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L69:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L70
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L70
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L70
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L70
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-804]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-808]
	ldr	r2, [fp, #-808]
	ldr	r3, [fp, #-804]
	cmp	r2, r3
	ble	.L70
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-804]
	ldr	r3, [fp, #-808]
	add	r3, r2, r3
	str	r3, [fp, #-812]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-804]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-808]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-812]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L70:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L71
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L71
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L71
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L71
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-816]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-820]
	ldr	r2, [fp, #-820]
	ldr	r3, [fp, #-816]
	cmp	r2, r3
	ble	.L71
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-816]
	ldr	r3, [fp, #-820]
	add	r3, r2, r3
	str	r3, [fp, #-824]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-816]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-820]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-824]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L71:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L72
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L72
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L72
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L72
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-828]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-832]
	ldr	r2, [fp, #-832]
	ldr	r3, [fp, #-828]
	cmp	r2, r3
	ble	.L72
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-828]
	ldr	r3, [fp, #-832]
	add	r3, r2, r3
	str	r3, [fp, #-836]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-828]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-832]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-836]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L72:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L73
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L73
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L73
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L73
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-840]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-844]
	ldr	r2, [fp, #-844]
	ldr	r3, [fp, #-840]
	cmp	r2, r3
	ble	.L73
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-840]
	ldr	r3, [fp, #-844]
	add	r3, r2, r3
	str	r3, [fp, #-848]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-840]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-844]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-848]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L73:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L74
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L74
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L74
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L74
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-852]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-856]
	ldr	r2, [fp, #-856]
	ldr	r3, [fp, #-852]
	cmp	r2, r3
	ble	.L74
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-852]
	ldr	r3, [fp, #-856]
	add	r3, r2, r3
	str	r3, [fp, #-860]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-852]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-856]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-860]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L74:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L75
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L75
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L75
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L75
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-864]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-868]
	ldr	r2, [fp, #-868]
	ldr	r3, [fp, #-864]
	cmp	r2, r3
	ble	.L75
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-864]
	ldr	r3, [fp, #-868]
	add	r3, r2, r3
	str	r3, [fp, #-872]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-864]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-868]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-872]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L75:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L76
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L76
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L76
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L76
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-876]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-880]
	ldr	r2, [fp, #-880]
	ldr	r3, [fp, #-876]
	cmp	r2, r3
	ble	.L76
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-876]
	ldr	r3, [fp, #-880]
	add	r3, r2, r3
	str	r3, [fp, #-884]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-876]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-880]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-884]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L76:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L77
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L77
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L77
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L77
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-888]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-892]
	ldr	r2, [fp, #-892]
	ldr	r3, [fp, #-888]
	cmp	r2, r3
	ble	.L77
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-888]
	ldr	r3, [fp, #-892]
	add	r3, r2, r3
	str	r3, [fp, #-896]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-888]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-892]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-896]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L77:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L78
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L78
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L78
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L78
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-900]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-904]
	ldr	r2, [fp, #-904]
	ldr	r3, [fp, #-900]
	cmp	r2, r3
	ble	.L78
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-900]
	ldr	r3, [fp, #-904]
	add	r3, r2, r3
	str	r3, [fp, #-908]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-900]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-904]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-908]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L78:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L79
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L79
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L79
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L79
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-912]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-916]
	ldr	r2, [fp, #-916]
	ldr	r3, [fp, #-912]
	cmp	r2, r3
	ble	.L79
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-912]
	ldr	r3, [fp, #-916]
	add	r3, r2, r3
	str	r3, [fp, #-920]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-912]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-916]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-920]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L79:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L80
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L80
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L80
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L80
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-924]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-928]
	ldr	r2, [fp, #-928]
	ldr	r3, [fp, #-924]
	cmp	r2, r3
	ble	.L80
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-924]
	ldr	r3, [fp, #-928]
	add	r3, r2, r3
	str	r3, [fp, #-932]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-924]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-928]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-932]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L80:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L81
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L81
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L81
	ldr	r3, .L137+8
	ldr	r2, [r3, #12]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L81
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-936]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-940]
	ldr	r2, [fp, #-940]
	ldr	r3, [fp, #-936]
	cmp	r2, r3
	ble	.L81
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-936]
	ldr	r3, [fp, #-940]
	add	r3, r2, r3
	str	r3, [fp, #-944]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-936]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-940]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-944]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L81:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L82
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L82
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L82
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L82
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-948]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-952]
	ldr	r2, [fp, #-952]
	ldr	r3, [fp, #-948]
	cmp	r2, r3
	ble	.L82
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-948]
	ldr	r3, [fp, #-952]
	add	r3, r2, r3
	str	r3, [fp, #-956]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-948]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-952]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-956]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L82:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L83
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L83
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L83
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L83
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-960]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-964]
	ldr	r2, [fp, #-964]
	ldr	r3, [fp, #-960]
	cmp	r2, r3
	ble	.L83
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-960]
	ldr	r3, [fp, #-964]
	add	r3, r2, r3
	str	r3, [fp, #-968]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-960]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-964]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-968]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L83:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L84
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L84
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L84
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L84
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-972]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-976]
	ldr	r2, [fp, #-976]
	ldr	r3, [fp, #-972]
	cmp	r2, r3
	ble	.L84
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-972]
	ldr	r3, [fp, #-976]
	add	r3, r2, r3
	str	r3, [fp, #-980]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-972]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137
	ldr	r2, [fp, #-976]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137
	ldr	r2, [fp, #-980]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+4
	str	r3, [r2]
.L84:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L85
	ldr	r3, .L137+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L85
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L85
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L85
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-984]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-988]
	ldr	r2, [fp, #-988]
	ldr	r3, [fp, #-984]
	cmp	r2, r3
	ble	.L85
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-984]
	ldr	r3, [fp, #-988]
	add	r3, r2, r3
	str	r3, [fp, #-992]
	ldr	r3, .L137+4
	ldr	r3, [r3]
	ldr	r1, .L137
	ldr	r2, [fp, #-984]
	str	r2, [r1, r3, lsl #2]
	b	.L138
.L139:
	.align	2
.L137:
	.word	P3_marking_member_0
	.word	P3_is_marked
	.word	P2_marking_member_0
	.word	P2_is_marked
	.word	P3_marking_member_0
	.word	P3_is_marked
.L138:
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-988]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-992]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L85:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L86
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L86
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L86
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L86
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-996]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1000]
	ldr	r2, [fp, #-1000]
	ldr	r3, [fp, #-996]
	cmp	r2, r3
	ble	.L86
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-996]
	ldr	r3, [fp, #-1000]
	add	r3, r2, r3
	str	r3, [fp, #-1004]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-996]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1000]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1004]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L86:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L87
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L87
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L87
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L87
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1008]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1012]
	ldr	r2, [fp, #-1012]
	ldr	r3, [fp, #-1008]
	cmp	r2, r3
	ble	.L87
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1008]
	ldr	r3, [fp, #-1012]
	add	r3, r2, r3
	str	r3, [fp, #-1016]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1008]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1012]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1016]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L87:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L88
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L88
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L88
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L88
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1020]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-1024]
	ldr	r2, [fp, #-1024]
	ldr	r3, [fp, #-1020]
	cmp	r2, r3
	ble	.L88
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1020]
	ldr	r3, [fp, #-1024]
	add	r3, r2, r3
	str	r3, [fp, #-1028]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1020]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1024]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1028]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L88:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L89
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L89
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L89
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L89
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1032]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-1036]
	ldr	r2, [fp, #-1036]
	ldr	r3, [fp, #-1032]
	cmp	r2, r3
	ble	.L89
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1032]
	ldr	r3, [fp, #-1036]
	add	r3, r2, r3
	str	r3, [fp, #-1040]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1032]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1036]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1040]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L89:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L90
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L90
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L90
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L90
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1044]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-1048]
	ldr	r2, [fp, #-1048]
	ldr	r3, [fp, #-1044]
	cmp	r2, r3
	ble	.L90
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1044]
	ldr	r3, [fp, #-1048]
	add	r3, r2, r3
	str	r3, [fp, #-1052]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1044]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1048]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1052]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L90:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L91
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L91
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L91
	ldr	r3, .L137+8
	ldr	r2, [r3]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L91
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1056]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	str	r3, [fp, #-1060]
	ldr	r2, [fp, #-1060]
	ldr	r3, [fp, #-1056]
	cmp	r2, r3
	ble	.L91
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1056]
	ldr	r3, [fp, #-1060]
	add	r3, r2, r3
	str	r3, [fp, #-1064]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1056]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1060]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1064]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L91:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L92
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L92
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L92
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L92
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1068]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1072]
	ldr	r2, [fp, #-1072]
	ldr	r3, [fp, #-1068]
	cmp	r2, r3
	ble	.L92
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1068]
	ldr	r3, [fp, #-1072]
	add	r3, r2, r3
	str	r3, [fp, #-1076]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1068]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1072]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1076]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L92:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L93
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L93
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L93
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L93
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1080]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1084]
	ldr	r2, [fp, #-1084]
	ldr	r3, [fp, #-1080]
	cmp	r2, r3
	ble	.L93
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1080]
	ldr	r3, [fp, #-1084]
	add	r3, r2, r3
	str	r3, [fp, #-1088]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1080]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1084]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1088]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L93:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L94
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L94
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L94
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L94
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1092]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1096]
	ldr	r2, [fp, #-1096]
	ldr	r3, [fp, #-1092]
	cmp	r2, r3
	ble	.L94
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1092]
	ldr	r3, [fp, #-1096]
	add	r3, r2, r3
	str	r3, [fp, #-1100]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1092]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1096]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1100]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L94:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L95
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L95
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L95
	ldr	r3, .L137+8
	ldr	r2, [r3, #4]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L95
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1104]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1108]
	ldr	r2, [fp, #-1108]
	ldr	r3, [fp, #-1104]
	cmp	r2, r3
	ble	.L95
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1104]
	ldr	r3, [fp, #-1108]
	add	r3, r2, r3
	str	r3, [fp, #-1112]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1104]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1108]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1112]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L95:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L96
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L96
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L96
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L96
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1116]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1120]
	ldr	r2, [fp, #-1120]
	ldr	r3, [fp, #-1116]
	cmp	r2, r3
	ble	.L96
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1116]
	ldr	r3, [fp, #-1120]
	add	r3, r2, r3
	str	r3, [fp, #-1124]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1116]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1120]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1124]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L96:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L97
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L97
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L97
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L97
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1128]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1132]
	ldr	r2, [fp, #-1132]
	ldr	r3, [fp, #-1128]
	cmp	r2, r3
	ble	.L97
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1128]
	ldr	r3, [fp, #-1132]
	add	r3, r2, r3
	str	r3, [fp, #-1136]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1128]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1132]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1136]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L97:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L98
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L98
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L98
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L98
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1140]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1144]
	ldr	r2, [fp, #-1144]
	ldr	r3, [fp, #-1140]
	cmp	r2, r3
	ble	.L98
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1140]
	ldr	r3, [fp, #-1144]
	add	r3, r2, r3
	str	r3, [fp, #-1148]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1140]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1144]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1148]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L98:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L99
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L99
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bne	.L99
	ldr	r3, .L137+8
	ldr	r2, [r3, #8]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L99
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1152]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1156]
	ldr	r2, [fp, #-1156]
	ldr	r3, [fp, #-1152]
	cmp	r2, r3
	ble	.L99
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1152]
	ldr	r3, [fp, #-1156]
	add	r3, r2, r3
	str	r3, [fp, #-1160]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1152]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1156]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1160]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L99:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L100
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L100
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L100
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L100
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1164]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1168]
	ldr	r2, [fp, #-1168]
	ldr	r3, [fp, #-1164]
	cmp	r2, r3
	ble	.L100
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1164]
	ldr	r3, [fp, #-1168]
	add	r3, r2, r3
	str	r3, [fp, #-1172]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1164]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1168]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1172]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L137+20
	str	r3, [r2]
.L100:
	ldr	r3, .L137+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L101
	ldr	r3, .L137+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L101
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L101
	ldr	r3, .L137+8
	ldr	r2, [r3, #16]
	ldr	r3, .L137+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L101
	ldr	r3, .L137+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1176]
	ldr	r3, .L137+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1180]
	ldr	r2, [fp, #-1180]
	ldr	r3, [fp, #-1176]
	cmp	r2, r3
	ble	.L101
	ldr	r3, .L137+8
	ldr	r3, [r3, #4]
	ldr	r2, .L137+8
	str	r3, [r2]
	ldr	r3, .L137+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L137+12
	str	r3, [r2]
	ldr	r2, [fp, #-1176]
	ldr	r3, [fp, #-1180]
	add	r3, r2, r3
	str	r3, [fp, #-1184]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	ldr	r1, .L137+16
	ldr	r2, [fp, #-1176]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L137+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1180]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1184]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L101:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L102
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L102
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L102
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L102
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1188]
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1192]
	ldr	r2, [fp, #-1192]
	ldr	r3, [fp, #-1188]
	cmp	r2, r3
	ble	.L102
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1188]
	ldr	r3, [fp, #-1192]
	add	r3, r2, r3
	str	r3, [fp, #-1196]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1188]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1192]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1196]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L102:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L103
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L103
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L103
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L103
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1200]
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1204]
	ldr	r2, [fp, #-1204]
	ldr	r3, [fp, #-1200]
	cmp	r2, r3
	ble	.L103
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1200]
	ldr	r3, [fp, #-1204]
	add	r3, r2, r3
	str	r3, [fp, #-1208]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1200]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1204]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1208]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L103:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L104
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L104
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L104
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L104
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1212]
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1216]
	ldr	r2, [fp, #-1216]
	ldr	r3, [fp, #-1212]
	cmp	r2, r3
	ble	.L104
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1212]
	ldr	r3, [fp, #-1216]
	add	r3, r2, r3
	str	r3, [fp, #-1220]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1212]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1216]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1220]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L104:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L105
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L105
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L105
	ldr	r3, .L140+8
	ldr	r2, [r3, #16]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L105
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1224]
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1228]
	ldr	r2, [fp, #-1228]
	ldr	r3, [fp, #-1224]
	cmp	r2, r3
	ble	.L105
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1224]
	ldr	r3, [fp, #-1228]
	add	r3, r2, r3
	str	r3, [fp, #-1232]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1224]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1228]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1232]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L105:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L106
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L106
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L106
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L106
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1236]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [fp, #-1240]
	ldr	r2, [fp, #-1240]
	ldr	r3, [fp, #-1236]
	cmp	r2, r3
	ble	.L106
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1236]
	ldr	r3, [fp, #-1240]
	add	r3, r2, r3
	str	r3, [fp, #-1244]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1236]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1240]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1244]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L106:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L107
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L107
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L107
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L107
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1248]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [fp, #-1252]
	ldr	r2, [fp, #-1252]
	ldr	r3, [fp, #-1248]
	cmp	r2, r3
	ble	.L107
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1248]
	ldr	r3, [fp, #-1252]
	add	r3, r2, r3
	str	r3, [fp, #-1256]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1248]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1252]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1256]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L107:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L108
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L108
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L108
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L108
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1260]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [fp, #-1264]
	ldr	r2, [fp, #-1264]
	ldr	r3, [fp, #-1260]
	cmp	r2, r3
	ble	.L108
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1260]
	ldr	r3, [fp, #-1264]
	add	r3, r2, r3
	str	r3, [fp, #-1268]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1260]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1264]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1268]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L108:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L109
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L109
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L109
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L109
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1272]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [fp, #-1276]
	ldr	r2, [fp, #-1276]
	ldr	r3, [fp, #-1272]
	cmp	r2, r3
	ble	.L109
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1272]
	ldr	r3, [fp, #-1276]
	add	r3, r2, r3
	str	r3, [fp, #-1280]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1272]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1276]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1280]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L109:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L110
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L110
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L110
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L110
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1284]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [fp, #-1288]
	ldr	r2, [fp, #-1288]
	ldr	r3, [fp, #-1284]
	cmp	r2, r3
	ble	.L110
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1284]
	ldr	r3, [fp, #-1288]
	add	r3, r2, r3
	str	r3, [fp, #-1292]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1284]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1288]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1292]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L110:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L111
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L111
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L111
	ldr	r3, .L140+8
	ldr	r2, [r3]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L111
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1296]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	str	r3, [fp, #-1300]
	ldr	r2, [fp, #-1300]
	ldr	r3, [fp, #-1296]
	cmp	r2, r3
	ble	.L111
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1296]
	ldr	r3, [fp, #-1300]
	add	r3, r2, r3
	str	r3, [fp, #-1304]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1296]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1300]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1304]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L111:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L112
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L112
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L112
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L112
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1308]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1312]
	ldr	r2, [fp, #-1312]
	ldr	r3, [fp, #-1308]
	cmp	r2, r3
	ble	.L112
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1308]
	ldr	r3, [fp, #-1312]
	add	r3, r2, r3
	str	r3, [fp, #-1316]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1308]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1312]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1316]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L112:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L113
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L113
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L113
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L113
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1320]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1324]
	ldr	r2, [fp, #-1324]
	ldr	r3, [fp, #-1320]
	cmp	r2, r3
	ble	.L113
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1320]
	ldr	r3, [fp, #-1324]
	add	r3, r2, r3
	str	r3, [fp, #-1328]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1320]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1324]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1328]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L113:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L114
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L114
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L114
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L114
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1332]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1336]
	ldr	r2, [fp, #-1336]
	ldr	r3, [fp, #-1332]
	cmp	r2, r3
	ble	.L114
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1332]
	ldr	r3, [fp, #-1336]
	add	r3, r2, r3
	str	r3, [fp, #-1340]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1332]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1336]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1340]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L114:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L115
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L115
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L115
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L115
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1344]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1348]
	ldr	r2, [fp, #-1348]
	ldr	r3, [fp, #-1344]
	cmp	r2, r3
	ble	.L115
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1344]
	ldr	r3, [fp, #-1348]
	add	r3, r2, r3
	str	r3, [fp, #-1352]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1344]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1348]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1352]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L115:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L116
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L116
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L116
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L116
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1356]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1360]
	ldr	r2, [fp, #-1360]
	ldr	r3, [fp, #-1356]
	cmp	r2, r3
	ble	.L116
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1356]
	ldr	r3, [fp, #-1360]
	add	r3, r2, r3
	str	r3, [fp, #-1364]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1356]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140
	ldr	r2, [fp, #-1360]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140
	ldr	r2, [fp, #-1364]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+4
	str	r3, [r2]
.L116:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L117
	ldr	r3, .L140+4
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L117
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L117
	ldr	r3, .L140+8
	ldr	r2, [r3, #4]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L117
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1368]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	str	r3, [fp, #-1372]
	ldr	r2, [fp, #-1372]
	ldr	r3, [fp, #-1368]
	cmp	r2, r3
	ble	.L117
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1368]
	ldr	r3, [fp, #-1372]
	add	r3, r2, r3
	str	r3, [fp, #-1376]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	ldr	r1, .L140
	ldr	r2, [fp, #-1368]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+4
	ldr	r3, [r3]
	b	.L141
.L142:
	.align	2
.L140:
	.word	P3_marking_member_0
	.word	P3_is_marked
	.word	P2_marking_member_0
	.word	P2_is_marked
	.word	P3_marking_member_0
	.word	P3_is_marked
.L141:
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1372]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1376]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L117:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L118
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L118
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L118
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L118
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1380]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1384]
	ldr	r2, [fp, #-1384]
	ldr	r3, [fp, #-1380]
	cmp	r2, r3
	ble	.L118
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1380]
	ldr	r3, [fp, #-1384]
	add	r3, r2, r3
	str	r3, [fp, #-1388]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1380]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1384]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1388]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L118:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L119
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L119
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L119
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L119
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1392]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1396]
	ldr	r2, [fp, #-1396]
	ldr	r3, [fp, #-1392]
	cmp	r2, r3
	ble	.L119
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1392]
	ldr	r3, [fp, #-1396]
	add	r3, r2, r3
	str	r3, [fp, #-1400]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1392]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1396]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1400]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L119:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L120
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L120
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L120
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L120
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1404]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1408]
	ldr	r2, [fp, #-1408]
	ldr	r3, [fp, #-1404]
	cmp	r2, r3
	ble	.L120
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1404]
	ldr	r3, [fp, #-1408]
	add	r3, r2, r3
	str	r3, [fp, #-1412]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1404]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1408]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1412]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L120:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L121
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L121
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L121
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L121
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1416]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1420]
	ldr	r2, [fp, #-1420]
	ldr	r3, [fp, #-1416]
	cmp	r2, r3
	ble	.L121
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1416]
	ldr	r3, [fp, #-1420]
	add	r3, r2, r3
	str	r3, [fp, #-1424]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1416]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1420]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1424]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L121:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L122
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L122
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L122
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L122
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1428]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1432]
	ldr	r2, [fp, #-1432]
	ldr	r3, [fp, #-1428]
	cmp	r2, r3
	ble	.L122
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1428]
	ldr	r3, [fp, #-1432]
	add	r3, r2, r3
	str	r3, [fp, #-1436]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1428]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1432]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1436]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L122:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L123
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L123
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	cmp	r2, r3
	bne	.L123
	ldr	r3, .L140+8
	ldr	r2, [r3, #8]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L123
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1440]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	str	r3, [fp, #-1444]
	ldr	r2, [fp, #-1444]
	ldr	r3, [fp, #-1440]
	cmp	r2, r3
	ble	.L123
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1440]
	ldr	r3, [fp, #-1444]
	add	r3, r2, r3
	str	r3, [fp, #-1448]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1440]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1444]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1448]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L123:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L124
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L124
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L124
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L124
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1452]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1456]
	ldr	r2, [fp, #-1456]
	ldr	r3, [fp, #-1452]
	cmp	r2, r3
	ble	.L124
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1452]
	ldr	r3, [fp, #-1456]
	add	r3, r2, r3
	str	r3, [fp, #-1460]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1452]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1456]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1460]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L124:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L125
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L125
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L125
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L125
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1464]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1468]
	ldr	r2, [fp, #-1468]
	ldr	r3, [fp, #-1464]
	cmp	r2, r3
	ble	.L125
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1464]
	ldr	r3, [fp, #-1468]
	add	r3, r2, r3
	str	r3, [fp, #-1472]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1464]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1468]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1472]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L125:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L126
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L126
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L126
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L126
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1476]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1480]
	ldr	r2, [fp, #-1480]
	ldr	r3, [fp, #-1476]
	cmp	r2, r3
	ble	.L126
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1476]
	ldr	r3, [fp, #-1480]
	add	r3, r2, r3
	str	r3, [fp, #-1484]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1476]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1480]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1484]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L126:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L127
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L127
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L127
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L127
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1488]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1492]
	ldr	r2, [fp, #-1492]
	ldr	r3, [fp, #-1488]
	cmp	r2, r3
	ble	.L127
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1488]
	ldr	r3, [fp, #-1492]
	add	r3, r2, r3
	str	r3, [fp, #-1496]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1488]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1492]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1496]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L127:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L128
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L128
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L128
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L128
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1500]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1504]
	ldr	r2, [fp, #-1504]
	ldr	r3, [fp, #-1500]
	cmp	r2, r3
	ble	.L128
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	ldr	r2, .L140+8
	str	r3, [r2]
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1500]
	ldr	r3, [fp, #-1504]
	add	r3, r2, r3
	str	r3, [fp, #-1508]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1500]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1504]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1508]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L128:
	ldr	r3, .L140+12
	ldr	r3, [r3]
	cmp	r3, #4
	ble	.L3
	ldr	r3, .L140+20
	ldr	r3, [r3]
	cmp	r3, #3
	bgt	.L3
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #8]
	cmp	r2, r3
	bne	.L3
	ldr	r3, .L140+8
	ldr	r2, [r3, #12]
	ldr	r3, .L140+8
	ldr	r3, [r3, #4]
	cmp	r2, r3
	bne	.L3
	ldr	r3, .L140+8
	ldr	r3, [r3, #16]
	str	r3, [fp, #-1512]
	ldr	r3, .L140+8
	ldr	r3, [r3, #12]
	str	r3, [fp, #-1516]
	ldr	r2, [fp, #-1516]
	ldr	r3, [fp, #-1512]
	cmp	r2, r3
	ble	.L3
	ldr	r3, .L140+12
	ldr	r3, [r3]
	sub	r3, r3, #4
	ldr	r2, .L140+12
	str	r3, [r2]
	ldr	r2, [fp, #-1512]
	ldr	r3, [fp, #-1516]
	add	r3, r2, r3
	str	r3, [fp, #-1520]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1512]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1516]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #2
	ldr	r1, .L140+16
	ldr	r2, [fp, #-1520]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, .L140+20
	ldr	r3, [r3]
	add	r3, r3, #3
	ldr	r2, .L140+20
	str	r3, [r2]
.L3:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bgt	.L129
	mov	r3, #77
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_nsichneu_benchmark, .-beebs_nsichneu_benchmark
	.align	2
	.global	beebs_nsichneu_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nsichneu_verify_benchmark, %function
beebs_nsichneu_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #84
	str	r0, [fp, #-80]
	mov	r3, #3
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	mov	r3, #5
	str	r3, [fp, #-16]
	sub	r3, fp, #52
	mov	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	mov	r3, #0
	str	r3, [fp, #-20]
	sub	r3, fp, #76
	mov	r2, #0
	str	r2, [r3]
	str	r2, [r3, #4]
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r3, .L159
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	cmp	r2, r3
	bne	.L144
	ldr	r3, .L159+4
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L144
	ldr	r3, .L159+8
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L145
.L144:
	mov	r3, #0
	b	.L158
.L145:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L147
.L150:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-28]
	ldr	r1, .L159+12
	ldr	r3, [fp, #-8]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bne	.L148
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-48]
	ldr	r1, .L159+16
	ldr	r3, [fp, #-8]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bne	.L148
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-72]
	ldr	r1, .L159+20
	ldr	r3, [fp, #-8]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	beq	.L149
.L148:
	mov	r3, #0
	b	.L158
.L149:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L147:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	ble	.L150
	mov	r3, #3
	str	r3, [fp, #-8]
	b	.L151
.L154:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-48]
	ldr	r1, .L159+16
	ldr	r3, [fp, #-8]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	bne	.L152
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-72]
	ldr	r1, .L159+20
	ldr	r3, [fp, #-8]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	beq	.L153
.L152:
	mov	r3, #0
	b	.L158
.L153:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L151:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L154
	mov	r3, #5
	str	r3, [fp, #-8]
	b	.L155
.L157:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [r3, #-72]
	ldr	r1, .L159+20
	ldr	r3, [fp, #-8]
	ldr	r3, [r1, r3, lsl #2]
	cmp	r2, r3
	beq	.L156
	mov	r3, #0
	b	.L158
.L156:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L155:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	ble	.L157
	mov	r3, #1
.L158:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L160:
	.align	2
.L159:
	.word	P1_is_marked
	.word	P2_is_marked
	.word	P3_is_marked
	.word	P1_marking_member_0
	.word	P2_marking_member_0
	.word	P3_marking_member_0
	.size	beebs_nsichneu_verify_benchmark, .-beebs_nsichneu_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
