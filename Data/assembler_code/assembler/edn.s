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
	.file	"libedn.c"
	.text
	.align	2
	.global	vec_mpy1
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	vec_mpy1, %function
vec_mpy1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, r2
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrsh	r3, [fp, #-22]
	ldr	r1, [fp, #-8]
	lsl	r1, r1, #1
	ldr	r0, [fp, #-20]
	add	r1, r0, r1
	ldrsh	r1, [r1]
	mul	r3, r1, r3
	asr	r3, r3, #15
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L2:
	ldr	r3, [fp, #-8]
	cmp	r3, #149
	ble	.L3
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	vec_mpy1, .-vec_mpy1
	.align	2
	.global	mac
	.syntax unified
	.arm
	.fpu softvfp
	.type	mac, %function
mac:
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
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L6:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	cmp	r3, #149
	ble	.L6
	ldr	r3, [fp, #-28]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	mac, .-mac
	.align	2
	.global	fir
	.syntax unified
	.arm
	.fpu softvfp
	.type	fir, %function
fir:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L12:
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L10
.L11:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #1
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-12]
	cmp	r3, #49
	ble	.L11
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L9:
	ldr	r3, [fp, #-8]
	cmp	r3, #49
	ble	.L12
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	fir, .-fir
	.align	2
	.global	fir_no_red_ld
	.syntax unified
	.arm
	.fpu softvfp
	.type	fir_no_red_ld, %function
fir_no_red_ld:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #44
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L14
.L17:
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L15
.L16:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #1
	lsl	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-26]	@ movhi
	ldrsh	r3, [fp, #-22]
	ldrsh	r2, [fp, #-26]
	mul	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldrsh	r3, [fp, #-24]
	ldrsh	r2, [fp, #-26]
	mul	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r3, #2
	lsl	r3, r3, #1
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-22]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	lsl	r3, r3, #1
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-28]	@ movhi
	ldrsh	r3, [fp, #-24]
	ldrsh	r2, [fp, #-28]
	mul	r3, r2, r3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldrsh	r3, [fp, #-22]
	ldrsh	r2, [fp, #-28]
	mul	r3, r2, r3
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
.L15:
	ldr	r3, [fp, #-8]
	cmp	r3, #31
	ble	.L16
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [fp, #-16]
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	ldr	r2, [fp, #-20]
	asr	r2, r2, #15
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	str	r3, [fp, #-12]
.L14:
	ldr	r3, [fp, #-12]
	cmp	r3, #99
	ble	.L17
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	fir_no_red_ld, .-fir_no_red_ld
	.align	2
	.global	latsynth
	.syntax unified
	.arm
	.fpu softvfp
	.type	latsynth, %function
latsynth:
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
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #-2147483647
	lsl	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-24]
	sub	r3, r3, #-2147483647
	lsl	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [fp, #-28]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #2
	str	r3, [fp, #-8]
	b	.L19
.L20:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mul	r3, r1, r3
	ldr	r2, [fp, #-28]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	ldr	r1, [fp, #-20]
	add	r3, r1, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-28]
	asr	r3, r3, #16
	mul	r3, r1, r3
	asr	r3, r3, #16
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	lsl	r3, r3, #1
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L20
	ldr	r3, [fp, #-28]
	asr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-16]
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-28]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	latsynth, .-latsynth
	.align	2
	.global	iir1
	.syntax unified
	.arm
	.fpu softvfp
	.type	iir1, %function
iir1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldrsh	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L23
.L24:
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [fp, #-24]
	add	r3, r3, #6
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, #4
	ldr	r3, [r3]
	mul	r3, r1, r3
	add	r3, r2, r3
	asr	r3, r3, #15
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	ldrsh	r3, [r3]
	mov	r1, r3
	ldr	r3, [fp, #-36]
	add	r3, r3, #4
	ldr	r3, [r3]
	mul	r3, r1, r3
	add	r3, r2, r3
	asr	r3, r3, #15
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	add	r3, r3, #4
	ldr	r2, [fp, #-36]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-36]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #8
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L23:
	ldr	r3, [fp, #-12]
	cmp	r3, #49
	ble	.L24
	ldr	r3, [fp, #-32]
	add	r2, r3, #4
	str	r2, [fp, #-32]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	iir1, .-iir1
	.align	2
	.global	codebook
	.syntax unified
	.arm
	.fpu softvfp
	.type	codebook, %function
codebook:
	@ Function supports interworking.
	@ args = 16, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L26
.L27:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L26:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L27
	ldr	r3, [fp, #4]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	codebook, .-codebook
	.align	2
	.global	jpegdct
	.syntax unified
	.arm
	.fpu softvfp
	.type	jpegdct, %function
jpegdct:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #76
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	mov	r3, #1
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-12]	@ movhi
	mov	r3, #13
	strh	r3, [fp, #-14]	@ movhi
	mov	r3, #8
	strh	r3, [fp, #-16]	@ movhi
	b	.L30
.L35:
	mov	r3, #0
	strh	r3, [fp, #-6]	@ movhi
	b	.L31
.L34:
	mov	r3, #0
	strh	r3, [fp, #-8]	@ movhi
	b	.L32
.L33:
	ldrsh	r3, [fp, #-10]
	ldrsh	r2, [fp, #-8]
	mul	r3, r2, r3
	lsl	r3, r3, #1
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldrsh	r3, [fp, #-10]
	ldrsh	r2, [fp, #-8]
	rsb	r2, r2, #7
	mul	r3, r2, r3
	lsl	r3, r3, #1
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r2, r3
	ldrsh	r3, [fp, #-8]
	add	r2, r1, r2
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-60]
	ldrsh	r3, [fp, #-10]
	ldrsh	r2, [fp, #-8]
	mul	r3, r2, r3
	lsl	r3, r3, #1
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r1, r3
	ldrsh	r3, [fp, #-10]
	ldrsh	r2, [fp, #-8]
	rsb	r2, r2, #7
	mul	r3, r2, r3
	lsl	r3, r3, #1
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	mov	r2, r3
	ldrsh	r3, [fp, #-8]
	rsb	r3, r3, #7
	sub	r2, r1, r2
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	str	r2, [r3, #-60]
	ldrsh	r3, [fp, #-8]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
.L32:
	ldrsh	r3, [fp, #-8]
	cmp	r3, #3
	ble	.L33
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-52]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-56]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	add	r2, r2, r3
	ldrsh	r3, [fp, #-12]
	asr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-72]
	strh	r2, [r3]	@ movhi
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	sub	r2, r2, r3
	ldrsh	r3, [fp, #-12]
	asr	r2, r2, r3
	ldrsh	r3, [fp, #-10]
	lsl	r3, r3, #3
	ldr	r1, [fp, #-72]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-28]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r3, #20
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-28]
	ldr	r1, [fp, #-76]
	add	r1, r1, #18
	ldrsh	r1, [r1]
	mul	r1, r3, r1
	ldrsh	r3, [fp, #-14]
	asr	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrsh	r3, [fp, #-10]
	lsl	r3, r3, #2
	ldr	r1, [fp, #-72]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	ldr	r1, [fp, #-76]
	add	r1, r1, #22
	ldrsh	r1, [r1]
	mul	r1, r3, r1
	ldrsh	r3, [fp, #-14]
	asr	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrsh	r2, [fp, #-10]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r3, #4
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-76]
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r3, #16
	ldrsh	r3, [r3]
	mul	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r3, #2
	ldrsh	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r3, #6
	ldrsh	r3, [r3]
	mul	r2, r3, r2
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-48]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, [fp, #-76]
	add	r2, r2, #8
	ldrsh	r2, [r2]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldrsh	r3, [fp, #-14]
	asr	r1, r2, r3
	ldrsh	r2, [fp, #-10]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-44]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, [fp, #-76]
	add	r2, r2, #12
	ldrsh	r2, [r2]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldrsh	r3, [fp, #-14]
	asr	r1, r2, r3
	ldrsh	r2, [fp, #-10]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, [fp, #-76]
	add	r2, r2, #10
	ldrsh	r2, [r2]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-60]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldrsh	r3, [fp, #-14]
	asr	r1, r2, r3
	ldrsh	r2, [fp, #-10]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-72]
	add	r3, r3, r2
	lsl	r2, r1, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, [fp, #-76]
	add	r2, r2, #14
	ldrsh	r2, [r2]
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-64]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-52]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r2, r3
	ldrsh	r3, [fp, #-14]
	asr	r2, r2, r3
	ldrsh	r3, [fp, #-10]
	lsl	r3, r3, #1
	ldr	r1, [fp, #-72]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r3, [fp, #-6]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-16]
	lsl	r3, r3, #1
	ldr	r2, [fp, #-72]
	add	r3, r2, r3
	str	r3, [fp, #-72]
.L31:
	ldrsh	r3, [fp, #-6]
	cmp	r3, #7
	ble	.L34
	ldrh	r3, [fp, #-10]
	add	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r3, [fp, #-12]
	add	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-12]	@ movhi
	ldrh	r3, [fp, #-14]
	add	r3, r3, #3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r3, [fp, #-16]
	sub	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-16]	@ movhi
	ldr	r3, [fp, #-72]
	sub	r3, r3, #128
	str	r3, [fp, #-72]
.L30:
	ldrsh	r3, [fp, #-10]
	cmp	r3, #8
	ble	.L35
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	jpegdct, .-jpegdct
	.bss
	.align	2
a:
	.space	400
	.size	a, 400
	.align	2
b:
	.space	400
	.size	b, 400
	.align	1
c:
	.space	2
	.size	c, 2
	.align	2
d:
	.space	4
	.size	d, 4
	.align	2
e:
	.space	4
	.size	e, 4
	.align	2
output:
	.space	800
	.size	output, 800
	.text
	.align	2
	.global	beebs_edn_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_edn_initialise_benchmark, %function
beebs_edn_initialise_benchmark:
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
	.size	beebs_edn_initialise_benchmark, .-beebs_edn_initialise_benchmark
	.section	.rodata
	.align	2
.LC0:
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.short	0
	.short	2047
	.short	3072
	.short	2048
	.short	512
	.short	-2048
	.short	-3328
	.short	1024
	.align	2
.LC1:
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.short	3168
	.short	3136
	.short	3104
	.short	3072
	.short	-2560
	.short	-3072
	.short	-3584
	.short	-4096
	.text
	.align	2
	.global	beebs_edn_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_edn_benchmark, %function
beebs_edn_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 808
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #824
	ldr	r2, .L41
	sub	r3, fp, #408
	mov	r1, r2
	mov	r2, #400
	mov	r0, r3
	bl	memcpy
	ldr	r2, .L41+4
	sub	r3, fp, #808
	mov	r1, r2
	mov	r2, #400
	mov	r0, r3
	bl	memcpy
	ldr	r3, .L41+8
	mov	r2, #3
	strh	r2, [r3]	@ movhi
	ldr	r3, .L41+12
	ldr	r2, .L41+16
	str	r2, [r3]
	ldr	r3, .L41+20
	ldr	r2, .L41+24
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L38
.L39:
	sub	r3, fp, #4
	sub	r2, r3, #404
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrsh	r2, [r3]
	ldr	r1, .L41+28
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	sub	r3, fp, #4
	sub	r2, r3, #804
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrsh	r2, [r3]
	ldr	r1, .L41+32
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L38:
	ldr	r3, [fp, #-8]
	cmp	r3, #199
	ble	.L39
	ldr	r3, .L41+8
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	vec_mpy1
	ldr	r3, .L41+8
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L41+36
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	mac
	mov	r3, r0
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, .L41+8
	strh	r3, [r2]	@ movhi
	ldr	r2, .L41+36
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	fir
	ldr	r2, .L41+36
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	fir_no_red_ld
	ldr	r3, .L41+12
	ldr	r3, [r3]
	mov	r2, #100
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	latsynth
	mov	r3, r0
	ldr	r2, .L41+12
	str	r3, [r2]
	ldr	r3, .L41+36
	ldr	r2, .L41+40
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	iir1
	ldr	r3, .L41+12
	ldr	r0, [r3]
	ldr	r3, .L41+20
	ldr	r1, [r3]
	ldr	r3, .L41+12
	ldr	r3, [r3]
	ldr	r2, .L41+8
	ldrsh	r2, [r2]
	mov	ip, #1
	str	ip, [sp, #12]
	str	r2, [sp, #8]
	ldr	r2, .L41+28
	str	r2, [sp, #4]
	str	r3, [sp]
	mov	r3, r1
	mov	r2, #17
	mov	r1, #1
	bl	codebook
	mov	r3, r0
	ldr	r2, .L41+20
	str	r3, [r2]
	ldr	r1, .L41+32
	ldr	r0, .L41+28
	bl	jpegdct
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	.LC0
	.word	.LC1
	.word	c
	.word	d
	.word	43690
	.word	e
	.word	61166
	.word	a
	.word	b
	.word	output
	.word	output+400
	.size	beebs_edn_benchmark, .-beebs_edn_benchmark
	.section	.rodata
	.align	2
.LC2:
	.word	3760
	.word	4269
	.word	3126
	.word	1030
	.word	2453
	.word	-4601
	.word	1981
	.word	-1056
	.word	2621
	.word	4269
	.word	3058
	.word	1030
	.word	2378
	.word	-4601
	.word	1902
	.word	-1056
	.word	2548
	.word	4269
	.word	2988
	.word	1030
	.word	2300
	.word	-4601
	.word	1822
	.word	-1056
	.word	2474
	.word	4269
	.word	2917
	.word	1030
	.word	2220
	.word	-4601
	.word	1738
	.word	-1056
	.word	2398
	.word	4269
	.word	2844
	.word	1030
	.word	2140
	.word	-4601
	.word	1655
	.word	-1056
	.word	2321
	.word	4269
	.word	2770
	.word	1030
	.word	2058
	.word	-4601
	.word	1569
	.word	-1056
	.word	2242
	.word	4269
	.word	2152
	.word	1030
	.word	1683
	.word	-4601
	.word	1627
	.word	-1056
	.word	2030
	.word	4269
	.word	2080
	.word	1030
	.word	1611
	.word	-4601
	.word	1555
	.word	-1056
	.word	1958
	.word	4269
	.word	2008
	.word	1030
	.word	1539
	.word	-4601
	.word	1483
	.word	-1056
	.word	1886
	.word	4269
	.word	1935
	.word	1030
	.word	1466
	.word	-4601
	.word	1410
	.word	-1056
	.word	1813
	.word	4269
	.word	1862
	.word	1030
	.word	1393
	.word	-4601
	.word	1337
	.word	-1056
	.word	1740
	.word	4269
	.word	1789
	.word	1030
	.word	1320
	.word	-4601
	.word	1264
	.word	-1056
	.word	1667
	.word	4269
	.word	1716
	.word	1030
	.word	1968
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.text
	.align	2
	.global	beebs_edn_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_edn_verify_benchmark, %function
beebs_edn_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 824
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #824
	str	r0, [fp, #-824]
	ldr	r3, .L51
	str	r3, [fp, #-12]
	ldr	r3, .L51+4
	str	r3, [fp, #-16]
	ldr	r3, .L51+4
	str	r3, [fp, #-20]
	ldr	r2, .L51+8
	sub	r3, fp, #820
	mov	r1, r2
	mov	r2, #800
	mov	r0, r3
	bl	memcpy
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L44
.L47:
	ldr	r2, .L51+12
	ldr	r3, [fp, #-8]
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-816]
	cmp	r2, r3
	beq	.L45
	mov	r3, #0
	b	.L50
.L45:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L44:
	ldr	r3, [fp, #-8]
	cmp	r3, #199
	ble	.L47
	ldr	r3, .L51+16
	ldrsh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-12]
	cmp	r3, r2
	bne	.L48
	ldr	r3, .L51+20
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L48
	ldr	r3, .L51+24
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	beq	.L49
.L48:
	mov	r3, #0
	b	.L50
.L49:
	mov	r3, #1
.L50:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	10243
	.word	-441886230
	.word	.LC2
	.word	output
	.word	c
	.word	d
	.word	e
	.size	beebs_edn_verify_benchmark, .-beebs_edn_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
