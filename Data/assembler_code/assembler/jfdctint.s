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
	.file	"libjfdctint.c"
	.text
	.global	jfdctint_data
	.bss
	.align	2
	.type	jfdctint_data, %object
	.size	jfdctint_data, 256
jfdctint_data:
	.space	256
	.text
	.align	2
	.global	jpeg_fdct_islow
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	jpeg_fdct_islow, %function
jpeg_fdct_islow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #84
	ldr	r3, .L6
	str	r3, [fp, #-8]
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	sub	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	sub	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	lsl	r2, r3, #2
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-56]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
	lsl	r2, r2, #2
	str	r2, [r3]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r2, r3, #5
	sub	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	add	r2, r3, #1024
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	asr	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [fp, #-60]
	ldr	r2, .L6+4
	mul	r2, r3, r2
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	add	r2, r3, #1024
	ldr	r3, [fp, #-8]
	add	r3, r3, #24
	asr	r2, r2, #11
	str	r2, [r3]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-76]
	add	r1, r2, r3
	mov	r2, r1
	lsl	r2, r2, #2
	add	r2, r2, r1
	lsl	r3, r2, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #5
	add	r3, r3, r1
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r1, r3, #4
	add	r3, r3, r1
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldr	r2, .L6+8
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldr	r2, .L6+12
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r1, r3, #10
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-64]
	ldr	r2, .L6+16
	mul	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-68]
	ldr	r2, .L6+20
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-72]
	ldr	r2, .L6+24
	mul	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	ldr	r2, .L6+28
	mul	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	add	r2, r3, #1024
	ldr	r3, [fp, #-8]
	add	r3, r3, #28
	asr	r2, r2, #11
	str	r2, [r3]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	add	r2, r3, #1024
	ldr	r3, [fp, #-8]
	add	r3, r3, #20
	asr	r2, r2, #11
	str	r2, [r3]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	add	r2, r3, #1024
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	asr	r2, r2, #11
	str	r2, [r3]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	add	r2, r3, #1024
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	asr	r2, r2, #11
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L3
	ldr	r3, .L6
	str	r3, [fp, #-8]
	mov	r3, #7
	str	r3, [fp, #-12]
	b	.L4
.L5:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #224
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #224
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #192
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #192
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	add	r3, r3, #64
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #160
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-8]
	add	r3, r3, #64
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #160
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-8]
	add	r3, r3, #96
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	ldr	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-8]
	add	r3, r3, #96
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	ldr	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-40]
	sub	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-32]
	sub	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	add	r3, r3, #2
	asr	r2, r3, #2
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-56]
	sub	r3, r2, r3
	add	r2, r3, #2
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	asr	r2, r2, #2
	str	r2, [r3]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r2, r3, #5
	sub	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-52]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	add	r2, r3, #16384
	ldr	r3, [fp, #-8]
	add	r3, r3, #64
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [fp, #-60]
	ldr	r2, .L6+4
	mul	r2, r3, r2
	ldr	r3, [fp, #-64]
	add	r3, r2, r3
	add	r2, r3, #16384
	ldr	r3, [fp, #-8]
	add	r3, r3, #192
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-76]
	add	r1, r2, r3
	mov	r2, r1
	lsl	r2, r2, #2
	add	r2, r2, r1
	lsl	r3, r2, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #5
	add	r3, r3, r1
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-44]
	mov	r3, r2
	lsl	r3, r3, #3
	add	r3, r3, r2
	lsl	r1, r3, #4
	add	r3, r3, r1
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	ldr	r2, .L6+8
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldr	r2, .L6+12
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r1, r3, #10
	add	r3, r3, r1
	lsl	r3, r3, #2
	sub	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-64]
	ldr	r2, .L6+16
	mul	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-68]
	ldr	r2, .L6+20
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-72]
	ldr	r2, .L6+24
	mul	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	ldr	r2, .L6+28
	mul	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	add	r2, r3, #16384
	ldr	r3, [fp, #-8]
	add	r3, r3, #224
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	add	r2, r3, #16384
	ldr	r3, [fp, #-8]
	add	r3, r3, #160
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	add	r2, r3, #16384
	ldr	r3, [fp, #-8]
	add	r3, r3, #96
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-64]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	add	r2, r3, #16384
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #1
	str	r3, [fp, #-12]
.L4:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L5
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	jfdctint_data
	.word	-15137
	.word	16819
	.word	25172
	.word	-7373
	.word	-20995
	.word	-16069
	.word	-3196
	.size	jpeg_fdct_islow, .-jpeg_fdct_islow
	.align	2
	.global	beebs_jfdctint_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_jfdctint_benchmark, %function
beebs_jfdctint_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	jpeg_fdct_islow
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_jfdctint_benchmark, .-beebs_jfdctint_benchmark
	.align	2
	.global	beebs_jfdctint_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_jfdctint_initialise_benchmark, %function
beebs_jfdctint_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #1
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L11
.L12:
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	add	r2, r3, #81
	ldr	r3, .L13
	smull	r1, r3, r2, r3
	add	r3, r3, r2
	asr	r1, r3, #15
	asr	r3, r2, #31
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #16
	sub	r3, r3, r1
	sub	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r1, .L13+4
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L11:
	ldr	r3, [fp, #-8]
	cmp	r3, #63
	ble	.L12
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	-2147450879
	.word	jfdctint_data
	.size	beebs_jfdctint_initialise_benchmark, .-beebs_jfdctint_initialise_benchmark
	.section	.rodata
	.align	2
.LC0:
	.word	1956823
	.word	184557
	.word	-39350
	.word	-94393
	.word	-77163
	.word	5995
	.word	162871
	.word	-3428
	.word	31856
	.word	57575
	.word	-49784
	.word	43664
	.word	63854
	.word	-9784
	.word	11398
	.word	-23444
	.word	13102
	.word	59509
	.word	63748
	.word	-34407
	.word	-57064
	.word	11667
	.word	37414
	.word	41934
	.word	20234
	.word	25212
	.word	-44504
	.word	25562
	.word	-46366
	.word	-4562
	.word	-40816
	.word	-64820
	.word	-203745
	.word	-15884
	.word	-134082
	.word	-126104
	.word	66045
	.word	23372
	.word	-87152
	.word	-147968
	.word	41739
	.word	-20979
	.word	-36653
	.word	23706
	.word	613
	.word	41593
	.word	34760
	.word	-60639
	.word	30493
	.word	-10396
	.word	13944
	.word	-13980
	.word	52343
	.word	-40116
	.word	-55093
	.word	37532
	.word	61998
	.word	-22500
	.word	25991
	.word	-57098
	.word	-18228
	.word	47265
	.word	-48356
	.word	38613
	.text
	.align	2
	.global	beebs_jfdctint_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_jfdctint_verify_benchmark, %function
beebs_jfdctint_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 272
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #272
	str	r0, [fp, #-272]
	ldr	r2, .L21
	sub	r3, fp, #264
	mov	r1, r2
	mov	r2, #256
	mov	r0, r3
	bl	memcpy
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L16
.L19:
	ldr	r2, .L21+4
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-260]
	cmp	r2, r3
	beq	.L17
	mov	r3, #0
	b	.L20
.L17:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L16:
	ldr	r3, [fp, #-8]
	cmp	r3, #63
	ble	.L19
	mov	r3, #1
.L20:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LC0
	.word	jfdctint_data
	.size	beebs_jfdctint_verify_benchmark, .-beebs_jfdctint_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
