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
	.file	"libfdct.c"
	.text
	.global	out
	.bss
	.align	2
	.type	out, %object
	.size	out, 4
out:
	.space	4
	.section	.rodata
	.align	2
	.type	block_ref, %object
	.size	block_ref, 128
block_ref:
	.short	99
	.short	104
	.short	109
	.short	113
	.short	115
	.short	115
	.short	55
	.short	55
	.short	104
	.short	111
	.short	113
	.short	116
	.short	119
	.short	56
	.short	56
	.short	56
	.short	110
	.short	115
	.short	120
	.short	119
	.short	118
	.short	56
	.short	56
	.short	56
	.short	119
	.short	121
	.short	122
	.short	120
	.short	120
	.short	59
	.short	59
	.short	59
	.short	119
	.short	120
	.short	121
	.short	122
	.short	122
	.short	55
	.short	55
	.short	55
	.short	121
	.short	121
	.short	121
	.short	121
	.short	60
	.short	57
	.short	57
	.short	57
	.short	122
	.short	122
	.short	61
	.short	63
	.short	62
	.short	57
	.short	57
	.short	57
	.short	62
	.short	62
	.short	61
	.short	61
	.short	63
	.short	58
	.short	58
	.short	58
	.bss
	.align	2
block:
	.space	128
	.size	block, 128
	.data
	.align	2
	.type	exp_res, %object
	.size	exp_res, 128
exp_res:
	.short	699
	.short	164
	.short	-51
	.short	-16
	.short	31
	.short	-15
	.short	-19
	.short	8
	.short	71
	.short	14
	.short	-61
	.short	-2
	.short	11
	.short	-12
	.short	7
	.short	12
	.short	-58
	.short	-55
	.short	13
	.short	28
	.short	-20
	.short	-7
	.short	14
	.short	-18
	.short	29
	.short	22
	.short	3
	.short	3
	.short	-11
	.short	7
	.short	11
	.short	-22
	.short	-1
	.short	-28
	.short	-27
	.short	10
	.short	0
	.short	-7
	.short	11
	.short	6
	.short	7
	.short	6
	.short	21
	.short	21
	.short	-10
	.short	-8
	.short	2
	.short	-14
	.short	1
	.short	-7
	.short	-15
	.short	-15
	.short	-10
	.short	15
	.short	16
	.short	-10
	.short	0
	.short	-1
	.short	0
	.short	15
	.short	4
	.short	-13
	.short	-5
	.short	4
	.text
	.align	2
	.global	fdct
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fdct, %function
fdct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #92
	str	r0, [fp, #-88]
	str	r1, [fp, #-92]
	ldr	r3, [fp, #-88]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-12]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #14
	ldrsh	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #14
	ldrsh	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	ldrsh	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	ldrsh	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #10
	ldrsh	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #10
	ldrsh	r3, [r3]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-12]
	add	r3, r3, #6
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	ldrsh	r3, [r3]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-12]
	add	r3, r3, #6
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	ldrsh	r3, [r3]
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
	lsl	r3, r3, #2
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-12]
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-56]
	sub	r3, r2, r3
	lsl	r2, r3, #2
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L6
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, .L6+4
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-64]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	asr	r2, r3, #11
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L6+8
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-64]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	asr	r2, r3, #11
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r3, .L6+12
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-84]
	ldr	r3, .L6+16
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, .L6+20
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, .L6+24
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, .L6+28
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, .L6+32
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, .L6+36
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, .L6+40
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-76]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r3, .L6+44
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-84]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	asr	r2, r3, #11
	ldr	r3, [fp, #-12]
	add	r3, r3, #14
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	asr	r2, r3, #11
	ldr	r3, [fp, #-12]
	add	r3, r3, #10
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	asr	r2, r3, #11
	ldr	r3, [fp, #-12]
	add	r3, r3, #6
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	asr	r2, r3, #11
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L3
	ldr	r3, [fp, #-88]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L4
.L5:
	ldr	r3, [fp, #-12]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	add	r3, r1, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	sub	r3, r1, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	add	r3, r1, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	sub	r3, r1, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	add	r3, r1, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	sub	r3, r1, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	add	r3, r1, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	sub	r3, r1, r3
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
	asr	r3, r3, #5
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-12]
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-56]
	sub	r3, r2, r3
	asr	r2, r3, #5
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #3
	ldr	r1, [fp, #-12]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L6
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-52]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, .L6+4
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-52]
	ldr	r2, [fp, #-64]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	asr	r2, r3, #18
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-12]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, .L6+8
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-60]
	ldr	r2, [fp, #-64]
	mul	r2, r3, r2
	ldr	r3, [fp, #-68]
	add	r3, r2, r3
	asr	r1, r3, #18
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r3, .L6+12
	str	r3, [fp, #-64]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-84]
	ldr	r3, .L6+16
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-44]
	ldr	r3, .L6+20
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, .L6+24
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, .L6+28
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, .L6+32
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r3, .L6+36
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, .L6+40
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-76]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r3, .L6+44
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-80]
	ldr	r2, [fp, #-64]
	mul	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-84]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-84]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	asr	r1, r3, #18
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	asr	r1, r3, #18
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-72]
	add	r2, r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	asr	r1, r3, #18
	ldr	r2, [fp, #-92]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-68]
	add	r2, r2, r3
	ldr	r3, [fp, #-80]
	add	r3, r2, r3
	asr	r2, r3, #18
	ldr	r3, [fp, #-92]
	lsl	r3, r3, #1
	ldr	r1, [fp, #-12]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L4:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	ble	.L5
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L7:
	.align	2
.L6:
	.word	4433
	.word	6270
	.word	-15137
	.word	9633
	.word	2446
	.word	16819
	.word	25172
	.word	12299
	.word	-7373
	.word	-20995
	.word	-16069
	.word	-3196
	.size	fdct, .-fdct
	.align	2
	.global	beebs_fdct_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fdct_initialise_benchmark, %function
beebs_fdct_initialise_benchmark:
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
	.size	beebs_fdct_initialise_benchmark, .-beebs_fdct_initialise_benchmark
	.align	2
	.global	beebs_fdct_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fdct_benchmark, %function
beebs_fdct_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r2, .L11
	ldr	r3, .L11+4
	mov	r0, r2
	mov	r1, r3
	mov	r3, #128
	mov	r2, r3
	bl	memcpy
	mov	r1, #8
	ldr	r0, .L11
	bl	fdct
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	block
	.word	block_ref
	.size	beebs_fdct_benchmark, .-beebs_fdct_benchmark
	.align	2
	.global	beebs_fdct_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fdct_verify_benchmark, %function
beebs_fdct_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	mov	r2, #128
	ldr	r1, .L15
	ldr	r0, .L15+4
	bl	memcmp
	mov	r3, r0
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	exp_res
	.word	block
	.size	beebs_fdct_verify_benchmark, .-beebs_fdct_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
