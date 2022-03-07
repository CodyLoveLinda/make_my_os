; haribote-os
; TAB=4

CYLS	EQU		0x0ff0			
LEDS	EQU		0x0ff1
VMODE	EQU		0x0ff2			
SCRNX	EQU		0x0ff4			
SCRNY	EQU		0x0ff6			
VRAM	EQU		0x0ff8			

		ORG		0xc400			

		MOV		AL,0x13			
		MOV		AH,0x00
		INT		0x10

		MOV		BYTE [VMODE],8	
		MOV		WORD [SCRNX],320
		MOV		WORD [SCRNY],200
		MOV		DWORD [VRAM],0x000a0000

		MOV		AH,0x02
		INT		0x16 			; keyboard BIOS
		MOV		[LEDS],AL
		
		MOV		SI, mymsg
		CALL		putchar

fin:
		HLT
		JMP		fin

putchar:
		MOV		AL, [SI]
		ADD		SI, 1
		CMP		AL, 0
		JE		over
		MOV		AH, 0x0e
		MOV 		BX, 15
		INT		0x10
		JMP		putchar

over:
		ret
mymsg:
		DB		0x0a,0x0d
		DB		"---------"
		DB		0x0a,0x0d
		DB		"Hey, man~~~I'm mingmingzhang"
		DB		0x0a,0x0d
		DB		"my kernel is running"
		DB		0x00
