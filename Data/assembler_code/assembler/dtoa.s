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
	.file	"libdtoa.c"
	.text
	.bss
	.align	3
private_mem:
	.space	2304
	.size	private_mem, 2304
	.data
	.align	2
	.type	pmem_next, %object
	.size	pmem_next, 4
pmem_next:
	.word	private_mem
	.bss
	.align	2
heap:
	.space	8192
	.size	heap, 8192
	.align	2
heap_ptr:
	.space	4
	.size	heap_ptr, 4
	.align	2
heap_end:
	.space	4
	.size	heap_end, 4
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	init_heap, %function
init_heap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L2
	ldr	r2, .L2+4
	str	r2, [r3]
	ldr	r3, .L2
	ldr	r3, [r3]
	add	r3, r3, #8192
	ldr	r2, .L2+8
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	heap_ptr
	.word	heap
	.word	heap_end
	.size	init_heap, .-init_heap
	.align	2
	.global	malloc_beebs
	.syntax unified
	.arm
	.fpu softvfp
	.type	malloc_beebs, %function
malloc_beebs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L8
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r2, r3
	ldr	r3, .L8+4
	ldr	r3, [r3]
	cmp	r2, r3
	bhi	.L5
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L6
.L5:
	mov	r3, #0
	b	.L7
.L6:
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L8
	str	r3, [r2]
	ldr	r3, [fp, #-8]
.L7:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L9:
	.align	2
.L8:
	.word	heap_ptr
	.word	heap_end
	.size	malloc_beebs, .-malloc_beebs
	.align	2
	.global	free_beebs
	.syntax unified
	.arm
	.fpu softvfp
	.type	free_beebs, %function
free_beebs:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	free_beebs, .-free_beebs
	.bss
	.align	2
freelist:
	.space	32
	.size	freelist, 32
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	Balloc, %function
Balloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #7
	bgt	.L12
	ldr	r2, .L17
	ldr	r3, [fp, #-24]
	ldr	r3, [r2, r3, lsl #2]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L12
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r1, .L17
	ldr	r3, [fp, #-24]
	str	r2, [r1, r3, lsl #2]
	b	.L13
.L12:
	mov	r2, #1
	ldr	r3, [fp, #-24]
	lsl	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #7
	lsl	r3, r3, #2
	sub	r3, r3, #1
	lsr	r3, r3, #3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-24]
	cmp	r3, #7
	bgt	.L14
	ldr	r3, .L17+4
	ldr	r3, [r3]
	ldr	r2, .L17+8
	sub	r3, r3, r2
	asr	r3, r3, #3
	mov	r2, r3
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	cmp	r3, #288
	bhi	.L14
	ldr	r3, .L17+4
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L17+4
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldr	r2, .L17+4
	str	r3, [r2]
	b	.L15
.L14:
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #3
	mov	r0, r3
	bl	malloc_beebs
	str	r0, [fp, #-8]
.L15:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
.L13:
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	freelist
	.word	pmem_next
	.word	private_mem
	.size	Balloc, .-Balloc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	Bfree, %function
Bfree:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L22
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	cmp	r3, #7
	ble	.L21
	ldr	r0, [fp, #-8]
	bl	free_beebs
	b	.L22
.L21:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, .L23
	ldr	r2, [r2, r3, lsl #2]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r1, .L23
	ldr	r2, [fp, #-8]
	str	r2, [r1, r3, lsl #2]
.L22:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	freelist
	.size	Bfree, .-Bfree
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	multadd, %function
multadd:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #72
	str	r0, [fp, #-72]
	str	r1, [fp, #-76]
	str	r2, [fp, #-80]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-72]
	add	r3, r3, #20
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-80]
	asr	r2, r3, #31
	str	r3, [fp, #-92]
	str	r2, [fp, #-88]
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
.L26:
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	mov	r2, #0
	mov	r8, r3
	mov	r9, r2
	ldr	r3, [fp, #-76]
	asr	r2, r3, #31
	mov	r6, r3
	mov	r7, r2
	mul	r2, r6, r9
	mul	r3, r8, r7
	add	r3, r2, r3
	umull	r4, r2, r8, r6
	mov	r5, r2
	add	r3, r3, r5
	mov	r5, r3
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	adds	r1, r2, r4
	str	r1, [fp, #-100]
	adc	r3, r3, r5
	str	r3, [fp, #-96]
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	mov	r2, r1
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	add	r2, r3, #4
	str	r2, [fp, #-36]
	ldr	r2, [fp, #-60]
	str	r2, [r3]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	blt	.L26
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	orrs	r3, r2, r3
	beq	.L27
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-48]
	cmp	r2, r3
	blt	.L28
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	mov	r0, r3
	bl	Balloc
	str	r0, [fp, #-64]
	ldr	r3, [fp, #-64]
	add	r0, r3, #12
	ldr	r3, [fp, #-72]
	add	r1, r3, #12
	ldr	r3, [fp, #-72]
	ldr	r3, [r3, #16]
	add	r3, r3, #2
	lsl	r3, r3, #2
	mov	r2, r3
	bl	memcpy
	ldr	r0, [fp, #-72]
	bl	Bfree
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-72]
.L28:
	ldr	r3, [fp, #-48]
	add	r2, r3, #1
	str	r2, [fp, #-48]
	ldr	r2, [fp, #-44]
	ldr	r1, [fp, #-72]
	add	r3, r3, #4
	lsl	r3, r3, #2
	add	r3, r1, r3
	str	r2, [r3, #4]
	ldr	r3, [fp, #-72]
	ldr	r2, [fp, #-48]
	str	r2, [r3, #16]
.L27:
	ldr	r3, [fp, #-72]
	mov	r0, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	multadd, .-multadd
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	s2b, %function
s2b:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-40]
	add	r3, r3, #8
	ldr	r2, .L39
	smull	r1, r2, r3, r2
	asr	r2, r2, #1
	asr	r3, r3, #31
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-16]
	mov	r3, #1
	str	r3, [fp, #-20]
	b	.L31
.L32:
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L31:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	bgt	.L32
	ldr	r0, [fp, #-16]
	bl	Balloc
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-44]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-8]
	mov	r2, #1
	str	r2, [r3, #16]
	mov	r3, #9
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-36]
	cmp	r3, #9
	ble	.L33
	ldr	r3, [fp, #-32]
	add	r3, r3, #9
	str	r3, [fp, #-32]
.L34:
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	str	r2, [fp, #-32]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	mov	r2, r3
	mov	r1, #10
	ldr	r0, [fp, #-8]
	bl	multadd
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	blt	.L34
	ldr	r3, [fp, #4]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	b	.L36
.L33:
	ldr	r3, [fp, #4]
	add	r3, r3, #9
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	b	.L36
.L37:
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	str	r2, [fp, #-32]
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #48
	mov	r2, r3
	mov	r1, #10
	ldr	r0, [fp, #-8]
	bl	multadd
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L36:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	blt	.L37
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	954437177
	.size	s2b, .-s2b
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	hi0bits, %function
hi0bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	cmp	r3, #0
	bne	.L42
	mov	r3, #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #16
	str	r3, [fp, #-16]
.L42:
	ldr	r3, [fp, #-16]
	and	r3, r3, #-16777216
	cmp	r3, #0
	bne	.L43
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #8
	str	r3, [fp, #-16]
.L43:
	ldr	r3, [fp, #-16]
	and	r3, r3, #-268435456
	cmp	r3, #0
	bne	.L44
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #4
	str	r3, [fp, #-16]
.L44:
	ldr	r3, [fp, #-16]
	and	r3, r3, #-1073741824
	cmp	r3, #0
	bne	.L45
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #2
	str	r3, [fp, #-16]
.L45:
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	blt	.L46
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-16]
	and	r3, r3, #1073741824
	cmp	r3, #0
	bne	.L46
	mov	r3, #32
	b	.L47
.L46:
	ldr	r3, [fp, #-8]
.L47:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	hi0bits, .-hi0bits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lo0bits, %function
lo0bits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	and	r3, r3, #7
	cmp	r3, #0
	beq	.L49
	ldr	r3, [fp, #-12]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L50
	mov	r3, #0
	b	.L51
.L50:
	ldr	r3, [fp, #-12]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L52
	ldr	r3, [fp, #-12]
	lsr	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	mov	r3, #1
	b	.L51
.L52:
	ldr	r3, [fp, #-12]
	lsr	r2, r3, #2
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	mov	r3, #2
	b	.L51
.L49:
	mov	r3, #0
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	cmp	r3, #0
	bne	.L53
	mov	r3, #16
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #16
	str	r3, [fp, #-12]
.L53:
	ldr	r3, [fp, #-12]
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L54
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #8
	str	r3, [fp, #-12]
.L54:
	ldr	r3, [fp, #-12]
	and	r3, r3, #15
	cmp	r3, #0
	bne	.L55
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #4
	str	r3, [fp, #-12]
.L55:
	ldr	r3, [fp, #-12]
	and	r3, r3, #3
	cmp	r3, #0
	bne	.L56
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #2
	str	r3, [fp, #-12]
.L56:
	ldr	r3, [fp, #-12]
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L57
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L57
	mov	r3, #32
	b	.L51
.L57:
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
.L51:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	lo0bits, .-lo0bits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	i2b, %function
i2b:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r0, #1
	bl	Balloc
	str	r0, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #20]
	ldr	r3, [fp, #-8]
	mov	r2, #1
	str	r2, [r3, #16]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	i2b, .-i2b
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	mult, %function
mult:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #104
	str	r0, [fp, #-104]
	str	r1, [fp, #-108]
	ldr	r3, [fp, #-104]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-108]
	ldr	r3, [r3, #16]
	cmp	r2, r3
	bge	.L61
	ldr	r3, [fp, #-104]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-108]
.L61:
	ldr	r3, [fp, #-104]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-104]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-108]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-104]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-36]
	cmp	r2, r3
	ble	.L62
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L62:
	ldr	r0, [fp, #-32]
	bl	Balloc
	str	r0, [fp, #-64]
	ldr	r3, [fp, #-64]
	add	r3, r3, #20
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-76]
	b	.L63
.L64:
	ldr	r3, [fp, #-40]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-40]
	add	r3, r3, #4
	str	r3, [fp, #-40]
.L63:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bcc	.L64
	ldr	r3, [fp, #-104]
	add	r3, r3, #20
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-68]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-76]
	add	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-108]
	add	r3, r3, #20
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-44]
	add	r3, r2, r3
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-64]
	add	r3, r3, #20
	str	r3, [fp, #-52]
	b	.L65
.L68:
	ldr	r3, [fp, #-44]
	add	r2, r3, #4
	str	r2, [fp, #-44]
	ldr	r3, [r3]
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	beq	.L66
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-48]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
.L67:
	ldr	r3, [fp, #-40]
	add	r2, r3, #4
	str	r2, [fp, #-40]
	ldr	r3, [r3]
	mov	r2, #0
	mov	r8, r3
	mov	r9, r2
	ldr	r3, [fp, #-88]
	mov	r2, #0
	str	r3, [fp, #-116]
	str	r2, [fp, #-112]
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	mov	r2, r0
	mul	r2, r9, r2
	mov	r3, r1
	mul	r3, r8, r3
	add	r3, r2, r3
	mov	r1, r0
	umull	r4, r2, r8, r1
	mov	r5, r2
	add	r3, r3, r5
	mov	r5, r3
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	mov	r2, #0
	str	r3, [fp, #-124]
	str	r2, [fp, #-120]
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	mov	r1, r2
	adds	r6, r4, r1
	adc	r7, r5, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	adds	r1, r2, r6
	str	r1, [fp, #-132]
	adc	r3, r3, r7
	str	r3, [fp, #-128]
	sub	r3, fp, #132
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-100]
	str	r3, [fp, #-96]
	sub	r3, fp, #100
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-60]
	str	r1, [fp, #-56]
	ldr	r2, [fp, #-48]
	add	r3, r2, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-100]
	str	r3, [r2]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	bcc	.L67
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-48]
	str	r2, [r3]
.L66:
	ldr	r3, [fp, #-52]
	add	r3, r3, #4
	str	r3, [fp, #-52]
.L65:
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	bcc	.L68
	ldr	r3, [fp, #-64]
	add	r3, r3, #20
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	str	r3, [fp, #-48]
	b	.L69
.L71:
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
.L69:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	ble	.L70
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L71
.L70:
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-64]
	mov	r0, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	mult, .-mult
	.bss
	.align	2
p5s:
	.space	4
	.size	p5s, 4
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pow5mult, %function
pow5mult:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-28]
	and	r3, r3, #3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L74
	ldr	r3, [fp, #-16]
	sub	r3, r3, #1
	ldr	r2, .L85
	ldr	r3, [r2, r3, lsl #2]
	mov	r2, #0
	mov	r1, r3
	ldr	r0, [fp, #-24]
	bl	multadd
	str	r0, [fp, #-24]
.L74:
	ldr	r3, [fp, #-28]
	asr	r3, r3, #2
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L75
	ldr	r3, [fp, #-24]
	b	.L76
.L75:
	ldr	r3, .L85+4
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L82
	ldr	r0, .L85+8
	bl	i2b
	mov	r3, r0
	ldr	r2, .L85+4
	str	r3, [r2]
	ldr	r3, .L85+4
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3]
.L82:
	ldr	r3, [fp, #-28]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L78
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-24]
	bl	mult
	str	r0, [fp, #-20]
	ldr	r0, [fp, #-24]
	bl	Bfree
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
.L78:
	ldr	r3, [fp, #-28]
	asr	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	beq	.L84
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L81
	ldr	r1, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	mult
	mov	r2, r0
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, #0
	str	r2, [r3]
.L81:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L82
.L84:
	nop
	ldr	r3, [fp, #-24]
.L76:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	p05.0
	.word	p5s
	.word	625
	.size	pow5mult, .-pow5mult
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	lshift, %function
lshift:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	ldr	r3, [fp, #-52]
	asr	r3, r3, #5
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-48]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #8]
	str	r3, [fp, #-8]
	b	.L88
.L89:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
.L88:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bgt	.L89
	ldr	r0, [fp, #-12]
	bl	Balloc
	str	r0, [fp, #-36]
	ldr	r3, [fp, #-36]
	add	r3, r3, #20
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L90
.L91:
	ldr	r3, [fp, #-24]
	add	r2, r3, #4
	str	r2, [fp, #-24]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L90:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	blt	.L91
	ldr	r3, [fp, #-48]
	add	r3, r3, #20
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3, #16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-52]
	and	r3, r3, #31
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L92
	ldr	r3, [fp, #-52]
	rsb	r3, r3, #32
	str	r3, [fp, #-12]
	mov	r3, #0
	str	r3, [fp, #-28]
.L93:
	ldr	r3, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-52]
	lsl	r1, r2, r3
	ldr	r3, [fp, #-24]
	add	r2, r3, #4
	str	r2, [fp, #-24]
	ldr	r2, [fp, #-28]
	orr	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r2, r3, #4
	str	r2, [fp, #-20]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsr	r3, r2, r3
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bcc	.L93
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L94
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	b	.L94
.L92:
	ldr	r2, [fp, #-20]
	add	r3, r2, #4
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r1, r3, #4
	str	r1, [fp, #-24]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r2, [fp, #-20]
	ldr	r3, [fp, #-40]
	cmp	r2, r3
	bcc	.L92
.L94:
	ldr	r3, [fp, #-16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-36]
	str	r2, [r3, #16]
	ldr	r0, [fp, #-48]
	bl	Bfree
	ldr	r3, [fp, #-36]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	lshift, .-lshift
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	cmp, %function
cmp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L97
	ldr	r3, [fp, #-16]
	b	.L98
.L97:
	ldr	r3, [fp, #-32]
	add	r3, r3, #20
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	add	r3, r3, #20
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-28]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L104:
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	sub	r3, r3, #4
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L99
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	cmp	r2, r3
	bcs	.L100
	mvn	r3, #0
	b	.L98
.L100:
	mov	r3, #1
	b	.L98
.L99:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bls	.L106
	b	.L104
.L106:
	nop
	mov	r3, #0
.L98:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	cmp, .-cmp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	diff, %function
diff:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 104
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #104
	str	r0, [fp, #-88]
	str	r1, [fp, #-92]
	ldr	r1, [fp, #-92]
	ldr	r0, [fp, #-88]
	bl	cmp
	str	r0, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L108
	mov	r0, #0
	bl	Balloc
	str	r0, [fp, #-64]
	ldr	r3, [fp, #-64]
	mov	r2, #1
	str	r2, [r3, #16]
	ldr	r3, [fp, #-64]
	mov	r2, #0
	str	r2, [r3, #20]
	ldr	r3, [fp, #-64]
	b	.L109
.L108:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bge	.L110
	ldr	r3, [fp, #-88]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-92]
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-92]
	mov	r3, #1
	str	r3, [fp, #-32]
	b	.L111
.L110:
	mov	r3, #0
	str	r3, [fp, #-32]
.L111:
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	Balloc
	str	r0, [fp, #-64]
	ldr	r2, [fp, #-64]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #12]
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-88]
	add	r3, r3, #20
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-36]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-40]
	add	r3, r3, r2
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-92]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-92]
	add	r3, r3, #20
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-72]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-44]
	add	r3, r3, r2
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-64]
	add	r3, r3, #20
	str	r3, [fp, #-48]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
.L112:
	ldr	r2, [fp, #-40]
	add	r3, r2, #4
	str	r3, [fp, #-40]
	ldr	r3, [r2]
	mov	r2, #0
	str	r3, [fp, #-100]
	str	r2, [fp, #-96]
	ldr	r2, [fp, #-44]
	add	r3, r2, #4
	str	r3, [fp, #-44]
	ldr	r3, [r2]
	mov	r2, #0
	str	r3, [fp, #-108]
	str	r2, [fp, #-104]
	sub	r1, fp, #100
	ldmia	r1, {r0-r1}
	mov	ip, r0
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	mov	lr, r2
	subs	r4, ip, lr
	sbc	r5, r1, r3
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	subs	r1, r4, r2
	str	r1, [fp, #-116]
	sbc	r3, r5, r3
	str	r3, [fp, #-112]
	sub	r3, fp, #116
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	and	r3, r0, #1
	str	r3, [fp, #-124]
	mov	r3, #0
	str	r3, [fp, #-120]
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-48]
	add	r3, r2, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-84]
	str	r3, [r2]
	ldr	r2, [fp, #-44]
	ldr	r3, [fp, #-76]
	cmp	r2, r3
	bcc	.L112
	b	.L113
.L114:
	ldr	r3, [fp, #-40]
	add	r2, r3, #4
	str	r2, [fp, #-40]
	ldr	r3, [r3]
	mov	r2, #0
	mov	r6, r3
	mov	r7, r2
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	subs	r8, r6, r2
	sbc	r9, r7, r3
	str	r8, [fp, #-84]
	str	r9, [fp, #-80]
	sub	r1, fp, #84
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	mov	r2, r1
	mov	r3, #0
	and	r3, r2, #1
	str	r3, [fp, #-132]
	mov	r3, #0
	str	r3, [fp, #-128]
	sub	r4, fp, #132
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	ldr	r3, [fp, #-48]
	add	r2, r3, #4
	str	r2, [fp, #-48]
	ldr	r2, [fp, #-84]
	str	r2, [r3]
.L113:
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	bcc	.L114
	b	.L115
.L116:
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-36]
.L115:
	ldr	r3, [fp, #-48]
	sub	r3, r3, #4
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L116
	ldr	r3, [fp, #-64]
	ldr	r2, [fp, #-36]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-64]
.L109:
	mov	r0, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	diff, .-diff
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ulp, %function
ulp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #4]
	ldr	r3, .L119
	and	r3, r3, r2
	sub	r3, r3, #7040
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-20]
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L120:
	.align	2
.L119:
	.word	32640
	.size	ulp, .-ulp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	b2d, %function
b2d:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-40]
	add	r3, r3, #20
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3, #16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r0, [fp, #-16]
	bl	hi0bits
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	rsb	r2, r3, #32
	ldr	r3, [fp, #-44]
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	cmp	r3, #7
	bgt	.L122
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #8
	ldr	r2, [fp, #-16]
	lsr	r3, r2, r3
	orr	r3, r3, #1073741824
	orr	r3, r3, #8388608
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L123
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	b	.L124
.L123:
	mov	r3, #0
.L124:
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-20]
	add	r3, r3, #24
	ldr	r2, [fp, #-16]
	lsl	r2, r2, r3
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #8
	ldr	r1, [fp, #-28]
	lsr	r3, r1, r3
	orr	r3, r2, r3
	str	r3, [fp, #-36]
	b	.L125
.L122:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L126
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	b	.L127
.L126:
	mov	r3, #0
.L127:
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	sub	r3, r3, #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L128
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-20]
	lsl	r2, r2, r3
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #32
	ldr	r1, [fp, #-24]
	lsr	r3, r1, r3
	orr	r3, r2, r3
	orr	r3, r3, #1073741824
	orr	r3, r3, #8388608
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bls	.L129
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	b	.L130
.L129:
	mov	r3, #0
.L130:
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	lsl	r2, r2, r3
	ldr	r3, [fp, #-20]
	rsb	r3, r3, #32
	ldr	r1, [fp, #-16]
	lsr	r3, r1, r3
	orr	r3, r2, r3
	str	r3, [fp, #-36]
	b	.L125
.L128:
	ldr	r3, [fp, #-16]
	orr	r3, r3, #1073741824
	orr	r3, r3, #8388608
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-36]
.L125:
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	b2d, .-b2d
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	d2b, %function
d2b:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	str	r2, [fp, #-40]
	mov	r0, #1
	bl	Balloc
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #20
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	bic	r3, r3, #-16777216
	bic	r3, r3, #8388608
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	bic	r2, r3, #-2147483648
	ldr	r3, [fp, #-32]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #4]
	lsr	r3, r3, #23
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	orr	r3, r3, #8388608
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L133
	sub	r3, fp, #24
	mov	r0, r3
	bl	lo0bits
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L134
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #32
	lsl	r2, r2, r3
	ldr	r3, [fp, #-24]
	orr	r2, r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	lsr	r3, r2, r3
	str	r3, [fp, #-28]
	b	.L135
.L134:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
.L135:
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L136
	mov	r2, #2
	b	.L137
.L136:
	mov	r2, #1
.L137:
	ldr	r3, [fp, #-12]
	str	r2, [r3, #16]
	b	.L138
.L133:
	sub	r3, fp, #28
	mov	r0, r3
	bl	lo0bits
	str	r0, [fp, #-8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	mov	r2, #1
	str	r2, [r3, #16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #32
	str	r3, [fp, #-8]
.L138:
	ldr	r3, [fp, #-20]
	sub	r2, r3, #184
	ldr	r3, [fp, #-8]
	add	r2, r2, r3
	ldr	r3, [fp, #-36]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	rsb	r2, r3, #56
	ldr	r3, [fp, #-40]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	d2b, .-d2b
	.global	__aeabi_ddiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	ratio, %function
ratio:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	sub	r3, fp, #32
	mov	r1, r3
	ldr	r0, [fp, #-40]
	bl	b2d
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	sub	r3, fp, #36
	mov	r1, r3
	ldr	r0, [fp, #-44]
	bl	b2d
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-36]
	sub	r2, r2, r3
	ldr	r3, [fp, #-40]
	ldr	r1, [r3, #16]
	ldr	r3, [fp, #-44]
	ldr	r3, [r3, #16]
	sub	r3, r1, r3
	lsl	r3, r3, #5
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	ble	.L141
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #7
	add	r3, r2, r3
	str	r3, [fp, #-16]
	b	.L142
.L141:
	ldr	r3, [fp, #-8]
	rsb	r3, r3, #0
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #7
	add	r3, r2, r3
	str	r3, [fp, #-24]
.L142:
	sub	r1, fp, #20
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	ratio, .-ratio
	.section	.rodata
	.align	3
	.type	tens, %object
	.size	tens, 184
tens:
	.word	0
	.word	1072693248
	.word	0
	.word	1076101120
	.word	0
	.word	1079574528
	.word	0
	.word	1083129856
	.word	0
	.word	1086556160
	.word	0
	.word	1090021888
	.word	0
	.word	1093567616
	.word	0
	.word	1097011920
	.word	0
	.word	1100470148
	.word	0
	.word	1104006501
	.word	536870912
	.word	1107468383
	.word	-402653184
	.word	1110919286
	.word	-1577058304
	.word	1114446484
	.word	-448790528
	.word	1117925532
	.word	512753664
	.word	1121369284
	.word	640942080
	.word	1124887541
	.word	937459712
	.word	1128383353
	.word	-2049400832
	.word	1131820119
	.word	1733216256
	.word	1135329645
	.word	1620131072
	.word	1138841828
	.word	2025163840
	.word	1142271773
	.word	-689770672
	.word	1145772772
	.word	105764242
	.word	1149300943
	.align	3
	.type	bigtens, %object
	.size	bigtens, 16
bigtens:
	.word	937459712
	.word	1128383353
	.word	-1257935337
	.word	1184086197
	.align	3
	.type	tinytens, %object
	.size	tinytens, 16
tinytens:
	.word	-1747416644
	.word	1016910514
	.word	-710367437
	.word	961148451
	.data
	.align	2
	.type	hexdig, %object
	.size	hexdig, 256
hexdig:
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\020\021\022\023"
	.ascii	"\024\025\026\027\030\031\000\000\000\000\000\000\000"
	.ascii	"\032\033\034\035\036\037\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\032\033\034\035\036\037\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	increment, %function
increment:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	add	r3, r3, #20
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-12]
.L147:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	cmn	r3, #1
	beq	.L145
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	b	.L146
.L145:
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	str	r2, [fp, #-8]
	mov	r2, #0
	str	r2, [r3]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcc	.L147
	ldr	r3, [fp, #-24]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #8]
	cmp	r2, r3
	blt	.L148
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #4]
	add	r3, r3, #1
	mov	r0, r3
	bl	Balloc
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r0, r3, #12
	ldr	r3, [fp, #-24]
	add	r1, r3, #12
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	add	r3, r3, #2
	lsl	r3, r3, #2
	mov	r2, r3
	bl	memcpy
	ldr	r0, [fp, #-24]
	bl	Bfree
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-24]
.L148:
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #16]
	add	r1, r3, #1
	ldr	r2, [fp, #-24]
	str	r1, [r2, #16]
	ldr	r2, [fp, #-24]
	add	r3, r3, #4
	lsl	r3, r3, #2
	add	r3, r2, r3
	mov	r2, #1
	str	r2, [r3, #4]
	ldr	r3, [fp, #-24]
.L146:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	increment, .-increment
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	rshift, %function
rshift:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	add	r3, r3, #20
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	asr	r3, r3, #5
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	ldr	r2, [fp, #-20]
	cmp	r2, r3
	bge	.L150
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-20]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-36]
	and	r3, r3, #31
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L154
	ldr	r3, [fp, #-36]
	rsb	r3, r3, #32
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	str	r2, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsr	r3, r2, r3
	str	r3, [fp, #-16]
	b	.L152
.L153:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-20]
	lsl	r1, r2, r3
	ldr	r3, [fp, #-12]
	add	r2, r3, #4
	str	r2, [fp, #-12]
	ldr	r2, [fp, #-16]
	orr	r2, r1, r2
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r2, r3, #4
	str	r2, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-36]
	lsr	r3, r2, r3
	str	r3, [fp, #-16]
.L152:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bcc	.L153
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-16]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L150
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	str	r3, [fp, #-12]
	b	.L150
.L155:
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
.L154:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bcc	.L155
.L150:
	ldr	r3, [fp, #-32]
	add	r3, r3, #20
	ldr	r2, [fp, #-12]
	sub	r3, r2, r3
	asr	r3, r3, #2
	mov	r2, r3
	ldr	r3, [fp, #-32]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	bne	.L157
	ldr	r3, [fp, #-32]
	mov	r2, #0
	str	r2, [r3, #20]
.L157:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	rshift, .-rshift
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	any_on, %function
any_on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	str	r1, [fp, #-36]
	ldr	r3, [fp, #-32]
	add	r3, r3, #20
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-32]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-36]
	asr	r3, r3, #5
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	ble	.L159
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	b	.L160
.L159:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-16]
	cmp	r2, r3
	bge	.L160
	ldr	r3, [fp, #-36]
	and	r3, r3, #31
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	beq	.L160
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	lsr	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	lsl	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	cmp	r2, r3
	beq	.L160
	mov	r3, #1
	b	.L161
.L160:
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-12]
	add	r3, r2, r3
	str	r3, [fp, #-12]
	b	.L162
.L163:
	ldr	r3, [fp, #-12]
	sub	r3, r3, #4
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L162
	mov	r3, #1
	b	.L161
.L162:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bhi	.L163
	mov	r3, #0
.L161:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	any_on, .-any_on
	.align	2
	.global	gethex
	.syntax unified
	.arm
	.fpu softvfp
	.type	gethex, %function
gethex:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 96
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #100
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	str	r2, [fp, #-104]
	str	r3, [fp, #-108]
	mov	r3, #0
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-96]
	ldr	r3, [r3]
	add	r3, r3, #2
	str	r3, [fp, #-24]
	b	.L165
.L166:
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-68]
.L165:
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L166
	ldr	r3, [fp, #-68]
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-20]
	mov	r3, #0
	str	r3, [fp, #-88]
	mov	r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L167
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-68]
	b	.L175
.L167:
	mov	r3, #1
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L230
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L231
	b	.L172
.L173:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L172:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L173
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L174
	mov	r3, #0
	str	r3, [fp, #-88]
.L174:
	mov	r3, #1
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-24]
	b	.L175
.L176:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L175:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L176
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L177
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L177
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-20]
	b	.L178
.L179:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L178:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L179
.L177:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L232
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	lsl	r3, r3, #2
	rsb	r3, r3, #0
	str	r3, [fp, #-36]
	b	.L170
.L230:
	nop
	b	.L170
.L231:
	nop
	b	.L170
.L232:
	nop
.L170:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-64]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #80
	beq	.L180
	cmp	r3, #112
	bne	.L181
.L180:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #43
	beq	.L182
	cmp	r3, #45
	bne	.L183
	mov	r3, #1
	str	r3, [fp, #-64]
.L182:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L183:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	beq	.L184
	ldr	r3, [fp, #-76]
	cmp	r3, #25
	ble	.L185
.L184:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-28]
	b	.L181
.L185:
	ldr	r3, [fp, #-76]
	sub	r3, r3, #16
	str	r3, [fp, #-40]
	b	.L186
.L189:
	ldr	r3, [fp, #-40]
	and	r3, r3, #-134217728
	cmp	r3, #0
	beq	.L187
	mov	r3, #1
	str	r3, [fp, #-56]
.L187:
	ldr	r2, [fp, #-40]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	sub	r3, r3, #16
	str	r3, [fp, #-40]
.L186:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	beq	.L188
	ldr	r3, [fp, #-76]
	cmp	r3, #25
	ble	.L189
.L188:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L190
	ldr	r3, [fp, #-40]
	rsb	r3, r3, #0
	str	r3, [fp, #-40]
.L190:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	add	r3, r2, r3
	str	r3, [fp, #-36]
.L181:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-28]
	str	r2, [r3]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bne	.L191
	ldr	r3, [fp, #-24]
	sub	r2, r3, #1
	ldr	r3, [fp, #-96]
	str	r2, [r3]
.L191:
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	bne	.L233
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L194
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	bne	.L234
	ldr	r3, [fp, #-104]
	cmp	r3, #3
	beq	.L197
	ldr	r3, [fp, #-104]
	cmp	r3, #3
	bgt	.L198
	ldr	r3, [fp, #-104]
	cmp	r3, #1
	beq	.L235
	ldr	r3, [fp, #-104]
	cmp	r3, #2
	bne	.L198
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	bne	.L236
	b	.L201
.L197:
	ldr	r3, [fp, #-108]
	cmp	r3, #0
	bne	.L237
	b	.L198
.L236:
	nop
.L198:
	ldr	r3, [fp, #-100]
	ldr	r2, .L240+4
	str	r2, [r3, #4]
	ldr	r3, [fp, #-100]
	mvn	r2, #0
	str	r2, [r3]
	b	.L164
.L194:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	sub	r3, r2, r3
	sub	r3, r3, #1
	str	r3, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L205
.L206:
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-76]
	asr	r3, r3, #1
	str	r3, [fp, #-76]
.L205:
	ldr	r3, [fp, #-76]
	cmp	r3, #7
	bgt	.L206
	ldr	r0, [fp, #-72]
	bl	Balloc
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-76]
	mov	r3, #0
	str	r3, [fp, #-44]
	b	.L207
.L210:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #46
	bne	.L208
	b	.L207
.L208:
	ldr	r3, [fp, #-76]
	cmp	r3, #32
	bne	.L209
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-44]
	str	r2, [r3]
	mov	r3, #0
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-76]
.L209:
	ldr	r3, [fp, #-32]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L240
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	and	r2, r3, #15
	ldr	r3, [fp, #-76]
	lsl	r3, r2, r3
	mov	r2, r3
	ldr	r3, [fp, #-44]
	orr	r3, r3, r2
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-76]
	add	r3, r3, #4
	str	r3, [fp, #-76]
.L207:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bhi	.L210
	ldr	r3, [fp, #-52]
	add	r2, r3, #4
	str	r2, [fp, #-52]
	ldr	r2, [fp, #-44]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	ldr	r2, [fp, #-52]
	sub	r3, r2, r3
	asr	r3, r3, #2
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-76]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-76]
	lsl	r4, r3, #5
	ldr	r0, [fp, #-44]
	bl	hi0bits
	mov	r3, r0
	sub	r3, r4, r3
	str	r3, [fp, #-76]
	mov	r3, #56
	str	r3, [fp, #-80]
	mov	r3, #0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	ble	.L211
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	sub	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r1, [fp, #-76]
	ldr	r0, [fp, #-16]
	bl	any_on
	mov	r3, r0
	cmp	r3, #0
	beq	.L212
	mov	r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-76]
	sub	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-72]
	asr	r3, r3, #5
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-72]
	and	r2, r2, #31
	mov	r1, #1
	lsl	r2, r1, r2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L212
	mov	r3, #2
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	ble	.L212
	ldr	r1, [fp, #-72]
	ldr	r0, [fp, #-16]
	bl	any_on
	mov	r3, r0
	cmp	r3, #0
	beq	.L212
	mov	r3, #3
	str	r3, [fp, #-48]
.L212:
	ldr	r1, [fp, #-76]
	ldr	r0, [fp, #-16]
	bl	rshift
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-76]
	add	r3, r2, r3
	str	r3, [fp, #-36]
	b	.L213
.L211:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	bge	.L213
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-76]
	sub	r3, r2, r3
	str	r3, [fp, #-76]
	ldr	r1, [fp, #-76]
	ldr	r0, [fp, #-16]
	bl	lshift
	str	r0, [fp, #-16]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-76]
	sub	r3, r2, r3
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	str	r3, [fp, #-52]
.L213:
	ldr	r3, [fp, #-36]
	cmp	r3, #126
	ble	.L214
	nop
	b	.L215
.L239:
	nop
.L215:
	ldr	r0, [fp, #-16]
	bl	Bfree
	b	.L201
.L235:
	nop
	b	.L201
.L237:
	nop
.L201:
	bl	__errno
	mov	r3, r0
	mov	r2, #34
	str	r2, [r3]
	ldr	r3, [fp, #-100]
	ldr	r2, .L240+8
	str	r2, [r3, #4]
	ldr	r3, [fp, #-100]
	mov	r2, #0
	str	r2, [r3]
	b	.L164
.L214:
	mov	r3, #0
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-36]
	cmn	r3, #185
	bge	.L216
	mov	r3, #1
	str	r3, [fp, #-60]
	ldr	r2, [fp, #-36]
	mvn	r3, #184
	sub	r3, r3, r2
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-80]
	cmp	r2, r3
	blt	.L217
	ldr	r0, [fp, #-16]
	bl	Bfree
	b	.L196
.L234:
	nop
.L196:
	bl	__errno
	mov	r3, r0
	mov	r2, #34
	str	r2, [r3]
	b	.L193
.L233:
	nop
.L193:
	ldr	r1, [fp, #-100]
	mov	r2, #0
	mov	r3, #0
	stm	r1, {r2-r3}
	b	.L164
.L217:
	ldr	r3, [fp, #-76]
	sub	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L218
	mov	r3, #1
	str	r3, [fp, #-48]
	b	.L219
.L218:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	ble	.L219
	ldr	r1, [fp, #-72]
	ldr	r0, [fp, #-16]
	bl	any_on
	str	r0, [fp, #-48]
.L219:
	ldr	r3, [fp, #-72]
	asr	r3, r3, #5
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3]
	ldr	r2, [fp, #-72]
	and	r2, r2, #31
	mov	r1, #1
	lsl	r2, r1, r2
	and	r3, r3, r2
	cmp	r3, #0
	beq	.L220
	ldr	r3, [fp, #-48]
	orr	r3, r3, #2
	str	r3, [fp, #-48]
.L220:
	ldr	r2, [fp, #-80]
	ldr	r3, [fp, #-76]
	sub	r3, r2, r3
	str	r3, [fp, #-80]
	ldr	r1, [fp, #-76]
	ldr	r0, [fp, #-16]
	bl	rshift
	mvn	r3, #184
	str	r3, [fp, #-36]
.L216:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	beq	.L221
	mov	r3, #0
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-104]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L222
.L224:
	.word	.L222
	.word	.L226
	.word	.L225
	.word	.L223
.L226:
	ldr	r3, [fp, #-48]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L238
	ldr	r3, [fp, #-52]
	ldr	r2, [r3]
	ldr	r3, [fp, #-48]
	orr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L238
	mov	r3, #1
	str	r3, [fp, #-84]
	b	.L238
.L225:
	ldr	r3, [fp, #-108]
	rsb	r3, r3, #1
	str	r3, [fp, #-84]
	b	.L222
.L223:
	ldr	r3, [fp, #-108]
	str	r3, [fp, #-84]
	b	.L222
.L238:
	nop
.L222:
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	beq	.L221
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-72]
	ldr	r0, [fp, #-16]
	bl	increment
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #20
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bne	.L221
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	ldr	r2, [fp, #-72]
	cmp	r2, r3
	blt	.L229
	ldr	r3, [fp, #-80]
	and	r3, r3, #31
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	beq	.L221
	ldr	r3, [fp, #-72]
	sub	r3, r3, #-1073741823
	lsl	r3, r3, #2
	ldr	r2, [fp, #-52]
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r0, r3
	bl	hi0bits
	mov	r2, r0
	ldr	r3, [fp, #-76]
	rsb	r3, r3, #32
	cmp	r2, r3
	bge	.L221
.L229:
	mov	r1, #1
	ldr	r0, [fp, #-16]
	bl	rshift
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	cmp	r3, #126
	bgt	.L239
.L221:
	ldr	r0, [fp, #-16]
	bl	Bfree
.L164:
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L241:
	.align	2
.L240:
	.word	hexdig
	.word	-49025
	.word	32640
	.size	gethex, .-gethex
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	dshift, %function
dshift:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	sub	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r3, #4
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	hi0bits
	mov	r3, r0
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	ble	.L243
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	sub	r3, r2, r3
	str	r3, [fp, #-8]
.L243:
	ldr	r3, [fp, #-8]
	and	r3, r3, #31
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	dshift, .-dshift
	.global	__aeabi_uidiv
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	quorem, %function
quorem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 176
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #176
	str	r0, [fp, #-96]
	str	r1, [fp, #-100]
	ldr	r3, [fp, #-100]
	ldr	r3, [r3, #16]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-96]
	ldr	r2, [r3, #16]
	ldr	r3, [fp, #-32]
	cmp	r3, r2
	ble	.L246
	mov	r3, #0
	b	.L247
.L246:
	ldr	r3, [fp, #-100]
	add	r3, r3, #20
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-32]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-48]
	add	r3, r3, r2
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-96]
	add	r3, r3, #20
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	lsl	r2, r3, #2
	ldr	r3, [fp, #-36]
	add	r3, r3, r2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r2, [r3]
	ldr	r3, [fp, #-72]
	ldr	r3, [r3]
	add	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidiv
	mov	r3, r0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	beq	.L248
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
.L249:
	ldr	r2, [fp, #-48]
	add	r3, r2, #4
	str	r3, [fp, #-48]
	ldr	r3, [r2]
	mov	r2, #0
	str	r3, [fp, #-116]
	str	r2, [fp, #-112]
	ldr	r3, [fp, #-44]
	mov	r2, #0
	str	r3, [fp, #-108]
	str	r2, [fp, #-104]
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	mov	r2, r1
	ldr	r3, [fp, #-108]
	mul	r2, r3, r2
	ldr	r3, [fp, #-104]
	mov	ip, r0
	mul	r3, ip, r3
	add	r3, r2, r3
	mov	r1, r0
	ldr	r0, [fp, #-108]
	umull	r6, r2, r1, r0
	mov	r7, r2
	add	r3, r3, r7
	mov	r7, r3
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	adds	r1, r2, r6
	str	r1, [fp, #-164]
	adc	r3, r3, r7
	str	r3, [fp, #-160]
	sub	r3, fp, #164
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-84]
	str	r3, [fp, #-80]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	mov	r2, #0
	str	r3, [fp, #-124]
	str	r2, [fp, #-120]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	mov	r8, r2
	mov	r9, #0
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	mov	r1, r2
	subs	r4, r1, r8
	sbc	r5, r3, r9
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	subs	r1, r4, r2
	str	r1, [fp, #-172]
	sbc	r3, r5, r3
	str	r3, [fp, #-168]
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-92]
	str	r3, [fp, #-88]
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	and	r3, r0, #1
	str	r3, [fp, #-180]
	mov	r3, #0
	str	r3, [fp, #-176]
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r2, [fp, #-36]
	add	r3, r2, #4
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-92]
	str	r3, [r2]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-72]
	cmp	r2, r3
	bls	.L249
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L248
	ldr	r3, [fp, #-96]
	add	r3, r3, #20
	str	r3, [fp, #-36]
	b	.L250
.L252:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L250:
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bls	.L251
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L252
.L251:
	ldr	r2, [fp, #-96]
	ldr	r3, [fp, #-32]
	str	r3, [r2, #16]
.L248:
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-96]
	bl	cmp
	mov	r3, r0
	cmp	r3, #0
	blt	.L253
	ldr	r3, [fp, #-44]
	add	r3, r3, #1
	str	r3, [fp, #-44]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-96]
	add	r3, r3, #20
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-100]
	add	r3, r3, #20
	str	r3, [fp, #-48]
.L254:
	ldr	r2, [fp, #-48]
	add	r3, r2, #4
	str	r3, [fp, #-48]
	ldr	r3, [r2]
	mov	r2, #0
	str	r3, [fp, #-132]
	str	r2, [fp, #-128]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	sub	r1, fp, #132
	ldmia	r1, {r0-r1}
	mov	ip, r0
	adds	ip, r2, ip
	str	ip, [fp, #-188]
	adc	r3, r3, r1
	str	r3, [fp, #-184]
	sub	r4, fp, #188
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-84]
	str	r4, [fp, #-80]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	ldr	r3, [fp, #-36]
	ldr	r3, [r3]
	mov	r2, #0
	str	r3, [fp, #-140]
	str	r2, [fp, #-136]
	sub	r3, fp, #84
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-148]
	mov	ip, #0
	str	ip, [fp, #-144]
	sub	r2, fp, #140
	ldmia	r2, {r1-r2}
	mov	r0, r1
	sub	r4, fp, #148
	ldmia	r4, {r3-r4}
	mov	lr, r3
	subs	r0, r0, lr
	str	r0, [fp, #-156]
	mov	r3, r4
	sbc	r3, r2, r3
	str	r3, [fp, #-152]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	sub	r1, fp, #156
	ldmia	r1, {r0-r1}
	mov	lr, r0
	subs	lr, lr, r2
	str	lr, [fp, #-196]
	sbc	r3, r1, r3
	str	r3, [fp, #-192]
	sub	r4, fp, #196
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-92]
	str	r4, [fp, #-88]
	sub	r3, fp, #92
	ldmia	r3, {r2-r3}
	mov	r0, #0
	mov	r1, #0
	mov	r0, r3
	mov	r1, #0
	and	r3, r0, #1
	str	r3, [fp, #-204]
	str	ip, [fp, #-200]
	sub	r4, fp, #204
	ldmia	r4, {r3-r4}
	str	r3, [fp, #-60]
	str	r4, [fp, #-56]
	ldr	r2, [fp, #-36]
	add	r3, r2, #4
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-92]
	str	r3, [r2]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-72]
	cmp	r2, r3
	bls	.L254
	ldr	r3, [fp, #-96]
	add	r3, r3, #20
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	ldr	r2, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L253
	b	.L255
.L257:
	ldr	r3, [fp, #-32]
	sub	r3, r3, #1
	str	r3, [fp, #-32]
.L255:
	ldr	r3, [fp, #-40]
	sub	r3, r3, #4
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-36]
	cmp	r2, r3
	bls	.L256
	ldr	r3, [fp, #-40]
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L257
.L256:
	ldr	r3, [fp, #-96]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #16]
.L253:
	ldr	r3, [fp, #-44]
.L247:
	mov	r0, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	quorem, .-quorem
	.global	__aeabi_ui2d
	.global	__aeabi_dmul
	.global	__aeabi_dadd
	.global	__aeabi_dcmpeq
	.global	__aeabi_dcmple
	.global	__aeabi_dcmplt
	.global	__aeabi_d2iz
	.global	__aeabi_i2d
	.global	__aeabi_dsub
	.global	__aeabi_dcmpgt
	.align	2
	.global	strtod
	.syntax unified
	.arm
	.fpu softvfp
	.type	strtod, %function
strtod:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 240
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, fp, lr}
	add	fp, sp, #28
	sub	sp, sp, #248
	str	r0, [fp, #-256]
	str	r1, [fp, #-260]
	sub	r3, fp, #204
	mov	r2, #8
	mov	r1, #0
	mov	r0, r3
	bl	memset
	mov	r3, #0
	str	r3, [fp, #-208]
	ldr	r3, [fp, #-208]
	str	r3, [fp, #-240]
	ldr	r3, [fp, #-240]
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-88]
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	str	r3, [fp, #-100]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	ldr	r3, [fp, #-256]
	str	r3, [fp, #-176]
.L267:
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #45
	ldrls	pc, [pc, r3, asl #2]
	b	.L399
.L261:
	.word	.L400
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L263
	.word	.L263
	.word	.L263
	.word	.L263
	.word	.L263
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L263
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L399
	.word	.L262
	.word	.L399
	.word	.L260
.L260:
	mov	r3, #1
	str	r3, [fp, #-100]
.L262:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L400
	b	.L265
.L263:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	b	.L267
.L399:
	nop
.L265:
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	bne	.L268
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #88
	beq	.L269
	cmp	r3, #120
	bne	.L270
.L269:
	sub	r1, fp, #196
	sub	r0, fp, #176
	ldr	r3, [fp, #-100]
	mov	r2, #1
	bl	gethex
	b	.L271
.L270:
	mov	r3, #1
	str	r3, [fp, #-92]
	nop
.L272:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L272
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L401
.L268:
	ldr	r3, [fp, #-176]
	str	r3, [fp, #-104]
	mov	r3, #0
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-136]
	str	r3, [fp, #-132]
	mov	r3, #0
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-84]
	str	r3, [fp, #-76]
	b	.L273
.L277:
	ldr	r3, [fp, #-76]
	cmp	r3, #8
	bgt	.L274
	ldr	r2, [fp, #-132]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	sub	r3, r3, #48
	str	r3, [fp, #-132]
	b	.L275
.L274:
	ldr	r3, [fp, #-76]
	cmp	r3, #16
	bgt	.L275
	ldr	r2, [fp, #-136]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	sub	r3, r3, #48
	str	r3, [fp, #-136]
.L275:
	ldr	r3, [fp, #-76]
	add	r3, r3, #1
	str	r3, [fp, #-76]
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
.L273:
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #47
	ble	.L276
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	ble	.L277
.L276:
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-80]
	ldr	r2, [fp, #-176]
	ldr	r3, [fp, #-104]
	sub	r3, r2, r3
	str	r3, [fp, #-244]
	ldr	r3, [fp, #-244]
	str	r3, [fp, #-248]
	ldr	r3, [fp, #-176]
	str	r3, [fp, #-108]
	b	.L278
.L280:
	ldr	r3, [fp, #-96]
	add	r3, r3, #1
	str	r3, [fp, #-96]
.L278:
	ldr	r2, [fp, #-108]
	ldr	r3, [fp, #-104]
	cmp	r2, r3
	bls	.L279
	ldr	r3, [fp, #-108]
	sub	r3, r3, #1
	str	r3, [fp, #-108]
	ldr	r3, [fp, #-108]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L280
.L279:
	ldr	r3, [fp, #-52]
	cmp	r3, #46
	bne	.L402
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r2, [fp, #-176]
	ldr	r3, [fp, #-104]
	sub	r3, r2, r3
	str	r3, [fp, #-244]
	ldr	r2, [fp, #-244]
	ldr	r3, [fp, #-248]
	sub	r3, r2, r3
	str	r3, [fp, #-240]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	bne	.L287
	b	.L283
.L284:
	ldr	r3, [fp, #-88]
	add	r3, r3, #1
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
.L283:
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L284
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	ble	.L403
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L403
	ldr	r3, [fp, #-176]
	ldr	r2, [fp, #-104]
	sub	r3, r2, r3
	str	r3, [fp, #-248]
	ldr	r2, [fp, #-248]
	ldr	r3, [fp, #-240]
	add	r3, r2, r3
	str	r3, [fp, #-244]
	ldr	r3, [fp, #-176]
	str	r3, [fp, #-104]
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-88]
	add	r3, r2, r3
	str	r3, [fp, #-84]
	mov	r3, #0
	str	r3, [fp, #-88]
	nop
	b	.L286
.L404:
	nop
.L286:
	ldr	r3, [fp, #-88]
	add	r3, r3, #1
	str	r3, [fp, #-88]
	ldr	r3, [fp, #-52]
	sub	r3, r3, #48
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L288
	ldr	r2, [fp, #-84]
	ldr	r3, [fp, #-88]
	add	r3, r2, r3
	str	r3, [fp, #-84]
	mov	r3, #1
	str	r3, [fp, #-68]
	b	.L289
.L292:
	ldr	r3, [fp, #-76]
	add	r2, r3, #1
	str	r2, [fp, #-76]
	cmp	r3, #8
	bgt	.L290
	ldr	r2, [fp, #-132]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-132]
	b	.L291
.L290:
	ldr	r3, [fp, #-76]
	cmp	r3, #17
	bgt	.L291
	ldr	r2, [fp, #-136]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [fp, #-136]
.L291:
	ldr	r3, [fp, #-68]
	add	r3, r3, #1
	str	r3, [fp, #-68]
.L289:
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-88]
	cmp	r2, r3
	blt	.L292
	ldr	r3, [fp, #-76]
	add	r2, r3, #1
	str	r2, [fp, #-76]
	cmp	r3, #8
	bgt	.L293
	ldr	r2, [fp, #-132]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	str	r3, [fp, #-132]
	b	.L294
.L293:
	ldr	r3, [fp, #-76]
	cmp	r3, #17
	bgt	.L294
	ldr	r2, [fp, #-136]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	str	r3, [fp, #-136]
.L294:
	mov	r3, #0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-88]
.L288:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
.L287:
	ldr	r3, [fp, #-52]
	cmp	r3, #47
	ble	.L402
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	ble	.L404
.L402:
	nop
	b	.L281
.L403:
	nop
.L281:
	mov	r3, #0
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-52]
	cmp	r3, #101
	beq	.L295
	ldr	r3, [fp, #-52]
	cmp	r3, #69
	bne	.L296
.L295:
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	bne	.L297
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	bne	.L297
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	beq	.L405
.L297:
	ldr	r3, [fp, #-176]
	str	r3, [fp, #-256]
	mov	r3, #0
	str	r3, [fp, #-64]
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #43
	beq	.L298
	ldr	r3, [fp, #-52]
	cmp	r3, #45
	bne	.L299
	mov	r3, #1
	str	r3, [fp, #-64]
.L298:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
.L299:
	ldr	r3, [fp, #-52]
	cmp	r3, #47
	ble	.L300
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L300
	b	.L301
.L302:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
.L301:
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	beq	.L302
	ldr	r3, [fp, #-52]
	cmp	r3, #48
	ble	.L303
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	bgt	.L303
	ldr	r3, [fp, #-52]
	sub	r3, r3, #48
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-176]
	str	r3, [fp, #-108]
	b	.L304
.L306:
	ldr	r2, [fp, #-128]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	mov	r2, r3
	ldr	r3, [fp, #-52]
	add	r3, r2, r3
	sub	r3, r3, #48
	str	r3, [fp, #-128]
.L304:
	ldr	r3, [fp, #-176]
	add	r3, r3, #1
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	ldrb	r3, [r3]	@ zero_extendqisi2
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #47
	ble	.L305
	ldr	r3, [fp, #-52]
	cmp	r3, #57
	ble	.L306
.L305:
	ldr	r2, [fp, #-176]
	ldr	r3, [fp, #-108]
	sub	r3, r2, r3
	cmp	r3, #8
	bgt	.L307
	ldr	r3, [fp, #-128]
	ldr	r2, .L419+24
	cmp	r3, r2
	ble	.L308
.L307:
	ldr	r3, .L419+24
	str	r3, [fp, #-56]
	b	.L309
.L308:
	ldr	r3, [fp, #-128]
	str	r3, [fp, #-56]
.L309:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L311
	ldr	r3, [fp, #-56]
	rsb	r3, r3, #0
	str	r3, [fp, #-56]
	b	.L311
.L303:
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L296
.L311:
	b	.L296
.L300:
	ldr	r3, [fp, #-256]
	str	r3, [fp, #-176]
.L296:
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	bne	.L312
	ldr	r3, [fp, #-88]
	cmp	r3, #0
	bne	.L406
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	bne	.L406
	b	.L266
.L400:
	nop
	b	.L266
.L405:
	nop
.L266:
	ldr	r3, [fp, #-256]
	str	r3, [fp, #-176]
	mov	r3, #0
	str	r3, [fp, #-100]
	b	.L406
.L312:
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-84]
	sub	r3, r2, r3
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	str	r3, [fp, #-232]
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	bne	.L314
	ldr	r3, [fp, #-76]
	str	r3, [fp, #-80]
.L314:
	ldr	r3, [fp, #-76]
	cmp	r3, #17
	movlt	r3, r3
	movge	r3, #17
	str	r3, [fp, #-160]
	ldr	r0, [fp, #-132]
	bl	__aeabi_ui2d
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	ldr	r3, [fp, #-160]
	cmp	r3, #9
	ble	.L315
	ldr	r3, [fp, #-160]
	sub	r3, r3, #9
	ldr	r2, .L419+28
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	sub	r3, fp, #196
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-268]
	str	r3, [fp, #-264]
	ldr	r0, [fp, #-136]
	bl	__aeabi_ui2d
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #268
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
.L315:
	mov	r3, #0
	str	r3, [fp, #-148]
	ldr	r3, [fp, #-76]
	cmp	r3, #15
	bgt	.L316
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	beq	.L407
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ble	.L318
	ldr	r3, [fp, #-56]
	cmp	r3, #24
	bgt	.L319
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+28
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	b	.L271
.L319:
	ldr	r3, [fp, #-76]
	rsb	r3, r3, #15
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	add	r3, r3, #24
	ldr	r2, [fp, #-56]
	cmp	r2, r3
	bgt	.L316
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-68]
	sub	r3, r2, r3
	str	r3, [fp, #-56]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+28
	ldr	r3, [fp, #-68]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+28
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	b	.L271
.L318:
	ldr	r3, [fp, #-56]
	cmn	r3, #24
	blt	.L316
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-56]
	rsb	r3, r3, #0
	ldr	r2, .L419+28
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	b	.L271
.L316:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-160]
	sub	r3, r2, r3
	ldr	r2, [fp, #-60]
	add	r3, r2, r3
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	ble	.L320
	ldr	r3, [fp, #-60]
	and	r3, r3, #15
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	beq	.L321
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+28
	ldr	r3, [fp, #-68]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
.L321:
	ldr	r3, [fp, #-60]
	bic	r3, r3, #15
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L322
	ldr	r3, [fp, #-60]
	cmp	r3, #308
	ble	.L323
	nop
	b	.L324
.L408:
	nop
	b	.L324
.L412:
	nop
	b	.L324
.L415:
	nop
.L324:
	ldr	r3, .L419+32
	str	r3, [fp, #-192]
	mvn	r3, #0
	str	r3, [fp, #-196]
.L325:
	ldr	r3, [fp, #-148]
	cmp	r3, #0
	beq	.L326
	ldr	r0, [fp, #-140]
	bl	Bfree
	ldr	r0, [fp, #-144]
	bl	Bfree
	ldr	r0, [fp, #-152]
	bl	Bfree
	ldr	r0, [fp, #-148]
	bl	Bfree
	ldr	r0, [fp, #-156]
	bl	Bfree
.L326:
	bl	__errno
	mov	r3, r0
	mov	r2, #34
	str	r2, [r3]
	b	.L271
.L323:
	ldr	r3, [fp, #-60]
	asr	r3, r3, #4
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L327
.L329:
	ldr	r3, [fp, #-60]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L328
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+36
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
.L328:
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-60]
	asr	r3, r3, #1
	str	r3, [fp, #-60]
.L327:
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bgt	.L329
	ldr	r3, [fp, #-192]
	sub	r3, r3, #7168
	str	r3, [fp, #-192]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+36
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-136]
	ldr	r2, .L419+44
	cmp	r3, r2
	bhi	.L408
	ldr	r3, [fp, #-136]
	cmp	r3, #140288
	bls	.L331
	ldr	r3, .L419+32
	str	r3, [fp, #-192]
	mvn	r3, #0
	str	r3, [fp, #-196]
	b	.L322
.L331:
	ldr	r3, [fp, #-192]
	add	r3, r3, #7168
	str	r3, [fp, #-192]
	b	.L322
.L320:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	bge	.L322
	ldr	r3, [fp, #-60]
	rsb	r3, r3, #0
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	and	r3, r3, #15
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	beq	.L332
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+28
	ldr	r3, [fp, #-68]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
.L332:
	ldr	r3, [fp, #-60]
	asr	r3, r3, #4
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L322
	ldr	r3, [fp, #-60]
	cmp	r3, #3
	bgt	.L409
	mov	r3, #0
	str	r3, [fp, #-72]
	b	.L335
.L337:
	ldr	r3, [fp, #-60]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L336
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+48
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
.L336:
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-60]
	asr	r3, r3, #1
	str	r3, [fp, #-60]
.L335:
	ldr	r3, [fp, #-60]
	cmp	r3, #1
	bgt	.L337
	sub	r3, fp, #196
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-204]
	str	r3, [fp, #-200]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+48
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L322
	sub	r1, fp, #204
	ldmia	r1, {r0-r1}
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	ldr	r2, .L419+48
	ldr	r3, [fp, #-72]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L396
	b	.L334
.L409:
	nop
	b	.L334
.L413:
	nop
	b	.L334
.L416:
	nop
.L334:
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	b	.L325
.L396:
	mov	r3, #128
	str	r3, [fp, #-192]
	mov	r3, #0
	str	r3, [fp, #-196]
.L322:
	ldr	r2, [fp, #-76]
	ldr	r3, [fp, #-96]
	sub	r3, r2, r3
	str	r3, [fp, #-224]
	ldr	r3, [fp, #-240]
	str	r3, [sp]
	ldr	r3, [fp, #-132]
	ldr	r2, [fp, #-76]
	ldr	r1, [fp, #-80]
	ldr	r0, [fp, #-104]
	bl	s2b
	str	r0, [fp, #-148]
.L388:
	ldr	r3, [fp, #-148]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	Balloc
	str	r0, [fp, #-144]
	ldr	r3, [fp, #-144]
	add	r0, r3, #12
	ldr	r3, [fp, #-148]
	add	r1, r3, #12
	ldr	r3, [fp, #-148]
	ldr	r3, [r3, #16]
	add	r3, r3, #2
	lsl	r3, r3, #2
	mov	r2, r3
	bl	memcpy
	sub	r2, fp, #172
	sub	r1, fp, #168
	sub	r3, fp, #196
	mov	r0, r3
	bl	d2b
	str	r0, [fp, #-140]
	mov	r0, #1
	bl	i2b
	str	r0, [fp, #-152]
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	blt	.L341
	mov	r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
	b	.L342
.L341:
	ldr	r3, [fp, #-56]
	rsb	r3, r3, #0
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-40]
.L342:
	ldr	r3, [fp, #-168]
	cmp	r3, #0
	blt	.L343
	ldr	r3, [fp, #-168]
	ldr	r2, [fp, #-32]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	b	.L344
.L343:
	ldr	r3, [fp, #-168]
	ldr	r2, [fp, #-40]
	sub	r3, r2, r3
	str	r3, [fp, #-40]
.L344:
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-172]
	rsb	r3, r3, #57
	str	r3, [fp, #-72]
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-72]
	add	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-32]
	cmp	r2, r3
	movlt	r3, r2
	movge	r3, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-48]
	cmp	r2, r3
	ble	.L345
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-68]
.L345:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	ble	.L346
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-68]
	sub	r3, r2, r3
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-68]
	sub	r3, r2, r3
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-68]
	sub	r3, r2, r3
	str	r3, [fp, #-48]
.L346:
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	ble	.L347
	ldr	r1, [fp, #-36]
	ldr	r0, [fp, #-152]
	bl	pow5mult
	str	r0, [fp, #-152]
	ldr	r1, [fp, #-140]
	ldr	r0, [fp, #-152]
	bl	mult
	str	r0, [fp, #-164]
	ldr	r0, [fp, #-140]
	bl	Bfree
	ldr	r3, [fp, #-164]
	str	r3, [fp, #-140]
.L347:
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	ble	.L348
	ldr	r1, [fp, #-32]
	ldr	r0, [fp, #-140]
	bl	lshift
	str	r0, [fp, #-140]
.L348:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	ble	.L349
	ldr	r1, [fp, #-44]
	ldr	r0, [fp, #-144]
	bl	pow5mult
	str	r0, [fp, #-144]
.L349:
	ldr	r3, [fp, #-40]
	cmp	r3, #0
	ble	.L350
	ldr	r1, [fp, #-40]
	ldr	r0, [fp, #-144]
	bl	lshift
	str	r0, [fp, #-144]
.L350:
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ble	.L351
	ldr	r1, [fp, #-48]
	ldr	r0, [fp, #-152]
	bl	lshift
	str	r0, [fp, #-152]
.L351:
	ldr	r1, [fp, #-144]
	ldr	r0, [fp, #-140]
	bl	diff
	str	r0, [fp, #-156]
	ldr	r3, [fp, #-156]
	ldr	r3, [r3, #12]
	str	r3, [fp, #-236]
	ldr	r3, [fp, #-156]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-156]
	bl	cmp
	str	r0, [fp, #-68]
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bge	.L352
	ldr	r3, [fp, #-236]
	cmp	r3, #0
	bne	.L353
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	bne	.L353
	ldr	r3, [fp, #-192]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	cmp	r3, #0
	bne	.L353
	ldr	r3, [fp, #-156]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L354
	ldr	r3, [fp, #-156]
	ldr	r3, [r3, #16]
	cmp	r3, #1
	ble	.L410
.L354:
	mov	r1, #1
	ldr	r0, [fp, #-156]
	bl	lshift
	str	r0, [fp, #-156]
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-156]
	bl	cmp
	mov	r3, r0
	cmp	r3, #0
	ble	.L411
	b	.L356
.L352:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	bne	.L357
	ldr	r3, [fp, #-236]
	cmp	r3, #0
	beq	.L358
	ldr	r3, [fp, #-192]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	ldr	r2, .L419+52
	cmp	r3, r2
	bne	.L359
	ldr	r3, [fp, #-196]
	cmn	r3, #1
	bne	.L359
	ldr	r3, [fp, #-192]
	ldr	r2, .L419+32
	cmp	r3, r2
	bne	.L360
	ldr	r3, [fp, #-196]
	cmn	r3, #1
	beq	.L412
.L360:
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	add	r3, r3, #128
	str	r3, [fp, #-192]
	mov	r3, #0
	str	r3, [fp, #-196]
	b	.L353
.L358:
	ldr	r3, [fp, #-192]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	cmp	r3, #0
	bne	.L359
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	bne	.L359
	nop
.L356:
	ldr	r3, [fp, #-192]
	mov	r2, r3
	ldr	r3, .L419+40
	and	r3, r3, r2
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	cmp	r3, #128
	bhi	.L361
	ldr	r3, [fp, #-224]
	ldr	r2, [fp, #-76]
	cmp	r2, r3
	bge	.L413
	mov	r3, #1
	str	r3, [fp, #-208]
	b	.L353
.L361:
	ldr	r3, [fp, #-128]
	sub	r3, r3, #128
	str	r3, [fp, #-128]
	ldr	r2, [fp, #-128]
	ldr	r3, .L419+52
	orr	r3, r2, r3
	str	r3, [fp, #-192]
	mvn	r3, #0
	str	r3, [fp, #-196]
	b	.L353
.L359:
	ldr	r3, [fp, #-236]
	cmp	r3, #0
	beq	.L414
	sub	r3, fp, #196
	mov	r0, r3
	bl	ulp
	sub	r3, fp, #196
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	b	.L414
.L357:
	ldr	r1, [fp, #-152]
	ldr	r0, [fp, #-156]
	bl	ratio
	str	r0, [fp, #-116]
	str	r1, [fp, #-112]
	mov	r2, #0
	mov	r3, #1073741824
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	beq	.L397
	ldr	r3, [fp, #-236]
	cmp	r3, #0
	beq	.L366
	mov	r2, #0
	ldr	r3, .L419+56
	str	r2, [fp, #-124]
	str	r3, [fp, #-120]
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	b	.L373
.L366:
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	bne	.L368
	ldr	r3, [fp, #-192]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	cmp	r3, #0
	beq	.L369
.L368:
	mov	r2, #0
	ldr	r3, .L419+56
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	mov	r2, #0
	ldr	r3, .L419+60
	str	r2, [fp, #-124]
	str	r3, [fp, #-120]
	b	.L373
.L369:
	mov	r2, #0
	ldr	r3, .L419+56
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L398
	mov	r2, #0
	ldr	r3, .L419+64
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	b	.L372
.L398:
	mov	r2, #0
	ldr	r3, .L419+64
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
.L372:
	ldr	r8, [fp, #-116]
	ldr	r3, [fp, #-112]
	eor	r9, r3, #-2147483648
	str	r8, [fp, #-124]
	str	r9, [fp, #-120]
	b	.L373
.L397:
	mov	r2, #0
	ldr	r3, .L419+64
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-236]
	cmp	r3, #0
	bne	.L374
	ldr	r4, [fp, #-116]
	ldr	r3, [fp, #-112]
	eor	r5, r3, #-2147483648
	b	.L375
.L374:
	sub	r5, fp, #116
	ldmia	r5, {r4-r5}
.L375:
	str	r4, [fp, #-124]
	str	r5, [fp, #-120]
.L373:
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	str	r3, [fp, #-132]
	ldr	r3, [fp, #-132]
	cmp	r3, #147456
	bne	.L376
	sub	r3, fp, #196
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-204]
	str	r3, [fp, #-200]
	ldr	r3, [fp, #-192]
	sub	r3, r3, #7168
	str	r3, [fp, #-192]
	sub	r3, fp, #196
	mov	r0, r3
	bl	ulp
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-188]
	str	r3, [fp, #-184]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	sub	r3, fp, #188
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	ldr	r2, .L419+68
	cmp	r3, r2
	bls	.L377
	ldr	r3, [fp, #-200]
	ldr	r2, .L419+32
	cmp	r3, r2
	bne	.L378
	ldr	r3, [fp, #-204]
	cmn	r3, #1
	beq	.L415
.L378:
	ldr	r3, .L419+32
	str	r3, [fp, #-192]
	mvn	r3, #0
	str	r3, [fp, #-196]
	b	.L379
.L377:
	ldr	r3, [fp, #-192]
	add	r3, r3, #7168
	str	r3, [fp, #-192]
	b	.L380
.L376:
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	cmp	r3, #7168
	bhi	.L381
	sub	r3, fp, #196
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-204]
	str	r3, [fp, #-200]
	ldr	r3, [fp, #-192]
	add	r3, r3, #7168
	str	r3, [fp, #-192]
	sub	r3, fp, #196
	mov	r0, r3
	bl	ulp
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-188]
	str	r3, [fp, #-184]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	sub	r3, fp, #188
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	cmp	r3, #7168
	bhi	.L382
	ldr	r3, [fp, #-200]
	cmp	r3, #128
	bne	.L383
	ldr	r3, [fp, #-204]
	cmp	r3, #0
	bne	.L383
	ldr	r3, [fp, #-224]
	ldr	r2, [fp, #-76]
	cmp	r2, r3
	bge	.L416
	mov	r3, #1
	str	r3, [fp, #-208]
	b	.L353
.L383:
	mov	r3, #128
	str	r3, [fp, #-192]
	mov	r3, #0
	str	r3, [fp, #-196]
	b	.L379
.L382:
	ldr	r3, [fp, #-192]
	sub	r3, r3, #7168
	str	r3, [fp, #-192]
	b	.L380
.L381:
	sub	r3, fp, #196
	mov	r0, r3
	bl	ulp
	sub	r3, fp, #124
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-188]
	str	r3, [fp, #-184]
	sub	r1, fp, #196
	ldmia	r1, {r0-r1}
	sub	r3, fp, #188
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-196]
	str	r3, [fp, #-192]
.L380:
	ldr	r2, [fp, #-192]
	ldr	r3, .L419+40
	and	r3, r3, r2
	str	r3, [fp, #-136]
	ldr	r3, [fp, #-224]
	ldr	r2, [fp, #-76]
	cmp	r2, r3
	bne	.L417
	ldr	r2, [fp, #-132]
	ldr	r3, [fp, #-136]
	cmp	r2, r3
	bne	.L417
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-128]
	ldr	r0, [fp, #-128]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-116]
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-236]
	cmp	r3, #0
	bne	.L385
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	bne	.L385
	ldr	r3, [fp, #-192]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	cmp	r3, #0
	beq	.L386
.L385:
	adr	r3, .L419
	ldmia	r3, {r2-r3}
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L353
	adr	r3, .L419+8
	ldmia	r3, {r2-r3}
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L353
	b	.L379
.L386:
	adr	r3, .L419+16
	ldmia	r3, {r2-r3}
	sub	r1, fp, #116
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L418
	b	.L379
.L420:
	.align	3
.L419:
	.word	-1801439851
	.word	1071644671
	.word	900719925
	.word	1071644672
	.word	-1801439851
	.word	1070596095
	.word	19999
	.word	tens
	.word	-49025
	.word	bigtens
	.word	32640
	.word	140416
	.word	tinytens
	.word	-65409
	.word	1072693248
	.word	-1074790400
	.word	1071644672
	.word	140415
.L417:
	nop
.L379:
	ldr	r0, [fp, #-140]
	bl	Bfree
	ldr	r0, [fp, #-144]
	bl	Bfree
	ldr	r0, [fp, #-152]
	bl	Bfree
	ldr	r0, [fp, #-156]
	bl	Bfree
	b	.L388
.L410:
	nop
	b	.L353
.L411:
	nop
	b	.L353
.L414:
	nop
	b	.L353
.L418:
	nop
.L353:
	ldr	r0, [fp, #-140]
	bl	Bfree
	ldr	r0, [fp, #-144]
	bl	Bfree
	ldr	r0, [fp, #-152]
	bl	Bfree
	ldr	r0, [fp, #-148]
	bl	Bfree
	ldr	r0, [fp, #-156]
	bl	Bfree
	b	.L271
.L401:
	nop
	b	.L271
.L406:
	nop
	b	.L271
.L407:
	nop
.L271:
	ldr	r3, [fp, #-260]
	cmp	r3, #0
	beq	.L389
	ldr	r2, [fp, #-176]
	ldr	r3, [fp, #-260]
	str	r2, [r3]
.L389:
	ldr	r3, [fp, #-100]
	cmp	r3, #0
	beq	.L390
	sub	r3, fp, #196
	ldmia	r3, {r2-r3}
	mov	r6, r2
	eor	r7, r3, #-2147483648
	b	.L392
.L390:
	sub	r7, fp, #196
	ldmia	r7, {r6-r7}
.L392:
	mov	r2, r6
	mov	r3, r7
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, fp, lr}
	bx	lr
	.size	strtod, .-strtod
	.bss
	.align	2
dtoa_result:
	.space	4
	.size	dtoa_result, 4
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	rv_alloc, %function
rv_alloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	mov	r3, #4
	str	r3, [fp, #-8]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L422
.L423:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
.L422:
	ldr	r3, [fp, #-8]
	add	r2, r3, #16
	ldr	r3, [fp, #-24]
	cmp	r2, r3
	bls	.L423
	ldr	r0, [fp, #-12]
	bl	Balloc
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	ldr	r2, .L425
	str	r3, [r2]
	ldr	r3, .L425
	ldr	r3, [r3]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L426:
	.align	2
.L425:
	.word	dtoa_result
	.size	rv_alloc, .-rv_alloc
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	nrv_alloc, %function
nrv_alloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r0, [fp, #-24]
	bl	rv_alloc
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	b	.L428
.L429:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L428:
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	str	r2, [fp, #-16]
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-8]
	strb	r2, [r3]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L429
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	beq	.L430
	ldr	r3, [fp, #-20]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
.L430:
	ldr	r3, [fp, #-12]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	nrv_alloc, .-nrv_alloc
	.align	2
	.global	freedtoa
	.syntax unified
	.arm
	.fpu softvfp
	.type	freedtoa, %function
freedtoa:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	mov	r2, #1
	lsl	r2, r2, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #8]
	ldr	r0, [fp, #-8]
	bl	Bfree
	ldr	r3, .L435
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bne	.L434
	ldr	r3, .L435
	mov	r2, #0
	str	r2, [r3]
.L434:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L436:
	.align	2
.L435:
	.word	dtoa_result
	.size	freedtoa, .-freedtoa
	.section	.rodata
	.align	2
.LC0:
	.ascii	"0\000"
	.text
	.align	2
	.global	dtoa
	.syntax unified
	.arm
	.fpu softvfp
	.type	dtoa, %function
dtoa:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 176
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #176
	str	r0, [fp, #-188]
	str	r1, [fp, #-184]
	str	r2, [fp, #-192]
	str	r3, [fp, #-196]
	ldr	r3, .L591+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L438
	ldr	r3, .L591+32
	ldr	r3, [r3]
	mov	r0, r3
	bl	freedtoa
	ldr	r3, .L591+32
	mov	r2, #0
	str	r2, [r3]
.L438:
	sub	r3, fp, #188
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-176]
	and	r3, r3, #32768
	cmp	r3, #0
	beq	.L439
	ldr	r3, [fp, #8]
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-176]
	bic	r3, r3, #32768
	str	r3, [fp, #-176]
	b	.L440
.L439:
	ldr	r3, [fp, #8]
	mov	r2, #0
	str	r2, [r3]
.L440:
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L571
	ldr	r3, [fp, #4]
	mov	r2, #1
	str	r2, [r3]
	mov	r2, #1
	ldr	r1, [fp, #12]
	ldr	r0, .L591+36
	bl	nrv_alloc
	mov	r3, r0
	b	.L563
.L571:
	sub	r2, fp, #148
	sub	r1, fp, #152
	sub	r3, fp, #180
	mov	r0, r3
	bl	d2b
	str	r0, [fp, #-88]
	ldr	r3, [fp, #-176]
	lsr	r3, r3, #7
	and	r3, r3, #255
	str	r3, [fp, #-36]
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-164]
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-160]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-160]
	orr	r3, r3, #16384
	orr	r3, r3, #128
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #129
	str	r3, [fp, #-36]
	sub	r1, fp, #164
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+40
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adr	r3, .L591
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adr	r3, .L591+8
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r0, [fp, #-36]
	bl	__aeabi_i2d
	adr	r3, .L591+16
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-56]
	mov	r2, #0
	mov	r3, #0
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L444
	ldr	r0, [fp, #-56]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L444
	ldr	r3, [fp, #-56]
	sub	r3, r3, #1
	str	r3, [fp, #-56]
.L444:
	mov	r3, #1
	str	r3, [fp, #-60]
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	blt	.L447
	ldr	r3, [fp, #-56]
	cmp	r3, #24
	bgt	.L447
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	ldr	r2, .L591+60
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L448
	ldr	r3, [fp, #-56]
	sub	r3, r3, #1
	str	r3, [fp, #-56]
.L448:
	mov	r3, #0
	str	r3, [fp, #-60]
.L447:
	ldr	r2, [fp, #-148]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	sub	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	blt	.L450
	mov	r3, #0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-52]
	str	r3, [fp, #-72]
	b	.L451
.L450:
	ldr	r3, [fp, #-52]
	rsb	r3, r3, #0
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-72]
.L451:
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	blt	.L452
	mov	r3, #0
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-76]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	b	.L453
.L452:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-56]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-56]
	rsb	r3, r3, #0
	str	r3, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-76]
.L453:
	ldr	r3, [fp, #-192]
	cmp	r3, #0
	blt	.L454
	ldr	r3, [fp, #-192]
	cmp	r3, #9
	ble	.L455
.L454:
	mov	r3, #0
	str	r3, [fp, #-192]
.L455:
	mov	r3, #1
	str	r3, [fp, #-84]
	ldr	r3, [fp, #-192]
	cmp	r3, #5
	ble	.L456
	ldr	r3, [fp, #-192]
	sub	r3, r3, #4
	str	r3, [fp, #-192]
	mov	r3, #0
	str	r3, [fp, #-84]
.L456:
	mov	r3, #1
	str	r3, [fp, #-64]
	mvn	r3, #0
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-192]
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L457
.L459:
	.word	.L463
	.word	.L463
	.word	.L462
	.word	.L461
	.word	.L460
	.word	.L458
.L463:
	mov	r3, #18
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-196]
	b	.L457
.L462:
	mov	r3, #0
	str	r3, [fp, #-64]
.L460:
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	bgt	.L464
	mov	r3, #1
	str	r3, [fp, #-196]
.L464:
	ldr	r3, [fp, #-196]
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	b	.L457
.L461:
	mov	r3, #0
	str	r3, [fp, #-64]
.L458:
	ldr	r2, [fp, #-196]
	ldr	r3, [fp, #-56]
	add	r3, r2, r3
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-36]
	sub	r3, r3, #1
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-36]
	cmp	r3, #0
	bgt	.L457
	mov	r3, #1
	str	r3, [fp, #-36]
.L457:
	ldr	r0, [fp, #-36]
	bl	rv_alloc
	str	r0, [fp, #-116]
	ldr	r3, [fp, #-116]
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	blt	.L465
	ldr	r3, [fp, #-44]
	cmp	r3, #15
	bgt	.L465
	ldr	r3, [fp, #-84]
	cmp	r3, #0
	beq	.L465
	mov	r3, #0
	str	r3, [fp, #-36]
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-164]
	str	r3, [fp, #-160]
	ldr	r3, [fp, #-56]
	str	r3, [fp, #-120]
	ldr	r3, [fp, #-44]
	str	r3, [fp, #-124]
	mov	r3, #2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-56]
	cmp	r3, #0
	ble	.L466
	ldr	r3, [fp, #-56]
	and	r3, r3, #15
	ldr	r2, .L591+60
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-56]
	asr	r3, r3, #4
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	and	r3, r3, #2
	cmp	r3, #0
	beq	.L468
	ldr	r3, [fp, #-52]
	and	r3, r3, #1
	str	r3, [fp, #-52]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	adr	r3, .L591+24
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	b	.L468
.L592:
	.align	3
.L591:
	.word	1668236129
	.word	1070761895
	.word	-1956591437
	.word	1069976104
	.word	1352628731
	.word	1070810131
	.word	-1257935337
	.word	1184086197
	.word	dtoa_result
	.word	.LC0
	.word	1073217536
	.word	bigtens
	.word	1075576832
	.word	1072693248
	.word	1071644672
	.word	tens
	.word	1075052544
	.word	1076101120
.L470:
	ldr	r3, [fp, #-52]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L469
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	ldr	r2, .L591+44
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
.L469:
	ldr	r3, [fp, #-52]
	asr	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L468:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L470
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	b	.L471
.L466:
	ldr	r3, [fp, #-56]
	rsb	r3, r3, #0
	str	r3, [fp, #-128]
	ldr	r3, [fp, #-128]
	cmp	r3, #0
	beq	.L471
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-128]
	and	r3, r3, #15
	ldr	r2, .L591+60
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-128]
	asr	r3, r3, #4
	str	r3, [fp, #-52]
	b	.L472
.L474:
	ldr	r3, [fp, #-52]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L473
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	ldr	r2, .L591+44
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
.L473:
	ldr	r3, [fp, #-52]
	asr	r3, r3, #1
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L472:
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L474
.L471:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L475
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+52
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	beq	.L475
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	ble	.L475
	ldr	r3, [fp, #-48]
	cmp	r3, #0
	ble	.L572
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-56]
	sub	r3, r3, #1
	str	r3, [fp, #-56]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+68
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L475:
	ldr	r0, [fp, #-40]
	bl	__aeabi_i2d
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	ldr	r3, .L591+48
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-172]
	str	r3, [fp, #-168]
	ldr	r3, [fp, #-168]
	sub	r3, r3, #7040
	str	r3, [fp, #-168]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bne	.L479
	mov	r3, #0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-100]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+64
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L573
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	mov	r4, r2
	eor	r5, r3, #-2147483648
	mov	r2, r4
	mov	r3, r5
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L574
	b	.L478
.L479:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L486
	ldr	r3, [fp, #-44]
	sub	r3, r3, #1
	ldr	r2, .L591+60
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	mov	r0, #0
	ldr	r1, .L591+56
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-172]
	str	r3, [fp, #-168]
	mov	r3, #0
	str	r3, [fp, #-36]
.L495:
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-132]
	sub	r5, fp, #180
	ldmia	r5, {r4-r5}
	ldr	r0, [fp, #-132]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-132]
	and	r2, r3, #255
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	str	r1, [fp, #-112]
	add	r2, r2, #48
	and	r2, r2, #255
	strb	r2, [r3]
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	mov	r0, #0
	ldr	r1, .L591+52
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L575
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L576
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bge	.L577
	sub	r1, fp, #172
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+68
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-172]
	str	r3, [fp, #-168]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+68
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	b	.L495
.L486:
	sub	r1, fp, #172
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-44]
	sub	r3, r3, #1
	ldr	r2, .L591+60
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-172]
	str	r3, [fp, #-168]
	mov	r3, #1
	str	r3, [fp, #-36]
.L504:
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-132]
	sub	r5, fp, #180
	ldmia	r5, {r4-r5}
	ldr	r0, [fp, #-132]
	bl	__aeabi_i2d
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	beq	.L496
	ldr	r3, [fp, #-36]
	str	r3, [fp, #-44]
.L496:
	ldr	r3, [fp, #-132]
	and	r2, r3, #255
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	str	r1, [fp, #-112]
	add	r2, r2, #48
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bne	.L498
	sub	r5, fp, #180
	ldmia	r5, {r4-r5}
	sub	r1, fp, #172
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+56
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmpgt
	mov	r3, r0
	cmp	r3, #0
	bne	.L578
	sub	r5, fp, #180
	ldmia	r5, {r4-r5}
	sub	r3, fp, #172
	ldmia	r3, {r2-r3}
	mov	r0, #0
	ldr	r1, .L591+56
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmplt
	mov	r3, r0
	cmp	r3, #0
	bne	.L503
	b	.L478
.L503:
	ldr	r3, [fp, #-112]
	sub	r3, r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L503
	ldr	r3, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-112]
	b	.L492
.L498:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+68
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	b	.L504
.L572:
	nop
	b	.L478
.L577:
	nop
.L478:
	ldr	r3, [fp, #-116]
	str	r3, [fp, #-112]
	sub	r3, fp, #164
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-120]
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-124]
	str	r3, [fp, #-44]
.L465:
	ldr	r3, [fp, #-152]
	cmp	r3, #0
	blt	.L505
	ldr	r3, [fp, #-56]
	cmp	r3, #15
	bgt	.L505
	ldr	r2, .L591+60
	ldr	r3, [fp, #-56]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	str	r2, [fp, #-108]
	str	r3, [fp, #-104]
	ldr	r3, [fp, #-196]
	cmp	r3, #0
	bge	.L506
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bgt	.L506
	mov	r3, #0
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-100]
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	blt	.L579
	sub	r5, fp, #180
	ldmia	r5, {r4-r5}
	mov	r2, #0
	ldr	r3, .L591+64
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	bne	.L579
	b	.L482
.L506:
	mov	r3, #1
	str	r3, [fp, #-36]
.L519:
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	str	r3, [fp, #-132]
	sub	r5, fp, #180
	ldmia	r5, {r4-r5}
	ldr	r0, [fp, #-132]
	bl	__aeabi_i2d
	sub	r3, fp, #108
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	ldr	r3, [fp, #-132]
	and	r2, r3, #255
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	str	r1, [fp, #-112]
	add	r2, r2, #48
	and	r2, r2, #255
	strb	r2, [r3]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	mov	r3, #0
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L580
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bne	.L513
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, r0
	mov	r3, r1
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	sub	r3, fp, #180
	ldmia	r3, {r2-r3}
	sub	r1, fp, #108
	ldmia	r1, {r0-r1}
	bl	__aeabi_dcmple
	mov	r3, r0
	cmp	r3, #0
	bne	.L581
	b	.L512
.L575:
	nop
	b	.L516
.L578:
	nop
	b	.L516
.L581:
	nop
.L489:
	b	.L516
.L518:
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-116]
	cmp	r2, r3
	bne	.L516
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-112]
	mov	r2, #48
	strb	r2, [r3]
	b	.L517
.L516:
	ldr	r3, [fp, #-112]
	sub	r3, r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	beq	.L518
.L517:
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r2, r2, #1
	and	r2, r2, #255
	strb	r2, [r3]
	b	.L512
.L513:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	sub	r1, fp, #180
	ldmia	r1, {r0-r1}
	mov	r2, #0
	ldr	r3, .L591+68
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-180]
	str	r3, [fp, #-176]
	b	.L519
.L580:
	nop
.L512:
	b	.L492
.L505:
	ldr	r3, [fp, #-24]
	str	r3, [fp, #-68]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-136]
	mov	r3, #0
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-92]
	str	r3, [fp, #-96]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L520
	ldr	r3, [fp, #-148]
	rsb	r3, r3, #57
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	mov	r0, #1
	bl	i2b
	str	r0, [fp, #-96]
.L520:
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	ble	.L521
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	ble	.L521
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-68]
	cmp	r2, r3
	movlt	r3, r2
	movge	r3, r3
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-36]
	sub	r3, r2, r3
	str	r3, [fp, #-72]
.L521:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	ble	.L522
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L523
	ldr	r3, [fp, #-136]
	cmp	r3, #0
	ble	.L524
	ldr	r1, [fp, #-136]
	ldr	r0, [fp, #-96]
	bl	pow5mult
	str	r0, [fp, #-96]
	ldr	r1, [fp, #-88]
	ldr	r0, [fp, #-96]
	bl	mult
	str	r0, [fp, #-140]
	ldr	r0, [fp, #-88]
	bl	Bfree
	ldr	r3, [fp, #-140]
	str	r3, [fp, #-88]
.L524:
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-136]
	sub	r3, r2, r3
	str	r3, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	beq	.L522
	ldr	r1, [fp, #-52]
	ldr	r0, [fp, #-88]
	bl	pow5mult
	str	r0, [fp, #-88]
	b	.L522
.L523:
	ldr	r1, [fp, #-28]
	ldr	r0, [fp, #-88]
	bl	pow5mult
	str	r0, [fp, #-88]
.L522:
	mov	r0, #1
	bl	i2b
	str	r0, [fp, #-100]
	ldr	r3, [fp, #-76]
	cmp	r3, #0
	ble	.L525
	ldr	r1, [fp, #-76]
	ldr	r0, [fp, #-100]
	bl	pow5mult
	str	r0, [fp, #-100]
.L525:
	mov	r3, #0
	str	r3, [fp, #-80]
	ldr	r3, [fp, #-192]
	cmp	r3, #1
	ble	.L526
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L527
.L526:
	ldr	r3, [fp, #-180]
	cmp	r3, #0
	bne	.L527
	ldr	r3, [fp, #-176]
	bic	r3, r3, #65280
	bic	r3, r3, #128
	cmp	r3, #0
	bne	.L527
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-72]
	add	r3, r3, #1
	str	r3, [fp, #-72]
	mov	r3, #1
	str	r3, [fp, #-80]
.L527:
	ldr	r1, [fp, #-72]
	ldr	r0, [fp, #-100]
	bl	dshift
	str	r0, [fp, #-36]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-24]
	ldr	r2, [fp, #-68]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-68]
	ldr	r2, [fp, #-72]
	ldr	r3, [fp, #-36]
	add	r3, r2, r3
	str	r3, [fp, #-72]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	ble	.L528
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-88]
	bl	lshift
	str	r0, [fp, #-88]
.L528:
	ldr	r3, [fp, #-72]
	cmp	r3, #0
	ble	.L529
	ldr	r1, [fp, #-72]
	ldr	r0, [fp, #-100]
	bl	lshift
	str	r0, [fp, #-100]
.L529:
	ldr	r3, [fp, #-60]
	cmp	r3, #0
	beq	.L530
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-88]
	bl	cmp
	mov	r3, r0
	cmp	r3, #0
	bge	.L530
	ldr	r3, [fp, #-56]
	sub	r3, r3, #1
	str	r3, [fp, #-56]
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-88]
	bl	multadd
	str	r0, [fp, #-88]
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L531
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-96]
	bl	multadd
	str	r0, [fp, #-96]
.L531:
	ldr	r3, [fp, #-48]
	str	r3, [fp, #-44]
.L530:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	bgt	.L532
	ldr	r3, [fp, #-192]
	cmp	r3, #3
	beq	.L533
	ldr	r3, [fp, #-192]
	cmp	r3, #5
	bne	.L532
.L533:
	ldr	r3, [fp, #-44]
	cmp	r3, #0
	blt	.L582
	mov	r2, #0
	mov	r1, #5
	ldr	r0, [fp, #-100]
	bl	multadd
	str	r0, [fp, #-100]
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-88]
	bl	cmp
	mov	r3, r0
	cmp	r3, #0
	bgt	.L583
	b	.L582
.L574:
	nop
	b	.L485
.L579:
	nop
	b	.L485
.L582:
	nop
.L485:
	ldr	r3, [fp, #-196]
	mvn	r3, r3
	str	r3, [fp, #-56]
	b	.L534
.L573:
	nop
	b	.L482
.L583:
	nop
.L482:
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	mov	r2, #49
	strb	r2, [r3]
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	b	.L534
.L532:
	ldr	r3, [fp, #-64]
	cmp	r3, #0
	beq	.L535
	ldr	r3, [fp, #-68]
	cmp	r3, #0
	ble	.L536
	ldr	r1, [fp, #-68]
	ldr	r0, [fp, #-96]
	bl	lshift
	str	r0, [fp, #-96]
.L536:
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-92]
	ldr	r3, [fp, #-80]
	cmp	r3, #0
	beq	.L537
	ldr	r3, [fp, #-96]
	ldr	r3, [r3, #4]
	mov	r0, r3
	bl	Balloc
	str	r0, [fp, #-96]
	ldr	r3, [fp, #-96]
	add	r0, r3, #12
	ldr	r3, [fp, #-92]
	add	r1, r3, #12
	ldr	r3, [fp, #-92]
	ldr	r3, [r3, #16]
	add	r3, r3, #2
	lsl	r3, r3, #2
	mov	r2, r3
	bl	memcpy
	mov	r1, #1
	ldr	r0, [fp, #-96]
	bl	lshift
	str	r0, [fp, #-96]
.L537:
	mov	r3, #1
	str	r3, [fp, #-36]
.L552:
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-88]
	bl	quorem
	mov	r3, r0
	add	r3, r3, #48
	str	r3, [fp, #-32]
	ldr	r1, [fp, #-92]
	ldr	r0, [fp, #-88]
	bl	cmp
	str	r0, [fp, #-52]
	ldr	r1, [fp, #-96]
	ldr	r0, [fp, #-100]
	bl	diff
	str	r0, [fp, #-144]
	ldr	r3, [fp, #-144]
	ldr	r3, [r3, #12]
	cmp	r3, #0
	bne	.L538
	ldr	r1, [fp, #-144]
	ldr	r0, [fp, #-88]
	bl	cmp
	mov	r3, r0
	b	.L539
.L538:
	mov	r3, #1
.L539:
	str	r3, [fp, #-128]
	ldr	r0, [fp, #-144]
	bl	Bfree
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	blt	.L540
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	bne	.L541
	ldr	r3, [fp, #-192]
	cmp	r3, #1
	beq	.L541
.L540:
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L542
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #16]
	cmp	r3, #1
	ble	.L584
.L542:
	ldr	r3, [fp, #-128]
	cmp	r3, #0
	ble	.L585
	mov	r1, #1
	ldr	r0, [fp, #-88]
	bl	lshift
	str	r0, [fp, #-88]
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-88]
	bl	cmp
	str	r0, [fp, #-128]
	ldr	r3, [fp, #-128]
	cmp	r3, #0
	blt	.L585
	ldr	r3, [fp, #-32]
	add	r2, r3, #1
	str	r2, [fp, #-32]
	cmp	r3, #57
	beq	.L586
	b	.L585
.L584:
	nop
	b	.L543
.L585:
	nop
.L543:
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	ldr	r2, [fp, #-32]
	and	r2, r2, #255
	strb	r2, [r3]
	b	.L534
.L541:
	ldr	r3, [fp, #-128]
	cmp	r3, #0
	ble	.L545
	ldr	r3, [fp, #-32]
	cmp	r3, #57
	bne	.L546
	b	.L544
.L586:
	nop
.L544:
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	mov	r2, #57
	strb	r2, [r3]
	b	.L547
.L546:
	ldr	r3, [fp, #-32]
	and	r2, r3, #255
	ldr	r3, [fp, #-112]
	add	r1, r3, #1
	str	r1, [fp, #-112]
	add	r2, r2, #1
	and	r2, r2, #255
	strb	r2, [r3]
	b	.L534
.L545:
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	ldr	r2, [fp, #-32]
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	beq	.L587
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-88]
	bl	multadd
	str	r0, [fp, #-88]
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	bne	.L550
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-96]
	bl	multadd
	str	r0, [fp, #-96]
	ldr	r3, [fp, #-96]
	str	r3, [fp, #-92]
	b	.L551
.L550:
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-92]
	bl	multadd
	str	r0, [fp, #-92]
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-96]
	bl	multadd
	str	r0, [fp, #-96]
.L551:
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	b	.L552
.L535:
	mov	r3, #1
	str	r3, [fp, #-36]
.L556:
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-88]
	bl	quorem
	mov	r3, r0
	add	r3, r3, #48
	str	r3, [fp, #-32]
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	ldr	r2, [fp, #-32]
	and	r2, r2, #255
	strb	r2, [r3]
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #20]
	cmp	r3, #0
	bne	.L554
	ldr	r3, [fp, #-88]
	ldr	r3, [r3, #16]
	cmp	r3, #1
	ble	.L588
.L554:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bge	.L589
	mov	r2, #0
	mov	r1, #10
	ldr	r0, [fp, #-88]
	bl	multadd
	str	r0, [fp, #-88]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	b	.L556
.L587:
	nop
	b	.L553
.L589:
	nop
.L553:
	mov	r1, #1
	ldr	r0, [fp, #-88]
	bl	lshift
	str	r0, [fp, #-88]
	ldr	r1, [fp, #-100]
	ldr	r0, [fp, #-88]
	bl	cmp
	str	r0, [fp, #-52]
	ldr	r3, [fp, #-52]
	cmp	r3, #0
	blt	.L560
	nop
.L547:
	b	.L558
.L559:
	ldr	r2, [fp, #-112]
	ldr	r3, [fp, #-116]
	cmp	r2, r3
	bne	.L558
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	mov	r2, #49
	strb	r2, [r3]
	b	.L534
.L558:
	ldr	r3, [fp, #-112]
	sub	r3, r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #57
	beq	.L559
	ldr	r3, [fp, #-112]
	add	r2, r3, #1
	str	r2, [fp, #-112]
	ldrb	r2, [r3]	@ zero_extendqisi2
	add	r2, r2, #1
	and	r2, r2, #255
	strb	r2, [r3]
	b	.L534
.L560:
	ldr	r3, [fp, #-112]
	sub	r3, r3, #1
	str	r3, [fp, #-112]
	ldr	r3, [fp, #-112]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #48
	beq	.L560
	ldr	r3, [fp, #-112]
	add	r3, r3, #1
	str	r3, [fp, #-112]
	b	.L534
.L588:
	nop
.L534:
	ldr	r0, [fp, #-100]
	bl	Bfree
	ldr	r3, [fp, #-96]
	cmp	r3, #0
	beq	.L590
	ldr	r3, [fp, #-92]
	cmp	r3, #0
	beq	.L561
	ldr	r2, [fp, #-92]
	ldr	r3, [fp, #-96]
	cmp	r2, r3
	beq	.L561
	ldr	r0, [fp, #-92]
	bl	Bfree
.L561:
	ldr	r0, [fp, #-96]
	bl	Bfree
	b	.L492
.L576:
	nop
	b	.L492
.L590:
	nop
.L492:
	ldr	r0, [fp, #-88]
	bl	Bfree
	ldr	r3, [fp, #-112]
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, [fp, #-56]
	add	r2, r3, #1
	ldr	r3, [fp, #4]
	str	r2, [r3]
	ldr	r3, [fp, #12]
	cmp	r3, #0
	beq	.L562
	ldr	r3, [fp, #12]
	ldr	r2, [fp, #-112]
	str	r2, [r3]
.L562:
	ldr	r3, [fp, #-116]
.L563:
	mov	r0, r3
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
	.size	dtoa, .-dtoa
	.global	nums
	.section	.rodata
	.align	2
.LC1:
	.ascii	"238434.3459823\000"
	.align	2
.LC2:
	.ascii	"23955.0\000"
	.align	2
.LC3:
	.ascii	"0.01000000023123\000"
	.align	2
.LC4:
	.ascii	"1.0\000"
	.align	2
.LC5:
	.ascii	"5555.5555555555555555\000"
	.data
	.align	2
	.type	nums, %object
	.size	nums, 20
nums:
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.word	.LC5
	.text
	.align	2
	.global	beebs_dtoa_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_dtoa_initialise_benchmark, %function
beebs_dtoa_initialise_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	init_heap
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	beebs_dtoa_initialise_benchmark, .-beebs_dtoa_initialise_benchmark
	.align	2
	.global	beebs_dtoa_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_dtoa_benchmark, %function
beebs_dtoa_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L595
.L596:
	ldr	r2, .L598
	ldr	r3, [fp, #-8]
	ldr	r3, [r2, r3, lsl #2]
	mov	r1, #0
	mov	r0, r3
	bl	strtod
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-20]
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L595:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	ble	.L596
	sub	r3, fp, #20
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	bl	__aeabi_d2iz
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L599:
	.align	2
.L598:
	.word	nums
	.size	beebs_dtoa_benchmark, .-beebs_dtoa_benchmark
	.align	2
	.global	beebs_dtoa_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_dtoa_verify_benchmark, %function
beebs_dtoa_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L603
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	beq	.L601
	mov	r3, #0
	b	.L602
.L601:
	mov	r3, #1
.L602:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L604:
	.align	2
.L603:
	.word	267945
	.size	beebs_dtoa_verify_benchmark, .-beebs_dtoa_verify_benchmark
	.data
	.align	2
	.type	p05.0, %object
	.size	p05.0, 12
p05.0:
	.word	5
	.word	25
	.word	125
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
