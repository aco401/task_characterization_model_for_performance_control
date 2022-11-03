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
	.file	"libfasta.c"
	.text
	.global	__aeabi_uidivmod
	.global	__aeabi_i2f
	.global	__aeabi_fmul
	.global	__aeabi_ui2f
	.global	__aeabi_fdiv
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	myrandom, %function
myrandom:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #28
	str	r0, [fp, #-32]	@ float
	ldr	r3, .L3
	str	r3, [fp, #-16]
	ldr	r3, .L3+4
	str	r3, [fp, #-20]
	ldr	r3, .L3+8
	str	r3, [fp, #-24]
	ldr	r3, .L3+12
	ldr	r3, [r3]
	ldr	r2, [fp, #-20]
	mul	r2, r3, r2
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, .L3+12
	str	r2, [r3]
	ldr	r3, .L3+12
	ldr	r3, [r3]
	mov	r0, r3
	bl	__aeabi_i2f
	mov	r3, r0
	ldr	r1, [fp, #-32]	@ float
	mov	r0, r3
	bl	__aeabi_fmul
	mov	r3, r0
	mov	r4, r3
	ldr	r0, [fp, #-16]
	bl	__aeabi_ui2f
	mov	r3, r0
	mov	r1, r3
	mov	r0, r4
	bl	__aeabi_fdiv
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L4:
	.align	2
.L3:
	.word	139968
	.word	3877
	.word	29573
	.word	last.3
	.size	myrandom, .-myrandom
	.global	__aeabi_fadd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	accumulate_probabilities, %function
accumulate_probabilities:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]	@ float
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L6
.L7:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-8]	@ float
	bl	__aeabi_fadd
	mov	r3, r0
	str	r3, [fp, #-8]	@ float
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, [fp, #-8]	@ float
	str	r2, [r3]	@ float
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L6:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bcc	.L7
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	accumulate_probabilities, .-accumulate_probabilities
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	repeat_fasta, %function
repeat_fasta:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	strlen
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #60
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	sub	sp, sp, r3
	mov	r3, sp
	add	r3, r3, #7
	lsr	r3, r3, #3
	lsl	r3, r3, #3
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-16]
	bl	memcpy
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	mov	r2, #60
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	memcpy
.L10:
	ldr	r3, [fp, #-28]
	cmp	r3, #60
	movcc	r3, r3
	movcs	r3, #60
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcc	.L9
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
.L9:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L10
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	repeat_fasta, .-repeat_fasta
	.global	__aeabi_fcmpgt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	random_fasta, %function
random_fasta:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 88
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #88
	str	r0, [fp, #-88]
	str	r1, [fp, #-92]
.L15:
	ldr	r3, [fp, #-92]
	cmp	r3, #60
	movcc	r3, r3
	movcs	r3, #60
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
.L14:
	mov	r0, #1065353216
	bl	myrandom
	str	r0, [fp, #-20]	@ float
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L12
.L13:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L12:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r3, r2, r3
	ldr	r3, [r3]	@ float
	mov	r1, r3
	ldr	r0, [fp, #-20]	@ float
	bl	__aeabi_fcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L13
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #3
	ldr	r2, [fp, #-88]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r1, r3, #1
	str	r1, [fp, #-8]
	ldrb	r2, [r2, #4]	@ zero_extendqisi2
	sub	r3, r3, #4
	add	r3, r3, fp
	strb	r2, [r3, #-80]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bcc	.L14
	sub	r2, fp, #84
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	mov	r2, #10
	strb	r2, [r3]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-16]
	sub	r3, r2, r3
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	bne	.L15
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	random_fasta, .-random_fasta
	.align	2
	.global	beebs_fasta_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fasta_verify_benchmark, %function
beebs_fasta_verify_benchmark:
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
	.size	beebs_fasta_verify_benchmark, .-beebs_fasta_verify_benchmark
	.align	2
	.global	beebs_fasta_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fasta_initialise_benchmark, %function
beebs_fasta_initialise_benchmark:
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
	.size	beebs_fasta_initialise_benchmark, .-beebs_fasta_initialise_benchmark
	.align	2
	.global	beebs_fasta_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_fasta_benchmark, %function
beebs_fasta_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #1000
	str	r3, [fp, #-8]
	mov	r1, #15
	ldr	r0, .L21
	bl	accumulate_probabilities
	mov	r1, #4
	ldr	r0, .L21+4
	bl	accumulate_probabilities
	ldr	r3, .L21+8
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	repeat_fasta
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, .L21
	bl	random_fasta
	ldr	r2, [fp, #-8]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	mov	r1, r3
	ldr	r0, .L21+4
	bl	random_fasta
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	iub.2
	.word	homosapiens.1
	.word	alu.0
	.size	beebs_fasta_benchmark, .-beebs_fasta_benchmark
	.data
	.align	2
	.type	last.3, %object
	.size	last.3, 4
last.3:
	.word	42
	.align	2
	.type	iub.2, %object
	.size	iub.2, 120
iub.2:
	.word	1049247089
	.byte	97
	.space	3
	.word	1039516303
	.byte	99
	.space	3
	.word	1039516303
	.byte	103
	.space	3
	.word	1049247089
	.byte	116
	.space	3
	.word	1017370378
	.byte	66
	.space	3
	.word	1017370378
	.byte	68
	.space	3
	.word	1017370378
	.byte	72
	.space	3
	.word	1017370378
	.byte	75
	.space	3
	.word	1017370378
	.byte	77
	.space	3
	.word	1017370378
	.byte	78
	.space	3
	.word	1017370378
	.byte	82
	.space	3
	.word	1017370378
	.byte	83
	.space	3
	.word	1017370378
	.byte	86
	.space	3
	.word	1017370378
	.byte	87
	.space	3
	.word	1017370378
	.byte	89
	.space	3
	.align	2
	.type	homosapiens.1, %object
	.size	homosapiens.1, 32
homosapiens.1:
	.word	1050352873
	.byte	97
	.space	3
	.word	1045085554
	.byte	99
	.space	3
	.word	1045055959
	.byte	103
	.space	3
	.word	1050304370
	.byte	116
	.space	3
	.section	.rodata
	.align	2
.LC0:
	.ascii	"GGCCGGGCGCGGTGGCTCACGCCTGTAATCCCAGCACTTTGGGAGGCCGAG"
	.ascii	"GCGGGCGGATCACCTGAGGTCAGGAGTTCGAGACCAGCCTGGCCAACATGG"
	.ascii	"TGAAACCCCGTCTCTACTAAAAATACAAAAATTAGCCGGGCGTGGTGGCGC"
	.ascii	"GCGCCTGTAATCCCAGCTACTCGGGAGGCTGAGGCAGGAGAATCGCTTGAA"
	.ascii	"CCCGGGAGGCGGAGGTTGCAGTGAGCCGAGATCGCGCCACTGCACTCCAGC"
	.ascii	"CTGGGCGACAGAGCGAGACTCCGTCTCAAAAA\000"
	.align	2
	.type	alu.0, %object
	.size	alu.0, 4
alu.0:
	.word	.LC0
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
