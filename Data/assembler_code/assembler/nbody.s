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
	.file	"nbody.c"
	.text
	.data
	.align	3
	.type	solar_bodies, %object
	.size	solar_bodies, 320
solar_bodies:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.space	8
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	-910277154
	.word	1078181180
	.word	876402988
	.word	1075010976
	.word	-1071654020
	.word	-1074622293
	.word	1814424560
	.word	-1078294791
	.space	8
	.word	-1684812612
	.word	1071867654
	.word	-176319333
	.word	1074167538
	.word	-1705375979
	.word	-1080438057
	.word	-643091496
	.word	1067666581
	.word	-1020081561
	.word	1075883981
	.word	836633008
	.word	1074823115
	.word	-504674692
	.word	-1076243629
	.space	8
	.word	-1199074238
	.word	-1074779103
	.word	-1088450797
	.word	1073559017
	.word	1594958772
	.word	1065434184
	.word	218613303
	.word	1065819465
	.word	-827860529
	.word	1076480490
	.word	-702126466
	.word	-1070712600
	.word	-1104839264
	.word	-1077111465
	.space	8
	.word	-1450107921
	.word	1072780060
	.word	1045740485
	.word	1072417919
	.word	-84787588
	.word	-1081725077
	.word	-1661722957
	.word	1063009746
	.word	-1459267798
	.word	1076806247
	.word	868786720
	.word	-1069946024
	.word	-1817451200
	.word	1070002675
	.space	8
	.word	374979658
	.word	1072649398
	.word	834993059
	.word	1071843270
	.word	1484154358
	.word	-1079915640
	.word	1394055596
	.word	1063299315
	.section	.rodata
	.align	2
	.type	BODIES_SIZE, %object
	.size	BODIES_SIZE, 4
BODIES_SIZE:
	.word	5
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_dsub
	.text
	.align	2
	.global	offset_momentum
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	offset_momentum, %function
offset_momentum:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #16
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L3
.L4:
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r4-r5}
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-24]
	add	r2, r2, r3
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-16]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-24]
	add	r3, r2, r3
	add	r3, r3, #56
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	adr	r3, .L6
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r0, [fp, #-24]
	ldr	r1, [fp, #-20]
	add	r1, r1, #4
	lsl	r1, r1, #3
	add	r1, r0, r1
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
.L3:
	ldr	r3, [fp, #-20]
	cmp	r3, #2
	bls	.L4
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L2:
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-28]
	cmp	r2, r3
	bcc	.L5
	nop
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, fp, lr}
	bx	lr
.L7:
	.align	3
.L6:
	.word	-910277154
	.word	1078181180
	.size	offset_momentum, .-offset_momentum
	.global	__aeabi_dadd
	.align	2
	.global	bodies_energy
	.syntax unified
	.arm
	.fpu softvfp
	.type	bodies_energy, %function
bodies_energy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #64
	str	r0, [fp, #-80]
	str	r1, [fp, #-84]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L9
.L14:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r5, r3, #56
	ldmia	r5, {r4-r5}
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r1, r3, #32
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r3, r3, #32
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r1, r3, #40
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r3, r3, #40
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r1, r3, #48
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r3, r3, #48
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	mov	r2, #0
	mov	r3, #1073741824
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-36]
	b	.L10
.L13:
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L11
.L12:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r0-r1}
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r2, r2, r3
	ldr	r3, [fp, #-40]
	lsl	r3, r3, #3
	add	r3, r2, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	ldr	r1, [fp, #-40]
	lsl	r1, r1, #3
	sub	r1, r1, #20
	add	r1, r1, fp
	sub	r1, r1, #56
	stm	r1, {r2-r3}
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L11:
	ldr	r3, [fp, #-40]
	cmp	r3, #2
	bls	.L12
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r4, r2
	mov	r5, r3
	sub	r1, fp, #60
	ldmia	r1, {r0-r1}
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	bl	__aeabi_dadd
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	bl	sqrt
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r1, r3, #56
	ldmia	r1, {r0-r1}
	ldr	r3, [fp, #-36]
	lsl	r3, r3, #6
	ldr	r2, [fp, #-80]
	add	r3, r2, r3
	add	r3, r3, #56
	ldmia	r3, {r2-r3}
	bl	__aeabi_dmul
	mov	r2, r0
	mov	r3, r1
	mov	r0, r2
	mov	r1, r3
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	__aeabi_ddiv
	mov	r2, r0
	mov	r3, r1
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	bl	__aeabi_dsub
	mov	r2, r0
	mov	r3, r1
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-36]
	add	r3, r3, #1
	str	r3, [fp, #-36]
.L10:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	bcc	.L13
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L9:
	ldr	r2, [fp, #-32]
	ldr	r3, [fp, #-84]
	cmp	r2, r3
	bcc	.L14
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	mov	r0, r2
	mov	r1, r3
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
	.size	bodies_energy, .-bodies_energy
	.align	2
	.global	beebs_nbody_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nbody_initialise_benchmark, %function
beebs_nbody_initialise_benchmark:
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
	.size	beebs_nbody_initialise_benchmark, .-beebs_nbody_initialise_benchmark
	.align	2
	.global	beebs_nbody_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nbody_benchmark, %function
beebs_nbody_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #5
	mov	r1, r3
	ldr	r0, .L21
	bl	offset_momentum
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L18
.L19:
	mov	r3, #5
	mov	r1, r3
	ldr	r0, .L21
	bl	bodies_energy
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #99
	ble	.L19
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	solar_bodies
	.size	beebs_nbody_benchmark, .-beebs_nbody_benchmark
	.global	__aeabi_dcmpeq
	.align	2
	.global	beebs_nbody_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nbody_verify_benchmark, %function
beebs_nbody_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L24
.L34:
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L25
.L31:
	ldr	r1, .L41
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldmia	r3, {r0-r1}
	ldr	ip, .L41+4
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	lsl	r3, r3, #3
	add	r3, ip, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L38
	mov	r3, #0
	b	.L28
.L38:
	ldr	r1, .L41
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r3, #4
	lsl	r3, r3, #3
	add	r3, r1, r3
	ldmia	r3, {r0-r1}
	ldr	ip, .L41+4
	ldr	r3, [fp, #-8]
	lsl	r2, r3, #3
	ldr	r3, [fp, #-12]
	add	r3, r2, r3
	add	r3, r3, #4
	lsl	r3, r3, #3
	add	r3, ip, r3
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L39
	mov	r3, #0
	b	.L28
.L39:
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L25:
	ldr	r3, [fp, #-12]
	cmp	r3, #2
	ble	.L31
	ldr	r2, .L41
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #6
	add	r3, r2, r3
	add	r3, r3, #56
	ldmia	r3, {r0-r1}
	ldr	r2, .L41+4
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #6
	add	r3, r2, r3
	add	r3, r3, #56
	ldmia	r3, {r2-r3}
	bl	__aeabi_dcmpeq
	mov	r3, r0
	cmp	r3, #0
	bne	.L40
	mov	r3, #0
	b	.L28
.L40:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L24:
	mov	r2, #5
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	blt	.L34
	mov	r3, #1
.L28:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	solar_bodies
	.word	expected.0
	.size	beebs_nbody_verify_benchmark, .-beebs_nbody_verify_benchmark
	.data
	.align	3
	.type	expected.0, %object
	.size	expected.0, 320
expected.0:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.space	8
	.word	-1478437133
	.word	-1086756887
	.word	-28276229
	.word	-1083517716
	.word	520850034
	.word	1056512307
	.word	-910277154
	.word	1078181180
	.word	876402988
	.word	1075010976
	.word	-1071654020
	.word	-1074622293
	.word	1814424560
	.word	-1078294791
	.space	8
	.word	-1684812612
	.word	1071867654
	.word	-176319333
	.word	1074167538
	.word	-1705375979
	.word	-1080438057
	.word	-643091496
	.word	1067666581
	.word	-1020081561
	.word	1075883981
	.word	836633008
	.word	1074823115
	.word	-504674692
	.word	-1076243629
	.space	8
	.word	-1199074238
	.word	-1074779103
	.word	-1088450797
	.word	1073559017
	.word	1594958772
	.word	1065434184
	.word	218613303
	.word	1065819465
	.word	-827860529
	.word	1076480490
	.word	-702126466
	.word	-1070712600
	.word	-1104839264
	.word	-1077111465
	.space	8
	.word	-1450107921
	.word	1072780060
	.word	1045740485
	.word	1072417919
	.word	-84787588
	.word	-1081725077
	.word	-1661722957
	.word	1063009746
	.word	-1459267798
	.word	1076806247
	.word	868786720
	.word	-1069946024
	.word	-1817451200
	.word	1070002675
	.space	8
	.word	374979658
	.word	1072649398
	.word	834993059
	.word	1071843270
	.word	1484154358
	.word	-1079915640
	.word	1394055596
	.word	1063299315
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
