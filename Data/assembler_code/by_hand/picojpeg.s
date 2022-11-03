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
	.file	"picojpeg_test.c"
	.text
	.section	.rodata
	.align	2
	.type	ZAG, %object
	.size	ZAG, 64
ZAG:
	.ascii	"\000\001\010\020\011\002\003\012\021\030 \031\022\013"
	.ascii	"\004\005\014\023\032!(0)\"\033\024\015\006\007\016\025"
	.ascii	"\034#*1892+$\035\026\017\027\036%,3:;4-&\037'.5<=6/"
	.ascii	"7>?"
	.bss
	.align	2
gCoeffBuf:
	.space	128
	.size	gCoeffBuf, 128
	.align	2
gMCUBufR:
	.space	256
	.size	gMCUBufR, 256
	.align	2
gMCUBufG:
	.space	256
	.size	gMCUBufG, 256
	.align	2
gMCUBufB:
	.space	256
	.size	gMCUBufB, 256
	.align	2
gQuant0:
	.space	128
	.size	gQuant0, 128
	.align	2
gQuant1:
	.space	128
	.size	gQuant1, 128
	.align	2
gLastDC:
	.space	6
	.size	gLastDC, 6
	.align	2
gHuffTab0:
	.space	80
	.size	gHuffTab0, 80
	.align	2
gHuffVal0:
	.space	16
	.size	gHuffVal0, 16
	.align	2
gHuffTab1:
	.space	80
	.size	gHuffTab1, 80
	.align	2
gHuffVal1:
	.space	16
	.size	gHuffVal1, 16
	.align	2
gHuffTab2:
	.space	80
	.size	gHuffTab2, 80
	.align	2
gHuffVal2:
	.space	256
	.size	gHuffVal2, 256
	.align	2
gHuffTab3:
	.space	80
	.size	gHuffTab3, 80
	.align	2
gHuffVal3:
	.space	256
	.size	gHuffVal3, 256
gValidHuffTables:
	.space	1
	.size	gValidHuffTables, 1
gValidQuantTables:
	.space	1
	.size	gValidQuantTables, 1
gTemFlag:
	.space	1
	.size	gTemFlag, 1
	.align	2
gInBuf:
	.space	256
	.size	gInBuf, 256
gInBufOfs:
	.space	1
	.size	gInBufOfs, 1
gInBufLeft:
	.space	1
	.size	gInBufLeft, 1
	.align	1
gBitBuf:
	.space	2
	.size	gBitBuf, 2
gBitsLeft:
	.space	1
	.size	gBitsLeft, 1
	.align	1
gImageXSize:
	.space	2
	.size	gImageXSize, 2
	.align	1
gImageYSize:
	.space	2
	.size	gImageYSize, 2
gCompsInFrame:
	.space	1
	.size	gCompsInFrame, 1
	.align	2
gCompIdent:
	.space	3
	.size	gCompIdent, 3
	.align	2
gCompHSamp:
	.space	3
	.size	gCompHSamp, 3
	.align	2
gCompVSamp:
	.space	3
	.size	gCompVSamp, 3
	.align	2
gCompQuant:
	.space	3
	.size	gCompQuant, 3
	.align	1
gRestartInterval:
	.space	2
	.size	gRestartInterval, 2
	.align	1
gNextRestartNum:
	.space	2
	.size	gNextRestartNum, 2
	.align	1
gRestartsLeft:
	.space	2
	.size	gRestartsLeft, 2
gCompsInScan:
	.space	1
	.size	gCompsInScan, 1
	.align	2
gCompList:
	.space	3
	.size	gCompList, 3
	.align	2
gCompDCTab:
	.space	3
	.size	gCompDCTab, 3
	.align	2
gCompACTab:
	.space	3
	.size	gCompACTab, 3
gScanType:
	.space	1
	.size	gScanType, 1
gMaxBlocksPerMCU:
	.space	1
	.size	gMaxBlocksPerMCU, 1
gMaxMCUXSize:
	.space	1
	.size	gMaxMCUXSize, 1
gMaxMCUYSize:
	.space	1
	.size	gMaxMCUYSize, 1
	.align	1
gMaxMCUSPerRow:
	.space	2
	.size	gMaxMCUSPerRow, 2
	.align	1
gMaxMCUSPerCol:
	.space	2
	.size	gMaxMCUSPerCol, 2
	.align	1
gNumMCUSRemaining:
	.space	2
	.size	gNumMCUSRemaining, 2
	.align	2
gMCUOrg:
	.space	6
	.size	gMCUOrg, 6
	.align	2
g_pNeedBytesCallback:
	.space	4
	.size	g_pNeedBytesCallback, 4
	.align	2
g_pCallback_data:
	.space	4
	.size	g_pCallback_data, 4
gCallbackStatus:
	.space	1
	.size	gCallbackStatus, 1
gReduce:
	.space	1
	.size	gReduce, 1
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	fillInBuf, %function
fillInBuf:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	ldr	r3, .L4
	mov	r2, #4
	strb	r2, [r3]
	ldr	r3, .L4+4
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L4+8
	ldr	r4, [r3]
	ldr	r3, .L4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L4+12
	add	r0, r2, r3
	ldr	r3, .L4
	ldrb	r3, [r3]	@ zero_extendqisi2
	rsb	r3, r3, #0
	and	r1, r3, #255
	ldr	r3, .L4+16
	ldr	r3, [r3]
	ldr	r2, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L3
	ldr	r2, .L4+20
	ldrb	r3, [fp, #-13]
	strb	r3, [r2]
.L3:
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	gInBufOfs
	.word	gInBufLeft
	.word	g_pNeedBytesCallback
	.word	gInBuf
	.word	g_pCallback_data
	.word	gCallbackStatus
	.size	fillInBuf, .-fillInBuf
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getChar, %function
getChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L11
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L7
	bl	fillInBuf
	ldr	r3, .L11
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L7
	ldr	r3, .L11+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	mvn	r3, r3
	and	r2, r3, #255
	ldr	r3, .L11+4
	strb	r2, [r3]
	ldr	r3, .L11+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L8
	mov	r3, #255
	b	.L10
.L8:
	mov	r3, #217
	b	.L10
.L7:
	ldr	r3, .L11
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L11
	strb	r2, [r3]
	ldr	r3, .L11+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r2, r3, #1
	and	r1, r2, #255
	ldr	r2, .L11+8
	strb	r1, [r2]
	mov	r2, r3
	ldr	r3, .L11+12
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
.L10:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	gInBufLeft
	.word	gTemFlag
	.word	gInBufOfs
	.word	gInBuf
	.size	getChar, .-getChar
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	stuffChar, %function
stuffChar:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldr	r3, .L14
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L14
	strb	r2, [r3]
	ldr	r3, .L14
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r2, .L14+4
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, r1]
	ldr	r3, .L14+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L14+8
	strb	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	gInBufOfs
	.word	gInBuf
	.word	gInBufLeft
	.size	stuffChar, .-stuffChar
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getOctet, %function
getOctet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	strb	r3, [fp, #-13]
	bl	getChar
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L17
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L17
	bl	getChar
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L17
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	mov	r0, r3
	bl	stuffChar
	mov	r0, #255
	bl	stuffChar
.L17:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	getOctet, .-getOctet
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getBits, %function
getBits:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-13]
	mov	r3, r2
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-13]
	strb	r3, [fp, #-7]
	ldr	r3, .L24
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-6]	@ movhi
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #8
	bls	.L20
	ldrb	r3, [fp, #-13]
	sub	r3, r3, #8
	strb	r3, [fp, #-13]
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L24+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	mov	r0, r3
	bl	getOctet
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L24
	ldrh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L24+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	rsb	r3, r3, #8
	lsl	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
	ldrsh	r3, [fp, #-6]
	bic	r3, r3, #255
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, .L24
	ldrh	r3, [r3]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	strh	r3, [fp, #-6]	@ movhi
.L20:
	ldr	r3, .L24+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-13]	@ zero_extendqisi2
	cmp	r2, r3
	bls	.L21
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L24+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	mov	r0, r3
	bl	getOctet
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L24
	ldrh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r1, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	ldr	r2, .L24+4
	ldrb	r2, [r2]	@ zero_extendqisi2
	sub	r3, r3, r2
	lsl	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
	ldr	r3, .L24+4
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	r3, [fp, #-13]
	sub	r3, r2, r3
	and	r3, r3, #255
	add	r3, r3, #8
	and	r2, r3, #255
	ldr	r3, .L24+4
	strb	r2, [r3]
	b	.L22
.L21:
	ldr	r3, .L24+4
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	r3, [fp, #-13]
	sub	r3, r2, r3
	and	r2, r3, #255
	ldr	r3, .L24+4
	strb	r2, [r3]
	ldr	r3, .L24
	ldrh	r3, [r3]
	mov	r2, r3
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	lsl	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L24
	strh	r3, [r2]	@ movhi
.L22:
	ldrh	r2, [fp, #-6]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	rsb	r3, r3, #16
	asr	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	gBitBuf
	.word	gBitsLeft
	.size	getBits, .-getBits
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getBits1, %function
getBits1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r1, #0
	mov	r0, r3
	bl	getBits
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	getBits1, .-getBits1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getBits2, %function
getBits2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r1, #1
	mov	r0, r3
	bl	getBits
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	getBits2, .-getBits2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getBit, %function
getBit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	strb	r3, [fp, #-5]
	ldr	r3, .L34
	ldrh	r3, [r3]
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r3, #0
	bge	.L31
	mov	r3, #1
	strb	r3, [fp, #-5]
.L31:
	ldr	r3, .L34+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L32
	mov	r0, #1
	bl	getOctet
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, .L34
	ldrh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L34
	strh	r3, [r2]	@ movhi
	ldr	r3, .L34+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r3, #8
	and	r2, r3, #255
	ldr	r3, .L34+4
	strb	r2, [r3]
.L32:
	ldr	r3, .L34+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #1
	and	r2, r3, #255
	ldr	r3, .L34+4
	strb	r2, [r3]
	ldr	r3, .L34
	ldrh	r3, [r3]
	lsl	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L34
	strh	r3, [r2]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	gBitBuf
	.word	gBitsLeft
	.size	getBit, .-getBit
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getExtendTest, %function
getExtendTest:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #15
	ldrls	pc, [pc, r3, asl #2]
	b	.L37
.L39:
	.word	.L54
	.word	.L53
	.word	.L52
	.word	.L51
	.word	.L50
	.word	.L49
	.word	.L48
	.word	.L47
	.word	.L46
	.word	.L45
	.word	.L44
	.word	.L43
	.word	.L42
	.word	.L41
	.word	.L40
	.word	.L38
.L54:
	mov	r3, #0
	b	.L55
.L53:
	mov	r3, #1
	b	.L55
.L52:
	mov	r3, #2
	b	.L55
.L51:
	mov	r3, #4
	b	.L55
.L50:
	mov	r3, #8
	b	.L55
.L49:
	mov	r3, #16
	b	.L55
.L48:
	mov	r3, #32
	b	.L55
.L47:
	mov	r3, #64
	b	.L55
.L46:
	mov	r3, #128
	b	.L55
.L45:
	mov	r3, #256
	b	.L55
.L44:
	mov	r3, #512
	b	.L55
.L43:
	mov	r3, #1024
	b	.L55
.L42:
	mov	r3, #2048
	b	.L55
.L41:
	mov	r3, #4096
	b	.L55
.L40:
	mov	r3, #8192
	b	.L55
.L38:
	mov	r3, #16384
	b	.L55
.L37:
	mov	r3, #0
.L55:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	getExtendTest, .-getExtendTest
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getExtendOffset, %function
getExtendOffset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #15
	ldrls	pc, [pc, r3, asl #2]
	b	.L57
.L59:
	.word	.L74
	.word	.L73
	.word	.L72
	.word	.L71
	.word	.L70
	.word	.L69
	.word	.L68
	.word	.L67
	.word	.L66
	.word	.L65
	.word	.L64
	.word	.L63
	.word	.L62
	.word	.L61
	.word	.L60
	.word	.L58
.L74:
	mov	r3, #0
	b	.L75
.L73:
	mvn	r3, #0
	b	.L75
.L72:
	mvn	r3, #2
	b	.L75
.L71:
	mvn	r3, #6
	b	.L75
.L70:
	mvn	r3, #14
	b	.L75
.L69:
	mvn	r3, #30
	b	.L75
.L68:
	mvn	r3, #62
	b	.L75
.L67:
	mvn	r3, #126
	b	.L75
.L66:
	mvn	r3, #254
	b	.L75
.L65:
	ldr	r3, .L76
	b	.L75
.L64:
	ldr	r3, .L76+4
	b	.L75
.L63:
	ldr	r3, .L76+8
	b	.L75
.L62:
	ldr	r3, .L76+12
	b	.L75
.L61:
	ldr	r3, .L76+16
	b	.L75
.L60:
	ldr	r3, .L76+20
	b	.L75
.L58:
	ldr	r3, .L76+24
	b	.L75
.L57:
	mov	r3, #0
.L75:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L77:
	.align	2
.L76:
	.word	-511
	.word	-1023
	.word	-2047
	.word	-4095
	.word	-8191
	.word	-16383
	.word	-32767
	.size	getExtendOffset, .-getExtendOffset
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	huffExtend, %function
huffExtend:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	mov	r2, r1
	strh	r3, [fp, #-6]	@ movhi
	mov	r3, r2
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	mov	r0, r3
	bl	getExtendTest
	mov	r3, r0
	mov	r2, r3
	ldrh	r3, [fp, #-6]
	cmp	r3, r2
	bcs	.L79
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	mov	r0, r3
	bl	getExtendOffset
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-6]	@ movhi
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	b	.L80
.L79:
	ldrsh	r3, [fp, #-6]
.L80:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	huffExtend, .-huffExtend
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	huffDecode, %function
huffDecode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	mov	r3, #0
	strb	r3, [fp, #-5]
	bl	getBit
	mov	r3, r0
	strh	r3, [fp, #-8]	@ movhi
.L87:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #16
	bne	.L83
	mov	r3, #0
	b	.L84
.L83:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	add	r3, r3, #16
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-10]	@ movhi
	ldrh	r2, [fp, #-8]
	ldrh	r3, [fp, #-10]
	cmp	r2, r3
	bhi	.L85
	ldrh	r3, [fp, #-10]
	ldr	r2, .L90
	cmp	r3, r2
	bne	.L89
.L85:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
	ldrh	r3, [fp, #-8]	@ movhi
	lsl	r3, r3, #1
	strh	r3, [fp, #-8]	@ movhi
	bl	getBit
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-8]	@ movhi
	orr	r3, r2, r3
	strh	r3, [fp, #-8]	@ movhi
	b	.L87
.L89:
	nop
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3, #64]
	strb	r3, [fp, #-11]
	ldrh	r3, [fp, #-8]	@ movhi
	and	r2, r3, #255
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r1, [fp, #-16]
	lsl	r3, r3, #1
	add	r3, r1, r3
	ldrh	r3, [r3]
	and	r3, r3, #255
	sub	r3, r2, r3
	and	r2, r3, #255
	ldrb	r3, [fp, #-11]
	add	r3, r2, r3
	strb	r3, [fp, #-11]
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
.L84:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	65535
	.size	huffDecode, .-huffDecode
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	huffCreate, %function
huffCreate:
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
	strb	r3, [fp, #-5]
	mov	r3, #0
	strb	r3, [fp, #-6]
	mov	r3, #0
	strh	r3, [fp, #-8]	@ movhi
.L97:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrb	r3, [r3]
	strb	r3, [fp, #-9]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L93
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	add	r3, r3, #16
	lsl	r3, r3, #1
	add	r3, r2, r3
	mvn	r2, #0
	strh	r2, [r3]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	mov	r2, #0
	strb	r2, [r3, #64]
	b	.L94
.L93:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrh	r2, [fp, #-8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-8]	@ movhi
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r2, r2, #1
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	ldr	r1, [fp, #-20]
	add	r3, r3, #16
	lsl	r3, r3, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrb	r2, [fp, #-6]
	strb	r2, [r3, #64]
	ldrb	r2, [fp, #-6]
	ldrb	r3, [fp, #-9]
	add	r3, r2, r3
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-8]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-8]	@ movhi
.L94:
	ldrh	r3, [fp, #-8]	@ movhi
	lsl	r3, r3, #1
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #15
	bhi	.L99
	b	.L97
.L99:
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	huffCreate, .-huffCreate
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getHuffTable, %function
getHuffTable:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L101
.L103:
	.word	.L106
	.word	.L105
	.word	.L104
	.word	.L102
.L106:
	ldr	r3, .L108
	b	.L107
.L105:
	ldr	r3, .L108+4
	b	.L107
.L104:
	ldr	r3, .L108+8
	b	.L107
.L102:
	ldr	r3, .L108+12
	b	.L107
.L101:
	mov	r3, #0
.L107:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L109:
	.align	2
.L108:
	.word	gHuffTab0
	.word	gHuffTab1
	.word	gHuffTab2
	.word	gHuffTab3
	.size	getHuffTable, .-getHuffTable
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getHuffVal, %function
getHuffVal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L111
.L113:
	.word	.L116
	.word	.L115
	.word	.L114
	.word	.L112
.L116:
	ldr	r3, .L118
	b	.L117
.L115:
	ldr	r3, .L118+4
	b	.L117
.L114:
	ldr	r3, .L118+8
	b	.L117
.L112:
	ldr	r3, .L118+12
	b	.L117
.L111:
	mov	r3, #0
.L117:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L119:
	.align	2
.L118:
	.word	gHuffVal0
	.word	gHuffVal1
	.word	gHuffVal2
	.word	gHuffVal3
	.size	getHuffVal, .-getHuffVal
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getMaxHuffCodes, %function
getMaxHuffCodes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #1
	bhi	.L121
	mov	r3, #12
	b	.L122
.L121:
	mov	r3, #255
.L122:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	getMaxHuffCodes, .-getMaxHuffCodes
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	readDHTMarker, %function
readDHTMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-6]
	cmp	r3, #1
	bhi	.L125
	mov	r3, #4
	b	.L137
.L125:
	ldrh	r3, [fp, #-6]	@ movhi
	sub	r3, r3, #2
	strh	r3, [fp, #-6]	@ movhi
	b	.L127
.L136:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-11]
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	and	r3, r3, #14
	cmp	r3, #0
	bne	.L128
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	and	r3, r3, #240
	cmp	r3, #16
	ble	.L129
.L128:
	mov	r3, #3
	b	.L137
.L129:
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	lsr	r3, r3, #3
	and	r3, r3, #255
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r3, r3, #2
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldrsb	r3, [fp, #-11]
	and	r3, r3, #1
	lsl	r3, r3, #24
	asr	r3, r3, #24
	orr	r3, r2, r3
	lsl	r3, r3, #24
	asr	r3, r3, #24
	strb	r3, [fp, #-12]
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	mov	r0, r3
	bl	getHuffTable
	str	r0, [fp, #-16]
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	mov	r0, r3
	bl	getHuffVal
	str	r0, [fp, #-20]
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	mov	r2, #1
	lsl	r3, r2, r3
	lsl	r3, r3, #24
	asr	r2, r3, #24
	ldr	r3, .L138
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	orr	r3, r2, r3
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r2, r3, #255
	ldr	r3, .L138
	strb	r2, [r3]
	mov	r3, #0
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-7]
	b	.L130
.L131:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-23]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	sub	r3, r3, #4
	add	r3, r3, fp
	ldrb	r2, [fp, #-23]
	strb	r2, [r3, #-36]
	ldrb	r3, [fp, #-23]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-10]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-10]	@ movhi
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-7]
.L130:
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L131
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	mov	r0, r3
	bl	getMaxHuffCodes
	mov	r3, r0
	mov	r2, r3
	ldrh	r3, [fp, #-10]
	cmp	r3, r2
	bls	.L132
	mov	r3, #2
	b	.L137
.L132:
	mov	r3, #0
	strb	r3, [fp, #-7]
	b	.L133
.L134:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	mov	r1, r3
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	and	r2, r1, #255
	strb	r2, [r3]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-7]
.L133:
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldrh	r2, [fp, #-10]
	cmp	r2, r3
	bhi	.L134
	ldrh	r3, [fp, #-10]	@ movhi
	add	r3, r3, #17
	strh	r3, [fp, #-22]	@ movhi
	ldrh	r2, [fp, #-6]
	ldrh	r3, [fp, #-22]
	cmp	r2, r3
	bcs	.L135
	mov	r3, #4
	b	.L137
.L135:
	ldrh	r2, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-22]	@ movhi
	sub	r3, r2, r3
	strh	r3, [fp, #-6]	@ movhi
	sub	r3, fp, #40
	ldr	r1, [fp, #-16]
	mov	r0, r3
	bl	huffCreate
.L127:
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L136
	mov	r3, #0
.L137:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L139:
	.align	2
.L138:
	.word	gValidHuffTables
	.size	readDHTMarker, .-readDHTMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	readDQTMarker, %function
readDQTMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r3, [fp, #-14]
	cmp	r3, #1
	bhi	.L141
	mov	r3, #5
	b	.L142
.L141:
	ldrh	r3, [fp, #-14]	@ movhi
	sub	r3, r3, #2
	strh	r3, [fp, #-14]	@ movhi
	b	.L143
.L156:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	lsr	r3, r3, #4
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-21]
	and	r3, r3, #15
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L144
	mov	r3, #6
	b	.L142
.L144:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L145
	mov	r2, #2
	b	.L146
.L145:
	mov	r2, #1
.L146:
	ldr	r3, .L157
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #24
	asr	r3, r3, #24
	orr	r3, r2, r3
	lsl	r3, r3, #24
	asr	r3, r3, #24
	and	r2, r3, #255
	ldr	r3, .L157
	strb	r2, [r3]
	mov	r3, #0
	strb	r3, [fp, #-15]
	b	.L147
.L151:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strh	r3, [fp, #-20]	@ movhi
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L148
	ldrh	r3, [fp, #-20]	@ movhi
	lsl	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r4, r3, #16
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	add	r3, r4, r3
	strh	r3, [fp, #-20]	@ movhi
.L148:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L149
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-20]
	ldr	r1, .L157+4
	lsl	r3, r3, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	b	.L150
.L149:
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-20]
	ldr	r1, .L157+8
	lsl	r3, r3, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
.L150:
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-15]
.L147:
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	cmp	r3, #63
	bls	.L151
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L152
	ldr	r3, .L157+4
	b	.L153
.L152:
	ldr	r3, .L157+8
.L153:
	mov	r0, r3
	bl	createWinogradQuant
	mov	r3, #65
	strh	r3, [fp, #-18]	@ movhi
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L154
	ldrh	r3, [fp, #-18]	@ movhi
	add	r3, r3, #64
	strh	r3, [fp, #-18]	@ movhi
.L154:
	ldrh	r2, [fp, #-14]
	ldrh	r3, [fp, #-18]
	cmp	r2, r3
	bcs	.L155
	mov	r3, #21
	b	.L142
.L155:
	ldrh	r2, [fp, #-14]	@ movhi
	ldrh	r3, [fp, #-18]	@ movhi
	sub	r3, r2, r3
	strh	r3, [fp, #-14]	@ movhi
.L143:
	ldrh	r3, [fp, #-14]
	cmp	r3, #0
	bne	.L156
	mov	r3, #0
.L142:
	mov	r0, r3
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L158:
	.align	2
.L157:
	.word	gValidQuantTables
	.word	gQuant1
	.word	gQuant0
	.size	readDQTMarker, .-readDQTMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	readSOFMarker, %function
readSOFMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	strh	r3, [fp, #-8]	@ movhi
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	cmp	r3, #8
	beq	.L160
	mov	r3, #7
	b	.L161
.L160:
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L171
	strh	r2, [r3]	@ movhi
	ldr	r3, .L171
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L162
	ldr	r3, .L171
	ldrh	r3, [r3]
	cmp	r3, #16384
	bls	.L163
.L162:
	mov	r3, #8
	b	.L161
.L163:
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L171+4
	strh	r2, [r3]	@ movhi
	ldr	r3, .L171+4
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L164
	ldr	r3, .L171+4
	ldrh	r3, [r3]
	cmp	r3, #16384
	bls	.L165
.L164:
	mov	r3, #9
	b	.L161
.L165:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	and	r2, r3, #255
	ldr	r3, .L171+8
	strb	r2, [r3]
	ldr	r3, .L171+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L166
	mov	r3, #10
	b	.L161
.L166:
	ldrh	r2, [fp, #-8]
	ldr	r3, .L171+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r1, r3
	mov	r3, r1
	lsl	r3, r3, #1
	add	r3, r3, r1
	add	r3, r3, #8
	cmp	r2, r3
	beq	.L167
	mov	r3, #11
	b	.L161
.L167:
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L168
.L170:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r1, r2, #255
	ldr	r2, .L171+12
	strb	r1, [r2, r3]
	mov	r0, #4
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r1, r2, #255
	ldr	r2, .L171+16
	strb	r1, [r2, r3]
	mov	r0, #4
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r1, r2, #255
	ldr	r2, .L171+20
	strb	r1, [r2, r3]
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	and	r1, r2, #255
	ldr	r2, .L171+24
	strb	r1, [r2, r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L171+24
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	cmp	r3, #1
	bls	.L169
	mov	r3, #36
	b	.L161
.L169:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
.L168:
	ldr	r3, .L171+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L170
	mov	r3, #0
.L161:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L172:
	.align	2
.L171:
	.word	gImageYSize
	.word	gImageXSize
	.word	gCompsInFrame
	.word	gCompIdent
	.word	gCompHSamp
	.word	gCompVSamp
	.word	gCompQuant
	.size	readSOFMarker, .-readSOFMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	skipVariableMarker, %function
skipVariableMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-6]
	cmp	r3, #1
	bhi	.L174
	mov	r3, #12
	b	.L175
.L174:
	ldrh	r3, [fp, #-6]	@ movhi
	sub	r3, r3, #2
	strh	r3, [fp, #-6]	@ movhi
	b	.L176
.L177:
	mov	r0, #8
	bl	getBits1
	ldrh	r3, [fp, #-6]
	sub	r3, r3, #1
	strh	r3, [fp, #-6]	@ movhi
.L176:
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L177
	mov	r3, #0
.L175:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	skipVariableMarker, .-skipVariableMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	readDRIMarker, %function
readDRIMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	cmp	r3, #4
	beq	.L179
	mov	r3, #13
	b	.L180
.L179:
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L181
	strh	r2, [r3]	@ movhi
	mov	r3, #0
.L180:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L182:
	.align	2
.L181:
	.word	gRestartInterval
	.size	readDRIMarker, .-readDRIMarker
	.global	spectral_start
	.bss
	.type	spectral_start, %object
	.size	spectral_start, 1
spectral_start:
	.space	1
	.global	spectral_end
	.type	spectral_end, %object
	.size	spectral_end, 1
spectral_end:
	.space	1
	.global	successive_high
	.type	successive_high, %object
	.size	successive_high, 1
successive_high:
	.space	1
	.global	successive_low
	.type	successive_low, %object
	.size	successive_low, 1
successive_low:
	.space	1
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	readSOSMarker, %function
readSOSMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #16
	bl	getBits1
	mov	r3, r0
	strh	r3, [fp, #-8]	@ movhi
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	and	r2, r3, #255
	ldr	r3, .L197
	strb	r2, [r3]
	ldrh	r3, [fp, #-8]	@ movhi
	sub	r3, r3, #3
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r2, [fp, #-8]
	ldr	r3, .L197
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #1
	add	r3, r3, #3
	cmp	r2, r3
	bne	.L184
	ldr	r3, .L197
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L184
	ldr	r3, .L197
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L185
.L184:
	mov	r3, #14
	b	.L186
.L185:
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L187
.L193:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-10]
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-11]
	ldrh	r3, [fp, #-8]	@ movhi
	sub	r3, r3, #2
	strh	r3, [fp, #-8]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-9]
	b	.L188
.L191:
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	ldr	r2, .L197+4
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-10]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L196
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-9]
.L188:
	ldr	r3, .L197+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L191
	b	.L190
.L196:
	nop
.L190:
	ldr	r3, .L197+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-9]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L192
	mov	r3, #15
	b	.L186
.L192:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r1, .L197+12
	ldrb	r2, [fp, #-9]
	strb	r2, [r1, r3]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-11]	@ zero_extendqisi2
	lsr	r2, r2, #4
	and	r1, r2, #255
	ldr	r2, .L197+16
	strb	r1, [r2, r3]
	ldrb	r3, [fp, #-9]	@ zero_extendqisi2
	ldrb	r2, [fp, #-11]
	and	r2, r2, #15
	and	r1, r2, #255
	ldr	r2, .L197+20
	strb	r1, [r2, r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
.L187:
	ldr	r3, .L197
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L193
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	and	r2, r3, #255
	ldr	r3, .L197+24
	strb	r2, [r3]
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	and	r2, r3, #255
	ldr	r3, .L197+28
	strb	r2, [r3]
	mov	r0, #4
	bl	getBits1
	mov	r3, r0
	and	r2, r3, #255
	ldr	r3, .L197+32
	strb	r2, [r3]
	mov	r0, #4
	bl	getBits1
	mov	r3, r0
	and	r2, r3, #255
	ldr	r3, .L197+36
	strb	r2, [r3]
	ldrh	r3, [fp, #-8]	@ movhi
	sub	r3, r3, #3
	strh	r3, [fp, #-8]	@ movhi
	b	.L194
.L195:
	mov	r0, #8
	bl	getBits1
	ldrh	r3, [fp, #-8]
	sub	r3, r3, #1
	strh	r3, [fp, #-8]	@ movhi
.L194:
	ldrh	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L195
	mov	r3, #0
.L186:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L198:
	.align	2
.L197:
	.word	gCompsInScan
	.word	gCompIdent
	.word	gCompsInFrame
	.word	gCompList
	.word	gCompDCTab
	.word	gCompACTab
	.word	spectral_start
	.word	spectral_end
	.word	successive_high
	.word	successive_low
	.size	readSOSMarker, .-readSOSMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	nextMarker, %function
nextMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	strb	r3, [fp, #-5]
.L200:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L200
.L201:
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L201
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L200
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	nextMarker, .-nextMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	processMarkers, %function
processMarkers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
.L214:
	bl	nextMarker
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L204
	cmp	r3, #0
	ble	.L205
	cmp	r3, #221
	bgt	.L205
	cmp	r3, #192
	blt	.L205
	sub	r3, r3, #192
	cmp	r3, #29
	ldrls	pc, [pc, r3, asl #2]
	b	.L205
.L207:
	.word	.L209
	.word	.L209
	.word	.L209
	.word	.L209
	.word	.L211
	.word	.L209
	.word	.L209
	.word	.L209
	.word	.L204
	.word	.L209
	.word	.L209
	.word	.L209
	.word	.L210
	.word	.L209
	.word	.L209
	.word	.L209
	.word	.L204
	.word	.L204
	.word	.L204
	.word	.L204
	.word	.L204
	.word	.L204
	.word	.L204
	.word	.L204
	.word	.L209
	.word	.L209
	.word	.L209
	.word	.L208
	.word	.L205
	.word	.L206
.L209:
	ldr	r3, [fp, #-16]
	ldrb	r2, [fp, #-5]
	strb	r2, [r3]
	mov	r3, #0
	b	.L212
.L211:
	bl	readDHTMarker
	b	.L213
.L210:
	mov	r3, #17
	b	.L212
.L208:
	bl	readDQTMarker
	b	.L213
.L206:
	bl	readDRIMarker
	b	.L213
.L204:
	mov	r3, #18
	b	.L212
.L205:
	bl	skipVariableMarker
	nop
.L213:
	b	.L214
.L212:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	processMarkers, .-processMarkers
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	locateSOIMarker, %function
locateSOIMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-8]
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L216
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #216
	bne	.L216
	mov	r3, #0
	b	.L217
.L216:
	mov	r3, #4096
	strh	r3, [fp, #-6]	@ movhi
.L222:
	ldrh	r3, [fp, #-6]	@ movhi
	sub	r3, r3, #1
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L218
	mov	r3, #19
	b	.L217
.L218:
	ldrb	r3, [fp, #-7]
	strb	r3, [fp, #-8]
	mov	r0, #8
	bl	getBits1
	mov	r3, r0
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L222
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #216
	beq	.L225
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #217
	bne	.L222
	mov	r3, #19
	b	.L217
.L225:
	nop
	ldr	r3, .L226
	ldrh	r3, [r3]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #255
	beq	.L223
	mov	r3, #19
	b	.L217
.L223:
	mov	r3, #0
.L217:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L227:
	.align	2
.L226:
	.word	gBitBuf
	.size	locateSOIMarker, .-locateSOIMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	locateSOFMarker, %function
locateSOFMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	bl	locateSOIMarker
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L229
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L237
.L229:
	sub	r3, fp, #6
	mov	r0, r3
	bl	processMarkers
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L231
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L237
.L231:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #201
	beq	.L232
	cmp	r3, #201
	bgt	.L233
	cmp	r3, #192
	beq	.L234
	cmp	r3, #194
	bne	.L233
	mov	r3, #37
	b	.L237
.L234:
	bl	readSOFMarker
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L238
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L237
.L232:
	mov	r3, #17
	b	.L237
.L233:
	mov	r3, #20
	b	.L237
.L238:
	nop
	mov	r3, #0
.L237:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	locateSOFMarker, .-locateSOFMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	locateSOSMarker, %function
locateSOSMarker:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	strb	r2, [r3]
	sub	r3, fp, #6
	mov	r0, r3
	bl	processMarkers
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L240
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L244
.L240:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #217
	bne	.L242
	ldr	r3, [fp, #-16]
	mov	r2, #1
	strb	r2, [r3]
	mov	r3, #0
	b	.L244
.L242:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #218
	beq	.L243
	mov	r3, #18
	b	.L244
.L243:
	bl	readSOSMarker
	mov	r3, r0
.L244:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	locateSOSMarker, .-locateSOSMarker
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	init, %function
init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L247
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L247+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L247+8
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+12
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L247+16
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+20
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+24
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+28
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+32
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+36
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L247+40
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L247+44
	mov	r2, #8
	strb	r2, [r3]
	mov	r0, #8
	bl	getBits1
	mov	r0, #8
	bl	getBits1
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L248:
	.align	2
.L247:
	.word	gImageXSize
	.word	gImageYSize
	.word	gCompsInFrame
	.word	gRestartInterval
	.word	gCompsInScan
	.word	gValidHuffTables
	.word	gValidQuantTables
	.word	gTemFlag
	.word	gInBufOfs
	.word	gInBufLeft
	.word	gBitBuf
	.word	gBitsLeft
	.size	init, .-init
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	fixInBuffer, %function
fixInBuffer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L251
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L250
	ldr	r3, .L251+4
	ldrh	r3, [r3]
	and	r3, r3, #255
	mov	r0, r3
	bl	stuffChar
.L250:
	ldr	r3, .L251+4
	ldrh	r3, [r3]
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #255
	mov	r0, r3
	bl	stuffChar
	ldr	r3, .L251
	mov	r2, #8
	strb	r2, [r3]
	mov	r0, #8
	bl	getBits2
	mov	r0, #8
	bl	getBits2
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L252:
	.align	2
.L251:
	.word	gBitsLeft
	.word	gBitBuf
	.size	fixInBuffer, .-fixInBuffer
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	processRestart, %function
processRestart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	strb	r3, [fp, #-7]
	mov	r3, #1536
	strh	r3, [fp, #-6]	@ movhi
	b	.L254
.L257:
	bl	getChar
	mov	r3, r0
	cmp	r3, #255
	beq	.L266
	ldrh	r3, [fp, #-6]
	sub	r3, r3, #1
	strh	r3, [fp, #-6]	@ movhi
.L254:
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L257
	b	.L256
.L266:
	nop
.L256:
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L260
	mov	r3, #29
	b	.L259
.L263:
	bl	getChar
	mov	r3, r0
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #255
	bne	.L267
	ldrh	r3, [fp, #-6]
	sub	r3, r3, #1
	strh	r3, [fp, #-6]	@ movhi
.L260:
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L263
	b	.L262
.L267:
	nop
.L262:
	ldrh	r3, [fp, #-6]
	cmp	r3, #0
	bne	.L264
	mov	r3, #29
	b	.L259
.L264:
	ldrb	r2, [fp, #-7]	@ zero_extendqisi2
	ldr	r3, .L268
	ldrh	r3, [r3]
	add	r3, r3, #208
	cmp	r2, r3
	beq	.L265
	mov	r3, #29
	b	.L259
.L265:
	ldr	r3, .L268+4
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L268+4
	mov	r2, #0
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L268+4
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L268+8
	ldrh	r3, [r3]
	ldr	r2, .L268+12
	strh	r3, [r2]	@ movhi
	ldr	r3, .L268
	ldrh	r3, [r3]
	add	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	and	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L268
	strh	r3, [r2]	@ movhi
	ldr	r3, .L268+16
	mov	r2, #8
	strb	r2, [r3]
	mov	r0, #8
	bl	getBits2
	mov	r0, #8
	bl	getBits2
	mov	r3, #0
.L259:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L269:
	.align	2
.L268:
	.word	gNextRestartNum
	.word	gLastDC
	.word	gRestartInterval
	.word	gRestartsLeft
	.word	gBitsLeft
	.size	processRestart, .-processRestart
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkHuffTables, %function
checkHuffTables:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L271
.L275:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L276
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L276+4
	ldrb	r3, [r3, r2]
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L276
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L276+8
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	add	r3, r3, #2
	strb	r3, [fp, #-7]
	ldr	r3, .L276+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L272
	ldr	r3, .L276+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	asr	r3, r2, r3
	and	r3, r3, #1
	cmp	r3, #0
	bne	.L273
.L272:
	mov	r3, #24
	b	.L274
.L273:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
.L271:
	ldr	r3, .L276+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L275
	mov	r3, #0
.L274:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L277:
	.align	2
.L276:
	.word	gCompList
	.word	gCompDCTab
	.word	gCompACTab
	.word	gValidHuffTables
	.word	gCompsInScan
	.size	checkHuffTables, .-checkHuffTables
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkQuantTables, %function
checkQuantTables:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L279
.L284:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L285
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, .L285+4
	ldrb	r3, [r3, r2]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L280
	mov	r3, #2
	b	.L281
.L280:
	mov	r3, #1
.L281:
	strb	r3, [fp, #-6]
	ldr	r3, .L285+8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldrb	r3, [fp, #-6]
	and	r3, r3, r2
	and	r3, r3, #255
	cmp	r3, #0
	bne	.L282
	mov	r3, #23
	b	.L283
.L282:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
.L279:
	ldr	r3, .L285+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L284
	mov	r3, #0
.L283:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L286:
	.align	2
.L285:
	.word	gCompList
	.word	gCompQuant
	.word	gValidQuantTables
	.word	gCompsInScan
	.size	checkQuantTables, .-checkQuantTables
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initScan, %function
initScan:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	sub	r3, fp, #6
	mov	r0, r3
	bl	locateSOSMarker
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L288
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L294
.L288:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L290
	mov	r3, #18
	b	.L294
.L290:
	bl	checkHuffTables
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L291
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L294
.L291:
	bl	checkQuantTables
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L292
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L294
.L292:
	ldr	r3, .L295
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldr	r3, .L295
	mov	r2, #0
	strh	r2, [r3, #2]	@ movhi
	ldr	r3, .L295
	mov	r2, #0
	strh	r2, [r3, #4]	@ movhi
	ldr	r3, .L295+4
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L293
	ldr	r3, .L295+4
	ldrh	r3, [r3]
	ldr	r2, .L295+8
	strh	r3, [r2]	@ movhi
	ldr	r3, .L295+12
	mov	r2, #0
	strh	r2, [r3]	@ movhi
.L293:
	bl	fixInBuffer
	mov	r3, #0
.L294:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L296:
	.align	2
.L295:
	.word	gLastDC
	.word	gRestartInterval
	.word	gRestartsLeft
	.word	gNextRestartNum
	.size	initScan, .-initScan
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initFrame, %function
initFrame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L315
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L298
	ldr	r3, .L315+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L299
	ldr	r3, .L315+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L300
.L299:
	mov	r3, #27
	b	.L301
.L300:
	ldr	r3, .L315+12
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L315+16
	mov	r2, #1
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L315+24
	mov	r2, #8
	strb	r2, [r3]
	ldr	r3, .L315+28
	mov	r2, #8
	strb	r2, [r3]
	b	.L302
.L298:
	ldr	r3, .L315
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #3
	bne	.L303
	ldr	r3, .L315+4
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L304
	ldr	r3, .L315+8
	ldrb	r3, [r3, #1]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L304
	ldr	r3, .L315+4
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L304
	ldr	r3, .L315+8
	ldrb	r3, [r3, #2]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L305
.L304:
	mov	r3, #27
	b	.L301
.L305:
	ldr	r3, .L315+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L306
	ldr	r3, .L315+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L306
	ldr	r3, .L315+12
	mov	r2, #1
	strb	r2, [r3]
	ldr	r3, .L315+16
	mov	r2, #3
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #1
	strb	r2, [r3, #1]
	ldr	r3, .L315+20
	mov	r2, #2
	strb	r2, [r3, #2]
	ldr	r3, .L315+24
	mov	r2, #8
	strb	r2, [r3]
	ldr	r3, .L315+28
	mov	r2, #8
	strb	r2, [r3]
	b	.L302
.L306:
	ldr	r3, .L315+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L308
	ldr	r3, .L315+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L308
	ldr	r3, .L315+12
	mov	r2, #3
	strb	r2, [r3]
	ldr	r3, .L315+16
	mov	r2, #4
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3, #1]
	ldr	r3, .L315+20
	mov	r2, #1
	strb	r2, [r3, #2]
	ldr	r3, .L315+20
	mov	r2, #2
	strb	r2, [r3, #3]
	ldr	r3, .L315+24
	mov	r2, #8
	strb	r2, [r3]
	ldr	r3, .L315+28
	mov	r2, #16
	strb	r2, [r3]
	b	.L302
.L308:
	ldr	r3, .L315+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L309
	ldr	r3, .L315+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L309
	ldr	r3, .L315+12
	mov	r2, #2
	strb	r2, [r3]
	ldr	r3, .L315+16
	mov	r2, #4
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3, #1]
	ldr	r3, .L315+20
	mov	r2, #1
	strb	r2, [r3, #2]
	ldr	r3, .L315+20
	mov	r2, #2
	strb	r2, [r3, #3]
	ldr	r3, .L315+24
	mov	r2, #16
	strb	r2, [r3]
	ldr	r3, .L315+28
	mov	r2, #8
	strb	r2, [r3]
	b	.L302
.L309:
	ldr	r3, .L315+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L310
	ldr	r3, .L315+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L310
	ldr	r3, .L315+12
	mov	r2, #4
	strb	r2, [r3]
	ldr	r3, .L315+16
	mov	r2, #6
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3, #1]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3, #2]
	ldr	r3, .L315+20
	mov	r2, #0
	strb	r2, [r3, #3]
	ldr	r3, .L315+20
	mov	r2, #1
	strb	r2, [r3, #4]
	ldr	r3, .L315+20
	mov	r2, #2
	strb	r2, [r3, #5]
	ldr	r3, .L315+24
	mov	r2, #16
	strb	r2, [r3]
	ldr	r3, .L315+28
	mov	r2, #16
	strb	r2, [r3]
	b	.L302
.L310:
	mov	r3, #27
	b	.L301
.L303:
	mov	r3, #26
	b	.L301
.L302:
	ldr	r3, .L315+32
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L315+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #1
	add	r2, r2, r3
	ldr	r3, .L315+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L311
	mov	r3, #3
	b	.L312
.L311:
	mov	r3, #4
.L312:
	asr	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L315+36
	strh	r3, [r2]	@ movhi
	ldr	r3, .L315+40
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, .L315+28
	ldrb	r3, [r3]	@ zero_extendqisi2
	sub	r3, r3, #1
	add	r2, r2, r3
	ldr	r3, .L315+28
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #8
	bne	.L313
	mov	r3, #3
	b	.L314
.L313:
	mov	r3, #4
.L314:
	asr	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L315+44
	strh	r3, [r2]	@ movhi
	ldr	r3, .L315+36
	ldrh	r3, [r3]
	ldr	r2, .L315+44
	ldrh	r2, [r2]
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L315+48
	strh	r3, [r2]	@ movhi
	mov	r3, #0
.L301:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L316:
	.align	2
.L315:
	.word	gCompsInFrame
	.word	gCompHSamp
	.word	gCompVSamp
	.word	gScanType
	.word	gMaxBlocksPerMCU
	.word	gMCUOrg
	.word	gMaxMCUXSize
	.word	gMaxMCUYSize
	.word	gImageXSize
	.word	gMaxMCUSPerRow
	.word	gImageYSize
	.word	gMaxMCUSPerCol
	.word	gNumMCUSRemaining
	.size	initFrame, .-initFrame
	.global	gWinogradQuant
	.section	.rodata
	.align	2
	.type	gWinogradQuant, %object
	.size	gWinogradQuant, 64
gWinogradQuant:
	.ascii	"\200\262\262\247\366\247\227\350\350\227\200\321\333"
	.ascii	"\321\200e\262\305\305\262eE\213\247\261\247\213E#`\203"
	.ascii	"\227\227\203`#1[v\200v[1.QeeQ.*EOE*#66#\034%\034\023"
	.ascii	"\023\012"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	createWinogradQuant, %function
createWinogradQuant:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L318
.L319:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, [fp, #-16]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	str	r3, [fp, #-12]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L320
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	mul	r3, r2, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	asr	r2, r3, #3
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r1, [fp, #-16]
	add	r3, r1, r3
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
.L318:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #63
	bls	.L319
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L321:
	.align	2
.L320:
	.word	gWinogradQuant
	.size	createWinogradQuant, .-createWinogradQuant
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	imul_b1_b3, %function
imul_b1_b3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrsh	r1, [fp, #-14]
	mov	r2, r1
	lsl	r2, r2, #1
	add	r2, r2, r1
	lsl	r3, r2, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r1
	lsl	r3, r3, #1
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	imul_b1_b3, .-imul_b1_b3
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	imul_b2, %function
imul_b2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrsh	r2, [fp, #-14]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r3, r3, #5
	sub	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	imul_b2, .-imul_b2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	imul_b4, %function
imul_b4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrsh	r2, [fp, #-14]
	mov	r3, r2
	lsl	r3, r3, #4
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	imul_b4, .-imul_b4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	imul_b5, %function
imul_b5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrsh	r2, [fp, #-14]
	mov	r3, r2
	lsl	r3, r3, #3
	sub	r3, r3, r2
	lsl	r2, r3, #3
	sub	r2, r2, r3
	lsl	r3, r2, #2
	mov	r2, r3
	str	r2, [fp, #-8]
	ldr	r3, [fp, #-8]
	add	r3, r3, #128
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	imul_b5, .-imul_b5
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	clamp, %function
clamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r3, [fp, #-6]
	cmp	r3, #255
	bls	.L331
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	bge	.L332
	mov	r3, #0
	b	.L333
.L332:
	ldrsh	r3, [fp, #-6]
	cmp	r3, #255
	ble	.L331
	mov	r3, #255
	b	.L333
.L331:
	ldrh	r3, [fp, #-6]	@ movhi
	and	r3, r3, #255
.L333:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	clamp, .-clamp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	idctRows, %function
idctRows:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #76
	ldr	r3, .L339
	str	r3, [fp, #-20]
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L335
.L338:
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	ldrsh	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #6
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #10
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #12
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #14
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r3, #0
	bne	.L336
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-80]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #6
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #10
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #12
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #14
	ldrh	r2, [fp, #-80]	@ movhi
	strh	r2, [r3]	@ movhi
	b	.L337
.L336:
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #10]	@ movhi
	strh	r3, [fp, #-22]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #6]	@ movhi
	strh	r3, [fp, #-24]	@ movhi
	ldrh	r2, [fp, #-22]
	ldrh	r3, [fp, #-24]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-26]	@ movhi
	ldrh	r2, [fp, #-22]
	ldrh	r3, [fp, #-24]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-28]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #2]	@ movhi
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #14]	@ movhi
	strh	r3, [fp, #-32]	@ movhi
	ldrh	r2, [fp, #-30]
	ldrh	r3, [fp, #-32]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldrh	r2, [fp, #-30]
	ldrh	r3, [fp, #-32]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-36]	@ movhi
	ldrh	r2, [fp, #-26]
	ldrh	r3, [fp, #-36]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	imul_b5
	mov	r3, r0
	strh	r3, [fp, #-38]	@ movhi
	ldrsh	r3, [fp, #-36]
	mov	r0, r3
	bl	imul_b4
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-38]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-40]	@ movhi
	ldrh	r4, [fp, #-38]
	ldrsh	r3, [fp, #-26]
	mov	r0, r3
	bl	imul_b2
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r4, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-42]	@ movhi
	ldrh	r2, [fp, #-34]
	ldrh	r3, [fp, #-28]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-44]	@ movhi
	ldrh	r2, [fp, #-34]
	ldrh	r3, [fp, #-28]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-46]	@ movhi
	ldrh	r2, [fp, #-40]
	ldrh	r3, [fp, #-46]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-48]	@ movhi
	ldrsh	r3, [fp, #-44]
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-48]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-50]	@ movhi
	ldrh	r2, [fp, #-50]
	ldrh	r3, [fp, #-42]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-52]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-54]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #8]	@ movhi
	strh	r3, [fp, #-56]	@ movhi
	ldrh	r2, [fp, #-54]
	ldrh	r3, [fp, #-56]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-58]	@ movhi
	ldrh	r2, [fp, #-54]
	ldrh	r3, [fp, #-56]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-60]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #4]	@ movhi
	strh	r3, [fp, #-62]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #12]	@ movhi
	strh	r3, [fp, #-64]	@ movhi
	ldrh	r2, [fp, #-62]
	ldrh	r3, [fp, #-64]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-66]	@ movhi
	ldrh	r2, [fp, #-62]
	ldrh	r3, [fp, #-64]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-68]	@ movhi
	ldrsh	r3, [fp, #-66]
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-68]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-70]	@ movhi
	ldrh	r2, [fp, #-58]
	ldrh	r3, [fp, #-68]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-72]	@ movhi
	ldrh	r2, [fp, #-58]
	ldrh	r3, [fp, #-68]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-74]	@ movhi
	ldrh	r2, [fp, #-60]
	ldrh	r3, [fp, #-70]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-76]	@ movhi
	ldrh	r2, [fp, #-60]
	ldrh	r3, [fp, #-70]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-78]	@ movhi
	ldrh	r2, [fp, #-72]
	ldrh	r3, [fp, #-46]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-76]
	ldrh	r3, [fp, #-48]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-78]
	ldrh	r3, [fp, #-50]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-74]
	ldrh	r3, [fp, #-52]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #6
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-74]
	ldrh	r3, [fp, #-52]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-78]
	ldrh	r3, [fp, #-50]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #10
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-76]
	ldrh	r3, [fp, #-48]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #12
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrh	r2, [fp, #-72]
	ldrh	r3, [fp, #-46]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #14
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
.L337:
	ldr	r3, [fp, #-20]
	add	r3, r3, #16
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L335:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L338
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L340:
	.align	2
.L339:
	.word	gCoeffBuf
	.size	idctRows, .-idctRows
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	idctCols, %function
idctCols:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 72
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #76
	ldr	r3, .L346
	str	r3, [fp, #-20]
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L342
.L345:
	ldr	r3, [fp, #-20]
	add	r3, r3, #16
	ldrsh	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #32
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #48
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #64
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #80
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #96
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	add	r3, r3, #112
	ldrsh	r3, [r3]
	orr	r3, r2, r3
	lsl	r3, r3, #16
	asr	r3, r3, #16
	cmp	r3, #0
	bne	.L343
	ldr	r3, [fp, #-20]
	ldrsh	r3, [r3]
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	strb	r3, [fp, #-79]
	ldrb	r3, [fp, #-79]	@ zero_extendqisi2
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #16
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #32
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #48
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #64
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #80
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #96
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	add	r3, r3, #112
	ldrb	r2, [fp, #-79]	@ zero_extendqisi2
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	b	.L344
.L343:
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #80]	@ movhi
	strh	r3, [fp, #-22]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #48]	@ movhi
	strh	r3, [fp, #-24]	@ movhi
	ldrh	r2, [fp, #-22]
	ldrh	r3, [fp, #-24]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-26]	@ movhi
	ldrh	r2, [fp, #-22]
	ldrh	r3, [fp, #-24]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-28]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #16]	@ movhi
	strh	r3, [fp, #-30]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #112]	@ movhi
	strh	r3, [fp, #-32]	@ movhi
	ldrh	r2, [fp, #-30]
	ldrh	r3, [fp, #-32]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldrh	r2, [fp, #-30]
	ldrh	r3, [fp, #-32]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-36]	@ movhi
	ldrh	r2, [fp, #-26]
	ldrh	r3, [fp, #-36]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	imul_b5
	mov	r3, r0
	strh	r3, [fp, #-38]	@ movhi
	ldrsh	r3, [fp, #-36]
	mov	r0, r3
	bl	imul_b4
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-38]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-40]	@ movhi
	ldrh	r4, [fp, #-38]
	ldrsh	r3, [fp, #-26]
	mov	r0, r3
	bl	imul_b2
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r4, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-42]	@ movhi
	ldrh	r2, [fp, #-34]
	ldrh	r3, [fp, #-28]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-44]	@ movhi
	ldrh	r2, [fp, #-34]
	ldrh	r3, [fp, #-28]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-46]	@ movhi
	ldrh	r2, [fp, #-40]
	ldrh	r3, [fp, #-46]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-48]	@ movhi
	ldrsh	r3, [fp, #-44]
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-48]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-50]	@ movhi
	ldrh	r2, [fp, #-50]
	ldrh	r3, [fp, #-42]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-52]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3]	@ movhi
	strh	r3, [fp, #-54]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #64]	@ movhi
	strh	r3, [fp, #-56]	@ movhi
	ldrh	r2, [fp, #-54]
	ldrh	r3, [fp, #-56]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-58]	@ movhi
	ldrh	r2, [fp, #-54]
	ldrh	r3, [fp, #-56]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-60]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #32]	@ movhi
	strh	r3, [fp, #-62]	@ movhi
	ldr	r3, [fp, #-20]
	ldrh	r3, [r3, #96]	@ movhi
	strh	r3, [fp, #-64]	@ movhi
	ldrh	r2, [fp, #-62]
	ldrh	r3, [fp, #-64]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-66]	@ movhi
	ldrh	r2, [fp, #-62]
	ldrh	r3, [fp, #-64]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-68]	@ movhi
	ldrsh	r3, [fp, #-66]
	mov	r0, r3
	bl	imul_b1_b3
	mov	r3, r0
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-68]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-70]	@ movhi
	ldrh	r2, [fp, #-58]
	ldrh	r3, [fp, #-68]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-72]	@ movhi
	ldrh	r2, [fp, #-58]
	ldrh	r3, [fp, #-68]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-74]	@ movhi
	ldrh	r2, [fp, #-60]
	ldrh	r3, [fp, #-70]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-76]	@ movhi
	ldrh	r2, [fp, #-60]
	ldrh	r3, [fp, #-70]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-78]	@ movhi
	ldrsh	r2, [fp, #-72]
	ldrsh	r3, [fp, #-46]
	add	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r3, [fp, #-20]
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-76]
	ldrsh	r3, [fp, #-48]
	add	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #16
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-78]
	ldrsh	r3, [fp, #-50]
	add	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #32
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-74]
	ldrsh	r3, [fp, #-52]
	sub	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #48
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-74]
	ldrsh	r3, [fp, #-52]
	add	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #64
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-78]
	ldrsh	r3, [fp, #-50]
	sub	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #80
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-76]
	ldrsh	r3, [fp, #-48]
	sub	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #96
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
	ldrsh	r2, [fp, #-72]
	ldrsh	r3, [fp, #-46]
	sub	r3, r2, r3
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #112
	lsl	r2, r2, #16
	asr	r2, r2, #16
	strh	r2, [r3]	@ movhi
.L344:
	ldr	r3, [fp, #-20]
	add	r3, r3, #2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L342:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L345
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L347:
	.align	2
.L346:
	.word	gCoeffBuf
	.size	idctCols, .-idctCols
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	addAndClamp, %function
addAndClamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-5]
	mov	r3, r2	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-8]
	add	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-8]
	cmp	r3, #255
	bls	.L349
	ldrsh	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L350
	mov	r3, #0
	b	.L351
.L350:
	ldrsh	r3, [fp, #-8]
	cmp	r3, #255
	ble	.L349
	mov	r3, #255
	b	.L351
.L349:
	ldrh	r3, [fp, #-8]	@ movhi
	and	r3, r3, #255
.L351:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	addAndClamp, .-addAndClamp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	subAndClamp, %function
subAndClamp:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-5]
	mov	r3, r2	@ movhi
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-8]
	sub	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r3, [fp, #-8]
	cmp	r3, #255
	bls	.L353
	ldrsh	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L354
	mov	r3, #0
	b	.L355
.L354:
	ldrsh	r3, [fp, #-8]
	cmp	r3, #255
	ble	.L353
	mov	r3, #255
	b	.L355
.L353:
	ldrh	r3, [fp, #-8]	@ movhi
	and	r3, r3, #255
.L355:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	subAndClamp, .-subAndClamp
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	upsampleCb, %function
upsampleCb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-37]
	mov	r3, r2
	strb	r3, [fp, #-38]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, .L361
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L361+4
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L361+8
	add	r3, r3, r2
	str	r3, [fp, #-28]
	mov	r3, #0
	strb	r3, [fp, #-14]
	b	.L357
.L360:
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L358
.L359:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-29]
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-32]	@ movhi
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-32]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #9
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #9
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-34]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #9
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #9
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L358:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L359
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-14]
.L357:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L360
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L362:
	.align	2
.L361:
	.word	gCoeffBuf
	.word	gMCUBufG
	.word	gMCUBufB
	.size	upsampleCb, .-upsampleCb
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	upsampleCbH, %function
upsampleCbH:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-37]
	mov	r3, r2
	strb	r3, [fp, #-38]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, .L368
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L368+4
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L368+8
	add	r3, r3, r2
	str	r3, [fp, #-28]
	mov	r3, #0
	strb	r3, [fp, #-14]
	b	.L364
.L367:
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L365
.L366:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-29]
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-32]	@ movhi
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-32]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-34]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L365:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L366
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-14]
.L364:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L367
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L369:
	.align	2
.L368:
	.word	gCoeffBuf
	.word	gMCUBufG
	.word	gMCUBufB
	.size	upsampleCbH, .-upsampleCbH
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	upsampleCbV, %function
upsampleCbV:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-37]
	mov	r3, r2
	strb	r3, [fp, #-38]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, .L375
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L375+4
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L375+8
	add	r3, r3, r2
	str	r3, [fp, #-28]
	mov	r3, #0
	strb	r3, [fp, #-14]
	b	.L371
.L374:
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L372
.L373:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-29]
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-32]	@ movhi
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-32]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-34]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L372:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L373
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-14]
.L371:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L374
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L376:
	.align	2
.L375:
	.word	gCoeffBuf
	.word	gMCUBufG
	.word	gMCUBufB
	.size	upsampleCbV, .-upsampleCbV
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	upsampleCr, %function
upsampleCr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-37]
	mov	r3, r2
	strb	r3, [fp, #-38]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, .L382
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L382+4
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L382+8
	add	r3, r3, r2
	str	r3, [fp, #-28]
	mov	r3, #0
	strb	r3, [fp, #-14]
	b	.L378
.L381:
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L379
.L380:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-32]	@ movhi
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-32]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #9
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #9
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-34]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-28]
	add	r3, r3, #9
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #9
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L379:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L380
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-14]
.L378:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L381
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L383:
	.align	2
.L382:
	.word	gCoeffBuf
	.word	gMCUBufR
	.word	gMCUBufG
	.size	upsampleCr, .-upsampleCr
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	upsampleCrH, %function
upsampleCrH:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-37]
	mov	r3, r2
	strb	r3, [fp, #-38]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, .L389
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L389+4
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L389+8
	add	r3, r3, r2
	str	r3, [fp, #-28]
	mov	r3, #0
	strb	r3, [fp, #-14]
	b	.L385
.L388:
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L386
.L387:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-32]	@ movhi
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-32]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-34]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #1
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L386:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L387
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-14]
.L385:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L388
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L390:
	.align	2
.L389:
	.word	gCoeffBuf
	.word	gMCUBufR
	.word	gMCUBufG
	.size	upsampleCrH, .-upsampleCrH
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	upsampleCrV, %function
upsampleCrV:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	mov	r3, r0
	mov	r2, r1
	strb	r3, [fp, #-37]
	mov	r3, r2
	strb	r3, [fp, #-38]
	ldrb	r3, [fp, #-37]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, .L396
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L396+4
	add	r3, r3, r2
	str	r3, [fp, #-24]
	ldrb	r3, [fp, #-38]	@ zero_extendqisi2
	ldr	r2, .L396+8
	add	r3, r3, r2
	str	r3, [fp, #-28]
	mov	r3, #0
	strb	r3, [fp, #-14]
	b	.L392
.L395:
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L393
.L394:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-32]	@ movhi
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-32]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-24]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-32]
	mov	r1, r3
	mov	r0, r2
	bl	addAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldrb	r2, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-34]	@ movhi
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-34]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-28]
	strb	r2, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r4, r3, #8
	ldrsh	r3, [fp, #-34]
	mov	r1, r3
	mov	r0, r2
	bl	subAndClamp
	mov	r3, r0
	strb	r3, [r4]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L393:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #7
	bls	.L394
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	str	r3, [fp, #-28]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-14]
.L392:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #3
	bls	.L395
	nop
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L397:
	.align	2
.L396:
	.word	gCoeffBuf
	.word	gMCUBufR
	.word	gMCUBufG
	.size	upsampleCrV, .-upsampleCrV
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	copyY, %function
copyY:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	mov	r3, r0
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L401
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L401+4
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L401+8
	add	r3, r3, r2
	str	r3, [fp, #-20]
	ldr	r3, .L401+12
	str	r3, [fp, #-24]
	mov	r3, #64
	strb	r3, [fp, #-5]
	b	.L399
.L400:
	ldr	r3, [fp, #-24]
	add	r2, r3, #2
	str	r2, [fp, #-24]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-25]
	ldr	r3, [fp, #-12]
	add	r2, r3, #1
	str	r2, [fp, #-12]
	ldrb	r2, [fp, #-25]
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r2, r3, #1
	str	r2, [fp, #-16]
	ldrb	r2, [fp, #-25]
	strb	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r2, r3, #1
	str	r2, [fp, #-20]
	ldrb	r2, [fp, #-25]
	strb	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #1
	strb	r3, [fp, #-5]
.L399:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L400
	nop
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L402:
	.align	2
.L401:
	.word	gMCUBufR
	.word	gMCUBufG
	.word	gMCUBufB
	.word	gCoeffBuf
	.size	copyY, .-copyY
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	convertCb, %function
convertCb:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r3, r0
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L406
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L406+4
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, .L406+8
	str	r3, [fp, #-20]
	mov	r3, #64
	strb	r3, [fp, #-5]
	b	.L404
.L405:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-21]
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-24]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-26]	@ movhi
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-26]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #1
	strb	r3, [fp, #-5]
.L404:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L405
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L407:
	.align	2
.L406:
	.word	gMCUBufG
	.word	gMCUBufB
	.word	gCoeffBuf
	.size	convertCb, .-convertCb
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	convertCr, %function
convertCr:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	mov	r3, r0
	strb	r3, [fp, #-29]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L411
	add	r3, r3, r2
	str	r3, [fp, #-12]
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	ldr	r2, .L411+4
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, .L411+8
	str	r3, [fp, #-20]
	mov	r3, #64
	strb	r3, [fp, #-5]
	b	.L409
.L410:
	ldr	r3, [fp, #-20]
	add	r2, r3, #2
	str	r2, [fp, #-20]
	ldrsh	r3, [r3]
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-24]	@ movhi
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-24]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-12]
	strb	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-26]	@ movhi
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-26]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, [fp, #-16]
	strb	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	sub	r3, r3, #1
	strb	r3, [fp, #-5]
.L409:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L410
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L412:
	.align	2
.L411:
	.word	gMCUBufR
	.word	gMCUBufG
	.word	gCoeffBuf
	.size	convertCr, .-convertCr
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	transformBlock, %function
transformBlock:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, r0
	strb	r3, [fp, #-5]
	bl	idctRows
	bl	idctCols
	ldr	r3, .L450
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L445
.L416:
	.word	.L420
	.word	.L419
	.word	.L418
	.word	.L417
	.word	.L415
.L420:
	mov	r0, #0
	bl	copyY
	b	.L414
.L419:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L421
	cmp	r3, #2
	bgt	.L446
	cmp	r3, #0
	beq	.L423
	cmp	r3, #1
	beq	.L424
	b	.L446
.L423:
	mov	r0, #0
	bl	copyY
	b	.L422
.L424:
	mov	r0, #0
	bl	convertCb
	b	.L422
.L421:
	mov	r0, #0
	bl	convertCr
	nop
.L422:
	b	.L446
.L417:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L447
.L427:
	.word	.L430
	.word	.L429
	.word	.L428
	.word	.L426
.L430:
	mov	r0, #0
	bl	copyY
	b	.L425
.L429:
	mov	r0, #128
	bl	copyY
	b	.L425
.L428:
	mov	r1, #0
	mov	r0, #0
	bl	upsampleCbV
	mov	r1, #128
	mov	r0, #32
	bl	upsampleCbV
	b	.L425
.L426:
	mov	r1, #0
	mov	r0, #0
	bl	upsampleCrV
	mov	r1, #128
	mov	r0, #32
	bl	upsampleCrV
	nop
.L425:
	b	.L447
.L418:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L448
.L433:
	.word	.L436
	.word	.L435
	.word	.L434
	.word	.L432
.L436:
	mov	r0, #0
	bl	copyY
	b	.L431
.L435:
	mov	r0, #64
	bl	copyY
	b	.L431
.L434:
	mov	r1, #0
	mov	r0, #0
	bl	upsampleCbH
	mov	r1, #64
	mov	r0, #4
	bl	upsampleCbH
	b	.L431
.L432:
	mov	r1, #0
	mov	r0, #0
	bl	upsampleCrH
	mov	r1, #64
	mov	r0, #4
	bl	upsampleCrH
	nop
.L431:
	b	.L448
.L415:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L449
.L439:
	.word	.L444
	.word	.L443
	.word	.L442
	.word	.L441
	.word	.L440
	.word	.L438
.L444:
	mov	r0, #0
	bl	copyY
	b	.L437
.L443:
	mov	r0, #64
	bl	copyY
	b	.L437
.L442:
	mov	r0, #128
	bl	copyY
	b	.L437
.L441:
	mov	r0, #192
	bl	copyY
	b	.L437
.L440:
	mov	r1, #0
	mov	r0, #0
	bl	upsampleCb
	mov	r1, #64
	mov	r0, #4
	bl	upsampleCb
	mov	r1, #128
	mov	r0, #32
	bl	upsampleCb
	mov	r1, #192
	mov	r0, #36
	bl	upsampleCb
	b	.L437
.L438:
	mov	r1, #0
	mov	r0, #0
	bl	upsampleCr
	mov	r1, #64
	mov	r0, #4
	bl	upsampleCr
	mov	r1, #128
	mov	r0, #32
	bl	upsampleCr
	mov	r1, #192
	mov	r0, #36
	bl	upsampleCr
	nop
.L437:
	b	.L449
.L446:
	nop
	b	.L445
.L447:
	nop
	b	.L445
.L448:
	nop
	b	.L445
.L449:
	nop
.L414:
.L445:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L451:
	.align	2
.L450:
	.word	gScanType
	.size	transformBlock, .-transformBlock
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	transformBlockReduce, %function
transformBlockReduce:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldr	r3, .L489
	ldrsh	r3, [r3]
	add	r3, r3, #64
	lsr	r3, r3, #7
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r3, #128
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	mov	r0, r3
	bl	clamp
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldr	r3, .L489+4
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L484
.L455:
	.word	.L459
	.word	.L458
	.word	.L457
	.word	.L456
	.word	.L454
.L459:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	b	.L453
.L458:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #2
	beq	.L460
	cmp	r3, #2
	bgt	.L485
	cmp	r3, #0
	beq	.L462
	cmp	r3, #1
	beq	.L463
	b	.L485
.L462:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	b	.L461
.L463:
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-12]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, .L489+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3]
	b	.L461
.L460:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
	ldr	r3, .L489+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	nop
.L461:
	b	.L485
.L456:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L486
.L466:
	.word	.L469
	.word	.L468
	.word	.L467
	.word	.L465
.L469:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	b	.L464
.L468:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #128]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #128]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #128]
	b	.L464
.L467:
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-12]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #128]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, .L489+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3]
	ldr	r3, .L489+16
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3, #128]
	b	.L464
.L465:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
	ldr	r3, .L489+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3]
	ldr	r3, .L489+8
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3, #128]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #128]
	nop
.L464:
	b	.L486
.L457:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L487
.L472:
	.word	.L475
	.word	.L474
	.word	.L473
	.word	.L471
.L475:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	b	.L470
.L474:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #64]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #64]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #64]
	b	.L470
.L473:
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-12]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #64]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, .L489+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3]
	ldr	r3, .L489+16
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3, #64]
	b	.L470
.L471:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
	ldr	r3, .L489+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3]
	ldr	r3, .L489+8
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3, #64]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #64]
	nop
.L470:
	b	.L487
.L454:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #5
	ldrls	pc, [pc, r3, asl #2]
	b	.L488
.L478:
	.word	.L483
	.word	.L482
	.word	.L481
	.word	.L480
	.word	.L479
	.word	.L477
.L483:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2]
	b	.L476
.L482:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #64]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #64]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #64]
	b	.L476
.L481:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #128]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #128]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #128]
	b	.L476
.L480:
	ldr	r2, .L489+8
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #192]
	ldr	r2, .L489+12
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #192]
	ldr	r2, .L489+16
	ldrb	r3, [fp, #-5]
	strb	r3, [r2, #192]
	b	.L476
.L479:
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #44
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-12]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #64]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #128]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #192]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-12]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #192]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r2, r3, #5
	add	r3, r3, r2
	lsl	r3, r3, #1
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #227
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-14]	@ movhi
	ldr	r3, .L489+16
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3]
	ldr	r3, .L489+16
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3, #64]
	ldr	r3, .L489+16
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3, #128]
	ldr	r3, .L489+16
	ldrb	r3, [r3, #192]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-14]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+16
	strb	r2, [r3, #192]
	b	.L476
.L477:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	lsl	r3, r3, #16
	lsr	r1, r3, #16
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r0, r3, #4
	add	r3, r3, r0
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	add	r3, r1, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #179
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-8]	@ movhi
	ldr	r3, .L489+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3]
	ldr	r3, .L489+8
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3, #64]
	ldr	r3, .L489+8
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3, #128]
	ldr	r3, .L489+8
	ldrb	r3, [r3, #192]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	addAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+8
	strb	r2, [r3, #192]
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	mov	r3, r2
	lsl	r3, r3, #4
	sub	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r2, r3, #2
	sub	r3, r2, r3
	lsr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	sub	r3, r3, #91
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [fp, #-10]	@ movhi
	ldr	r3, .L489+12
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #64]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #64]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #128]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #128]
	ldr	r3, .L489+12
	ldrb	r3, [r3, #192]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	subAndClamp
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L489+12
	strb	r2, [r3, #192]
	nop
.L476:
	b	.L488
.L485:
	nop
	b	.L484
.L486:
	nop
	b	.L484
.L487:
	nop
	b	.L484
.L488:
	nop
.L453:
.L484:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L490:
	.align	2
.L489:
	.word	gCoeffBuf
	.word	gScanType
	.word	gMCUBufR
	.word	gMCUBufG
	.word	gMCUBufB
	.size	transformBlockReduce, .-transformBlockReduce
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	decodeNextMCU, %function
decodeNextMCU:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L541
	ldrh	r3, [r3]
	cmp	r3, #0
	beq	.L492
	ldr	r3, .L541+4
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L493
	bl	processRestart
	mov	r3, r0
	strb	r3, [fp, #-11]
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L493
	ldrb	r3, [fp, #-11]	@ zero_extendqisi2
	b	.L494
.L493:
	ldr	r3, .L541+4
	ldrh	r3, [r3]
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L541+4
	strh	r3, [r2]	@ movhi
.L492:
	mov	r3, #0
	strb	r3, [fp, #-5]
	b	.L495
.L538:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	ldr	r2, .L541+8
	ldrb	r3, [r2, r3]
	strb	r3, [fp, #-12]
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	ldr	r2, .L541+12
	ldrb	r3, [r2, r3]
	strb	r3, [fp, #-13]
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	ldr	r2, .L541+16
	ldrb	r3, [r2, r3]
	strb	r3, [fp, #-14]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L496
	ldr	r3, .L541+20
	b	.L497
.L496:
	ldr	r3, .L541+24
.L497:
	str	r3, [fp, #-20]
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L498
	ldr	r2, .L541+28
	b	.L499
.L498:
	ldr	r2, .L541+32
.L499:
	ldrb	r3, [fp, #-14]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L500
	ldr	r3, .L541+36
	b	.L501
.L500:
	ldr	r3, .L541+40
.L501:
	mov	r1, r3
	mov	r0, r2
	bl	huffDecode
	mov	r3, r0
	strb	r3, [fp, #-21]
	mov	r3, #0
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-21]
	and	r3, r3, #15
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L502
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, r3
	bl	getBits2
	mov	r3, r0
	strh	r3, [fp, #-8]	@ movhi
.L502:
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldrh	r3, [fp, #-8]
	mov	r1, r2
	mov	r0, r3
	bl	huffExtend
	mov	r3, r0
	strh	r3, [fp, #-24]	@ movhi
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	ldr	r2, .L541+44
	lsl	r3, r3, #1
	add	r3, r2, r3
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r2, r3, #16
	ldrh	r3, [fp, #-24]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-24]	@ movhi
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	ldrsh	r2, [fp, #-24]
	ldr	r1, .L541+44
	lsl	r3, r3, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	ldr	r3, [fp, #-20]
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldrh	r2, [fp, #-24]	@ movhi
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r3, r3, #16
	asr	r3, r3, #16
	ldr	r2, .L541+48
	strh	r3, [r2]	@ movhi
	ldrb	r3, [fp, #-12]	@ zero_extendqisi2
	ldr	r2, .L541+52
	ldrb	r3, [r2, r3]
	strb	r3, [fp, #-25]
	ldr	r3, .L541+56
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L503
	mov	r3, #1
	strb	r3, [fp, #-6]
	b	.L504
.L516:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L505
	ldr	r2, .L541+60
	b	.L506
.L505:
	ldr	r2, .L541+64
.L506:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L507
	ldr	r3, .L541+68
	b	.L508
.L507:
	ldr	r3, .L541+72
.L508:
	mov	r1, r3
	mov	r0, r2
	bl	huffDecode
	mov	r3, r0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]
	and	r3, r3, #15
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L509
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, r3
	bl	getBits2
.L509:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	lsr	r3, r3, #4
	and	r3, r3, #255
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-21]
	and	r3, r3, #15
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L510
	ldrh	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L511
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrh	r3, [fp, #-8]
	add	r3, r2, r3
	cmp	r3, #63
	ble	.L512
	mov	r3, #28
	b	.L494
.L512:
	ldrh	r3, [fp, #-8]	@ movhi
	and	r2, r3, #255
	ldrb	r3, [fp, #-6]
	add	r3, r2, r3
	strb	r3, [fp, #-6]
	b	.L511
.L510:
	ldrh	r3, [fp, #-8]
	cmp	r3, #15
	bne	.L539
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #48
	bls	.L514
	mov	r3, #28
	b	.L494
.L514:
	ldrb	r3, [fp, #-6]
	add	r3, r3, #15
	strb	r3, [fp, #-6]
.L511:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-6]
.L504:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #63
	bls	.L516
	b	.L515
.L539:
	nop
.L515:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	transformBlockReduce
	b	.L517
.L503:
	mov	r3, #1
	strb	r3, [fp, #-6]
	b	.L518
.L535:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L519
	ldr	r2, .L541+60
	b	.L520
.L519:
	ldr	r2, .L541+64
.L520:
	ldrb	r3, [fp, #-25]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L521
	ldr	r3, .L541+68
	b	.L522
.L521:
	ldr	r3, .L541+72
.L522:
	mov	r1, r3
	mov	r0, r2
	bl	huffDecode
	mov	r3, r0
	strb	r3, [fp, #-21]
	mov	r3, #0
	strh	r3, [fp, #-10]	@ movhi
	ldrb	r3, [fp, #-21]
	and	r3, r3, #15
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L523
	ldrb	r3, [fp, #-22]	@ zero_extendqisi2
	mov	r0, r3
	bl	getBits2
	mov	r3, r0
	strh	r3, [fp, #-10]	@ movhi
.L523:
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	lsr	r3, r3, #4
	and	r3, r3, #255
	strh	r3, [fp, #-8]	@ movhi
	ldrb	r3, [fp, #-21]
	and	r3, r3, #15
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-21]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L524
	ldrh	r3, [fp, #-8]
	cmp	r3, #0
	beq	.L525
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldrh	r3, [fp, #-8]
	add	r3, r2, r3
	cmp	r3, #63
	ble	.L527
	mov	r3, #28
	b	.L494
.L528:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r2, r3, #1
	strb	r2, [fp, #-6]
	mov	r2, r3
	ldr	r3, .L541+76
	ldrsb	r3, [r3, r2]
	ldr	r2, .L541+48
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldrh	r3, [fp, #-8]
	sub	r3, r3, #1
	strh	r3, [fp, #-8]	@ movhi
.L527:
	ldrh	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L528
.L525:
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldrh	r3, [fp, #-10]
	mov	r1, r2
	mov	r0, r3
	bl	huffExtend
	mov	r3, r0
	strh	r3, [fp, #-28]	@ movhi
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	lsl	r3, r3, #1
	ldr	r2, [fp, #-20]
	add	r3, r2, r3
	ldrsh	r3, [r3]
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldrh	r2, [fp, #-28]
	mul	r3, r2, r3
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldrb	r2, [fp, #-6]	@ zero_extendqisi2
	ldr	r1, .L541+76
	ldrsb	r2, [r1, r2]
	mov	r0, r2
	lsl	r3, r3, #16
	asr	r2, r3, #16
	ldr	r1, .L541+48
	lsl	r3, r0, #1
	add	r3, r1, r3
	strh	r2, [r3]	@ movhi
	b	.L529
.L524:
	ldrh	r3, [fp, #-8]
	cmp	r3, #15
	bne	.L540
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #48
	bls	.L531
	mov	r3, #28
	b	.L494
.L531:
	mov	r3, #16
	strh	r3, [fp, #-8]	@ movhi
	b	.L532
.L533:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r2, r3, #1
	strb	r2, [fp, #-6]
	mov	r2, r3
	ldr	r3, .L541+76
	ldrsb	r3, [r3, r2]
	ldr	r2, .L541+48
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3]	@ movhi
	ldrh	r3, [fp, #-8]
	sub	r3, r3, #1
	strh	r3, [fp, #-8]	@ movhi
.L532:
	ldrh	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L533
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	sub	r3, r3, #1
	strb	r3, [fp, #-6]
.L529:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-6]
.L518:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #63
	bls	.L535
	b	.L536
.L540:
	nop
	b	.L536
.L537:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	add	r2, r3, #1
	strb	r2, [fp, #-6]
	mov	r2, r3
	ldr	r3, .L541+76
	ldrsb	r3, [r3, r2]
	ldr	r2, .L541+48
	lsl	r3, r3, #1
	add	r3, r2, r3
	mov	r2, #0
	strh	r2, [r3]	@ movhi
.L536:
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #63
	bls	.L537
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	bl	transformBlock
.L517:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	add	r3, r3, #1
	strb	r3, [fp, #-5]
.L495:
	ldr	r3, .L541+80
	ldrb	r3, [r3]	@ zero_extendqisi2
	ldrb	r2, [fp, #-5]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L538
	mov	r3, #0
.L494:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L542:
	.align	2
.L541:
	.word	gRestartInterval
	.word	gRestartsLeft
	.word	gMCUOrg
	.word	gCompQuant
	.word	gCompDCTab
	.word	gQuant1
	.word	gQuant0
	.word	gHuffTab1
	.word	gHuffTab0
	.word	gHuffVal1
	.word	gHuffVal0
	.word	gLastDC
	.word	gCoeffBuf
	.word	gCompACTab
	.word	gReduce
	.word	gHuffTab3
	.word	gHuffTab2
	.word	gHuffVal3
	.word	gHuffVal2
	.word	ZAG
	.word	gMaxBlocksPerMCU
	.size	decodeNextMCU, .-decodeNextMCU
	.align	2
	.global	pjpeg_decode_mcu
	.syntax unified
	.arm
	.fpu softvfp
	.type	pjpeg_decode_mcu, %function
pjpeg_decode_mcu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L551
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L544
	ldr	r3, .L551
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L545
.L544:
	ldr	r3, .L551+4
	ldrh	r3, [r3]
	cmp	r3, #0
	bne	.L546
	mov	r3, #1
	b	.L545
.L546:
	bl	decodeNextMCU
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L547
	ldr	r3, .L551
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L548
.L547:
	ldr	r3, .L551
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L549
	ldr	r3, .L551
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L545
.L549:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L545
.L548:
	ldr	r3, .L551+4
	ldrh	r3, [r3]
	sub	r3, r3, #1
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	ldr	r2, .L551+4
	strh	r3, [r2]	@ movhi
	mov	r3, #0
.L545:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L552:
	.align	2
.L551:
	.word	gCallbackStatus
	.word	gNumMCUSRemaining
	.size	pjpeg_decode_mcu, .-pjpeg_decode_mcu
	.align	2
	.global	pjpeg_decode_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	pjpeg_decode_init, %function
pjpeg_decode_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	strb	r3, [fp, #-25]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #12]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #16]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	strb	r2, [r3, #20]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #24]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #28]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #32]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	mov	r2, #0
	str	r2, [r3, #40]
	ldr	r2, .L571
	ldr	r3, [fp, #-20]
	str	r3, [r2]
	ldr	r2, .L571+4
	ldr	r3, [fp, #-24]
	str	r3, [r2]
	ldr	r3, .L571+8
	mov	r2, #0
	strb	r2, [r3]
	ldr	r2, .L571+12
	ldrb	r3, [fp, #-25]
	strb	r3, [r2]
	bl	init
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L554
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L555
.L554:
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L556
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L558
.L556:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L558
.L555:
	bl	locateSOFMarker
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L559
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L560
.L559:
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L561
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L558
.L561:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L558
.L560:
	bl	initFrame
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L563
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L564
.L563:
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L565
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L558
.L565:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L558
.L564:
	bl	initScan
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L567
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L568
.L567:
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	beq	.L569
	ldr	r3, .L571+8
	ldrb	r3, [r3]	@ zero_extendqisi2
	b	.L558
.L569:
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L558
.L568:
	ldr	r3, .L571+16
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3]
	ldr	r3, .L571+20
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, .L571+24
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #8]
	ldr	r3, .L571+28
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-16]
	strb	r2, [r3, #20]
	ldr	r3, .L571+32
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #12]
	ldr	r3, .L571+36
	ldrh	r3, [r3]
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #16]
	ldr	r3, .L571+40
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #24]
	ldr	r3, .L571+44
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-16]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-16]
	ldr	r2, .L571+48
	str	r2, [r3, #32]
	ldr	r3, [fp, #-16]
	ldr	r2, .L571+52
	str	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	ldr	r2, .L571+56
	str	r2, [r3, #40]
	mov	r3, #0
.L558:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L572:
	.align	2
.L571:
	.word	g_pNeedBytesCallback
	.word	g_pCallback_data
	.word	gCallbackStatus
	.word	gReduce
	.word	gImageXSize
	.word	gImageYSize
	.word	gCompsInFrame
	.word	gScanType
	.word	gMaxMCUSPerRow
	.word	gMaxMCUSPerCol
	.word	gMaxMCUXSize
	.word	gMaxMCUYSize
	.word	gMCUBufR
	.word	gMCUBufG
	.word	gMCUBufB
	.size	pjpeg_decode_init, .-pjpeg_decode_init
	.global	jpeg_data
	.section	.rodata
	.align	2
	.type	jpeg_data, %object
	.size	jpeg_data, 570
jpeg_data:
	.ascii	"\377\330\377\340\000\020JFIF\000\001\001\001\000H\000"
	.ascii	"H\000\000\377\333\000C\000P7<F<2PFAFZUP_x\310\202xn"
	.ascii	"nx\365\257\271\221\310\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\377\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\377\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\377\333\000C\001UZZxix\353\202\202"
	.ascii	"\353\377\377\377\377\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\377\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\377\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\377\377\377\377\377\377\377\377\377"
	.ascii	"\377\377\377\377\300\000\021\010\000@\0003\003\001\021"
	.ascii	"\000\002\021\001\003\021\001\377\304\000\030\000\000"
	.ascii	"\003\001\001\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\001\002\003\000\004\377\304\000&\020\000\002"
	.ascii	"\002\001\003\003\004\003\001\000\000\000\000\000\000"
	.ascii	"\000\001\002\000\021\003\022!1Aaq\004\"S\221\023#Qb"
	.ascii	"\377\304\000\025\001\001\001\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\000\000\000\001\377\304\000"
	.ascii	"\024\021\001\000\000\000\000\000\000\000\000\000\000"
	.ascii	"\000\000\000\000\000\000\377\332\000\014\003\001\000"
	.ascii	"\002\021\003\021\000?\000\307\210\013(Mf\341\002\317"
	.ascii	"X\005E\210\000\251\0204\016\257ohT3d\003a\002jI\333"
	.ascii	"I\204YP\221P\240=\244\200|\210\030\325H\005\011C\353"
	.ascii	"\377\000+\365\002x\324\034\254H\020\216\265U\250\014"
	.ascii	"\245/\333R*\031S\366\202\004\241\016E\370\204\015\255"
	.ascii	"~! \3200\004\223\\\231C\342\306W \324\327} :\341@\366"
	.ascii	"I\361 \243\213\027\305\011G&5\005\265\036 u\002\225"
	.ascii	"\300\372\201\317R\014l\015\240%\275\335\321\363*(C\260"
	.ascii	"\004\016:\334)\262\023\370j\021%S\"\251}\340.\250\006"
	.ascii	"\301\332\240)!M05*(\271\027\205\006\025P\227\214\330"
	.ascii	"\357 \345\001\371\323R\241\265\016\260\024\22092(\342"
	.ascii	"`\331\027\314\242\331\261\0025X\036`\014X\225\006\246"
	.ascii	" \370\220;gA\260\263\002O\234U@\216\265\376\011Q\022"
	.ascii	"\327\001\375;\021\231{\230U}K\273d\000\354\275\004\005"
	.ascii	"Eb6\262;B\033*\034@t\270\021\006\000\270\037\377\331"
	.global	jpeg_off
	.bss
	.align	2
	.type	jpeg_off, %object
	.size	jpeg_off, 4
jpeg_off:
	.space	4
	.text
	.align	2
	.global	pjpeg_need_bytes_callback
	.syntax unified
	.arm
	.fpu softvfp
	.type	pjpeg_need_bytes_callback, %function
pjpeg_need_bytes_callback:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-16]
	str	r2, [fp, #-24]
	str	r3, [fp, #-28]
	mov	r3, r1
	strb	r3, [fp, #-17]
	ldrb	r2, [fp, #-17]	@ zero_extendqisi2
	ldr	r3, .L575
	ldr	r3, [r3]
	rsb	r3, r3, #568
	add	r3, r3, #2
	cmp	r2, r3
	movcc	r3, r2
	movcs	r3, r3
	str	r3, [fp, #-8]
	ldr	r3, .L575
	ldr	r3, [r3]
	ldr	r2, .L575+4
	add	r3, r3, r2
	ldr	r2, [fp, #-8]
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	memcpy
	ldr	r3, [fp, #-8]
	and	r2, r3, #255
	ldr	r3, [fp, #-24]
	strb	r2, [r3]
	ldr	r3, .L575
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldr	r2, .L575
	str	r3, [r2]
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L576:
	.align	2
.L575:
	.word	jpeg_off
	.word	jpeg_data
	.size	pjpeg_need_bytes_callback, .-pjpeg_need_bytes_callback
	.align	2
	.global	beebs_picojpeg_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_picojpeg_verify_benchmark, %function
beebs_picojpeg_verify_benchmark:
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
	.size	beebs_picojpeg_verify_benchmark, .-beebs_picojpeg_verify_benchmark
	.align	2
	.global	beebs_picojpeg_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_picojpeg_initialise_benchmark, %function
beebs_picojpeg_initialise_benchmark:
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
	.size	beebs_picojpeg_initialise_benchmark, .-beebs_picojpeg_initialise_benchmark
	.align	2
	.global	beebs_picojpeg_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_picojpeg_benchmark, %function
beebs_picojpeg_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #48
	ldr	r3, .L587
	mov	r2, #0
	str	r2, [r3]
	sub	r0, fp, #52
	mov	r3, #0
	mov	r2, #0
	ldr	r1, .L587+4
	bl	pjpeg_decode_init
	mov	r3, r0
	strb	r3, [fp, #-5]
.L583:
	bl	pjpeg_decode_mcu
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #1
	beq	.L586
	b	.L583
.L586:
	nop
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L588:
	.align	2
.L587:
	.word	jpeg_off
	.word	pjpeg_need_bytes_callback
	.size	beebs_picojpeg_benchmark, .-beebs_picojpeg_benchmark
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
