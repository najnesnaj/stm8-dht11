                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
                                      4 ; This file was generated Fri Aug 18 15:54:49 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module dht11
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _segmentMap
                                     13 	.globl _main
                                     14 	.globl _DHT_ReadData
                                     15 	.globl _dht11_init
                                     16 	.globl _tm1637DisplayDecimal
                                     17 	.globl _tm1637Init
                                     18 	.globl _InitializeUART
                                     19 	.globl _InitializeI2C
                                     20 	.globl _i2c_read_register
                                     21 	.globl _print_byte_hex
                                     22 	.globl _i2c_set_start_ack
                                     23 	.globl _i2c_send_address
                                     24 	.globl _UARTPrintF
                                     25 	.globl _i2c_send_reg
                                     26 	.globl _i2c_set_stop
                                     27 	.globl _i2c_set_nak
                                     28 	.globl _i2c_read
                                     29 	.globl _delay
                                     30 	.globl _InitializeSystemClock
                                     31 	.globl _delayTenMicro
                                     32 	.globl _tm1637SetBrightness
                                     33 	.globl __tm1637Start
                                     34 	.globl __tm1637Stop
                                     35 	.globl __tm1637ReadResult
                                     36 	.globl __tm1637WriteByte
                                     37 	.globl __tm1637ClkHigh
                                     38 	.globl __tm1637ClkLow
                                     39 	.globl __tm1637DioHigh
                                     40 	.globl __tm1637DioLow
                                     41 ;--------------------------------------------------------
                                     42 ; ram data
                                     43 ;--------------------------------------------------------
                                     44 	.area DATA
                                     45 ;--------------------------------------------------------
                                     46 ; ram data
                                     47 ;--------------------------------------------------------
                                     48 	.area INITIALIZED
                                     49 ;--------------------------------------------------------
                                     50 ; Stack segment in internal ram 
                                     51 ;--------------------------------------------------------
                                     52 	.area	SSEG
      000000                         53 __start__stack:
      000000                         54 	.ds	1
                                     55 
                                     56 ;--------------------------------------------------------
                                     57 ; absolute external ram data
                                     58 ;--------------------------------------------------------
                                     59 	.area DABS (ABS)
                                     60 ;--------------------------------------------------------
                                     61 ; interrupt vector 
                                     62 ;--------------------------------------------------------
                                     63 	.area HOME
      008000                         64 __interrupt_vect:
      008000 82 00 80 83             65 	int s_GSINIT ;reset
      008004 82 00 00 00             66 	int 0x0000 ;trap
      008008 82 00 00 00             67 	int 0x0000 ;int0
      00800C 82 00 00 00             68 	int 0x0000 ;int1
      008010 82 00 00 00             69 	int 0x0000 ;int2
      008014 82 00 00 00             70 	int 0x0000 ;int3
      008018 82 00 00 00             71 	int 0x0000 ;int4
      00801C 82 00 00 00             72 	int 0x0000 ;int5
      008020 82 00 00 00             73 	int 0x0000 ;int6
      008024 82 00 00 00             74 	int 0x0000 ;int7
      008028 82 00 00 00             75 	int 0x0000 ;int8
      00802C 82 00 00 00             76 	int 0x0000 ;int9
      008030 82 00 00 00             77 	int 0x0000 ;int10
      008034 82 00 00 00             78 	int 0x0000 ;int11
      008038 82 00 00 00             79 	int 0x0000 ;int12
      00803C 82 00 00 00             80 	int 0x0000 ;int13
      008040 82 00 00 00             81 	int 0x0000 ;int14
      008044 82 00 00 00             82 	int 0x0000 ;int15
      008048 82 00 00 00             83 	int 0x0000 ;int16
      00804C 82 00 00 00             84 	int 0x0000 ;int17
      008050 82 00 00 00             85 	int 0x0000 ;int18
      008054 82 00 00 00             86 	int 0x0000 ;int19
      008058 82 00 00 00             87 	int 0x0000 ;int20
      00805C 82 00 00 00             88 	int 0x0000 ;int21
      008060 82 00 00 00             89 	int 0x0000 ;int22
      008064 82 00 00 00             90 	int 0x0000 ;int23
      008068 82 00 00 00             91 	int 0x0000 ;int24
      00806C 82 00 00 00             92 	int 0x0000 ;int25
      008070 82 00 00 00             93 	int 0x0000 ;int26
      008074 82 00 00 00             94 	int 0x0000 ;int27
      008078 82 00 00 00             95 	int 0x0000 ;int28
      00807C 82 00 00 00             96 	int 0x0000 ;int29
                                     97 ;--------------------------------------------------------
                                     98 ; global & static initialisations
                                     99 ;--------------------------------------------------------
                                    100 	.area HOME
                                    101 	.area GSINIT
                                    102 	.area GSFINAL
                                    103 	.area GSINIT
      008083                        104 __sdcc_gs_init_startup:
      008083                        105 __sdcc_init_data:
                                    106 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]  107 	ldw x, #l_DATA
      008086 27 07            [ 1]  108 	jreq	00002$
      008088                        109 00001$:
      008088 72 4F 00 00      [ 1]  110 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]  111 	decw x
      00808D 26 F9            [ 1]  112 	jrne	00001$
      00808F                        113 00002$:
      00808F AE 00 00         [ 2]  114 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]  115 	jreq	00004$
      008094                        116 00003$:
      008094 D6 8C BD         [ 1]  117 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]  118 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]  119 	decw	x
      00809B 26 F7            [ 1]  120 	jrne	00003$
      00809D                        121 00004$:
                                    122 ; stm8_genXINIT() end
                                    123 	.area GSFINAL
      00809D CC 80 80         [ 2]  124 	jp	__sdcc_program_startup
                                    125 ;--------------------------------------------------------
                                    126 ; Home
                                    127 ;--------------------------------------------------------
                                    128 	.area HOME
                                    129 	.area HOME
      008080                        130 __sdcc_program_startup:
      008080 CC 85 1B         [ 2]  131 	jp	_main
                                    132 ;	return from main will return to caller
                                    133 ;--------------------------------------------------------
                                    134 ; code
                                    135 ;--------------------------------------------------------
                                    136 	.area CODE
                                    137 ;	dht11.c: 17: void delayTenMicro (void) {
                                    138 ;	-----------------------------------------
                                    139 ;	 function delayTenMicro
                                    140 ;	-----------------------------------------
      0080A0                        141 _delayTenMicro:
                                    142 ;	dht11.c: 19: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  143 	ld	a, #0x32
      0080A2                        144 00104$:
                                    145 ;	dht11.c: 20: __asm__("nop");
      0080A2 9D               [ 1]  146 	nop
      0080A3 4A               [ 1]  147 	dec	a
                                    148 ;	dht11.c: 19: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  149 	tnz	a
      0080A5 26 FB            [ 1]  150 	jrne	00104$
      0080A7 81               [ 4]  151 	ret
                                    152 ;	dht11.c: 23: void InitializeSystemClock() {
                                    153 ;	-----------------------------------------
                                    154 ;	 function InitializeSystemClock
                                    155 ;	-----------------------------------------
      0080A8                        156 _InitializeSystemClock:
                                    157 ;	dht11.c: 24: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  158 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  159 	clr	(x)
                                    160 ;	dht11.c: 25: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  161 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  162 	ld	a, #0x01
      0080B1 F7               [ 1]  163 	ld	(x), a
                                    164 ;	dht11.c: 26: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  165 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  166 	clr	(x)
                                    167 ;	dht11.c: 27: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        168 00101$:
      0080B6 AE 50 C0         [ 2]  169 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  170 	ld	a, (x)
      0080BA A5 02            [ 1]  171 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  172 	jreq	00101$
                                    173 ;	dht11.c: 28: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  174 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  175 	clr	(x)
                                    176 ;	dht11.c: 29: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  177 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  178 	ld	a, #0xff
      0080C7 F7               [ 1]  179 	ld	(x), a
                                    180 ;	dht11.c: 30: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  181 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  182 	ld	a, #0xff
      0080CD F7               [ 1]  183 	ld	(x), a
                                    184 ;	dht11.c: 31: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  185 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  186 	clr	(x)
                                    187 ;	dht11.c: 32: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  188 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  189 	clr	(x)
                                    190 ;	dht11.c: 33: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  191 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  192 	clr	(x)
                                    193 ;	dht11.c: 34: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  194 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  195 	ld	a, #0xe1
      0080DF F7               [ 1]  196 	ld	(x), a
                                    197 ;	dht11.c: 35: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  198 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  199 	clr	(x)
                                    200 ;	dht11.c: 36: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  201 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  202 	ld	a, #0x02
      0080E9 F7               [ 1]  203 	ld	(x), a
                                    204 ;	dht11.c: 37: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        205 00104$:
      0080EA AE 50 C5         [ 2]  206 	ldw	x, #0x50c5
      0080ED F6               [ 1]  207 	ld	a, (x)
      0080EE 44               [ 1]  208 	srl	a
      0080EF 25 F9            [ 1]  209 	jrc	00104$
      0080F1 81               [ 4]  210 	ret
                                    211 ;	dht11.c: 39: void delay (int time_ms) {
                                    212 ;	-----------------------------------------
                                    213 ;	 function delay
                                    214 ;	-----------------------------------------
      0080F2                        215 _delay:
      0080F2 52 0A            [ 2]  216 	sub	sp, #10
                                    217 ;	dht11.c: 41: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  218 	clrw	x
      0080F5 1F 03            [ 2]  219 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  220 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  221 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  222 	pushw	x
      0080FC 4B 0C            [ 1]  223 	push	#0x0c
      0080FE 4B 04            [ 1]  224 	push	#0x04
      008100 CD 87 E6         [ 4]  225 	call	__mulint
      008103 5B 04            [ 2]  226 	addw	sp, #4
      008105 1F 09            [ 2]  227 	ldw	(0x09, sp), x
      008107                        228 00103$:
      008107 16 09            [ 2]  229 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  230 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  231 	ld	a, (0x07, sp)
      00810D 49               [ 1]  232 	rlc	a
      00810E 4F               [ 1]  233 	clr	a
      00810F A2 00            [ 1]  234 	sbc	a, #0x00
      008111 6B 06            [ 1]  235 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  236 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  237 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  238 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  239 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  240 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  241 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  242 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  243 	jrsge	00105$
                                    244 ;	dht11.c: 42: __asm__("nop");
      008123 9D               [ 1]  245 	nop
                                    246 ;	dht11.c: 41: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  247 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  248 	addw	y, #0x0001
      00812A 7B 02            [ 1]  249 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  250 	adc	a, #0x00
      00812E 97               [ 1]  251 	ld	xl, a
      00812F 7B 01            [ 1]  252 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  253 	adc	a, #0x00
      008133 95               [ 1]  254 	ld	xh, a
      008134 17 03            [ 2]  255 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  256 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  257 	jra	00103$
      00813A                        258 00105$:
      00813A 5B 0A            [ 2]  259 	addw	sp, #10
      00813C 81               [ 4]  260 	ret
                                    261 ;	dht11.c: 44: void i2c_read (unsigned char *x) {
                                    262 ;	-----------------------------------------
                                    263 ;	 function i2c_read
                                    264 ;	-----------------------------------------
      00813D                        265 _i2c_read:
                                    266 ;	dht11.c: 45: while ((I2C_SR1 & I2C_RXNE) == 0);
      00813D                        267 00101$:
      00813D AE 52 17         [ 2]  268 	ldw	x, #0x5217
      008140 F6               [ 1]  269 	ld	a, (x)
      008141 A5 40            [ 1]  270 	bcp	a, #0x40
      008143 27 F8            [ 1]  271 	jreq	00101$
                                    272 ;	dht11.c: 46: *x = I2C_DR;
      008145 16 03            [ 2]  273 	ldw	y, (0x03, sp)
      008147 AE 52 16         [ 2]  274 	ldw	x, #0x5216
      00814A F6               [ 1]  275 	ld	a, (x)
      00814B 90 F7            [ 1]  276 	ld	(y), a
      00814D 81               [ 4]  277 	ret
                                    278 ;	dht11.c: 48: void i2c_set_nak (void) {
                                    279 ;	-----------------------------------------
                                    280 ;	 function i2c_set_nak
                                    281 ;	-----------------------------------------
      00814E                        282 _i2c_set_nak:
                                    283 ;	dht11.c: 49: I2C_CR2 &= ~I2C_ACK;
      00814E AE 52 11         [ 2]  284 	ldw	x, #0x5211
      008151 F6               [ 1]  285 	ld	a, (x)
      008152 A4 FB            [ 1]  286 	and	a, #0xfb
      008154 F7               [ 1]  287 	ld	(x), a
      008155 81               [ 4]  288 	ret
                                    289 ;	dht11.c: 51: void i2c_set_stop (void) {
                                    290 ;	-----------------------------------------
                                    291 ;	 function i2c_set_stop
                                    292 ;	-----------------------------------------
      008156                        293 _i2c_set_stop:
                                    294 ;	dht11.c: 52: I2C_CR2 |= I2C_STOP;
      008156 AE 52 11         [ 2]  295 	ldw	x, #0x5211
      008159 F6               [ 1]  296 	ld	a, (x)
      00815A AA 02            [ 1]  297 	or	a, #0x02
      00815C F7               [ 1]  298 	ld	(x), a
      00815D 81               [ 4]  299 	ret
                                    300 ;	dht11.c: 54: void i2c_send_reg (UCHAR addr) {
                                    301 ;	-----------------------------------------
                                    302 ;	 function i2c_send_reg
                                    303 ;	-----------------------------------------
      00815E                        304 _i2c_send_reg:
      00815E 52 02            [ 2]  305 	sub	sp, #2
                                    306 ;	dht11.c: 56: reg = I2C_SR1;
      008160 AE 52 17         [ 2]  307 	ldw	x, #0x5217
      008163 F6               [ 1]  308 	ld	a, (x)
      008164 5F               [ 1]  309 	clrw	x
      008165 97               [ 1]  310 	ld	xl, a
      008166 1F 01            [ 2]  311 	ldw	(0x01, sp), x
                                    312 ;	dht11.c: 57: reg = I2C_SR3;
      008168 AE 52 19         [ 2]  313 	ldw	x, #0x5219
      00816B F6               [ 1]  314 	ld	a, (x)
      00816C 5F               [ 1]  315 	clrw	x
      00816D 97               [ 1]  316 	ld	xl, a
      00816E 1F 01            [ 2]  317 	ldw	(0x01, sp), x
                                    318 ;	dht11.c: 58: I2C_DR = addr;
      008170 AE 52 16         [ 2]  319 	ldw	x, #0x5216
      008173 7B 05            [ 1]  320 	ld	a, (0x05, sp)
      008175 F7               [ 1]  321 	ld	(x), a
                                    322 ;	dht11.c: 59: while ((I2C_SR1 & I2C_TXE) == 0);
      008176                        323 00101$:
      008176 AE 52 17         [ 2]  324 	ldw	x, #0x5217
      008179 F6               [ 1]  325 	ld	a, (x)
      00817A 48               [ 1]  326 	sll	a
      00817B 24 F9            [ 1]  327 	jrnc	00101$
      00817D 5B 02            [ 2]  328 	addw	sp, #2
      00817F 81               [ 4]  329 	ret
                                    330 ;	dht11.c: 63: void UARTPrintF (char *message) {
                                    331 ;	-----------------------------------------
                                    332 ;	 function UARTPrintF
                                    333 ;	-----------------------------------------
      008180                        334 _UARTPrintF:
                                    335 ;	dht11.c: 64: char *ch = message;
      008180 16 03            [ 2]  336 	ldw	y, (0x03, sp)
                                    337 ;	dht11.c: 65: while (*ch) {
      008182                        338 00104$:
      008182 90 F6            [ 1]  339 	ld	a, (y)
      008184 4D               [ 1]  340 	tnz	a
      008185 27 0F            [ 1]  341 	jreq	00107$
                                    342 ;	dht11.c: 66: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008187 AE 52 31         [ 2]  343 	ldw	x, #0x5231
      00818A F7               [ 1]  344 	ld	(x), a
                                    345 ;	dht11.c: 67: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      00818B                        346 00101$:
      00818B AE 52 30         [ 2]  347 	ldw	x, #0x5230
      00818E F6               [ 1]  348 	ld	a, (x)
      00818F 48               [ 1]  349 	sll	a
      008190 24 F9            [ 1]  350 	jrnc	00101$
                                    351 ;	dht11.c: 68: ch++;                               //  Grab the next character.
      008192 90 5C            [ 2]  352 	incw	y
      008194 20 EC            [ 2]  353 	jra	00104$
      008196                        354 00107$:
      008196 81               [ 4]  355 	ret
                                    356 ;	dht11.c: 74: void i2c_send_address (UCHAR addr, UCHAR mode) {
                                    357 ;	-----------------------------------------
                                    358 ;	 function i2c_send_address
                                    359 ;	-----------------------------------------
      008197                        360 _i2c_send_address:
      008197 52 03            [ 2]  361 	sub	sp, #3
                                    362 ;	dht11.c: 76: reg = I2C_SR1;
      008199 AE 52 17         [ 2]  363 	ldw	x, #0x5217
      00819C F6               [ 1]  364 	ld	a, (x)
      00819D 5F               [ 1]  365 	clrw	x
      00819E 97               [ 1]  366 	ld	xl, a
      00819F 1F 01            [ 2]  367 	ldw	(0x01, sp), x
                                    368 ;	dht11.c: 77: I2C_DR = (addr << 1) | mode;
      0081A1 7B 06            [ 1]  369 	ld	a, (0x06, sp)
      0081A3 48               [ 1]  370 	sll	a
      0081A4 1A 07            [ 1]  371 	or	a, (0x07, sp)
      0081A6 AE 52 16         [ 2]  372 	ldw	x, #0x5216
      0081A9 F7               [ 1]  373 	ld	(x), a
                                    374 ;	dht11.c: 78: if (mode == I2C_READ) {
      0081AA 7B 07            [ 1]  375 	ld	a, (0x07, sp)
      0081AC A1 01            [ 1]  376 	cp	a, #0x01
      0081AE 26 06            [ 1]  377 	jrne	00127$
      0081B0 A6 01            [ 1]  378 	ld	a, #0x01
      0081B2 6B 03            [ 1]  379 	ld	(0x03, sp), a
      0081B4 20 02            [ 2]  380 	jra	00128$
      0081B6                        381 00127$:
      0081B6 0F 03            [ 1]  382 	clr	(0x03, sp)
      0081B8                        383 00128$:
      0081B8 0D 03            [ 1]  384 	tnz	(0x03, sp)
      0081BA 27 08            [ 1]  385 	jreq	00103$
                                    386 ;	dht11.c: 79: I2C_OARL = 0;
      0081BC AE 52 13         [ 2]  387 	ldw	x, #0x5213
      0081BF 7F               [ 1]  388 	clr	(x)
                                    389 ;	dht11.c: 80: I2C_OARH = 0;
      0081C0 AE 52 14         [ 2]  390 	ldw	x, #0x5214
      0081C3 7F               [ 1]  391 	clr	(x)
                                    392 ;	dht11.c: 83: while ((I2C_SR1 & I2C_ADDR) == 0);
      0081C4                        393 00103$:
                                    394 ;	dht11.c: 76: reg = I2C_SR1;
      0081C4 AE 52 17         [ 2]  395 	ldw	x, #0x5217
      0081C7 F6               [ 1]  396 	ld	a, (x)
                                    397 ;	dht11.c: 83: while ((I2C_SR1 & I2C_ADDR) == 0);
      0081C8 A5 02            [ 1]  398 	bcp	a, #0x02
      0081CA 27 F8            [ 1]  399 	jreq	00103$
                                    400 ;	dht11.c: 84: if (mode == I2C_READ)
      0081CC 0D 03            [ 1]  401 	tnz	(0x03, sp)
      0081CE 27 06            [ 1]  402 	jreq	00108$
                                    403 ;	dht11.c: 85: UNSET (I2C_SR1, I2C_ADDR);
      0081D0 A4 FD            [ 1]  404 	and	a, #0xfd
      0081D2 AE 52 17         [ 2]  405 	ldw	x, #0x5217
      0081D5 F7               [ 1]  406 	ld	(x), a
      0081D6                        407 00108$:
      0081D6 5B 03            [ 2]  408 	addw	sp, #3
      0081D8 81               [ 4]  409 	ret
                                    410 ;	dht11.c: 88: void i2c_set_start_ack (void) {
                                    411 ;	-----------------------------------------
                                    412 ;	 function i2c_set_start_ack
                                    413 ;	-----------------------------------------
      0081D9                        414 _i2c_set_start_ack:
                                    415 ;	dht11.c: 89: I2C_CR2 = I2C_ACK | I2C_START;
      0081D9 AE 52 11         [ 2]  416 	ldw	x, #0x5211
      0081DC A6 05            [ 1]  417 	ld	a, #0x05
      0081DE F7               [ 1]  418 	ld	(x), a
                                    419 ;	dht11.c: 90: while ((I2C_SR1 & I2C_SB) == 0);
      0081DF                        420 00101$:
      0081DF AE 52 17         [ 2]  421 	ldw	x, #0x5217
      0081E2 F6               [ 1]  422 	ld	a, (x)
      0081E3 44               [ 1]  423 	srl	a
      0081E4 24 F9            [ 1]  424 	jrnc	00101$
      0081E6 81               [ 4]  425 	ret
                                    426 ;	dht11.c: 97: void print_byte_hex (unsigned char buffer) {
                                    427 ;	-----------------------------------------
                                    428 ;	 function print_byte_hex
                                    429 ;	-----------------------------------------
      0081E7                        430 _print_byte_hex:
      0081E7 52 0C            [ 2]  431 	sub	sp, #12
                                    432 ;	dht11.c: 100: a = (buffer >> 4);
      0081E9 7B 0F            [ 1]  433 	ld	a, (0x0f, sp)
      0081EB 4E               [ 1]  434 	swap	a
      0081EC A4 0F            [ 1]  435 	and	a, #0x0f
      0081EE 5F               [ 1]  436 	clrw	x
      0081EF 97               [ 1]  437 	ld	xl, a
                                    438 ;	dht11.c: 101: if (a > 9)
      0081F0 A3 00 09         [ 2]  439 	cpw	x, #0x0009
      0081F3 2D 07            [ 1]  440 	jrsle	00102$
                                    441 ;	dht11.c: 102: a = a + 'a' - 10;
      0081F5 1C 00 57         [ 2]  442 	addw	x, #0x0057
      0081F8 1F 03            [ 2]  443 	ldw	(0x03, sp), x
      0081FA 20 05            [ 2]  444 	jra	00103$
      0081FC                        445 00102$:
                                    446 ;	dht11.c: 104: a += '0'; 
      0081FC 1C 00 30         [ 2]  447 	addw	x, #0x0030
      0081FF 1F 03            [ 2]  448 	ldw	(0x03, sp), x
      008201                        449 00103$:
                                    450 ;	dht11.c: 105: b = buffer & 0x0f;
      008201 7B 0F            [ 1]  451 	ld	a, (0x0f, sp)
      008203 A4 0F            [ 1]  452 	and	a, #0x0f
      008205 5F               [ 1]  453 	clrw	x
      008206 97               [ 1]  454 	ld	xl, a
                                    455 ;	dht11.c: 106: if (b > 9)
      008207 A3 00 09         [ 2]  456 	cpw	x, #0x0009
      00820A 2D 07            [ 1]  457 	jrsle	00105$
                                    458 ;	dht11.c: 107: b = b + 'a' - 10;
      00820C 1C 00 57         [ 2]  459 	addw	x, #0x0057
      00820F 1F 01            [ 2]  460 	ldw	(0x01, sp), x
      008211 20 05            [ 2]  461 	jra	00106$
      008213                        462 00105$:
                                    463 ;	dht11.c: 109: b += '0'; 
      008213 1C 00 30         [ 2]  464 	addw	x, #0x0030
      008216 1F 01            [ 2]  465 	ldw	(0x01, sp), x
      008218                        466 00106$:
                                    467 ;	dht11.c: 110: message[0] = a;
      008218 90 96            [ 1]  468 	ldw	y, sp
      00821A 72 A9 00 05      [ 2]  469 	addw	y, #5
      00821E 7B 04            [ 1]  470 	ld	a, (0x04, sp)
      008220 90 F7            [ 1]  471 	ld	(y), a
                                    472 ;	dht11.c: 111: message[1] = b;
      008222 93               [ 1]  473 	ldw	x, y
      008223 5C               [ 2]  474 	incw	x
      008224 7B 02            [ 1]  475 	ld	a, (0x02, sp)
      008226 F7               [ 1]  476 	ld	(x), a
                                    477 ;	dht11.c: 112: message[2] = 0;
      008227 93               [ 1]  478 	ldw	x, y
      008228 5C               [ 2]  479 	incw	x
      008229 5C               [ 2]  480 	incw	x
      00822A 7F               [ 1]  481 	clr	(x)
                                    482 ;	dht11.c: 113: UARTPrintF (message);
      00822B 90 89            [ 2]  483 	pushw	y
      00822D CD 81 80         [ 4]  484 	call	_UARTPrintF
      008230 5B 02            [ 2]  485 	addw	sp, #2
      008232 5B 0C            [ 2]  486 	addw	sp, #12
      008234 81               [ 4]  487 	ret
                                    488 ;	dht11.c: 117: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
                                    489 ;	-----------------------------------------
                                    490 ;	 function i2c_read_register
                                    491 ;	-----------------------------------------
      008235                        492 _i2c_read_register:
      008235 52 02            [ 2]  493 	sub	sp, #2
                                    494 ;	dht11.c: 120: i2c_set_start_ack ();
      008237 CD 81 D9         [ 4]  495 	call	_i2c_set_start_ack
                                    496 ;	dht11.c: 121: i2c_send_address (addr, I2C_WRITE);
      00823A 4B 00            [ 1]  497 	push	#0x00
      00823C 7B 06            [ 1]  498 	ld	a, (0x06, sp)
      00823E 88               [ 1]  499 	push	a
      00823F CD 81 97         [ 4]  500 	call	_i2c_send_address
      008242 5B 02            [ 2]  501 	addw	sp, #2
                                    502 ;	dht11.c: 122: i2c_send_reg (rg);
      008244 7B 06            [ 1]  503 	ld	a, (0x06, sp)
      008246 88               [ 1]  504 	push	a
      008247 CD 81 5E         [ 4]  505 	call	_i2c_send_reg
      00824A 84               [ 1]  506 	pop	a
                                    507 ;	dht11.c: 123: i2c_set_start_ack ();
      00824B CD 81 D9         [ 4]  508 	call	_i2c_set_start_ack
                                    509 ;	dht11.c: 124: i2c_send_address (addr, I2C_READ);
      00824E 4B 01            [ 1]  510 	push	#0x01
      008250 7B 06            [ 1]  511 	ld	a, (0x06, sp)
      008252 88               [ 1]  512 	push	a
      008253 CD 81 97         [ 4]  513 	call	_i2c_send_address
      008256 5B 02            [ 2]  514 	addw	sp, #2
                                    515 ;	dht11.c: 125: reg = I2C_SR1;
      008258 AE 52 17         [ 2]  516 	ldw	x, #0x5217
      00825B F6               [ 1]  517 	ld	a, (x)
      00825C 6B 01            [ 1]  518 	ld	(0x01, sp), a
                                    519 ;	dht11.c: 126: reg = I2C_SR3;
      00825E AE 52 19         [ 2]  520 	ldw	x, #0x5219
      008261 F6               [ 1]  521 	ld	a, (x)
      008262 6B 01            [ 1]  522 	ld	(0x01, sp), a
                                    523 ;	dht11.c: 127: i2c_set_nak ();
      008264 CD 81 4E         [ 4]  524 	call	_i2c_set_nak
                                    525 ;	dht11.c: 128: i2c_set_stop ();
      008267 CD 81 56         [ 4]  526 	call	_i2c_set_stop
                                    527 ;	dht11.c: 129: i2c_read (&x);
      00826A 96               [ 1]  528 	ldw	x, sp
      00826B 5C               [ 2]  529 	incw	x
      00826C 5C               [ 2]  530 	incw	x
      00826D 89               [ 2]  531 	pushw	x
      00826E CD 81 3D         [ 4]  532 	call	_i2c_read
      008271 5B 02            [ 2]  533 	addw	sp, #2
                                    534 ;	dht11.c: 130: return (x);
      008273 7B 02            [ 1]  535 	ld	a, (0x02, sp)
      008275 5B 02            [ 2]  536 	addw	sp, #2
      008277 81               [ 4]  537 	ret
                                    538 ;	dht11.c: 133: void InitializeI2C (void) {
                                    539 ;	-----------------------------------------
                                    540 ;	 function InitializeI2C
                                    541 ;	-----------------------------------------
      008278                        542 _InitializeI2C:
                                    543 ;	dht11.c: 134: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
      008278 AE 52 10         [ 2]  544 	ldw	x, #0x5210
      00827B 7F               [ 1]  545 	clr	(x)
                                    546 ;	dht11.c: 138: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
      00827C AE 52 12         [ 2]  547 	ldw	x, #0x5212
      00827F A6 10            [ 1]  548 	ld	a, #0x10
      008281 F7               [ 1]  549 	ld	(x), a
                                    550 ;	dht11.c: 139: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
      008282 72 17 52 1C      [ 1]  551 	bres	0x521c, #7
                                    552 ;	dht11.c: 141: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
      008286 AE 52 1B         [ 2]  553 	ldw	x, #0x521b
      008289 A6 A0            [ 1]  554 	ld	a, #0xa0
      00828B F7               [ 1]  555 	ld	(x), a
                                    556 ;	dht11.c: 143: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
      00828C AE 52 1C         [ 2]  557 	ldw	x, #0x521c
      00828F 7F               [ 1]  558 	clr	(x)
                                    559 ;	dht11.c: 147: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
      008290 72 17 52 14      [ 1]  560 	bres	0x5214, #7
                                    561 ;	dht11.c: 148: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
      008294 AE 52 14         [ 2]  562 	ldw	x, #0x5214
      008297 F6               [ 1]  563 	ld	a, (x)
      008298 AA 40            [ 1]  564 	or	a, #0x40
      00829A F7               [ 1]  565 	ld	(x), a
                                    566 ;	dht11.c: 152: I2C_TRISER = 17;
      00829B AE 52 1D         [ 2]  567 	ldw	x, #0x521d
      00829E A6 11            [ 1]  568 	ld	a, #0x11
      0082A0 F7               [ 1]  569 	ld	(x), a
                                    570 ;	dht11.c: 160: I2C_CR1 = I2C_PE;	// Enables port
      0082A1 AE 52 10         [ 2]  571 	ldw	x, #0x5210
      0082A4 A6 01            [ 1]  572 	ld	a, #0x01
      0082A6 F7               [ 1]  573 	ld	(x), a
      0082A7 81               [ 4]  574 	ret
                                    575 ;	dht11.c: 166: void InitializeUART() {
                                    576 ;	-----------------------------------------
                                    577 ;	 function InitializeUART
                                    578 ;	-----------------------------------------
      0082A8                        579 _InitializeUART:
                                    580 ;	dht11.c: 176: UART1_CR1 = 0;
      0082A8 AE 52 34         [ 2]  581 	ldw	x, #0x5234
      0082AB 7F               [ 1]  582 	clr	(x)
                                    583 ;	dht11.c: 177: UART1_CR2 = 0;
      0082AC AE 52 35         [ 2]  584 	ldw	x, #0x5235
      0082AF 7F               [ 1]  585 	clr	(x)
                                    586 ;	dht11.c: 178: UART1_CR4 = 0;
      0082B0 AE 52 37         [ 2]  587 	ldw	x, #0x5237
      0082B3 7F               [ 1]  588 	clr	(x)
                                    589 ;	dht11.c: 179: UART1_CR3 = 0;
      0082B4 AE 52 36         [ 2]  590 	ldw	x, #0x5236
      0082B7 7F               [ 1]  591 	clr	(x)
                                    592 ;	dht11.c: 180: UART1_CR5 = 0;
      0082B8 AE 52 38         [ 2]  593 	ldw	x, #0x5238
      0082BB 7F               [ 1]  594 	clr	(x)
                                    595 ;	dht11.c: 181: UART1_GTR = 0;
      0082BC AE 52 39         [ 2]  596 	ldw	x, #0x5239
      0082BF 7F               [ 1]  597 	clr	(x)
                                    598 ;	dht11.c: 182: UART1_PSCR = 0;
      0082C0 AE 52 3A         [ 2]  599 	ldw	x, #0x523a
      0082C3 7F               [ 1]  600 	clr	(x)
                                    601 ;	dht11.c: 186: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      0082C4 AE 52 34         [ 2]  602 	ldw	x, #0x5234
      0082C7 F6               [ 1]  603 	ld	a, (x)
      0082C8 A4 EF            [ 1]  604 	and	a, #0xef
      0082CA F7               [ 1]  605 	ld	(x), a
                                    606 ;	dht11.c: 187: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      0082CB AE 52 34         [ 2]  607 	ldw	x, #0x5234
      0082CE F6               [ 1]  608 	ld	a, (x)
      0082CF A4 FB            [ 1]  609 	and	a, #0xfb
      0082D1 F7               [ 1]  610 	ld	(x), a
                                    611 ;	dht11.c: 188: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      0082D2 AE 52 36         [ 2]  612 	ldw	x, #0x5236
      0082D5 F6               [ 1]  613 	ld	a, (x)
      0082D6 A4 DF            [ 1]  614 	and	a, #0xdf
      0082D8 F7               [ 1]  615 	ld	(x), a
                                    616 ;	dht11.c: 189: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      0082D9 AE 52 36         [ 2]  617 	ldw	x, #0x5236
      0082DC F6               [ 1]  618 	ld	a, (x)
      0082DD A4 EF            [ 1]  619 	and	a, #0xef
      0082DF F7               [ 1]  620 	ld	(x), a
                                    621 ;	dht11.c: 190: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      0082E0 AE 52 33         [ 2]  622 	ldw	x, #0x5233
      0082E3 A6 0A            [ 1]  623 	ld	a, #0x0a
      0082E5 F7               [ 1]  624 	ld	(x), a
                                    625 ;	dht11.c: 191: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      0082E6 AE 52 32         [ 2]  626 	ldw	x, #0x5232
      0082E9 A6 08            [ 1]  627 	ld	a, #0x08
      0082EB F7               [ 1]  628 	ld	(x), a
                                    629 ;	dht11.c: 195: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      0082EC AE 52 35         [ 2]  630 	ldw	x, #0x5235
      0082EF F6               [ 1]  631 	ld	a, (x)
      0082F0 A4 F7            [ 1]  632 	and	a, #0xf7
      0082F2 F7               [ 1]  633 	ld	(x), a
                                    634 ;	dht11.c: 196: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      0082F3 AE 52 35         [ 2]  635 	ldw	x, #0x5235
      0082F6 F6               [ 1]  636 	ld	a, (x)
      0082F7 A4 FB            [ 1]  637 	and	a, #0xfb
      0082F9 F7               [ 1]  638 	ld	(x), a
                                    639 ;	dht11.c: 200: SET (UART1_CR3, CR3_CPOL);
      0082FA AE 52 36         [ 2]  640 	ldw	x, #0x5236
      0082FD F6               [ 1]  641 	ld	a, (x)
      0082FE AA 04            [ 1]  642 	or	a, #0x04
      008300 F7               [ 1]  643 	ld	(x), a
                                    644 ;	dht11.c: 201: SET (UART1_CR3, CR3_CPHA);
      008301 AE 52 36         [ 2]  645 	ldw	x, #0x5236
      008304 F6               [ 1]  646 	ld	a, (x)
      008305 AA 02            [ 1]  647 	or	a, #0x02
      008307 F7               [ 1]  648 	ld	(x), a
                                    649 ;	dht11.c: 202: SET (UART1_CR3, CR3_LBCL);
      008308 72 10 52 36      [ 1]  650 	bset	0x5236, #0
                                    651 ;	dht11.c: 206: SET (UART1_CR2, CR2_TEN);
      00830C AE 52 35         [ 2]  652 	ldw	x, #0x5235
      00830F F6               [ 1]  653 	ld	a, (x)
      008310 AA 08            [ 1]  654 	or	a, #0x08
      008312 F7               [ 1]  655 	ld	(x), a
                                    656 ;	dht11.c: 207: SET (UART1_CR2, CR2_REN);
      008313 AE 52 35         [ 2]  657 	ldw	x, #0x5235
      008316 F6               [ 1]  658 	ld	a, (x)
      008317 AA 04            [ 1]  659 	or	a, #0x04
      008319 F7               [ 1]  660 	ld	(x), a
                                    661 ;	dht11.c: 208: UART1_CR3 = CR3_CLKEN;
      00831A AE 52 36         [ 2]  662 	ldw	x, #0x5236
      00831D A6 08            [ 1]  663 	ld	a, #0x08
      00831F F7               [ 1]  664 	ld	(x), a
      008320 81               [ 4]  665 	ret
                                    666 ;	dht11.c: 236: void tm1637Init(void)
                                    667 ;	-----------------------------------------
                                    668 ;	 function tm1637Init
                                    669 ;	-----------------------------------------
      008321                        670 _tm1637Init:
                                    671 ;	dht11.c: 238: tm1637SetBrightness(8);
      008321 4B 08            [ 1]  672 	push	#0x08
      008323 CD 83 C6         [ 4]  673 	call	_tm1637SetBrightness
      008326 84               [ 1]  674 	pop	a
      008327 81               [ 4]  675 	ret
                                    676 ;	dht11.c: 243: void tm1637DisplayDecimal(long TT,unsigned int displaySeparator)
                                    677 ;	-----------------------------------------
                                    678 ;	 function tm1637DisplayDecimal
                                    679 ;	-----------------------------------------
      008328                        680 _tm1637DisplayDecimal:
      008328 52 13            [ 2]  681 	sub	sp, #19
                                    682 ;	dht11.c: 245: unsigned int v = TT & 0x0000FFFF;
      00832A 7B 19            [ 1]  683 	ld	a, (0x19, sp)
      00832C 97               [ 1]  684 	ld	xl, a
      00832D 7B 18            [ 1]  685 	ld	a, (0x18, sp)
      00832F 95               [ 1]  686 	ld	xh, a
      008330 0F 11            [ 1]  687 	clr	(0x11, sp)
      008332 4F               [ 1]  688 	clr	a
      008333 1F 05            [ 2]  689 	ldw	(0x05, sp), x
                                    690 ;	dht11.c: 251: for (ii = 0; ii < 4; ++ii) {
      008335 96               [ 1]  691 	ldw	x, sp
      008336 5C               [ 2]  692 	incw	x
      008337 1F 09            [ 2]  693 	ldw	(0x09, sp), x
      008339 AE 86 92         [ 2]  694 	ldw	x, #_segmentMap+0
      00833C 1F 0D            [ 2]  695 	ldw	(0x0d, sp), x
      00833E 90 5F            [ 1]  696 	clrw	y
      008340                        697 00106$:
                                    698 ;	dht11.c: 252: digitArr[ii] = segmentMap[v % 10];
      008340 93               [ 1]  699 	ldw	x, y
      008341 72 FB 09         [ 2]  700 	addw	x, (0x09, sp)
      008344 1F 0B            [ 2]  701 	ldw	(0x0b, sp), x
      008346 90 89            [ 2]  702 	pushw	y
      008348 1E 07            [ 2]  703 	ldw	x, (0x07, sp)
      00834A 90 AE 00 0A      [ 2]  704 	ldw	y, #0x000a
      00834E 65               [ 2]  705 	divw	x, y
      00834F 93               [ 1]  706 	ldw	x, y
      008350 90 85            [ 2]  707 	popw	y
      008352 72 FB 0D         [ 2]  708 	addw	x, (0x0d, sp)
      008355 F6               [ 1]  709 	ld	a, (x)
      008356 1E 0B            [ 2]  710 	ldw	x, (0x0b, sp)
      008358 F7               [ 1]  711 	ld	(x), a
                                    712 ;	dht11.c: 253: if (ii == 2 && displaySeparator) {
      008359 90 A3 00 02      [ 2]  713 	cpw	y, #0x0002
      00835D 26 0C            [ 1]  714 	jrne	00102$
      00835F 1E 1A            [ 2]  715 	ldw	x, (0x1a, sp)
      008361 27 08            [ 1]  716 	jreq	00102$
                                    717 ;	dht11.c: 254: digitArr[ii] |= 1 << 7;
      008363 1E 0B            [ 2]  718 	ldw	x, (0x0b, sp)
      008365 F6               [ 1]  719 	ld	a, (x)
      008366 AA 80            [ 1]  720 	or	a, #0x80
      008368 1E 0B            [ 2]  721 	ldw	x, (0x0b, sp)
      00836A F7               [ 1]  722 	ld	(x), a
      00836B                        723 00102$:
                                    724 ;	dht11.c: 256: v /= 10;
      00836B 90 89            [ 2]  725 	pushw	y
      00836D 1E 07            [ 2]  726 	ldw	x, (0x07, sp)
      00836F 90 AE 00 0A      [ 2]  727 	ldw	y, #0x000a
      008373 65               [ 2]  728 	divw	x, y
      008374 90 85            [ 2]  729 	popw	y
      008376 1F 05            [ 2]  730 	ldw	(0x05, sp), x
                                    731 ;	dht11.c: 251: for (ii = 0; ii < 4; ++ii) {
      008378 90 5C            [ 2]  732 	incw	y
      00837A 90 A3 00 04      [ 2]  733 	cpw	y, #0x0004
      00837E 25 C0            [ 1]  734 	jrc	00106$
                                    735 ;	dht11.c: 259: _tm1637Start();
      008380 CD 83 D8         [ 4]  736 	call	__tm1637Start
                                    737 ;	dht11.c: 260: _tm1637WriteByte(0x40);
      008383 4B 40            [ 1]  738 	push	#0x40
      008385 CD 84 2C         [ 4]  739 	call	__tm1637WriteByte
      008388 84               [ 1]  740 	pop	a
                                    741 ;	dht11.c: 261: _tm1637ReadResult();
      008389 CD 84 11         [ 4]  742 	call	__tm1637ReadResult
                                    743 ;	dht11.c: 262: _tm1637Stop();
      00838C CD 83 EA         [ 4]  744 	call	__tm1637Stop
                                    745 ;	dht11.c: 264: _tm1637Start();
      00838F CD 83 D8         [ 4]  746 	call	__tm1637Start
                                    747 ;	dht11.c: 265: _tm1637WriteByte(0xc0);
      008392 4B C0            [ 1]  748 	push	#0xc0
      008394 CD 84 2C         [ 4]  749 	call	__tm1637WriteByte
      008397 84               [ 1]  750 	pop	a
                                    751 ;	dht11.c: 266: _tm1637ReadResult();
      008398 CD 84 11         [ 4]  752 	call	__tm1637ReadResult
                                    753 ;	dht11.c: 268: for (ii = 0; ii < 4; ++ii) {
      00839B 5F               [ 1]  754 	clrw	x
      00839C 1F 07            [ 2]  755 	ldw	(0x07, sp), x
      00839E                        756 00108$:
                                    757 ;	dht11.c: 269: _tm1637WriteByte(digitArr[3 - ii]);
      00839E 7B 08            [ 1]  758 	ld	a, (0x08, sp)
      0083A0 6B 0F            [ 1]  759 	ld	(0x0f, sp), a
      0083A2 A6 03            [ 1]  760 	ld	a, #0x03
      0083A4 10 0F            [ 1]  761 	sub	a, (0x0f, sp)
      0083A6 5F               [ 1]  762 	clrw	x
      0083A7 97               [ 1]  763 	ld	xl, a
      0083A8 72 FB 09         [ 2]  764 	addw	x, (0x09, sp)
      0083AB F6               [ 1]  765 	ld	a, (x)
      0083AC 88               [ 1]  766 	push	a
      0083AD CD 84 2C         [ 4]  767 	call	__tm1637WriteByte
      0083B0 84               [ 1]  768 	pop	a
                                    769 ;	dht11.c: 270: _tm1637ReadResult();
      0083B1 CD 84 11         [ 4]  770 	call	__tm1637ReadResult
                                    771 ;	dht11.c: 268: for (ii = 0; ii < 4; ++ii) {
      0083B4 1E 07            [ 2]  772 	ldw	x, (0x07, sp)
      0083B6 5C               [ 2]  773 	incw	x
      0083B7 1F 07            [ 2]  774 	ldw	(0x07, sp), x
      0083B9 1E 07            [ 2]  775 	ldw	x, (0x07, sp)
      0083BB A3 00 04         [ 2]  776 	cpw	x, #0x0004
      0083BE 25 DE            [ 1]  777 	jrc	00108$
                                    778 ;	dht11.c: 273: _tm1637Stop();
      0083C0 CD 83 EA         [ 4]  779 	call	__tm1637Stop
      0083C3 5B 13            [ 2]  780 	addw	sp, #19
      0083C5 81               [ 4]  781 	ret
                                    782 ;	dht11.c: 278: void tm1637SetBrightness(char brightness)
                                    783 ;	-----------------------------------------
                                    784 ;	 function tm1637SetBrightness
                                    785 ;	-----------------------------------------
      0083C6                        786 _tm1637SetBrightness:
                                    787 ;	dht11.c: 285: _tm1637Start();
      0083C6 CD 83 D8         [ 4]  788 	call	__tm1637Start
                                    789 ;	dht11.c: 286: _tm1637WriteByte(0x87 + brightness);
      0083C9 7B 03            [ 1]  790 	ld	a, (0x03, sp)
      0083CB AB 87            [ 1]  791 	add	a, #0x87
      0083CD 88               [ 1]  792 	push	a
      0083CE CD 84 2C         [ 4]  793 	call	__tm1637WriteByte
      0083D1 84               [ 1]  794 	pop	a
                                    795 ;	dht11.c: 287: _tm1637ReadResult();
      0083D2 CD 84 11         [ 4]  796 	call	__tm1637ReadResult
                                    797 ;	dht11.c: 288: _tm1637Stop();
      0083D5 CC 83 EA         [ 2]  798 	jp	__tm1637Stop
                                    799 ;	dht11.c: 291: void _tm1637Start(void)
                                    800 ;	-----------------------------------------
                                    801 ;	 function _tm1637Start
                                    802 ;	-----------------------------------------
      0083D8                        803 __tm1637Start:
                                    804 ;	dht11.c: 293: _tm1637ClkHigh();
      0083D8 CD 84 6A         [ 4]  805 	call	__tm1637ClkHigh
                                    806 ;	dht11.c: 294: _tm1637DioHigh();
      0083DB CD 84 7A         [ 4]  807 	call	__tm1637DioHigh
                                    808 ;	dht11.c: 295: delay(5);
      0083DE 4B 05            [ 1]  809 	push	#0x05
      0083E0 4B 00            [ 1]  810 	push	#0x00
      0083E2 CD 80 F2         [ 4]  811 	call	_delay
      0083E5 5B 02            [ 2]  812 	addw	sp, #2
                                    813 ;	dht11.c: 296: _tm1637DioLow();
      0083E7 CC 84 82         [ 2]  814 	jp	__tm1637DioLow
                                    815 ;	dht11.c: 299: void _tm1637Stop(void)
                                    816 ;	-----------------------------------------
                                    817 ;	 function _tm1637Stop
                                    818 ;	-----------------------------------------
      0083EA                        819 __tm1637Stop:
                                    820 ;	dht11.c: 301: _tm1637ClkLow();
      0083EA CD 84 72         [ 4]  821 	call	__tm1637ClkLow
                                    822 ;	dht11.c: 302: delay(5);
      0083ED 4B 05            [ 1]  823 	push	#0x05
      0083EF 4B 00            [ 1]  824 	push	#0x00
      0083F1 CD 80 F2         [ 4]  825 	call	_delay
      0083F4 5B 02            [ 2]  826 	addw	sp, #2
                                    827 ;	dht11.c: 303: _tm1637DioLow();
      0083F6 CD 84 82         [ 4]  828 	call	__tm1637DioLow
                                    829 ;	dht11.c: 304: delay(5);
      0083F9 4B 05            [ 1]  830 	push	#0x05
      0083FB 4B 00            [ 1]  831 	push	#0x00
      0083FD CD 80 F2         [ 4]  832 	call	_delay
      008400 5B 02            [ 2]  833 	addw	sp, #2
                                    834 ;	dht11.c: 305: _tm1637ClkHigh();
      008402 CD 84 6A         [ 4]  835 	call	__tm1637ClkHigh
                                    836 ;	dht11.c: 306: delay(5);
      008405 4B 05            [ 1]  837 	push	#0x05
      008407 4B 00            [ 1]  838 	push	#0x00
      008409 CD 80 F2         [ 4]  839 	call	_delay
      00840C 5B 02            [ 2]  840 	addw	sp, #2
                                    841 ;	dht11.c: 307: _tm1637DioHigh();
      00840E CC 84 7A         [ 2]  842 	jp	__tm1637DioHigh
                                    843 ;	dht11.c: 310: void _tm1637ReadResult(void)
                                    844 ;	-----------------------------------------
                                    845 ;	 function _tm1637ReadResult
                                    846 ;	-----------------------------------------
      008411                        847 __tm1637ReadResult:
                                    848 ;	dht11.c: 312: _tm1637ClkLow();
      008411 CD 84 72         [ 4]  849 	call	__tm1637ClkLow
                                    850 ;	dht11.c: 313: delay(5);
      008414 4B 05            [ 1]  851 	push	#0x05
      008416 4B 00            [ 1]  852 	push	#0x00
      008418 CD 80 F2         [ 4]  853 	call	_delay
      00841B 5B 02            [ 2]  854 	addw	sp, #2
                                    855 ;	dht11.c: 315: _tm1637ClkHigh();
      00841D CD 84 6A         [ 4]  856 	call	__tm1637ClkHigh
                                    857 ;	dht11.c: 316: delay(5);
      008420 4B 05            [ 1]  858 	push	#0x05
      008422 4B 00            [ 1]  859 	push	#0x00
      008424 CD 80 F2         [ 4]  860 	call	_delay
      008427 5B 02            [ 2]  861 	addw	sp, #2
                                    862 ;	dht11.c: 317: _tm1637ClkLow();
      008429 CC 84 72         [ 2]  863 	jp	__tm1637ClkLow
                                    864 ;	dht11.c: 320: void _tm1637WriteByte(unsigned char b)
                                    865 ;	-----------------------------------------
                                    866 ;	 function _tm1637WriteByte
                                    867 ;	-----------------------------------------
      00842C                        868 __tm1637WriteByte:
      00842C 52 02            [ 2]  869 	sub	sp, #2
                                    870 ;	dht11.c: 322: for (ii = 0; ii < 8; ++ii) {
      00842E 5F               [ 1]  871 	clrw	x
      00842F 1F 01            [ 2]  872 	ldw	(0x01, sp), x
      008431                        873 00105$:
                                    874 ;	dht11.c: 323: _tm1637ClkLow();
      008431 CD 84 72         [ 4]  875 	call	__tm1637ClkLow
                                    876 ;	dht11.c: 324: if (b & 0x01) {
      008434 7B 05            [ 1]  877 	ld	a, (0x05, sp)
      008436 44               [ 1]  878 	srl	a
      008437 24 05            [ 1]  879 	jrnc	00102$
                                    880 ;	dht11.c: 325: _tm1637DioHigh();
      008439 CD 84 7A         [ 4]  881 	call	__tm1637DioHigh
      00843C 20 03            [ 2]  882 	jra	00103$
      00843E                        883 00102$:
                                    884 ;	dht11.c: 328: _tm1637DioLow();
      00843E CD 84 82         [ 4]  885 	call	__tm1637DioLow
      008441                        886 00103$:
                                    887 ;	dht11.c: 330: delay(15);
      008441 4B 0F            [ 1]  888 	push	#0x0f
      008443 4B 00            [ 1]  889 	push	#0x00
      008445 CD 80 F2         [ 4]  890 	call	_delay
      008448 5B 02            [ 2]  891 	addw	sp, #2
                                    892 ;	dht11.c: 331: b >>= 1;
      00844A 7B 05            [ 1]  893 	ld	a, (0x05, sp)
      00844C 44               [ 1]  894 	srl	a
      00844D 6B 05            [ 1]  895 	ld	(0x05, sp), a
                                    896 ;	dht11.c: 332: _tm1637ClkHigh();
      00844F CD 84 6A         [ 4]  897 	call	__tm1637ClkHigh
                                    898 ;	dht11.c: 333: delay(15);
      008452 4B 0F            [ 1]  899 	push	#0x0f
      008454 4B 00            [ 1]  900 	push	#0x00
      008456 CD 80 F2         [ 4]  901 	call	_delay
      008459 5B 02            [ 2]  902 	addw	sp, #2
                                    903 ;	dht11.c: 322: for (ii = 0; ii < 8; ++ii) {
      00845B 1E 01            [ 2]  904 	ldw	x, (0x01, sp)
      00845D 5C               [ 2]  905 	incw	x
      00845E 1F 01            [ 2]  906 	ldw	(0x01, sp), x
      008460 1E 01            [ 2]  907 	ldw	x, (0x01, sp)
      008462 A3 00 08         [ 2]  908 	cpw	x, #0x0008
      008465 2F CA            [ 1]  909 	jrslt	00105$
      008467 5B 02            [ 2]  910 	addw	sp, #2
      008469 81               [ 4]  911 	ret
                                    912 ;	dht11.c: 339: void _tm1637ClkHigh(void)
                                    913 ;	-----------------------------------------
                                    914 ;	 function _tm1637ClkHigh
                                    915 ;	-----------------------------------------
      00846A                        916 __tm1637ClkHigh:
                                    917 ;	dht11.c: 344: PD_ODR |= 1 << 2;
      00846A AE 50 0F         [ 2]  918 	ldw	x, #0x500f
      00846D F6               [ 1]  919 	ld	a, (x)
      00846E AA 04            [ 1]  920 	or	a, #0x04
      008470 F7               [ 1]  921 	ld	(x), a
      008471 81               [ 4]  922 	ret
                                    923 ;	dht11.c: 347: void _tm1637ClkLow(void)
                                    924 ;	-----------------------------------------
                                    925 ;	 function _tm1637ClkLow
                                    926 ;	-----------------------------------------
      008472                        927 __tm1637ClkLow:
                                    928 ;	dht11.c: 351: PD_ODR &= ~(1 << 2);
      008472 AE 50 0F         [ 2]  929 	ldw	x, #0x500f
      008475 F6               [ 1]  930 	ld	a, (x)
      008476 A4 FB            [ 1]  931 	and	a, #0xfb
      008478 F7               [ 1]  932 	ld	(x), a
      008479 81               [ 4]  933 	ret
                                    934 ;	dht11.c: 357: void _tm1637DioHigh(void)
                                    935 ;	-----------------------------------------
                                    936 ;	 function _tm1637DioHigh
                                    937 ;	-----------------------------------------
      00847A                        938 __tm1637DioHigh:
                                    939 ;	dht11.c: 361: PD_ODR |= 1 << 3;
      00847A AE 50 0F         [ 2]  940 	ldw	x, #0x500f
      00847D F6               [ 1]  941 	ld	a, (x)
      00847E AA 08            [ 1]  942 	or	a, #0x08
      008480 F7               [ 1]  943 	ld	(x), a
      008481 81               [ 4]  944 	ret
                                    945 ;	dht11.c: 365: void _tm1637DioLow(void)
                                    946 ;	-----------------------------------------
                                    947 ;	 function _tm1637DioLow
                                    948 ;	-----------------------------------------
      008482                        949 __tm1637DioLow:
                                    950 ;	dht11.c: 367: PD_ODR &= ~(1 << 3);
      008482 AE 50 0F         [ 2]  951 	ldw	x, #0x500f
      008485 F6               [ 1]  952 	ld	a, (x)
      008486 A4 F7            [ 1]  953 	and	a, #0xf7
      008488 F7               [ 1]  954 	ld	(x), a
      008489 81               [ 4]  955 	ret
                                    956 ;	dht11.c: 374: void dht11_init(void)
                                    957 ;	-----------------------------------------
                                    958 ;	 function dht11_init
                                    959 ;	-----------------------------------------
      00848A                        960 _dht11_init:
                                    961 ;	dht11.c: 376: PA_DDR |= (1 << 3); //port PA3
      00848A AE 50 02         [ 2]  962 	ldw	x, #0x5002
      00848D F6               [ 1]  963 	ld	a, (x)
      00848E AA 08            [ 1]  964 	or	a, #0x08
      008490 F7               [ 1]  965 	ld	(x), a
                                    966 ;	dht11.c: 377: PA_ODR |= (1 << 3);
      008491 AE 50 00         [ 2]  967 	ldw	x, #0x5000
      008494 F6               [ 1]  968 	ld	a, (x)
      008495 AA 08            [ 1]  969 	or	a, #0x08
      008497 F7               [ 1]  970 	ld	(x), a
      008498 81               [ 4]  971 	ret
                                    972 ;	dht11.c: 387: unsigned char DHT_ReadData(unsigned char* data)
                                    973 ;	-----------------------------------------
                                    974 ;	 function DHT_ReadData
                                    975 ;	-----------------------------------------
      008499                        976 _DHT_ReadData:
      008499 52 04            [ 2]  977 	sub	sp, #4
                                    978 ;	dht11.c: 389: unsigned char byte_num = 0, bit_num = 0, byte = 0, count = 0;
      00849B 0F 02            [ 1]  979 	clr	(0x02, sp)
      00849D 0F 04            [ 1]  980 	clr	(0x04, sp)
                                    981 ;	dht11.c: 391: PA_ODR &= ~(1 << 3);
      00849F AE 50 00         [ 2]  982 	ldw	x, #0x5000
      0084A2 F6               [ 1]  983 	ld	a, (x)
      0084A3 A4 F7            [ 1]  984 	and	a, #0xf7
      0084A5 F7               [ 1]  985 	ld	(x), a
                                    986 ;	dht11.c: 393: delay(1);
      0084A6 4B 01            [ 1]  987 	push	#0x01
      0084A8 4B 00            [ 1]  988 	push	#0x00
      0084AA CD 80 F2         [ 4]  989 	call	_delay
      0084AD 5B 02            [ 2]  990 	addw	sp, #2
                                    991 ;	dht11.c: 395: PA_ODR |= (1 << 3);
      0084AF AE 50 00         [ 2]  992 	ldw	x, #0x5000
      0084B2 F6               [ 1]  993 	ld	a, (x)
      0084B3 AA 08            [ 1]  994 	or	a, #0x08
      0084B5 F7               [ 1]  995 	ld	(x), a
                                    996 ;	dht11.c: 396: PA_DDR &= ~(1 << 3); //port PA3 as input
      0084B6 AE 50 02         [ 2]  997 	ldw	x, #0x5002
      0084B9 F6               [ 1]  998 	ld	a, (x)
      0084BA A4 F7            [ 1]  999 	and	a, #0xf7
      0084BC F7               [ 1] 1000 	ld	(x), a
                                   1001 ;	dht11.c: 399: while (PA_IDR & (1<<3));          // wait sensor response 20-40us
      0084BD                       1002 00101$:
      0084BD AE 50 01         [ 2] 1003 	ldw	x, #0x5001
      0084C0 F6               [ 1] 1004 	ld	a, (x)
      0084C1 A4 08            [ 1] 1005 	and	a, #0x08
      0084C3 4D               [ 1] 1006 	tnz	a
      0084C4 26 F7            [ 1] 1007 	jrne	00101$
                                   1008 ;	dht11.c: 400: while (!(PA_IDR & (1<<3)));          // pin low 80 ms :response 
      0084C6                       1009 00104$:
      0084C6 4D               [ 1] 1010 	tnz	a
      0084C7 27 FD            [ 1] 1011 	jreq	00104$
                                   1012 ;	dht11.c: 402: while (PA_IDR & (1<<3));          // pin high 
      0084C9                       1013 00107$:
      0084C9 4D               [ 1] 1014 	tnz	a
      0084CA 26 FD            [ 1] 1015 	jrne	00107$
                                   1016 ;	dht11.c: 404: for (byte_num = 0; byte_num < NUM_OF_BYTES; byte_num++)
      0084CC 0F 01            [ 1] 1017 	clr	(0x01, sp)
                                   1018 ;	dht11.c: 408: while (!(PA_IDR & (1<<3)));          // pin low 80 ms :response 
      0084CE                       1019 00130$:
      0084CE 0F 03            [ 1] 1020 	clr	(0x03, sp)
      0084D0                       1021 00110$:
                                   1022 ;	dht11.c: 399: while (PA_IDR & (1<<3));          // wait sensor response 20-40us
      0084D0 AE 50 01         [ 2] 1023 	ldw	x, #0x5001
      0084D3 F6               [ 1] 1024 	ld	a, (x)
      0084D4 A4 08            [ 1] 1025 	and	a, #0x08
                                   1026 ;	dht11.c: 408: while (!(PA_IDR & (1<<3)));          // pin low 80 ms :response 
      0084D6 4D               [ 1] 1027 	tnz	a
      0084D7 27 F7            [ 1] 1028 	jreq	00110$
                                   1029 ;	dht11.c: 410: while (PA_IDR & (1<<3));          // pin high 
      0084D9                       1030 00113$:
      0084D9 4D               [ 1] 1031 	tnz	a
      0084DA 26 FD            [ 1] 1032 	jrne	00113$
                                   1033 ;	dht11.c: 413: count++;
      0084DC 7B 04            [ 1] 1034 	ld	a, (0x04, sp)
      0084DE 4C               [ 1] 1035 	inc	a
                                   1036 ;	dht11.c: 415: if (count > ONE_LOW)
      0084DF A1 82            [ 1] 1037 	cp	a, #0x82
      0084E1 23 16            [ 2] 1038 	jrule	00117$
                                   1039 ;	dht11.c: 417: byte |= (1 << (8 - bit_num));
      0084E3 A6 08            [ 1] 1040 	ld	a, #0x08
      0084E5 10 03            [ 1] 1041 	sub	a, (0x03, sp)
      0084E7 95               [ 1] 1042 	ld	xh, a
      0084E8 A6 01            [ 1] 1043 	ld	a, #0x01
      0084EA 88               [ 1] 1044 	push	a
      0084EB 9E               [ 1] 1045 	ld	a, xh
      0084EC 4D               [ 1] 1046 	tnz	a
      0084ED 27 05            [ 1] 1047 	jreq	00179$
      0084EF                       1048 00178$:
      0084EF 08 01            [ 1] 1049 	sll	(1, sp)
      0084F1 4A               [ 1] 1050 	dec	a
      0084F2 26 FB            [ 1] 1051 	jrne	00178$
      0084F4                       1052 00179$:
      0084F4 84               [ 1] 1053 	pop	a
      0084F5 1A 02            [ 1] 1054 	or	a, (0x02, sp)
      0084F7 6B 02            [ 1] 1055 	ld	(0x02, sp), a
      0084F9                       1056 00117$:
                                   1057 ;	dht11.c: 419: count = 0;
      0084F9 0F 04            [ 1] 1058 	clr	(0x04, sp)
                                   1059 ;	dht11.c: 406: for (bit_num = 0; bit_num < 8; bit_num++)
      0084FB 0C 03            [ 1] 1060 	inc	(0x03, sp)
      0084FD 7B 03            [ 1] 1061 	ld	a, (0x03, sp)
      0084FF A1 08            [ 1] 1062 	cp	a, #0x08
      008501 25 CD            [ 1] 1063 	jrc	00110$
                                   1064 ;	dht11.c: 421: *(data + byte_num) = byte;
      008503 5F               [ 1] 1065 	clrw	x
      008504 7B 01            [ 1] 1066 	ld	a, (0x01, sp)
      008506 97               [ 1] 1067 	ld	xl, a
      008507 72 FB 07         [ 2] 1068 	addw	x, (0x07, sp)
      00850A 7B 02            [ 1] 1069 	ld	a, (0x02, sp)
      00850C F7               [ 1] 1070 	ld	(x), a
                                   1071 ;	dht11.c: 422: byte = 0;
      00850D 0F 02            [ 1] 1072 	clr	(0x02, sp)
                                   1073 ;	dht11.c: 404: for (byte_num = 0; byte_num < NUM_OF_BYTES; byte_num++)
      00850F 0C 01            [ 1] 1074 	inc	(0x01, sp)
      008511 7B 01            [ 1] 1075 	ld	a, (0x01, sp)
      008513 A1 05            [ 1] 1076 	cp	a, #0x05
      008515 25 B7            [ 1] 1077 	jrc	00130$
                                   1078 ;	dht11.c: 424: return 0;
      008517 4F               [ 1] 1079 	clr	a
      008518 5B 04            [ 2] 1080 	addw	sp, #4
      00851A 81               [ 4] 1081 	ret
                                   1082 ;	dht11.c: 429: int main () {
                                   1083 ;	-----------------------------------------
                                   1084 ;	 function main
                                   1085 ;	-----------------------------------------
      00851B                       1086 _main:
      00851B 52 1D            [ 2] 1087 	sub	sp, #29
                                   1088 ;	dht11.c: 437: InitializeSystemClock();
      00851D CD 80 A8         [ 4] 1089 	call	_InitializeSystemClock
                                   1090 ;	dht11.c: 442: PB_CR1 = (1 << 4) | (1 << 5); // push-pull
      008520 AE 50 08         [ 2] 1091 	ldw	x, #0x5008
      008523 A6 30            [ 1] 1092 	ld	a, #0x30
      008525 F7               [ 1] 1093 	ld	(x), a
                                   1094 ;	dht11.c: 444: PD_DDR = (1 << 3) | (1 << 2); // output mode
      008526 AE 50 11         [ 2] 1095 	ldw	x, #0x5011
      008529 A6 0C            [ 1] 1096 	ld	a, #0x0c
      00852B F7               [ 1] 1097 	ld	(x), a
                                   1098 ;	dht11.c: 445: PD_CR2 = (1 << 3) | (1 << 2); // up to 10MHz speed
      00852C AE 50 13         [ 2] 1099 	ldw	x, #0x5013
      00852F A6 0C            [ 1] 1100 	ld	a, #0x0c
      008531 F7               [ 1] 1101 	ld	(x), a
                                   1102 ;	dht11.c: 446: PD_CR1 = 0; // push-pull
      008532 AE 50 12         [ 2] 1103 	ldw	x, #0x5012
      008535 7F               [ 1] 1104 	clr	(x)
                                   1105 ;	dht11.c: 447: PD_CR2 = 0; // up to 10MHz speed
      008536 AE 50 13         [ 2] 1106 	ldw	x, #0x5013
      008539 7F               [ 1] 1107 	clr	(x)
                                   1108 ;	dht11.c: 448: tm1637Init();
      00853A CD 83 21         [ 4] 1109 	call	_tm1637Init
                                   1110 ;	dht11.c: 450: InitializeUART();
      00853D CD 82 A8         [ 4] 1111 	call	_InitializeUART
                                   1112 ;	dht11.c: 451: UARTPrintF("uart initialised \n\r");
      008540 AE 86 A3         [ 2] 1113 	ldw	x, #___str_0+0
      008543 89               [ 2] 1114 	pushw	x
      008544 CD 81 80         [ 4] 1115 	call	_UARTPrintF
      008547 5B 02            [ 2] 1116 	addw	sp, #2
                                   1117 ;	dht11.c: 453: dht11_init();	
      008549 CD 84 8A         [ 4] 1118 	call	_dht11_init
                                   1119 ;	dht11.c: 454: delay(200);
      00854C 4B C8            [ 1] 1120 	push	#0xc8
      00854E 4B 00            [ 1] 1121 	push	#0x00
      008550 CD 80 F2         [ 4] 1122 	call	_delay
      008553 5B 02            [ 2] 1123 	addw	sp, #2
                                   1124 ;	dht11.c: 456: DHT_ReadData(tmpr);
      008555 96               [ 1] 1125 	ldw	x, sp
      008556 1C 00 03         [ 2] 1126 	addw	x, #3
      008559 1F 1C            [ 2] 1127 	ldw	(0x1c, sp), x
      00855B 1E 1C            [ 2] 1128 	ldw	x, (0x1c, sp)
      00855D 89               [ 2] 1129 	pushw	x
      00855E CD 84 99         [ 4] 1130 	call	_DHT_ReadData
      008561 5B 02            [ 2] 1131 	addw	sp, #2
                                   1132 ;	dht11.c: 460: while (1) {
      008563                       1133 00114$:
                                   1134 ;	dht11.c: 461: objTemp = tmpr[0]; // humidity 
      008563 1E 1C            [ 2] 1135 	ldw	x, (0x1c, sp)
      008565 F6               [ 1] 1136 	ld	a, (x)
      008566 88               [ 1] 1137 	push	a
      008567 CD 8B C8         [ 4] 1138 	call	___uchar2fs
      00856A 84               [ 1] 1139 	pop	a
      00856B 1F 10            [ 2] 1140 	ldw	(0x10, sp), x
      00856D 17 0E            [ 2] 1141 	ldw	(0x0e, sp), y
                                   1142 ;	dht11.c: 466: while (objTemp > 1000) {
      00856F 5F               [ 1] 1143 	clrw	x
      008570 1F 01            [ 2] 1144 	ldw	(0x01, sp), x
      008572                       1145 00101$:
      008572 5F               [ 1] 1146 	clrw	x
      008573 89               [ 2] 1147 	pushw	x
      008574 4B 7A            [ 1] 1148 	push	#0x7a
      008576 4B 44            [ 1] 1149 	push	#0x44
      008578 1E 14            [ 2] 1150 	ldw	x, (0x14, sp)
      00857A 89               [ 2] 1151 	pushw	x
      00857B 1E 14            [ 2] 1152 	ldw	x, (0x14, sp)
      00857D 89               [ 2] 1153 	pushw	x
      00857E CD 86 DF         [ 4] 1154 	call	___fsgt
      008581 5B 08            [ 2] 1155 	addw	sp, #8
      008583 4D               [ 1] 1156 	tnz	a
      008584 27 1C            [ 1] 1157 	jreq	00127$
                                   1158 ;	dht11.c: 467: vierde+=1;
      008586 1E 01            [ 2] 1159 	ldw	x, (0x01, sp)
      008588 5C               [ 2] 1160 	incw	x
      008589 1F 01            [ 2] 1161 	ldw	(0x01, sp), x
                                   1162 ;	dht11.c: 468: objTemp-=1000;
      00858B 5F               [ 1] 1163 	clrw	x
      00858C 89               [ 2] 1164 	pushw	x
      00858D 4B 7A            [ 1] 1165 	push	#0x7a
      00858F 4B 44            [ 1] 1166 	push	#0x44
      008591 1E 14            [ 2] 1167 	ldw	x, (0x14, sp)
      008593 89               [ 2] 1168 	pushw	x
      008594 1E 14            [ 2] 1169 	ldw	x, (0x14, sp)
      008596 89               [ 2] 1170 	pushw	x
      008597 CD 86 B7         [ 4] 1171 	call	___fssub
      00859A 5B 08            [ 2] 1172 	addw	sp, #8
      00859C 1F 10            [ 2] 1173 	ldw	(0x10, sp), x
      00859E 17 0E            [ 2] 1174 	ldw	(0x0e, sp), y
      0085A0 20 D0            [ 2] 1175 	jra	00101$
                                   1176 ;	dht11.c: 470: while (objTemp > 100) {
      0085A2                       1177 00127$:
      0085A2 16 01            [ 2] 1178 	ldw	y, (0x01, sp)
      0085A4 17 1A            [ 2] 1179 	ldw	(0x1a, sp), y
      0085A6 5F               [ 1] 1180 	clrw	x
      0085A7 1F 08            [ 2] 1181 	ldw	(0x08, sp), x
      0085A9                       1182 00104$:
      0085A9 5F               [ 1] 1183 	clrw	x
      0085AA 89               [ 2] 1184 	pushw	x
      0085AB 4B C8            [ 1] 1185 	push	#0xc8
      0085AD 4B 42            [ 1] 1186 	push	#0x42
      0085AF 1E 14            [ 2] 1187 	ldw	x, (0x14, sp)
      0085B1 89               [ 2] 1188 	pushw	x
      0085B2 1E 14            [ 2] 1189 	ldw	x, (0x14, sp)
      0085B4 89               [ 2] 1190 	pushw	x
      0085B5 CD 86 DF         [ 4] 1191 	call	___fsgt
      0085B8 5B 08            [ 2] 1192 	addw	sp, #8
      0085BA 4D               [ 1] 1193 	tnz	a
      0085BB 27 1C            [ 1] 1194 	jreq	00128$
                                   1195 ;	dht11.c: 471: derde+=1;
      0085BD 1E 08            [ 2] 1196 	ldw	x, (0x08, sp)
      0085BF 5C               [ 2] 1197 	incw	x
      0085C0 1F 08            [ 2] 1198 	ldw	(0x08, sp), x
                                   1199 ;	dht11.c: 472: objTemp-=100;
      0085C2 5F               [ 1] 1200 	clrw	x
      0085C3 89               [ 2] 1201 	pushw	x
      0085C4 4B C8            [ 1] 1202 	push	#0xc8
      0085C6 4B 42            [ 1] 1203 	push	#0x42
      0085C8 1E 14            [ 2] 1204 	ldw	x, (0x14, sp)
      0085CA 89               [ 2] 1205 	pushw	x
      0085CB 1E 14            [ 2] 1206 	ldw	x, (0x14, sp)
      0085CD 89               [ 2] 1207 	pushw	x
      0085CE CD 86 B7         [ 4] 1208 	call	___fssub
      0085D1 5B 08            [ 2] 1209 	addw	sp, #8
      0085D3 1F 10            [ 2] 1210 	ldw	(0x10, sp), x
      0085D5 17 0E            [ 2] 1211 	ldw	(0x0e, sp), y
      0085D7 20 D0            [ 2] 1212 	jra	00104$
                                   1213 ;	dht11.c: 474: while (objTemp > 10) {
      0085D9                       1214 00128$:
      0085D9 16 08            [ 2] 1215 	ldw	y, (0x08, sp)
      0085DB 17 18            [ 2] 1216 	ldw	(0x18, sp), y
      0085DD 5F               [ 1] 1217 	clrw	x
      0085DE 1F 0A            [ 2] 1218 	ldw	(0x0a, sp), x
      0085E0                       1219 00107$:
      0085E0 5F               [ 1] 1220 	clrw	x
      0085E1 89               [ 2] 1221 	pushw	x
      0085E2 4B 20            [ 1] 1222 	push	#0x20
      0085E4 4B 41            [ 1] 1223 	push	#0x41
      0085E6 1E 14            [ 2] 1224 	ldw	x, (0x14, sp)
      0085E8 89               [ 2] 1225 	pushw	x
      0085E9 1E 14            [ 2] 1226 	ldw	x, (0x14, sp)
      0085EB 89               [ 2] 1227 	pushw	x
      0085EC CD 86 DF         [ 4] 1228 	call	___fsgt
      0085EF 5B 08            [ 2] 1229 	addw	sp, #8
      0085F1 4D               [ 1] 1230 	tnz	a
      0085F2 27 1C            [ 1] 1231 	jreq	00129$
                                   1232 ;	dht11.c: 475: tweede+=1;
      0085F4 1E 0A            [ 2] 1233 	ldw	x, (0x0a, sp)
      0085F6 5C               [ 2] 1234 	incw	x
      0085F7 1F 0A            [ 2] 1235 	ldw	(0x0a, sp), x
                                   1236 ;	dht11.c: 476: objTemp-=10;
      0085F9 5F               [ 1] 1237 	clrw	x
      0085FA 89               [ 2] 1238 	pushw	x
      0085FB 4B 20            [ 1] 1239 	push	#0x20
      0085FD 4B 41            [ 1] 1240 	push	#0x41
      0085FF 1E 14            [ 2] 1241 	ldw	x, (0x14, sp)
      008601 89               [ 2] 1242 	pushw	x
      008602 1E 14            [ 2] 1243 	ldw	x, (0x14, sp)
      008604 89               [ 2] 1244 	pushw	x
      008605 CD 86 B7         [ 4] 1245 	call	___fssub
      008608 5B 08            [ 2] 1246 	addw	sp, #8
      00860A 1F 10            [ 2] 1247 	ldw	(0x10, sp), x
      00860C 17 0E            [ 2] 1248 	ldw	(0x0e, sp), y
      00860E 20 D0            [ 2] 1249 	jra	00107$
                                   1250 ;	dht11.c: 478: while (objTemp > 0)
      008610                       1251 00129$:
      008610 16 0A            [ 2] 1252 	ldw	y, (0x0a, sp)
      008612 17 16            [ 2] 1253 	ldw	(0x16, sp), y
      008614 5F               [ 1] 1254 	clrw	x
      008615 1F 0C            [ 2] 1255 	ldw	(0x0c, sp), x
      008617                       1256 00110$:
      008617 5F               [ 1] 1257 	clrw	x
      008618 89               [ 2] 1258 	pushw	x
      008619 5F               [ 1] 1259 	clrw	x
      00861A 89               [ 2] 1260 	pushw	x
      00861B 1E 14            [ 2] 1261 	ldw	x, (0x14, sp)
      00861D 89               [ 2] 1262 	pushw	x
      00861E 1E 14            [ 2] 1263 	ldw	x, (0x14, sp)
      008620 89               [ 2] 1264 	pushw	x
      008621 CD 86 DF         [ 4] 1265 	call	___fsgt
      008624 5B 08            [ 2] 1266 	addw	sp, #8
      008626 4D               [ 1] 1267 	tnz	a
      008627 27 1C            [ 1] 1268 	jreq	00112$
                                   1269 ;	dht11.c: 480: eerste+=1;
      008629 1E 0C            [ 2] 1270 	ldw	x, (0x0c, sp)
      00862B 5C               [ 2] 1271 	incw	x
      00862C 1F 0C            [ 2] 1272 	ldw	(0x0c, sp), x
                                   1273 ;	dht11.c: 481: objTemp-=1;
      00862E 5F               [ 1] 1274 	clrw	x
      00862F 89               [ 2] 1275 	pushw	x
      008630 4B 80            [ 1] 1276 	push	#0x80
      008632 4B 3F            [ 1] 1277 	push	#0x3f
      008634 1E 14            [ 2] 1278 	ldw	x, (0x14, sp)
      008636 89               [ 2] 1279 	pushw	x
      008637 1E 14            [ 2] 1280 	ldw	x, (0x14, sp)
      008639 89               [ 2] 1281 	pushw	x
      00863A CD 86 B7         [ 4] 1282 	call	___fssub
      00863D 5B 08            [ 2] 1283 	addw	sp, #8
      00863F 1F 10            [ 2] 1284 	ldw	(0x10, sp), x
      008641 17 0E            [ 2] 1285 	ldw	(0x0e, sp), y
      008643 20 D2            [ 2] 1286 	jra	00110$
      008645                       1287 00112$:
                                   1288 ;	dht11.c: 492: utemp=vierde*1000+derde*100+tweede*10+eerste;
      008645 1E 1A            [ 2] 1289 	ldw	x, (0x1a, sp)
      008647 89               [ 2] 1290 	pushw	x
      008648 4B E8            [ 1] 1291 	push	#0xe8
      00864A 4B 03            [ 1] 1292 	push	#0x03
      00864C CD 87 E6         [ 4] 1293 	call	__mulint
      00864F 5B 04            [ 2] 1294 	addw	sp, #4
      008651 1F 14            [ 2] 1295 	ldw	(0x14, sp), x
      008653 1E 18            [ 2] 1296 	ldw	x, (0x18, sp)
      008655 89               [ 2] 1297 	pushw	x
      008656 4B 64            [ 1] 1298 	push	#0x64
      008658 4B 00            [ 1] 1299 	push	#0x00
      00865A CD 87 E6         [ 4] 1300 	call	__mulint
      00865D 5B 04            [ 2] 1301 	addw	sp, #4
      00865F 72 FB 14         [ 2] 1302 	addw	x, (0x14, sp)
      008662 1F 12            [ 2] 1303 	ldw	(0x12, sp), x
      008664 1E 16            [ 2] 1304 	ldw	x, (0x16, sp)
      008666 89               [ 2] 1305 	pushw	x
      008667 4B 0A            [ 1] 1306 	push	#0x0a
      008669 4B 00            [ 1] 1307 	push	#0x00
      00866B CD 87 E6         [ 4] 1308 	call	__mulint
      00866E 5B 04            [ 2] 1309 	addw	sp, #4
      008670 72 FB 12         [ 2] 1310 	addw	x, (0x12, sp)
      008673 72 FB 0C         [ 2] 1311 	addw	x, (0x0c, sp)
      008676 90 5F            [ 1] 1312 	clrw	y
      008678 5D               [ 2] 1313 	tnzw	x
      008679 2A 02            [ 1] 1314 	jrpl	00162$
      00867B 90 5A            [ 2] 1315 	decw	y
      00867D                       1316 00162$:
                                   1317 ;	dht11.c: 495: tm1637DisplayDecimal(utemp, 1); // eg 37:12
      00867D 4B 01            [ 1] 1318 	push	#0x01
      00867F 4B 00            [ 1] 1319 	push	#0x00
      008681 89               [ 2] 1320 	pushw	x
      008682 90 89            [ 2] 1321 	pushw	y
      008684 CD 83 28         [ 4] 1322 	call	_tm1637DisplayDecimal
      008687 5B 06            [ 2] 1323 	addw	sp, #6
                                   1324 ;	dht11.c: 498: delayTenMicro();
      008689 CD 80 A0         [ 4] 1325 	call	_delayTenMicro
      00868C CC 85 63         [ 2] 1326 	jp	00114$
      00868F 5B 1D            [ 2] 1327 	addw	sp, #29
      008691 81               [ 4] 1328 	ret
                                   1329 	.area CODE
      008692                       1330 _segmentMap:
      008692 3F                    1331 	.db #0x3F	;  63
      008693 06                    1332 	.db #0x06	;  6
      008694 5B                    1333 	.db #0x5B	;  91
      008695 4F                    1334 	.db #0x4F	;  79	'O'
      008696 66                    1335 	.db #0x66	;  102	'f'
      008697 6D                    1336 	.db #0x6D	;  109	'm'
      008698 7D                    1337 	.db #0x7D	;  125
      008699 07                    1338 	.db #0x07	;  7
      00869A 7F                    1339 	.db #0x7F	;  127
      00869B 6F                    1340 	.db #0x6F	;  111	'o'
      00869C 77                    1341 	.db #0x77	;  119	'w'
      00869D 7C                    1342 	.db #0x7C	;  124
      00869E 39                    1343 	.db #0x39	;  57	'9'
      00869F 5E                    1344 	.db #0x5E	;  94
      0086A0 79                    1345 	.db #0x79	;  121	'y'
      0086A1 71                    1346 	.db #0x71	;  113	'q'
      0086A2 00                    1347 	.db #0x00	;  0
      0086A3                       1348 ___str_0:
      0086A3 75 61 72 74 20 69 6E  1349 	.ascii "uart initialised "
             69 74 69 61 6C 69 73
             65 64 20
      0086B4 0A                    1350 	.db 0x0A
      0086B5 0D                    1351 	.db 0x0D
      0086B6 00                    1352 	.db 0x00
                                   1353 	.area INITIALIZER
                                   1354 	.area CABS (ABS)
