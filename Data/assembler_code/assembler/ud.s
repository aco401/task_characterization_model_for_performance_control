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
	.file	"libud.c"
	.text
	.global	ud_a
	.bss
	.align	2
	.type	ud_a, %object
	.size	ud_a, 1600
ud_a:
	.space	1600
	.global	ud_b
	.align	2
	.type	ud_b, %object
	.size	ud_b, 80
ud_b:
	.space	80
	.global	ud_x
	.align	2
	.type	ud_x, %object
	.size	ud_x, 80
ud_x:
	.space	80
	.global	ud_chkerr
	.align	2
	.type	ud_chkerr, %object
	.size	ud_chkerr, 4
ud_chkerr:
	.space	4
	.text
	.align	2
	.global	beebs_ud_verify_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ud_verify_benchmark, %function
beebs_ud_verify_benchmark:
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
	.size	beebs_ud_verify_benchmark, .-beebs_ud_verify_benchmark
	.align	2
	.global	beebs_ud_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ud_initialise_benchmark, %function
beebs_ud_initialise_benchmark:
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
	.size	beebs_ud_initialise_benchmark, .-beebs_ud_initialise_benchmark
	.global	__aeabi_i2d
	.global	__aeabi_dadd
	.global	__aeabi_d2iz
	.align	2
	.global	beebs_ud_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_ud_benchmark, %function
beebs_ud_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, #20
	str	r3, [fp, #-20]
	mov	r3, #5
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L5
.L9:
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L6
.L8:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	add	r1, r2, r3
	ldr	r0, .L11
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bne	.L7
	ldr	r1, .L11
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]
	mov	r0, r3
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r1, r0
	ldr	r0, .L11
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r1, [r0, r3, lsl #2]
.L7:
	ldr	r1, .L11
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L6:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L8
	ldr	r1, .L11+4
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	ble	.L9
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-20]
	bl	ud_ludcmp
	mov	r3, r0
	ldr	r2, .L11+8
	str	r3, [r2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	ud_a
	.word	ud_b
	.word	ud_chkerr
	.size	beebs_ud_benchmark, .-beebs_ud_benchmark
	.global	__aeabi_idiv
	.align	2
	.global	ud_ludcmp
	.syntax unified
	.arm
	.fpu softvfp
	.type	ud_ludcmp, %function
ud_ludcmp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 424
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #424
	str	r0, [fp, #-424]
	str	r1, [fp, #-428]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L14
.L24:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L15
.L19:
	ldr	r1, .L34
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L16
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L17
.L18:
	ldr	r1, .L34
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r1, [r1, r3, lsl #2]
	ldr	r0, .L34
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	ldr	r3, [r0, r3, lsl #2]
	mul	r3, r1, r3
	ldr	r2, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L17:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L18
.L16:
	ldr	r1, .L34
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	lsl	r3, r2, #2
	mov	r2, r3
	add	r3, r1, r2
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r0, r3
	ldr	r1, .L34
	ldr	r2, [fp, #-12]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	str	r0, [r1, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-428]
	cmp	r2, r3
	ble	.L19
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L20
.L23:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r1, .L34
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L21
.L22:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r1, .L34
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	ldr	r1, [r1, r3, lsl #2]
	ldr	r0, .L34
	ldr	r2, [fp, #-16]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r0, r3, lsl #2]
	mul	r3, r1, r3
	ldr	r2, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L21:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	ble	.L22
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r1, .L34
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r2, [fp, #-20]
	str	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L20:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-428]
	cmp	r2, r3
	ble	.L23
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L14:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-428]
	cmp	r2, r3
	blt	.L24
	ldr	r3, .L34+4
	ldr	r3, [r3]
	str	r3, [fp, #-420]
	mov	r3, #1
	str	r3, [fp, #-8]
	b	.L25
.L28:
	ldr	r2, .L34+4
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L26
.L27:
	ldr	r1, .L34
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r2, [r1, r3, lsl #2]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-416]
	mul	r3, r2, r3
	ldr	r2, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L26:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	blt	.L27
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r2, [fp, #-20]
	str	r2, [r3, #-416]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L25:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-428]
	cmp	r2, r3
	ble	.L28
	ldr	r3, [fp, #-428]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r0, [r3, #-416]
	ldr	r1, .L34
	ldr	r2, [fp, #-428]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	lsl	r3, r2, #2
	mov	r2, r3
	add	r3, r1, r2
	ldr	r3, [r3]
	mov	r1, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r1, r3
	ldr	r2, .L34+8
	ldr	r3, [fp, #-428]
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [fp, #-428]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
	b	.L29
.L32:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldr	r3, [r3, #-416]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	b	.L30
.L31:
	ldr	r1, .L34
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	ldr	r3, [r1, r3, lsl #2]
	ldr	r1, .L34+8
	ldr	r2, [fp, #-12]
	ldr	r2, [r1, r2, lsl #2]
	mul	r3, r2, r3
	ldr	r2, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L30:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-428]
	cmp	r2, r3
	ble	.L31
	ldr	r1, .L34
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	lsl	r3, r2, #2
	mov	r2, r3
	add	r3, r1, r2
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, [fp, #-20]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r1, r3
	ldr	r2, .L34+8
	ldr	r3, [fp, #-8]
	str	r1, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L29:
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L32
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	ud_a
	.word	ud_b
	.word	ud_x
	.size	ud_ludcmp, .-ud_ludcmp
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
