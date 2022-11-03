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
	.file	"libcompress.c"
	.text
	.global	n_bits
	.bss
	.align	2
	.type	n_bits, %object
	.size	n_bits, 4
n_bits:
	.space	4
	.global	maxbits
	.data
	.align	2
	.type	maxbits, %object
	.size	maxbits, 4
maxbits:
	.word	16
	.global	maxcode
	.bss
	.align	2
	.type	maxcode, %object
	.size	maxcode, 4
maxcode:
	.space	4
	.global	maxmaxcode
	.data
	.align	2
	.type	maxmaxcode, %object
	.size	maxmaxcode, 4
maxmaxcode:
	.word	65536
	.global	hsize
	.align	2
	.type	hsize, %object
	.size	hsize, 4
hsize:
	.word	400
	.global	fsize
	.bss
	.align	2
	.type	fsize, %object
	.size	fsize, 4
fsize:
	.space	4
	.global	free_ent
	.align	2
	.type	free_ent, %object
	.size	free_ent, 4
free_ent:
	.space	4
	.global	exit_stat
	.align	2
	.type	exit_stat, %object
	.size	exit_stat, 4
exit_stat:
	.space	4
	.global	nomagic
	.data
	.align	2
	.type	nomagic, %object
	.size	nomagic, 4
nomagic:
	.word	1
	.global	zcat_flg
	.bss
	.align	2
	.type	zcat_flg, %object
	.size	zcat_flg, 4
zcat_flg:
	.space	4
	.global	quiet
	.data
	.align	2
	.type	quiet, %object
	.size	quiet, 4
quiet:
	.word	1
	.global	block_compress
	.align	2
	.type	block_compress, %object
	.size	block_compress, 4
block_compress:
	.word	128
	.global	clear_flg
	.bss
	.align	2
	.type	clear_flg, %object
	.size	clear_flg, 4
clear_flg:
	.space	4
	.global	ratio
	.align	2
	.type	ratio, %object
	.size	ratio, 4
ratio:
	.space	4
	.global	checkpoint
	.data
	.align	2
	.type	checkpoint, %object
	.size	checkpoint, 4
checkpoint:
	.word	10000
	.global	force
	.bss
	.align	2
	.type	force, %object
	.size	force, 4
force:
	.space	4
	.global	ofname
	.align	2
	.type	ofname, %object
	.size	ofname, 100
ofname:
	.space	100
	.global	InCnt
	.align	2
	.type	InCnt, %object
	.size	InCnt, 4
InCnt:
	.space	4
	.global	apsim_InCnt
	.align	2
	.type	apsim_InCnt, %object
	.size	apsim_InCnt, 4
apsim_InCnt:
	.space	4
	.global	InBuff
	.align	2
	.type	InBuff, %object
	.size	InBuff, 4
InBuff:
	.space	4
	.global	OutBuff
	.align	2
	.type	OutBuff, %object
	.size	OutBuff, 4
OutBuff:
	.space	4
	.global	orig_text_buffer
	.section	.rodata
	.align	2
	.type	orig_text_buffer, %object
	.size	orig_text_buffer, 50
orig_text_buffer:
	.ascii	"\326\242\240\361\323\000\335\225c\337\030\026\004O."
	.ascii	"\250's2\037*`\360$\303\010n\315B\\\313\274u\255\323"
	.ascii	"M\016\214P\000\264\375\017\006Y\344\307$\331n"
	.global	comp_text_buffer
	.bss
	.align	2
	.type	comp_text_buffer, %object
	.size	comp_text_buffer, 55
comp_text_buffer:
	.space	55
	.global	htab
	.align	2
	.type	htab, %object
	.size	htab, 1600
htab:
	.space	1600
	.global	codetab
	.align	2
	.type	codetab, %object
	.size	codetab, 800
codetab:
	.space	800
	.global	buf
	.align	2
	.type	buf, %object
	.size	buf, 16
buf:
	.space	16
	.text
	.align	2
	.global	beebs_compress_verify_benchmark
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_compress_verify_benchmark, %function
beebs_compress_verify_benchmark:
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
	.size	beebs_compress_verify_benchmark, .-beebs_compress_verify_benchmark
	.align	2
	.global	beebs_compress_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_compress_initialise_benchmark, %function
beebs_compress_initialise_benchmark:
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
	.size	beebs_compress_initialise_benchmark, .-beebs_compress_initialise_benchmark
	.align	2
	.global	beebs_compress_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_compress_benchmark, %function
beebs_compress_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #50
	str	r3, [fp, #-8]
	ldr	r3, .L6
	mov	r2, #16
	str	r2, [r3]
	ldr	r3, .L6
	ldr	r3, [r3]
	mov	r2, #1
	lsl	r3, r2, r3
	ldr	r2, .L6+4
	str	r3, [r2]
	ldr	r2, .L6+8
	ldr	r3, [fp, #-8]
	str	r3, [r2]
	ldr	r3, .L6+12
	mov	r2, #53
	str	r2, [r3]
	ldr	r3, .L6+16
	ldr	r2, .L6+20
	str	r2, [r3]
	ldr	r3, .L6+24
	ldr	r2, .L6+28
	str	r2, [r3]
	bl	compress
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	maxbits
	.word	maxmaxcode
	.word	InCnt
	.word	apsim_InCnt
	.word	InBuff
	.word	orig_text_buffer
	.word	OutBuff
	.word	comp_text_buffer
	.size	beebs_compress_benchmark, .-beebs_compress_benchmark
	.bss
	.align	2
offset:
	.space	4
	.size	offset, 4
	.global	in_count
	.data
	.align	2
	.type	in_count, %object
	.size	in_count, 4
in_count:
	.word	1
	.global	bytes_out
	.bss
	.align	2
	.type	bytes_out, %object
	.size	bytes_out, 4
bytes_out:
	.space	4
	.global	out_count
	.align	2
	.type	out_count, %object
	.size	out_count, 4
out_count:
	.space	4
	.text
	.align	2
	.global	compress
	.syntax unified
	.arm
	.fpu softvfp
	.type	compress, %function
compress:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #8
	ldr	r3, .L29
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L29+4
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, .L29+8
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L29+12
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L29+16
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L29+20
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, .L29+24
	ldr	r2, .L29+28
	str	r2, [r3]
	ldr	r3, .L29+32
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L29+32
	ldr	r3, [r3]
	mov	r2, #1
	lsl	r3, r2, r3
	sub	r3, r3, #1
	ldr	r2, .L29+36
	str	r3, [r2]
	ldr	r3, .L29+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L9
	ldr	r3, .L29+44
	b	.L10
.L9:
	mov	r3, #256
.L10:
	ldr	r2, .L29+48
	str	r3, [r2]
	bl	getbyte
	mov	r3, r0
	mov	r8, r3
	mov	r6, #0
	ldr	r3, .L29+52
	ldr	r5, [r3]
	b	.L11
.L12:
	add	r6, r6, #1
	lsl	r5, r5, #1
.L11:
	cmp	r5, #65536
	blt	.L12
	rsb	r6, r6, #8
	ldr	r3, .L29+52
	ldr	r7, [r3]
	mov	r0, r7
	bl	cl_hash
	b	.L13
.L22:
	mov	r3, #0
	str	r3, [fp, #-32]
	bl	getbyte
	mov	r3, r0
	mov	r9, r3
	ldr	r3, .L29+20
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L29+20
	str	r3, [r2]
	ldr	r3, .L29+56
	ldr	r3, [r3]
	lsl	r3, r9, r3
	add	r5, r8, r3
	lsl	r3, r9, r6
	eor	r4, r8, r3
	ldr	r3, .L29+60
	ldr	r3, [r3, r4, lsl #2]
	cmp	r5, r3
	bne	.L14
	ldr	r2, .L29+64
	lsl	r3, r4, #1
	add	r3, r2, r3
	ldrh	r3, [r3]
	mov	r8, r3
	b	.L13
.L14:
	ldr	r3, .L29+60
	ldr	r3, [r3, r4, lsl #2]
	cmp	r3, #0
	blt	.L25
	sub	r8, r7, r4
	cmp	r4, #0
	bne	.L26
	mov	r8, #1
	b	.L20
.L26:
	nop
.L17:
.L20:
	sub	r4, r4, r8
	cmp	r4, #0
	bge	.L18
	add	r4, r4, r7
.L18:
	ldr	r3, .L29+60
	ldr	r3, [r3, r4, lsl #2]
	cmp	r5, r3
	bne	.L19
	ldr	r2, .L29+64
	lsl	r3, r4, #1
	add	r3, r2, r3
	ldrh	r3, [r3]
	mov	r8, r3
	b	.L13
.L19:
	ldr	r3, .L29+60
	ldr	r3, [r3, r4, lsl #2]
	cmp	r3, #0
	ble	.L27
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, .L29+20
	ldr	r3, [r3]
	ldr	r2, [fp, #-32]
	cmp	r2, r3
	bge	.L27
	b	.L20
.L25:
	nop
	b	.L16
.L27:
	nop
.L16:
	ldr	r3, .L29+8
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L29+8
	str	r3, [r2]
	mov	r8, r9
	ldr	r3, .L29+48
	ldr	r2, [r3]
	ldr	r3, .L29+68
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L21
	ldr	r3, .L29+48
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r1, .L29+48
	str	r2, [r1]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r1, .L29+64
	lsl	r3, r4, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	ldr	r3, .L29+60
	str	r5, [r3, r4, lsl #2]
	b	.L13
.L21:
	ldr	r3, .L29+20
	ldr	r2, [r3]
	ldr	r3, .L29+24
	ldr	r3, [r3]
	cmp	r2, r3
	blt	.L13
	ldr	r3, .L29+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L13
	bl	cl_block
.L13:
	ldr	r3, .L29+72
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L22
	ldr	r3, .L29+4
	ldr	r2, [r3]
	ldr	r3, .L29+20
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L28
	ldr	r3, .L29+76
	mov	r2, #2
	str	r2, [r3]
	nop
.L28:
	nop
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	offset
	.word	bytes_out
	.word	out_count
	.word	clear_flg
	.word	ratio
	.word	in_count
	.word	checkpoint
	.word	10000
	.word	n_bits
	.word	maxcode
	.word	block_compress
	.word	257
	.word	free_ent
	.word	hsize
	.word	maxbits
	.word	htab
	.word	codetab
	.word	maxmaxcode
	.word	InCnt
	.word	exit_stat
	.size	compress, .-compress
	.global	__aeabi_idiv
	.align	2
	.global	cl_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	cl_block, %function
cl_block:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	ldr	r3, .L38
	ldr	r3, [r3]
	add	r3, r3, #9984
	add	r3, r3, #16
	ldr	r2, .L38+4
	str	r3, [r2]
	ldr	r3, .L38
	ldr	r3, [r3]
	cmp	r3, #8388608
	blt	.L32
	ldr	r3, .L38+8
	ldr	r3, [r3]
	asr	r4, r3, #8
	cmp	r4, #0
	bne	.L33
	mvn	r4, #-2147483648
	b	.L34
.L33:
	ldr	r3, .L38
	ldr	r3, [r3]
	mov	r1, r4
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r4, r3
	b	.L34
.L32:
	ldr	r3, .L38
	ldr	r3, [r3]
	lsl	r3, r3, #8
	ldr	r2, .L38+8
	ldr	r2, [r2]
	mov	r1, r2
	mov	r0, r3
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r4, r3
.L34:
	ldr	r3, .L38+12
	ldr	r3, [r3]
	cmp	r4, r3
	ble	.L35
	ldr	r3, .L38+12
	str	r4, [r3]
	b	.L37
.L35:
	ldr	r3, .L38+12
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L38+16
	ldr	r3, [r3]
	mov	r0, r3
	bl	cl_hash
	ldr	r3, .L38+20
	ldr	r2, .L38+24
	str	r2, [r3]
	ldr	r3, .L38+28
	mov	r2, #1
	str	r2, [r3]
	mov	r0, #256
	bl	output
.L37:
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	in_count
	.word	checkpoint
	.word	bytes_out
	.word	ratio
	.word	hsize
	.word	free_ent
	.word	257
	.word	clear_flg
	.size	cl_block, .-cl_block
	.align	2
	.global	cl_hash
	.syntax unified
	.arm
	.fpu softvfp
	.type	cl_hash, %function
cl_hash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, fp}
	add	fp, sp, #12
	sub	sp, sp, #8
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	ldr	r2, .L44
	add	r4, r3, r2
	mvn	r5, #0
	ldr	r3, [fp, #-16]
	sub	r6, r3, #16
.L41:
	sub	r3, r4, #64
	str	r5, [r3]
	sub	r3, r4, #60
	str	r5, [r3]
	sub	r3, r4, #56
	str	r5, [r3]
	sub	r3, r4, #52
	str	r5, [r3]
	sub	r3, r4, #48
	str	r5, [r3]
	sub	r3, r4, #44
	str	r5, [r3]
	sub	r3, r4, #40
	str	r5, [r3]
	sub	r3, r4, #36
	str	r5, [r3]
	sub	r3, r4, #32
	str	r5, [r3]
	sub	r3, r4, #28
	str	r5, [r3]
	sub	r3, r4, #24
	str	r5, [r3]
	sub	r3, r4, #20
	str	r5, [r3]
	sub	r3, r4, #16
	str	r5, [r3]
	sub	r3, r4, #12
	str	r5, [r3]
	sub	r3, r4, #8
	str	r5, [r3]
	sub	r3, r4, #4
	str	r5, [r3]
	sub	r4, r4, #64
	sub	r6, r6, #16
	cmp	r6, #0
	bge	.L41
	add	r6, r6, #16
	b	.L42
.L43:
	sub	r4, r4, #4
	str	r5, [r4]
	sub	r6, r6, #1
.L42:
	cmp	r6, #0
	bgt	.L43
	nop
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, r6, fp}
	bx	lr
.L45:
	.align	2
.L44:
	.word	htab
	.size	cl_hash, .-cl_hash
	.align	2
	.global	getbyte
	.syntax unified
	.arm
	.fpu softvfp
	.type	getbyte, %function
getbyte:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L49
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L47
	ldr	r3, .L49+4
	ldr	r3, [r3]
	sub	r2, r3, #1
	ldr	r1, .L49+4
	str	r2, [r1]
	cmp	r3, #0
	ble	.L47
	ldr	r3, .L49
	ldr	r3, [r3]
	sub	r3, r3, #1
	ldr	r2, .L49
	str	r3, [r2]
	ldr	r3, .L49+8
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r1, .L49+8
	str	r2, [r1]
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L48
.L47:
	mvn	r3, #0
.L48:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L50:
	.align	2
.L49:
	.word	InCnt
	.word	apsim_InCnt
	.word	InBuff
	.size	getbyte, .-getbyte
	.align	2
	.global	putbyte
	.syntax unified
	.arm
	.fpu softvfp
	.type	putbyte, %function
putbyte:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldr	r3, .L52
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r1, .L52
	str	r2, [r1]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L53:
	.align	2
.L52:
	.word	OutBuff
	.size	putbyte, .-putbyte
	.align	2
	.global	writebytes
	.syntax unified
	.arm
	.fpu softvfp
	.type	writebytes, %function
writebytes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L55
.L57:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L59
	ldr	r3, [r3]
	add	r1, r3, #1
	ldr	r0, .L59
	str	r1, [r0]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L55:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bge	.L58
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	ble	.L57
.L58:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L60:
	.align	2
.L59:
	.word	OutBuff
	.size	writebytes, .-writebytes
	.global	lmask
	.data
	.align	2
	.type	lmask, %object
	.size	lmask, 9
lmask:
	.ascii	"\377\376\374\370\360\340\300\200\000"
	.global	rmask
	.align	2
	.type	rmask, %object
	.size	rmask, 9
rmask:
	.ascii	"\000\001\003\007\017\037?\177\377"
	.text
	.align	2
	.global	output
	.syntax unified
	.arm
	.fpu softvfp
	.type	output, %function
output:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, fp, lr}
	add	fp, sp, #16
	sub	sp, sp, #12
	str	r0, [fp, #-24]
	ldr	r3, .L75
	ldr	r6, [r3]
	ldr	r3, .L75+4
	ldr	r4, [r3]
	ldr	r5, .L75+8
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	blt	.L62
	asr	r3, r6, #3
	add	r5, r5, r3
	and	r6, r6, #7
	ldrb	r2, [r5]	@ zero_extendqisi2
	ldr	r3, .L75+12
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	and	r3, r3, r2
	and	r3, r3, #255
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldr	r3, [fp, #-24]
	lsl	r3, r3, r6
	lsl	r3, r3, #24
	asr	r3, r3, #24
	orr	r3, r2, r3
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldr	r3, .L75+16
	ldrb	r3, [r3, r6]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r3, r3, r2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r3, r3, #255
	strb	r3, [r5]
	add	r5, r5, #1
	rsb	r3, r6, #8
	sub	r4, r4, r3
	rsb	r3, r6, #8
	ldr	r2, [fp, #-24]
	asr	r3, r2, r3
	str	r3, [fp, #-24]
	cmp	r4, #7
	ble	.L63
	mov	r3, r5
	add	r5, r3, #1
	ldr	r2, [fp, #-24]
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	asr	r3, r3, #8
	str	r3, [fp, #-24]
	sub	r4, r4, #8
.L63:
	cmp	r4, #0
	beq	.L64
	ldr	r3, [fp, #-24]
	and	r3, r3, #255
	strb	r3, [r5]
.L64:
	ldr	r3, .L75
	ldr	r2, [r3]
	ldr	r3, .L75+4
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L75
	str	r3, [r2]
	ldr	r3, .L75+4
	ldr	r3, [r3]
	lsl	r2, r3, #3
	ldr	r3, .L75
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L65
	ldr	r5, .L75+8
	ldr	r3, .L75+4
	ldr	r4, [r3]
	ldr	r3, .L75+20
	ldr	r3, [r3]
	add	r3, r4, r3
	ldr	r2, .L75+20
	str	r3, [r2]
.L67:
	mov	r3, r5
	add	r5, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	putbyte
	sub	r4, r4, #1
	cmp	r4, #0
	beq	.L66
	ldr	r3, .L75+8
	sub	r3, r5, r3
	cmp	r3, #15
	ble	.L67
.L66:
	ldr	r3, .L75
	mov	r2, #0
	str	r2, [r3]
.L65:
	ldr	r3, .L75+24
	ldr	r2, [r3]
	ldr	r3, .L75+28
	ldr	r3, [r3]
	cmp	r2, r3
	bgt	.L68
	ldr	r3, .L75+32
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L74
.L68:
	ldr	r3, .L75
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L70
	ldr	r3, .L75+4
	ldr	r3, [r3]
	mov	r1, r3
	ldr	r0, .L75+8
	bl	writebytes
	ldr	r3, .L75+20
	ldr	r2, [r3]
	ldr	r3, .L75+4
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L75+20
	str	r3, [r2]
.L70:
	ldr	r3, .L75
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L75+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L71
	ldr	r3, .L75+4
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, .L75+4
	ldr	r3, [r3]
	mov	r2, #1
	lsl	r3, r2, r3
	sub	r3, r3, #1
	ldr	r2, .L75+28
	str	r3, [r2]
	ldr	r3, .L75+32
	mov	r2, #0
	str	r2, [r3]
	b	.L74
.L71:
	ldr	r3, .L75+4
	ldr	r3, [r3]
	add	r3, r3, #1
	ldr	r2, .L75+4
	str	r3, [r2]
	ldr	r3, .L75+4
	ldr	r2, [r3]
	ldr	r3, .L75+36
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L72
	ldr	r3, .L75+40
	ldr	r3, [r3]
	ldr	r2, .L75+28
	str	r3, [r2]
	b	.L74
.L72:
	ldr	r3, .L75+4
	ldr	r3, [r3]
	mov	r2, #1
	lsl	r3, r2, r3
	sub	r3, r3, #1
	ldr	r2, .L75+28
	str	r3, [r2]
	b	.L74
.L62:
	ldr	r3, .L75
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L73
	ldr	r3, .L75
	ldr	r3, [r3]
	add	r3, r3, #7
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	movge	r3, r3
	asr	r3, r3, #3
	mov	r1, r3
	ldr	r0, .L75+8
	bl	writebytes
.L73:
	ldr	r3, .L75
	ldr	r3, [r3]
	add	r3, r3, #7
	add	r2, r3, #7
	cmp	r3, #0
	movlt	r3, r2
	movge	r3, r3
	asr	r3, r3, #3
	mov	r2, r3
	ldr	r3, .L75+20
	ldr	r3, [r3]
	add	r3, r2, r3
	ldr	r2, .L75+20
	str	r3, [r2]
	ldr	r3, .L75
	mov	r2, #0
	str	r2, [r3]
.L74:
	nop
	sub	sp, fp, #16
	@ sp needed
	pop	{r4, r5, r6, fp, lr}
	bx	lr
.L76:
	.align	2
.L75:
	.word	offset
	.word	n_bits
	.word	buf
	.word	rmask
	.word	lmask
	.word	bytes_out
	.word	free_ent
	.word	maxcode
	.word	clear_flg
	.word	maxbits
	.word	maxmaxcode
	.size	output, .-output
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
