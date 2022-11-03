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
	.file	"des.c"
	.text
	.section	.rodata
	.align	2
	.type	data, %object
	.size	data, 16
data:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013\014"
	.ascii	"\015\016\017"
	.bss
	.align	2
result:
	.space	16
	.size	result, 16
	.global	des_ctx
	.align	2
	.type	des_ctx, %object
	.size	des_ctx, 128
des_ctx:
	.space	128
	.section	.rodata
	.align	2
	.type	des_keymap, %object
	.size	des_keymap, 2048
des_keymap:
	.word	34078728
	.word	34086912
	.word	8200
	.word	0
	.word	33562624
	.word	524296
	.word	34078720
	.word	34086920
	.word	8
	.word	33554432
	.word	532480
	.word	8200
	.word	532488
	.word	33562632
	.word	33554440
	.word	34078720
	.word	8192
	.word	532488
	.word	524296
	.word	33562624
	.word	34086920
	.word	33554440
	.word	0
	.word	532480
	.word	33554432
	.word	524288
	.word	33562632
	.word	34078728
	.word	524288
	.word	8192
	.word	34086912
	.word	8
	.word	524288
	.word	8192
	.word	33554440
	.word	34086920
	.word	8200
	.word	33554432
	.word	0
	.word	532480
	.word	34078728
	.word	33562632
	.word	33562624
	.word	524296
	.word	34086912
	.word	8
	.word	524296
	.word	33562624
	.word	34086920
	.word	524288
	.word	34078720
	.word	33554440
	.word	532480
	.word	8200
	.word	33562632
	.word	34078720
	.word	8
	.word	34086912
	.word	532488
	.word	0
	.word	33554432
	.word	34078728
	.word	8192
	.word	532488
	.word	134217732
	.word	131076
	.word	0
	.word	134349312
	.word	131076
	.word	512
	.word	134218244
	.word	131072
	.word	516
	.word	134349316
	.word	131584
	.word	134217728
	.word	134218240
	.word	134217732
	.word	134348800
	.word	131588
	.word	131072
	.word	134218244
	.word	134348804
	.word	0
	.word	512
	.word	4
	.word	134349312
	.word	134348804
	.word	134349316
	.word	134348800
	.word	134217728
	.word	516
	.word	4
	.word	131584
	.word	131588
	.word	134218240
	.word	516
	.word	134217728
	.word	134218240
	.word	131588
	.word	134349312
	.word	131076
	.word	0
	.word	134218240
	.word	134217728
	.word	512
	.word	134348804
	.word	131072
	.word	131076
	.word	134349316
	.word	131584
	.word	4
	.word	134349316
	.word	131584
	.word	131072
	.word	134218244
	.word	134217732
	.word	134348800
	.word	131588
	.word	0
	.word	512
	.word	134217732
	.word	134218244
	.word	134349312
	.word	134348800
	.word	516
	.word	4
	.word	134348804
	.word	-2147221248
	.word	16777472
	.word	-2147483648
	.word	-2130444032
	.word	0
	.word	17039360
	.word	-2130706176
	.word	-2147221504
	.word	17039616
	.word	-2130706432
	.word	16777216
	.word	-2147483392
	.word	-2130706432
	.word	-2147221248
	.word	262144
	.word	16777216
	.word	-2130444288
	.word	262400
	.word	256
	.word	-2147483648
	.word	262400
	.word	-2130706176
	.word	17039360
	.word	256
	.word	-2147483392
	.word	0
	.word	-2147221504
	.word	17039616
	.word	16777472
	.word	-2130444288
	.word	-2130444032
	.word	262144
	.word	-2130444288
	.word	-2147483392
	.word	262144
	.word	-2130706432
	.word	262400
	.word	16777472
	.word	-2147483648
	.word	17039360
	.word	-2130706176
	.word	0
	.word	256
	.word	-2147221504
	.word	0
	.word	-2130444288
	.word	17039616
	.word	256
	.word	16777216
	.word	-2130444032
	.word	-2147221248
	.word	262144
	.word	-2130444032
	.word	-2147483648
	.word	16777472
	.word	-2147221248
	.word	-2147221504
	.word	262400
	.word	17039360
	.word	-2130706176
	.word	-2147483392
	.word	16777216
	.word	-2130706432
	.word	17039616
	.word	67176449
	.word	0
	.word	67584
	.word	67174400
	.word	67108865
	.word	2049
	.word	67110912
	.word	67584
	.word	2048
	.word	67174401
	.word	1
	.word	67110912
	.word	65537
	.word	67176448
	.word	67174400
	.word	1
	.word	65536
	.word	67110913
	.word	67174401
	.word	2048
	.word	67585
	.word	67108864
	.word	0
	.word	65537
	.word	67110913
	.word	67585
	.word	67176448
	.word	67108865
	.word	67108864
	.word	65536
	.word	2049
	.word	67176449
	.word	65537
	.word	67176448
	.word	67110912
	.word	67585
	.word	67176449
	.word	65537
	.word	67108865
	.word	0
	.word	67108864
	.word	2049
	.word	65536
	.word	67174401
	.word	2048
	.word	67108864
	.word	67585
	.word	67110913
	.word	67176448
	.word	2048
	.word	0
	.word	67108865
	.word	1
	.word	67176449
	.word	67584
	.word	67174400
	.word	67174401
	.word	65536
	.word	2049
	.word	67110912
	.word	67110913
	.word	1
	.word	67174400
	.word	67584
	.word	1024
	.word	32
	.word	1048608
	.word	1074790400
	.word	1074791456
	.word	1073742848
	.word	1056
	.word	0
	.word	1048576
	.word	1074790432
	.word	1073741856
	.word	1049600
	.word	1073741824
	.word	1049632
	.word	1049600
	.word	1073741856
	.word	1074790432
	.word	1024
	.word	1073742848
	.word	1074791456
	.word	0
	.word	1048608
	.word	1074790400
	.word	1056
	.word	1074791424
	.word	1073742880
	.word	1049632
	.word	1073741824
	.word	1073742880
	.word	1074791424
	.word	32
	.word	1048576
	.word	1073742880
	.word	1049600
	.word	1074791424
	.word	1073741856
	.word	1024
	.word	32
	.word	1048576
	.word	1074791424
	.word	1074790432
	.word	1073742880
	.word	1056
	.word	0
	.word	32
	.word	1074790400
	.word	1073741824
	.word	1048608
	.word	0
	.word	1074790432
	.word	1048608
	.word	1056
	.word	1073741856
	.word	1024
	.word	1074791456
	.word	1048576
	.word	1049632
	.word	1073741824
	.word	1073742848
	.word	1074791456
	.word	1074790400
	.word	1049632
	.word	1049600
	.word	1073742848
	.word	8388608
	.word	4096
	.word	64
	.word	8392770
	.word	8392706
	.word	8388672
	.word	4162
	.word	8392704
	.word	4096
	.word	2
	.word	8388610
	.word	4160
	.word	8388674
	.word	8392706
	.word	8392768
	.word	0
	.word	4160
	.word	8388608
	.word	4098
	.word	66
	.word	8388672
	.word	4162
	.word	0
	.word	8388610
	.word	2
	.word	8388674
	.word	8392770
	.word	4098
	.word	8392704
	.word	64
	.word	66
	.word	8392768
	.word	8392768
	.word	8388674
	.word	4098
	.word	8392704
	.word	4096
	.word	2
	.word	8388610
	.word	8388672
	.word	8388608
	.word	4160
	.word	8392770
	.word	0
	.word	4162
	.word	8388608
	.word	64
	.word	4098
	.word	8388674
	.word	64
	.word	0
	.word	8392770
	.word	8392706
	.word	8392768
	.word	66
	.word	4096
	.word	4160
	.word	8392706
	.word	8388672
	.word	66
	.word	2
	.word	4162
	.word	8392704
	.word	8388610
	.word	272629760
	.word	4210704
	.word	16
	.word	272629776
	.word	268451840
	.word	4194304
	.word	272629776
	.word	16400
	.word	4194320
	.word	16384
	.word	4210688
	.word	268435456
	.word	272646160
	.word	268435472
	.word	268435456
	.word	272646144
	.word	0
	.word	268451840
	.word	4210704
	.word	16
	.word	268435472
	.word	272646160
	.word	16384
	.word	272629760
	.word	272646144
	.word	4194320
	.word	268451856
	.word	4210688
	.word	16400
	.word	0
	.word	4194304
	.word	268451856
	.word	4210704
	.word	16
	.word	268435456
	.word	16384
	.word	268435472
	.word	268451840
	.word	4210688
	.word	272629776
	.word	0
	.word	4210704
	.word	16400
	.word	272646144
	.word	268451840
	.word	4194304
	.word	272646160
	.word	268435456
	.word	268451856
	.word	272629760
	.word	4194304
	.word	272646160
	.word	16384
	.word	4194320
	.word	272629776
	.word	16400
	.word	4194320
	.word	0
	.word	272646144
	.word	268435472
	.word	272629760
	.word	268451856
	.word	16
	.word	4210688
	.word	2130048
	.word	32768
	.word	538968064
	.word	539000960
	.word	2097152
	.word	536903808
	.word	536903680
	.word	538968064
	.word	536903808
	.word	2130048
	.word	2129920
	.word	536871040
	.word	538968192
	.word	2097152
	.word	0
	.word	536903680
	.word	32768
	.word	536870912
	.word	2097280
	.word	32896
	.word	539000960
	.word	2129920
	.word	536871040
	.word	2097280
	.word	536870912
	.word	128
	.word	32896
	.word	539000832
	.word	128
	.word	538968192
	.word	539000832
	.word	0
	.word	0
	.word	539000960
	.word	2097280
	.word	536903680
	.word	2130048
	.word	32768
	.word	536871040
	.word	2097280
	.word	539000832
	.word	128
	.word	32896
	.word	538968064
	.word	536903808
	.word	536870912
	.word	538968064
	.word	2129920
	.word	539000960
	.word	32896
	.word	2129920
	.word	538968192
	.word	2097152
	.word	536871040
	.word	536903680
	.word	0
	.word	32768
	.word	2097152
	.word	538968192
	.word	2130048
	.word	536870912
	.word	539000832
	.word	128
	.word	536903808
	.align	2
	.type	rotors, %object
	.size	rotors, 768
rotors:
	.ascii	"\"\015\005./\022 )\0135!\024\016$\036\0301\002\017%"
	.ascii	"*2\000\025&0\006\032'\0044\031\014\033\037(\001\021"
	.ascii	"\034\035\0273#\007\003\026\011+)\024\01456\031'0\022"
	.ascii	"\037(\033\025+%\000\001\011\026,1\002\007\034-7\015"
	.ascii	"!.\013\006 \023\"&/\010\030#$\036\003*\016\012\035\020"
	.ascii	"27\"\032&\013'5\005 -6)#\0023\016\017\027$\003\010\020"
	.ascii	"\025*\006\014\033/\037\031\024.!04\004\026\00712,\021"
	.ascii	"\001\034\030+\036\011\0140(4\0315&\023.\006\01371\020"
	.ascii	"\012\034\035%2\021\026\036#\001\024\032)\004-'\"\037"
	.ascii	"/\005\015\022$\025\010\011\003\000\017*\007\002,\027"
	.ascii	"\032\0056\015'&4!\037\024\031\014\010\036\030*+3\011"
	.ascii	"\000$,1\017\"(7\022\00650-\004\023\033 2#\026\027\021"
	.ascii	"\016\035\001\025\020\003%(\023\013\03354\015/-\"'\032"
	.ascii	"\026,\007\001\002\012\027\0162\003\010\03506\014 \024"
	.ascii	"&\005\006\022!).\0111$%\000\034+\017#\036\02136!\031"
	.ascii	")&\015\033\004\00605($\003\025\017\020\030%\034\011"
	.ascii	"\021\026+\005\013\032.\"4\023\024 /7\037\027\01023\016"
	.ascii	"*\002\0351,\000\012\013/'74\033)\022\024\005&62\021"
	.ascii	"#\035\036\0073*\027\000$\002\023\031(\0370\015!\".\004"
	.ascii	"\014-%\026\011\012\034\001\020+\010\003\016\030\022"
	.ascii	"6.\005\006\"0\031\033\014-\004\002\030*$%\016\0031\036"
	.ascii	"\007+\011\032 /&7\024()5\013\0234,\035\020\021#\010"
	.ascii	"\0272\017\012\025\000 \013\037\023\0240\005')\032\006"
	.ascii	"\022\020\007\00123\034\021\010,\025\002\027(.\0044\014"
	.ascii	"\"67&\031!\015\003+\036\0001\026%\011\035\030#\016."
	.ascii	"\031-!\"\005\02357(\024 \036\025\017\011\012*\000\026"
	.ascii	"\003#\020%6\037\022\015\0320\013\0144'/\033\021\002"
	.ascii	",\016\010$3\027+\0071\034\037'\006/0\023!&\0146\".,"
	.ascii	"#\035\027\030\001\016$\0211\0363\013- \033(\005\031"
	.ascii	"\032\0155\004)\000\020\003\034\0262\012%\002\025\010"
	.ascii	"*-5\024\004\005!/4\032\0130\037\0031+%\007\017\0342"
	.ascii	"\000\010,\012\031\006.)6\023'(\033&\0227\016\036\021"
	.ascii	"*$\011\0303\020#\026\001\006&\"\022\023/\004\015(\031"
	.ascii	"\005-\021\010\0023\025\035*\011\016\026\003\030'\024"
	.ascii	"\0377\013!56)4 \014\034,\000\0012\027\007\012\0361$"
	.ascii	"\017\02440 !\004\022\0336'\023\006\000\026\020\012#"
	.ascii	"+\001\027\034$\021\0075\"-\014\031/&\0137\015.\032*"
	.ascii	"\003\016\017\011%\025\030,\0102\035\033\0067'(\013\031"
	.ascii	"\"\004.\032\015\007\035\027\021*2\010\036#+\030\016"
	.ascii	"\037)4\023 6-\022\005\0245!1\012\025\026\020,\034\000"
	.ascii	"3\017\002$"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	DesSmallFipsEncrypt, %function
DesSmallFipsEncrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, fp}
	add	fp, sp, #12
	mov	r3, r1
	add	r1, r2, #7
	ldrb	r1, [r1]	@ zero_extendqisi2
	mov	r6, r1
	lsl	r6, r6, #8
	add	r1, r2, #6
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r6, r6, r1
	lsl	r6, r6, #8
	add	r1, r2, #5
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r6, r6, r1
	lsl	r6, r6, #8
	add	r1, r2, #4
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r6, r6, r1
	add	r1, r2, #3
	ldrb	r1, [r1]	@ zero_extendqisi2
	mov	r5, r1
	lsl	r5, r5, #8
	add	r1, r2, #2
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r5, r5, r1
	lsl	r5, r5, #8
	add	r1, r2, #1
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r5, r5, r1
	lsl	r5, r5, #8
	ldrb	r2, [r2]	@ zero_extendqisi2
	orr	r5, r5, r2
	lsr	r2, r6, #4
	eor	r2, r2, r5
	ldr	r4, .L3
	and	r4, r4, r2
	lsl	r2, r4, #4
	eor	r6, r6, r2
	eor	r5, r5, r4
	lsr	r2, r5, #16
	eor	r2, r2, r6
	lsl	r4, r2, #16
	lsr	r4, r4, #16
	lsl	r2, r4, #16
	eor	r5, r5, r2
	eor	r6, r6, r4
	lsr	r2, r6, #2
	eor	r2, r2, r5
	ldr	r4, .L3+4
	and	r4, r4, r2
	lsl	r2, r4, #2
	eor	r6, r6, r2
	eor	r5, r5, r4
	lsr	r2, r5, #8
	eor	r2, r2, r6
	bic	r4, r2, #-16777216
	bic	r4, r4, #65280
	lsl	r2, r4, #8
	eor	r5, r5, r2
	eor	r6, r6, r4
	ror	r6, r6, #1
	eor	r2, r6, r5
	ldr	r4, .L3+8
	and	r4, r4, r2
	eor	r5, r5, r4
	eor	r6, r6, r4
	ror	r5, r5, #1
	ldr	r4, [r3]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #4]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #8]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #12]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #16]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #20]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #24]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #28]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #32]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #36]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #40]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #44]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #48]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #52]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #56]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #60]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #64]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #68]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #72]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #76]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #80]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #84]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #88]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #92]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #96]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #100]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #104]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #108]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #112]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #116]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #120]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L3+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #124]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r3, r4, #252
	add	r3, r3, #1792
	ldr	r2, .L3+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	lsr	r4, r4, #8
	and	r3, r4, #252
	add	r3, r3, #1536
	ldr	r2, .L3+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	lsr	r4, r4, #8
	and	r3, r4, #252
	add	r3, r3, #1280
	ldr	r2, .L3+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	lsr	r4, r4, #8
	and	r3, r4, #252
	add	r3, r3, #1024
	ldr	r2, .L3+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	ror	r6, r6, #31
	eor	r3, r6, r5
	ldr	r4, .L3+8
	and	r4, r4, r3
	eor	r5, r5, r4
	eor	r6, r6, r4
	ror	r5, r5, #31
	lsr	r3, r6, #8
	eor	r3, r3, r5
	bic	r4, r3, #-16777216
	bic	r4, r4, #65280
	lsl	r3, r4, #8
	eor	r6, r6, r3
	eor	r5, r5, r4
	lsr	r3, r5, #2
	eor	r3, r3, r6
	ldr	r4, .L3+4
	and	r4, r4, r3
	lsl	r3, r4, #2
	eor	r5, r5, r3
	eor	r6, r6, r4
	lsr	r3, r6, #16
	eor	r3, r3, r5
	lsl	r4, r3, #16
	lsr	r4, r4, #16
	lsl	r3, r4, #16
	eor	r6, r6, r3
	eor	r5, r5, r4
	lsr	r3, r5, #4
	eor	r3, r3, r6
	ldr	r4, .L3
	and	r4, r4, r3
	lsl	r3, r4, #4
	eor	r5, r5, r3
	eor	r6, r6, r4
	and	r3, r6, #255
	strb	r3, [r0]
	lsr	r6, r6, #8
	add	r3, r0, #1
	and	r2, r6, #255
	strb	r2, [r3]
	lsr	r6, r6, #8
	add	r3, r0, #2
	and	r2, r6, #255
	strb	r2, [r3]
	lsr	r6, r6, #8
	add	r3, r0, #3
	and	r2, r6, #255
	strb	r2, [r3]
	add	r3, r0, #4
	and	r2, r5, #255
	strb	r2, [r3]
	lsr	r5, r5, #8
	add	r3, r0, #5
	and	r2, r5, #255
	strb	r2, [r3]
	lsr	r5, r5, #8
	add	r3, r0, #6
	and	r2, r5, #255
	strb	r2, [r3]
	lsr	r5, r5, #8
	add	r3, r0, #7
	b	.L4
.L5:
	.align	2
.L3:
	.word	252645135
	.word	858993459
	.word	1431655765
	.word	des_keymap
.L4:
	and	r2, r5, #255
	strb	r2, [r3]
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, r6, fp}
	bx	lr
	.size	DesSmallFipsEncrypt, .-DesSmallFipsEncrypt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	DesSmallFipsDecrypt, %function
DesSmallFipsDecrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r4, r5, r6, fp}
	add	fp, sp, #12
	mov	r3, r1
	add	r1, r2, #7
	ldrb	r1, [r1]	@ zero_extendqisi2
	mov	r6, r1
	lsl	r6, r6, #8
	add	r1, r2, #6
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r6, r6, r1
	lsl	r6, r6, #8
	add	r1, r2, #5
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r6, r6, r1
	lsl	r6, r6, #8
	add	r1, r2, #4
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r6, r6, r1
	add	r1, r2, #3
	ldrb	r1, [r1]	@ zero_extendqisi2
	mov	r5, r1
	lsl	r5, r5, #8
	add	r1, r2, #2
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r5, r5, r1
	lsl	r5, r5, #8
	add	r1, r2, #1
	ldrb	r1, [r1]	@ zero_extendqisi2
	orr	r5, r5, r1
	lsl	r5, r5, #8
	ldrb	r2, [r2]	@ zero_extendqisi2
	orr	r5, r5, r2
	lsr	r2, r6, #4
	eor	r2, r2, r5
	ldr	r4, .L8
	and	r4, r4, r2
	lsl	r2, r4, #4
	eor	r6, r6, r2
	eor	r5, r5, r4
	lsr	r2, r5, #16
	eor	r2, r2, r6
	lsl	r4, r2, #16
	lsr	r4, r4, #16
	lsl	r2, r4, #16
	eor	r5, r5, r2
	eor	r6, r6, r4
	lsr	r2, r6, #2
	eor	r2, r2, r5
	ldr	r4, .L8+4
	and	r4, r4, r2
	lsl	r2, r4, #2
	eor	r6, r6, r2
	eor	r5, r5, r4
	lsr	r2, r5, #8
	eor	r2, r2, r6
	bic	r4, r2, #-16777216
	bic	r4, r4, #65280
	lsl	r2, r4, #8
	eor	r5, r5, r2
	eor	r6, r6, r4
	ror	r6, r6, #1
	eor	r2, r6, r5
	ldr	r4, .L8+8
	and	r4, r4, r2
	eor	r5, r5, r4
	eor	r6, r6, r4
	ror	r5, r5, #1
	ldr	r4, [r3, #124]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #120]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #116]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #112]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #108]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #104]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #100]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #96]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #92]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #88]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #84]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #80]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #76]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #72]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #68]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #64]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #60]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #56]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #52]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #48]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #44]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #40]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #36]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #32]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #28]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #24]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #20]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #16]
	eor	r4, r4, r6
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3, #12]
	eor	r4, r4, r5
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #8]
	eor	r4, r4, r5
	and	r2, r4, #252
	add	r2, r2, #768
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #512
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #256
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r6, r6, r2
	ldr	r4, [r3, #4]
	eor	r4, r4, r6
	ror	r4, r4, #28
	and	r2, r4, #252
	add	r2, r2, #1792
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1536
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1280
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	lsr	r4, r4, #8
	and	r2, r4, #252
	add	r2, r2, #1024
	ldr	r1, .L8+12
	add	r2, r2, r1
	ldr	r2, [r2]
	eor	r5, r5, r2
	ldr	r4, [r3]
	eor	r4, r4, r6
	and	r3, r4, #252
	add	r3, r3, #768
	ldr	r2, .L8+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	lsr	r4, r4, #8
	and	r3, r4, #252
	add	r3, r3, #512
	ldr	r2, .L8+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	lsr	r4, r4, #8
	and	r3, r4, #252
	add	r3, r3, #256
	ldr	r2, .L8+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	lsr	r4, r4, #8
	and	r3, r4, #252
	ldr	r2, .L8+12
	add	r3, r3, r2
	ldr	r3, [r3]
	eor	r5, r5, r3
	ror	r6, r6, #31
	eor	r3, r6, r5
	ldr	r4, .L8+8
	and	r4, r4, r3
	eor	r5, r5, r4
	eor	r6, r6, r4
	ror	r5, r5, #31
	lsr	r3, r6, #8
	eor	r3, r3, r5
	bic	r4, r3, #-16777216
	bic	r4, r4, #65280
	lsl	r3, r4, #8
	eor	r6, r6, r3
	eor	r5, r5, r4
	lsr	r3, r5, #2
	eor	r3, r3, r6
	ldr	r4, .L8+4
	and	r4, r4, r3
	lsl	r3, r4, #2
	eor	r5, r5, r3
	eor	r6, r6, r4
	lsr	r3, r6, #16
	eor	r3, r3, r5
	lsl	r4, r3, #16
	lsr	r4, r4, #16
	lsl	r3, r4, #16
	eor	r6, r6, r3
	eor	r5, r5, r4
	lsr	r3, r5, #4
	eor	r3, r3, r6
	ldr	r4, .L8
	and	r4, r4, r3
	lsl	r3, r4, #4
	eor	r5, r5, r3
	eor	r6, r6, r4
	and	r3, r6, #255
	strb	r3, [r0]
	lsr	r6, r6, #8
	add	r3, r0, #1
	and	r2, r6, #255
	strb	r2, [r3]
	lsr	r6, r6, #8
	add	r3, r0, #2
	and	r2, r6, #255
	strb	r2, [r3]
	lsr	r6, r6, #8
	add	r3, r0, #3
	and	r2, r6, #255
	strb	r2, [r3]
	add	r3, r0, #4
	and	r2, r5, #255
	strb	r2, [r3]
	lsr	r5, r5, #8
	add	r3, r0, #5
	and	r2, r5, #255
	strb	r2, [r3]
	lsr	r5, r5, #8
	add	r3, r0, #6
	and	r2, r5, #255
	strb	r2, [r3]
	lsr	r5, r5, #8
	add	r3, r0, #7
	b	.L9
.L10:
	.align	2
.L8:
	.word	252645135
	.word	858993459
	.word	1431655765
	.word	des_keymap
.L9:
	and	r2, r5, #255
	strb	r2, [r3]
	nop
	sub	sp, fp, #12
	@ sp needed
	pop	{r4, r5, r6, fp}
	bx	lr
	.size	DesSmallFipsDecrypt, .-DesSmallFipsDecrypt
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	des_weak_p, %function
des_weak_p:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-24]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-6]
	ldrsb	r3, [fp, #-6]
	add	r3, r3, #1
	ldr	r2, .L22
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r1, r3
	ldrsb	r3, [fp, #-5]
	ldr	r2, .L22
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	add	r3, r1, r3
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	ldr	r2, .L22+4
	add	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-12]
	cmp	r3, #25
	bls	.L12
	mov	r3, #0
	b	.L13
.L12:
	ldr	r3, [fp, #-16]
	ldrsb	r3, [r3]
	ldrsb	r2, [fp, #-5]
	cmp	r2, r3
	bne	.L14
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	ldrsb	r3, [r3]
	ldrsb	r2, [fp, #-6]
	cmp	r2, r3
	beq	.L15
.L14:
	mov	r3, #0
	b	.L13
.L15:
	ldr	r3, [fp, #-24]
	add	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	mov	r2, r3
	ldrsb	r3, [fp, #-5]
	cmp	r2, r3
	bne	.L16
	ldr	r3, [fp, #-24]
	add	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	mov	r2, r3
	ldrsb	r3, [fp, #-6]
	cmp	r2, r3
	beq	.L17
.L16:
	mov	r3, #0
	b	.L13
.L17:
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-5]
	ldr	r3, [fp, #-24]
	add	r3, r3, #5
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	strb	r3, [fp, #-6]
	ldr	r3, [fp, #-16]
	add	r3, r3, #2
	ldrsb	r3, [r3]
	ldrsb	r2, [fp, #-5]
	cmp	r2, r3
	bne	.L18
	ldr	r3, [fp, #-16]
	add	r3, r3, #3
	ldrsb	r3, [r3]
	ldrsb	r2, [fp, #-6]
	cmp	r2, r3
	beq	.L19
.L18:
	mov	r3, #0
	b	.L13
.L19:
	ldr	r3, [fp, #-24]
	add	r3, r3, #6
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	mov	r2, r3
	ldrsb	r3, [fp, #-5]
	cmp	r2, r3
	bne	.L20
	ldr	r3, [fp, #-24]
	add	r3, r3, #7
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsr	r3, r3, #1
	and	r3, r3, #255
	mov	r2, r3
	ldrsb	r3, [fp, #-6]
	cmp	r2, r3
	beq	.L21
.L20:
	mov	r3, #0
	b	.L13
.L21:
	mov	r3, #1
.L13:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L23:
	.align	2
.L22:
	.word	asso_values.1
	.word	weak_key_hash.0
	.size	des_weak_p, .-des_weak_p
	.align	2
	.global	des_set_key
	.syntax unified
	.arm
	.fpu softvfp
	.type	des_set_key, %function
des_set_key:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 128
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #128
	str	r0, [fp, #-144]
	str	r1, [fp, #-148]
	mov	r7, #56
	sub	r5, fp, #84
	sub	r6, fp, #140
	ldr	r3, [fp, #-148]
	str	r3, [fp, #-28]
.L26:
	ldr	r3, [fp, #-28]
	add	r2, r3, #1
	str	r2, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	lsl	r3, r3, #2
	orr	r3, r3, #1024
	mov	r4, r3
.L25:
	sub	r7, r7, #1
	and	r2, r4, #255
	add	r3, r6, r7
	and	r2, r2, #8
	and	r2, r2, #255
	strb	r2, [r3]
	lsr	r4, r4, #1
	and	r2, r4, #255
	add	r3, r5, r7
	and	r2, r2, #4
	and	r2, r2, #255
	strb	r2, [r3]
	cmp	r4, #15
	bhi	.L25
	cmp	r7, #0
	bne	.L26
	mov	r7, #16
	ldr	r3, .L29
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-144]
	str	r3, [fp, #-24]
.L27:
	ldr	r3, [fp, #-28]
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	mov	r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #2
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #3
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #4
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #5
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	lsl	r4, r4, #8
	ldr	r3, [fp, #-28]
	add	r3, r3, #6
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #7
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #8
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #9
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #10
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #11
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	lsl	r4, r4, #8
	ldr	r3, [fp, #-28]
	add	r3, r3, #12
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #13
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #14
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #15
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #16
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #17
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	lsl	r4, r4, #8
	ldr	r3, [fp, #-28]
	add	r3, r3, #18
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #19
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #20
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #21
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #22
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #23
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	ldr	r3, [fp, #-24]
	str	r4, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #24
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #25
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	mov	r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #26
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #27
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #28
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #29
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	lsl	r4, r4, #8
	ldr	r3, [fp, #-28]
	add	r3, r3, #30
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #31
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #32
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #33
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #34
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #35
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	lsl	r4, r4, #8
	ldr	r3, [fp, #-28]
	add	r3, r3, #36
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #37
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #38
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #39
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #40
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #41
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	lsl	r4, r4, #8
	ldr	r3, [fp, #-28]
	add	r3, r3, #42
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #43
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #4
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #44
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #45
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	lsl	r3, r3, #2
	orr	r4, r4, r3
	ldr	r3, [fp, #-28]
	add	r3, r3, #46
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r6, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	ldr	r3, [fp, #-28]
	add	r3, r3, #47
	ldrb	r3, [r3]	@ zero_extendqisi2
	add	r3, r5, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	orr	r3, r2, r3
	and	r3, r3, #255
	orr	r4, r4, r3
	ror	r4, r4, #4
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	str	r4, [r3]
	ldr	r3, [fp, #-28]
	add	r3, r3, #48
	str	r3, [fp, #-28]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	str	r3, [fp, #-24]
	sub	r7, r7, #1
	cmp	r7, #0
	bne	.L27
	ldr	r0, [fp, #-148]
	bl	des_weak_p
	mov	r3, r0
	cmp	r3, #0
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	sub	sp, fp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	rotors
	.size	des_set_key, .-des_set_key
	.align	2
	.global	des_encrypt
	.syntax unified
	.arm
	.fpu softvfp
	.type	des_encrypt, %function
des_encrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	b	.L32
.L33:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	DesSmallFipsEncrypt
	ldr	r3, [fp, #-12]
	sub	r3, r3, #8
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L32:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L33
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	des_encrypt, .-des_encrypt
	.align	2
	.global	des_decrypt
	.syntax unified
	.arm
	.fpu softvfp
	.type	des_decrypt, %function
des_decrypt:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	str	r2, [fp, #-16]
	str	r3, [fp, #-20]
	b	.L35
.L36:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-20]
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	DesSmallFipsDecrypt
	ldr	r3, [fp, #-12]
	sub	r3, r3, #8
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-16]
	add	r3, r3, #8
	str	r3, [fp, #-16]
.L35:
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bne	.L36
	nop
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	des_decrypt, .-des_decrypt
	.align	2
	.global	beebs_nettle_des_initialise_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_des_initialise_benchmark, %function
beebs_nettle_des_initialise_benchmark:
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
	.size	beebs_nettle_des_initialise_benchmark, .-beebs_nettle_des_initialise_benchmark
	.align	2
	.global	beebs_nettle_des_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_des_benchmark, %function
beebs_nettle_des_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L40
	ldr	r2, .L40+4
	mov	r1, #16
	ldr	r0, .L40+8
	bl	des_encrypt
	ldr	r3, .L40+4
	ldr	r2, .L40+4
	mov	r1, #16
	ldr	r0, .L40+8
	bl	des_decrypt
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	data
	.word	result
	.word	des_ctx
	.size	beebs_nettle_des_benchmark, .-beebs_nettle_des_benchmark
	.section	.rodata
	.align	2
.LC0:
	.ascii	"\000\001\002\003\004\005\006\007\010\011\012\013\014"
	.ascii	"\015\016\017"
	.text
	.align	2
	.global	beebs_nettle_des_verify_benchmark
	.syntax unified
	.arm
	.fpu softvfp
	.type	beebs_nettle_des_verify_benchmark, %function
beebs_nettle_des_verify_benchmark:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-32]
	ldr	r3, .L48
	sub	ip, fp, #24
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L43
.L46:
	ldr	r2, .L48+4
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	ldrb	r2, [r3]	@ zero_extendqisi2
	sub	r1, fp, #24
	ldr	r3, [fp, #-8]
	add	r3, r1, r3
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r2, r3
	beq	.L44
	mov	r3, #0
	b	.L47
.L44:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L43:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	ble	.L46
	mov	r3, #1
.L47:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	.LC0
	.word	result
	.size	beebs_nettle_des_verify_benchmark, .-beebs_nettle_des_verify_benchmark
	.section	.rodata
	.align	2
	.type	asso_values.1, %object
	.size	asso_values.1, 129
asso_values.1:
	.ascii	"\020\011\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\006\002\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\003\001\032\032\032"
	.ascii	"\032\032\032\032\032\032\032\032\032\032\000\000"
	.align	2
	.type	weak_key_hash.0, %object
	.size	weak_key_hash.0, 104
weak_key_hash.0:
	.ascii	"\177\177\177\177"
	.ascii	"\177p\177x"
	.ascii	"\177\017\177\007"
	.ascii	"p\177x\177"
	.ascii	"ppxx"
	.ascii	"p\017x\007"
	.ascii	"\017\177\007\177"
	.ascii	"\017p\007x"
	.ascii	"\017\017\007\007"
	.ascii	"\177\000\177\000"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"p\000x\000"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"\017\000\007\000"
	.ascii	"\000\177\000\177"
	.ascii	"\000p\000x"
	.ascii	"\000\017\000\007"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"\377\377\377\377"
	.ascii	"\000\000\000\000"
	.ident	"GCC: (15:10.3-2021.07-4) 10.3.1 20210621 (release)"
