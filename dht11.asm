;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul 11 2014) (Linux)
; This file was generated Fri Aug 18 15:54:49 2017
;--------------------------------------------------------
	.module dht11
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _segmentMap
	.globl _main
	.globl _DHT_ReadData
	.globl _dht11_init
	.globl _tm1637DisplayDecimal
	.globl _tm1637Init
	.globl _InitializeUART
	.globl _InitializeI2C
	.globl _i2c_read_register
	.globl _print_byte_hex
	.globl _i2c_set_start_ack
	.globl _i2c_send_address
	.globl _UARTPrintF
	.globl _i2c_send_reg
	.globl _i2c_set_stop
	.globl _i2c_set_nak
	.globl _i2c_read
	.globl _delay
	.globl _InitializeSystemClock
	.globl _delayTenMicro
	.globl _tm1637SetBrightness
	.globl __tm1637Start
	.globl __tm1637Stop
	.globl __tm1637ReadResult
	.globl __tm1637WriteByte
	.globl __tm1637ClkHigh
	.globl __tm1637ClkLow
	.globl __tm1637DioHigh
	.globl __tm1637DioLow
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	dht11.c: 17: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	dht11.c: 19: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	dht11.c: 20: __asm__("nop");
	nop
	dec	a
;	dht11.c: 19: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	dht11.c: 23: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	dht11.c: 24: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	dht11.c: 25: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	dht11.c: 26: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	dht11.c: 27: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	dht11.c: 28: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	dht11.c: 29: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	dht11.c: 30: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	dht11.c: 31: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	dht11.c: 32: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	dht11.c: 33: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	dht11.c: 34: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	dht11.c: 35: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	dht11.c: 36: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	dht11.c: 37: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	dht11.c: 39: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	dht11.c: 41: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x09, sp), x
00103$:
	ldw	y, (0x09, sp)
	ldw	(0x07, sp), y
	ld	a, (0x07, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrsge	00105$
;	dht11.c: 42: __asm__("nop");
	nop
;	dht11.c: 41: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	dht11.c: 44: void i2c_read (unsigned char *x) {
;	-----------------------------------------
;	 function i2c_read
;	-----------------------------------------
_i2c_read:
;	dht11.c: 45: while ((I2C_SR1 & I2C_RXNE) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	bcp	a, #0x40
	jreq	00101$
;	dht11.c: 46: *x = I2C_DR;
	ldw	y, (0x03, sp)
	ldw	x, #0x5216
	ld	a, (x)
	ld	(y), a
	ret
;	dht11.c: 48: void i2c_set_nak (void) {
;	-----------------------------------------
;	 function i2c_set_nak
;	-----------------------------------------
_i2c_set_nak:
;	dht11.c: 49: I2C_CR2 &= ~I2C_ACK;
	ldw	x, #0x5211
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	dht11.c: 51: void i2c_set_stop (void) {
;	-----------------------------------------
;	 function i2c_set_stop
;	-----------------------------------------
_i2c_set_stop:
;	dht11.c: 52: I2C_CR2 |= I2C_STOP;
	ldw	x, #0x5211
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
	ret
;	dht11.c: 54: void i2c_send_reg (UCHAR addr) {
;	-----------------------------------------
;	 function i2c_send_reg
;	-----------------------------------------
_i2c_send_reg:
	sub	sp, #2
;	dht11.c: 56: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	dht11.c: 57: reg = I2C_SR3;
	ldw	x, #0x5219
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	dht11.c: 58: I2C_DR = addr;
	ldw	x, #0x5216
	ld	a, (0x05, sp)
	ld	(x), a
;	dht11.c: 59: while ((I2C_SR1 & I2C_TXE) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	sll	a
	jrnc	00101$
	addw	sp, #2
	ret
;	dht11.c: 63: void UARTPrintF (char *message) {
;	-----------------------------------------
;	 function UARTPrintF
;	-----------------------------------------
_UARTPrintF:
;	dht11.c: 64: char *ch = message;
	ldw	y, (0x03, sp)
;	dht11.c: 65: while (*ch) {
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	dht11.c: 66: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
	ldw	x, #0x5231
	ld	(x), a
;	dht11.c: 67: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	sll	a
	jrnc	00101$
;	dht11.c: 68: ch++;                               //  Grab the next character.
	incw	y
	jra	00104$
00107$:
	ret
;	dht11.c: 74: void i2c_send_address (UCHAR addr, UCHAR mode) {
;	-----------------------------------------
;	 function i2c_send_address
;	-----------------------------------------
_i2c_send_address:
	sub	sp, #3
;	dht11.c: 76: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	clrw	x
	ld	xl, a
	ldw	(0x01, sp), x
;	dht11.c: 77: I2C_DR = (addr << 1) | mode;
	ld	a, (0x06, sp)
	sll	a
	or	a, (0x07, sp)
	ldw	x, #0x5216
	ld	(x), a
;	dht11.c: 78: if (mode == I2C_READ) {
	ld	a, (0x07, sp)
	cp	a, #0x01
	jrne	00127$
	ld	a, #0x01
	ld	(0x03, sp), a
	jra	00128$
00127$:
	clr	(0x03, sp)
00128$:
	tnz	(0x03, sp)
	jreq	00103$
;	dht11.c: 79: I2C_OARL = 0;
	ldw	x, #0x5213
	clr	(x)
;	dht11.c: 80: I2C_OARH = 0;
	ldw	x, #0x5214
	clr	(x)
;	dht11.c: 83: while ((I2C_SR1 & I2C_ADDR) == 0);
00103$:
;	dht11.c: 76: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
;	dht11.c: 83: while ((I2C_SR1 & I2C_ADDR) == 0);
	bcp	a, #0x02
	jreq	00103$
;	dht11.c: 84: if (mode == I2C_READ)
	tnz	(0x03, sp)
	jreq	00108$
;	dht11.c: 85: UNSET (I2C_SR1, I2C_ADDR);
	and	a, #0xfd
	ldw	x, #0x5217
	ld	(x), a
00108$:
	addw	sp, #3
	ret
;	dht11.c: 88: void i2c_set_start_ack (void) {
;	-----------------------------------------
;	 function i2c_set_start_ack
;	-----------------------------------------
_i2c_set_start_ack:
;	dht11.c: 89: I2C_CR2 = I2C_ACK | I2C_START;
	ldw	x, #0x5211
	ld	a, #0x05
	ld	(x), a
;	dht11.c: 90: while ((I2C_SR1 & I2C_SB) == 0);
00101$:
	ldw	x, #0x5217
	ld	a, (x)
	srl	a
	jrnc	00101$
	ret
;	dht11.c: 97: void print_byte_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_byte_hex
;	-----------------------------------------
_print_byte_hex:
	sub	sp, #12
;	dht11.c: 100: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	dht11.c: 101: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	dht11.c: 102: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x03, sp), x
	jra	00103$
00102$:
;	dht11.c: 104: a += '0'; 
	addw	x, #0x0030
	ldw	(0x03, sp), x
00103$:
;	dht11.c: 105: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	dht11.c: 106: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	dht11.c: 107: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x01, sp), x
	jra	00106$
00105$:
;	dht11.c: 109: b += '0'; 
	addw	x, #0x0030
	ldw	(0x01, sp), x
00106$:
;	dht11.c: 110: message[0] = a;
	ldw	y, sp
	addw	y, #5
	ld	a, (0x04, sp)
	ld	(y), a
;	dht11.c: 111: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x02, sp)
	ld	(x), a
;	dht11.c: 112: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	dht11.c: 113: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	dht11.c: 117: unsigned char i2c_read_register (UCHAR addr, UCHAR rg) {
;	-----------------------------------------
;	 function i2c_read_register
;	-----------------------------------------
_i2c_read_register:
	sub	sp, #2
;	dht11.c: 120: i2c_set_start_ack ();
	call	_i2c_set_start_ack
;	dht11.c: 121: i2c_send_address (addr, I2C_WRITE);
	push	#0x00
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_address
	addw	sp, #2
;	dht11.c: 122: i2c_send_reg (rg);
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_reg
	pop	a
;	dht11.c: 123: i2c_set_start_ack ();
	call	_i2c_set_start_ack
;	dht11.c: 124: i2c_send_address (addr, I2C_READ);
	push	#0x01
	ld	a, (0x06, sp)
	push	a
	call	_i2c_send_address
	addw	sp, #2
;	dht11.c: 125: reg = I2C_SR1;
	ldw	x, #0x5217
	ld	a, (x)
	ld	(0x01, sp), a
;	dht11.c: 126: reg = I2C_SR3;
	ldw	x, #0x5219
	ld	a, (x)
	ld	(0x01, sp), a
;	dht11.c: 127: i2c_set_nak ();
	call	_i2c_set_nak
;	dht11.c: 128: i2c_set_stop ();
	call	_i2c_set_stop
;	dht11.c: 129: i2c_read (&x);
	ldw	x, sp
	incw	x
	incw	x
	pushw	x
	call	_i2c_read
	addw	sp, #2
;	dht11.c: 130: return (x);
	ld	a, (0x02, sp)
	addw	sp, #2
	ret
;	dht11.c: 133: void InitializeI2C (void) {
;	-----------------------------------------
;	 function InitializeI2C
;	-----------------------------------------
_InitializeI2C:
;	dht11.c: 134: I2C_CR1 = 0;   //  Disable I2C before configuration starts. PE bit is bit 0
	ldw	x, #0x5210
	clr	(x)
;	dht11.c: 138: I2C_FREQR = 16;                     //  Set the internal clock frequency (MHz).
	ldw	x, #0x5212
	ld	a, #0x10
	ld	(x), a
;	dht11.c: 139: UNSET (I2C_CCRH, I2C_FS);           //  I2C running is standard mode.
	bres	0x521c, #7
;	dht11.c: 141: I2C_CCRL = 0xa0;                    //  SCL clock speed is 50 kHz.
	ldw	x, #0x521b
	ld	a, #0xa0
	ld	(x), a
;	dht11.c: 143: I2C_CCRH &= 0x00;	// Clears lower 4 bits "CCR"
	ldw	x, #0x521c
	clr	(x)
;	dht11.c: 147: UNSET (I2C_OARH, I2C_ADDMODE);      //  7 bit address mode.
	bres	0x5214, #7
;	dht11.c: 148: SET (I2C_OARH, I2C_ADDCONF);        //  Docs say this must always be 1.
	ldw	x, #0x5214
	ld	a, (x)
	or	a, #0x40
	ld	(x), a
;	dht11.c: 152: I2C_TRISER = 17;
	ldw	x, #0x521d
	ld	a, #0x11
	ld	(x), a
;	dht11.c: 160: I2C_CR1 = I2C_PE;	// Enables port
	ldw	x, #0x5210
	ld	a, #0x01
	ld	(x), a
	ret
;	dht11.c: 166: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	dht11.c: 176: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	dht11.c: 177: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	dht11.c: 178: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	dht11.c: 179: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	dht11.c: 180: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	dht11.c: 181: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	dht11.c: 182: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	dht11.c: 186: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	dht11.c: 187: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	dht11.c: 188: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	dht11.c: 189: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	dht11.c: 190: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	dht11.c: 191: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	dht11.c: 195: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	dht11.c: 196: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	dht11.c: 200: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	dht11.c: 201: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	dht11.c: 202: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	dht11.c: 206: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	dht11.c: 207: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	dht11.c: 208: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	dht11.c: 236: void tm1637Init(void)
;	-----------------------------------------
;	 function tm1637Init
;	-----------------------------------------
_tm1637Init:
;	dht11.c: 238: tm1637SetBrightness(8);
	push	#0x08
	call	_tm1637SetBrightness
	pop	a
	ret
;	dht11.c: 243: void tm1637DisplayDecimal(long TT,unsigned int displaySeparator)
;	-----------------------------------------
;	 function tm1637DisplayDecimal
;	-----------------------------------------
_tm1637DisplayDecimal:
	sub	sp, #19
;	dht11.c: 245: unsigned int v = TT & 0x0000FFFF;
	ld	a, (0x19, sp)
	ld	xl, a
	ld	a, (0x18, sp)
	ld	xh, a
	clr	(0x11, sp)
	clr	a
	ldw	(0x05, sp), x
;	dht11.c: 251: for (ii = 0; ii < 4; ++ii) {
	ldw	x, sp
	incw	x
	ldw	(0x09, sp), x
	ldw	x, #_segmentMap+0
	ldw	(0x0d, sp), x
	clrw	y
00106$:
;	dht11.c: 252: digitArr[ii] = segmentMap[v % 10];
	ldw	x, y
	addw	x, (0x09, sp)
	ldw	(0x0b, sp), x
	pushw	y
	ldw	x, (0x07, sp)
	ldw	y, #0x000a
	divw	x, y
	ldw	x, y
	popw	y
	addw	x, (0x0d, sp)
	ld	a, (x)
	ldw	x, (0x0b, sp)
	ld	(x), a
;	dht11.c: 253: if (ii == 2 && displaySeparator) {
	cpw	y, #0x0002
	jrne	00102$
	ldw	x, (0x1a, sp)
	jreq	00102$
;	dht11.c: 254: digitArr[ii] |= 1 << 7;
	ldw	x, (0x0b, sp)
	ld	a, (x)
	or	a, #0x80
	ldw	x, (0x0b, sp)
	ld	(x), a
00102$:
;	dht11.c: 256: v /= 10;
	pushw	y
	ldw	x, (0x07, sp)
	ldw	y, #0x000a
	divw	x, y
	popw	y
	ldw	(0x05, sp), x
;	dht11.c: 251: for (ii = 0; ii < 4; ++ii) {
	incw	y
	cpw	y, #0x0004
	jrc	00106$
;	dht11.c: 259: _tm1637Start();
	call	__tm1637Start
;	dht11.c: 260: _tm1637WriteByte(0x40);
	push	#0x40
	call	__tm1637WriteByte
	pop	a
;	dht11.c: 261: _tm1637ReadResult();
	call	__tm1637ReadResult
;	dht11.c: 262: _tm1637Stop();
	call	__tm1637Stop
;	dht11.c: 264: _tm1637Start();
	call	__tm1637Start
;	dht11.c: 265: _tm1637WriteByte(0xc0);
	push	#0xc0
	call	__tm1637WriteByte
	pop	a
;	dht11.c: 266: _tm1637ReadResult();
	call	__tm1637ReadResult
;	dht11.c: 268: for (ii = 0; ii < 4; ++ii) {
	clrw	x
	ldw	(0x07, sp), x
00108$:
;	dht11.c: 269: _tm1637WriteByte(digitArr[3 - ii]);
	ld	a, (0x08, sp)
	ld	(0x0f, sp), a
	ld	a, #0x03
	sub	a, (0x0f, sp)
	clrw	x
	ld	xl, a
	addw	x, (0x09, sp)
	ld	a, (x)
	push	a
	call	__tm1637WriteByte
	pop	a
;	dht11.c: 270: _tm1637ReadResult();
	call	__tm1637ReadResult
;	dht11.c: 268: for (ii = 0; ii < 4; ++ii) {
	ldw	x, (0x07, sp)
	incw	x
	ldw	(0x07, sp), x
	ldw	x, (0x07, sp)
	cpw	x, #0x0004
	jrc	00108$
;	dht11.c: 273: _tm1637Stop();
	call	__tm1637Stop
	addw	sp, #19
	ret
;	dht11.c: 278: void tm1637SetBrightness(char brightness)
;	-----------------------------------------
;	 function tm1637SetBrightness
;	-----------------------------------------
_tm1637SetBrightness:
;	dht11.c: 285: _tm1637Start();
	call	__tm1637Start
;	dht11.c: 286: _tm1637WriteByte(0x87 + brightness);
	ld	a, (0x03, sp)
	add	a, #0x87
	push	a
	call	__tm1637WriteByte
	pop	a
;	dht11.c: 287: _tm1637ReadResult();
	call	__tm1637ReadResult
;	dht11.c: 288: _tm1637Stop();
	jp	__tm1637Stop
;	dht11.c: 291: void _tm1637Start(void)
;	-----------------------------------------
;	 function _tm1637Start
;	-----------------------------------------
__tm1637Start:
;	dht11.c: 293: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	dht11.c: 294: _tm1637DioHigh();
	call	__tm1637DioHigh
;	dht11.c: 295: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 296: _tm1637DioLow();
	jp	__tm1637DioLow
;	dht11.c: 299: void _tm1637Stop(void)
;	-----------------------------------------
;	 function _tm1637Stop
;	-----------------------------------------
__tm1637Stop:
;	dht11.c: 301: _tm1637ClkLow();
	call	__tm1637ClkLow
;	dht11.c: 302: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 303: _tm1637DioLow();
	call	__tm1637DioLow
;	dht11.c: 304: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 305: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	dht11.c: 306: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 307: _tm1637DioHigh();
	jp	__tm1637DioHigh
;	dht11.c: 310: void _tm1637ReadResult(void)
;	-----------------------------------------
;	 function _tm1637ReadResult
;	-----------------------------------------
__tm1637ReadResult:
;	dht11.c: 312: _tm1637ClkLow();
	call	__tm1637ClkLow
;	dht11.c: 313: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 315: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	dht11.c: 316: delay(5);
	push	#0x05
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 317: _tm1637ClkLow();
	jp	__tm1637ClkLow
;	dht11.c: 320: void _tm1637WriteByte(unsigned char b)
;	-----------------------------------------
;	 function _tm1637WriteByte
;	-----------------------------------------
__tm1637WriteByte:
	sub	sp, #2
;	dht11.c: 322: for (ii = 0; ii < 8; ++ii) {
	clrw	x
	ldw	(0x01, sp), x
00105$:
;	dht11.c: 323: _tm1637ClkLow();
	call	__tm1637ClkLow
;	dht11.c: 324: if (b & 0x01) {
	ld	a, (0x05, sp)
	srl	a
	jrnc	00102$
;	dht11.c: 325: _tm1637DioHigh();
	call	__tm1637DioHigh
	jra	00103$
00102$:
;	dht11.c: 328: _tm1637DioLow();
	call	__tm1637DioLow
00103$:
;	dht11.c: 330: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 331: b >>= 1;
	ld	a, (0x05, sp)
	srl	a
	ld	(0x05, sp), a
;	dht11.c: 332: _tm1637ClkHigh();
	call	__tm1637ClkHigh
;	dht11.c: 333: delay(15);
	push	#0x0f
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 322: for (ii = 0; ii < 8; ++ii) {
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
	ldw	x, (0x01, sp)
	cpw	x, #0x0008
	jrslt	00105$
	addw	sp, #2
	ret
;	dht11.c: 339: void _tm1637ClkHigh(void)
;	-----------------------------------------
;	 function _tm1637ClkHigh
;	-----------------------------------------
__tm1637ClkHigh:
;	dht11.c: 344: PD_ODR |= 1 << 2;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
	ret
;	dht11.c: 347: void _tm1637ClkLow(void)
;	-----------------------------------------
;	 function _tm1637ClkLow
;	-----------------------------------------
__tm1637ClkLow:
;	dht11.c: 351: PD_ODR &= ~(1 << 2);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
	ret
;	dht11.c: 357: void _tm1637DioHigh(void)
;	-----------------------------------------
;	 function _tm1637DioHigh
;	-----------------------------------------
__tm1637DioHigh:
;	dht11.c: 361: PD_ODR |= 1 << 3;
	ldw	x, #0x500f
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	dht11.c: 365: void _tm1637DioLow(void)
;	-----------------------------------------
;	 function _tm1637DioLow
;	-----------------------------------------
__tm1637DioLow:
;	dht11.c: 367: PD_ODR &= ~(1 << 3);
	ldw	x, #0x500f
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
	ret
;	dht11.c: 374: void dht11_init(void)
;	-----------------------------------------
;	 function dht11_init
;	-----------------------------------------
_dht11_init:
;	dht11.c: 376: PA_DDR |= (1 << 3); //port PA3
	ldw	x, #0x5002
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	dht11.c: 377: PA_ODR |= (1 << 3);
	ldw	x, #0x5000
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
	ret
;	dht11.c: 387: unsigned char DHT_ReadData(unsigned char* data)
;	-----------------------------------------
;	 function DHT_ReadData
;	-----------------------------------------
_DHT_ReadData:
	sub	sp, #4
;	dht11.c: 389: unsigned char byte_num = 0, bit_num = 0, byte = 0, count = 0;
	clr	(0x02, sp)
	clr	(0x04, sp)
;	dht11.c: 391: PA_ODR &= ~(1 << 3);
	ldw	x, #0x5000
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	dht11.c: 393: delay(1);
	push	#0x01
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 395: PA_ODR |= (1 << 3);
	ldw	x, #0x5000
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	dht11.c: 396: PA_DDR &= ~(1 << 3); //port PA3 as input
	ldw	x, #0x5002
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	dht11.c: 399: while (PA_IDR & (1<<3));          // wait sensor response 20-40us
00101$:
	ldw	x, #0x5001
	ld	a, (x)
	and	a, #0x08
	tnz	a
	jrne	00101$
;	dht11.c: 400: while (!(PA_IDR & (1<<3)));          // pin low 80 ms :response 
00104$:
	tnz	a
	jreq	00104$
;	dht11.c: 402: while (PA_IDR & (1<<3));          // pin high 
00107$:
	tnz	a
	jrne	00107$
;	dht11.c: 404: for (byte_num = 0; byte_num < NUM_OF_BYTES; byte_num++)
	clr	(0x01, sp)
;	dht11.c: 408: while (!(PA_IDR & (1<<3)));          // pin low 80 ms :response 
00130$:
	clr	(0x03, sp)
00110$:
;	dht11.c: 399: while (PA_IDR & (1<<3));          // wait sensor response 20-40us
	ldw	x, #0x5001
	ld	a, (x)
	and	a, #0x08
;	dht11.c: 408: while (!(PA_IDR & (1<<3)));          // pin low 80 ms :response 
	tnz	a
	jreq	00110$
;	dht11.c: 410: while (PA_IDR & (1<<3));          // pin high 
00113$:
	tnz	a
	jrne	00113$
;	dht11.c: 413: count++;
	ld	a, (0x04, sp)
	inc	a
;	dht11.c: 415: if (count > ONE_LOW)
	cp	a, #0x82
	jrule	00117$
;	dht11.c: 417: byte |= (1 << (8 - bit_num));
	ld	a, #0x08
	sub	a, (0x03, sp)
	ld	xh, a
	ld	a, #0x01
	push	a
	ld	a, xh
	tnz	a
	jreq	00179$
00178$:
	sll	(1, sp)
	dec	a
	jrne	00178$
00179$:
	pop	a
	or	a, (0x02, sp)
	ld	(0x02, sp), a
00117$:
;	dht11.c: 419: count = 0;
	clr	(0x04, sp)
;	dht11.c: 406: for (bit_num = 0; bit_num < 8; bit_num++)
	inc	(0x03, sp)
	ld	a, (0x03, sp)
	cp	a, #0x08
	jrc	00110$
;	dht11.c: 421: *(data + byte_num) = byte;
	clrw	x
	ld	a, (0x01, sp)
	ld	xl, a
	addw	x, (0x07, sp)
	ld	a, (0x02, sp)
	ld	(x), a
;	dht11.c: 422: byte = 0;
	clr	(0x02, sp)
;	dht11.c: 404: for (byte_num = 0; byte_num < NUM_OF_BYTES; byte_num++)
	inc	(0x01, sp)
	ld	a, (0x01, sp)
	cp	a, #0x05
	jrc	00130$
;	dht11.c: 424: return 0;
	clr	a
	addw	sp, #4
	ret
;	dht11.c: 429: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #29
;	dht11.c: 437: InitializeSystemClock();
	call	_InitializeSystemClock
;	dht11.c: 442: PB_CR1 = (1 << 4) | (1 << 5); // push-pull
	ldw	x, #0x5008
	ld	a, #0x30
	ld	(x), a
;	dht11.c: 444: PD_DDR = (1 << 3) | (1 << 2); // output mode
	ldw	x, #0x5011
	ld	a, #0x0c
	ld	(x), a
;	dht11.c: 445: PD_CR2 = (1 << 3) | (1 << 2); // up to 10MHz speed
	ldw	x, #0x5013
	ld	a, #0x0c
	ld	(x), a
;	dht11.c: 446: PD_CR1 = 0; // push-pull
	ldw	x, #0x5012
	clr	(x)
;	dht11.c: 447: PD_CR2 = 0; // up to 10MHz speed
	ldw	x, #0x5013
	clr	(x)
;	dht11.c: 448: tm1637Init();
	call	_tm1637Init
;	dht11.c: 450: InitializeUART();
	call	_InitializeUART
;	dht11.c: 451: UARTPrintF("uart initialised \n\r");
	ldw	x, #___str_0+0
	pushw	x
	call	_UARTPrintF
	addw	sp, #2
;	dht11.c: 453: dht11_init();	
	call	_dht11_init
;	dht11.c: 454: delay(200);
	push	#0xc8
	push	#0x00
	call	_delay
	addw	sp, #2
;	dht11.c: 456: DHT_ReadData(tmpr);
	ldw	x, sp
	addw	x, #3
	ldw	(0x1c, sp), x
	ldw	x, (0x1c, sp)
	pushw	x
	call	_DHT_ReadData
	addw	sp, #2
;	dht11.c: 460: while (1) {
00114$:
;	dht11.c: 461: objTemp = tmpr[0]; // humidity 
	ldw	x, (0x1c, sp)
	ld	a, (x)
	push	a
	call	___uchar2fs
	pop	a
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
;	dht11.c: 466: while (objTemp > 1000) {
	clrw	x
	ldw	(0x01, sp), x
00101$:
	clrw	x
	pushw	x
	push	#0x7a
	push	#0x44
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00127$
;	dht11.c: 467: vierde+=1;
	ldw	x, (0x01, sp)
	incw	x
	ldw	(0x01, sp), x
;	dht11.c: 468: objTemp-=1000;
	clrw	x
	pushw	x
	push	#0x7a
	push	#0x44
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
	jra	00101$
;	dht11.c: 470: while (objTemp > 100) {
00127$:
	ldw	y, (0x01, sp)
	ldw	(0x1a, sp), y
	clrw	x
	ldw	(0x08, sp), x
00104$:
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00128$
;	dht11.c: 471: derde+=1;
	ldw	x, (0x08, sp)
	incw	x
	ldw	(0x08, sp), x
;	dht11.c: 472: objTemp-=100;
	clrw	x
	pushw	x
	push	#0xc8
	push	#0x42
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
	jra	00104$
;	dht11.c: 474: while (objTemp > 10) {
00128$:
	ldw	y, (0x08, sp)
	ldw	(0x18, sp), y
	clrw	x
	ldw	(0x0a, sp), x
00107$:
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00129$
;	dht11.c: 475: tweede+=1;
	ldw	x, (0x0a, sp)
	incw	x
	ldw	(0x0a, sp), x
;	dht11.c: 476: objTemp-=10;
	clrw	x
	pushw	x
	push	#0x20
	push	#0x41
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
	jra	00107$
;	dht11.c: 478: while (objTemp > 0)
00129$:
	ldw	y, (0x0a, sp)
	ldw	(0x16, sp), y
	clrw	x
	ldw	(0x0c, sp), x
00110$:
	clrw	x
	pushw	x
	clrw	x
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fsgt
	addw	sp, #8
	tnz	a
	jreq	00112$
;	dht11.c: 480: eerste+=1;
	ldw	x, (0x0c, sp)
	incw	x
	ldw	(0x0c, sp), x
;	dht11.c: 481: objTemp-=1;
	clrw	x
	pushw	x
	push	#0x80
	push	#0x3f
	ldw	x, (0x14, sp)
	pushw	x
	ldw	x, (0x14, sp)
	pushw	x
	call	___fssub
	addw	sp, #8
	ldw	(0x10, sp), x
	ldw	(0x0e, sp), y
	jra	00110$
00112$:
;	dht11.c: 492: utemp=vierde*1000+derde*100+tweede*10+eerste;
	ldw	x, (0x1a, sp)
	pushw	x
	push	#0xe8
	push	#0x03
	call	__mulint
	addw	sp, #4
	ldw	(0x14, sp), x
	ldw	x, (0x18, sp)
	pushw	x
	push	#0x64
	push	#0x00
	call	__mulint
	addw	sp, #4
	addw	x, (0x14, sp)
	ldw	(0x12, sp), x
	ldw	x, (0x16, sp)
	pushw	x
	push	#0x0a
	push	#0x00
	call	__mulint
	addw	sp, #4
	addw	x, (0x12, sp)
	addw	x, (0x0c, sp)
	clrw	y
	tnzw	x
	jrpl	00162$
	decw	y
00162$:
;	dht11.c: 495: tm1637DisplayDecimal(utemp, 1); // eg 37:12
	push	#0x01
	push	#0x00
	pushw	x
	pushw	y
	call	_tm1637DisplayDecimal
	addw	sp, #6
;	dht11.c: 498: delayTenMicro();
	call	_delayTenMicro
	jp	00114$
	addw	sp, #29
	ret
	.area CODE
_segmentMap:
	.db #0x3F	;  63
	.db #0x06	;  6
	.db #0x5B	;  91
	.db #0x4F	;  79	'O'
	.db #0x66	;  102	'f'
	.db #0x6D	;  109	'm'
	.db #0x7D	;  125
	.db #0x07	;  7
	.db #0x7F	;  127
	.db #0x6F	;  111	'o'
	.db #0x77	;  119	'w'
	.db #0x7C	;  124
	.db #0x39	;  57	'9'
	.db #0x5E	;  94
	.db #0x79	;  121	'y'
	.db #0x71	;  113	'q'
	.db #0x00	;  0
___str_0:
	.ascii "uart initialised "
	.db 0x0A
	.db 0x0D
	.db 0x00
	.area INITIALIZER
	.area CABS (ABS)
