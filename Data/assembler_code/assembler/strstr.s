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
	.file	"libstrstr.c"
	.text
	.align	2
	.global	strstr
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	strstr, %function
strstr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L26
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [fp, #-8]
.L5:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L27
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L5
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L28
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	nop
.L7:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L11
	b	.L10
.L35:
	nop
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	b	.L11
.L16:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L29
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	beq	.L30
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L31
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
.L11:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bne	.L16
	b	.L14
.L30:
	nop
.L14:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bne	.L11
	nop
.L10:
	ldr	r3, [fp, #-8]
	sub	r2, r3, #1
	str	r2, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	bne	.L18
.L22:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L32
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	bne	.L33
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L34
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, r2
	beq	.L22
	b	.L18
.L33:
	nop
.L18:
	ldr	r3, [fp, #-40]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L35
	b	.L2
.L26:
	nop
	b	.L2
.L28:
	nop
	b	.L2
.L32:
	nop
	b	.L2
.L34:
	nop
.L2:
	ldr	r3, [fp, #-8]
	b	.L25
.L27:
	nop
	b	.L4
.L29:
	nop
	b	.L4
.L31:
	nop
.L4:
	mov	r3, #0
.L25:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	strstr, .-strstr
	.global	strstr_text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"abbaabbaababadcsdabbacasdaabbbaabbadabbacbbbaabbada"
	.ascii	"bbacasdaabbbaabba\000"
	.data
	.align	2
	.type	strstr_text, %object
	.size	strstr_text, 4
strstr_text:
	.word	.LC0
	.text
	.align	2
	.global	beebs_strstr_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_strstr_initialise_benchmark, %function
beebs_strstr_initialise_benchmark:
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
	.size	beebs_strstr_initialise_benchmark, .-beebs_strstr_initialise_benchmark
	.global	substr
	.section	.rodata
	.align	2
.LC1:
	.ascii	"abba\000"
	.data
	.align	2
	.type	substr, %object
	.size	substr, 4
substr:
	.word	.LC1
	.text
	.align	2
	.global	beebs_strstr_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_strstr_benchmark, %function
beebs_strstr_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L40
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
.L38:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldr	r2, .L40+4
	ldr	r2, [r2]
	mov	r1, r2
	mov	r0, r3
	bl	strstr
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L38
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	strstr_text
	.word	substr
	.size	beebs_strstr_benchmark, .-beebs_strstr_benchmark
	.align	2
	.global	beebs_strstr_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_strstr_verify_benchmark, %function
beebs_strstr_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #8
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L43
	mov	r3, #0
	b	.L44
.L43:
	mov	r3, #1
.L44:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	beebs_strstr_verify_benchmark, .-beebs_strstr_verify_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
