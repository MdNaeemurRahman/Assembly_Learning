INCLUDE Irvine32.inc

.data
val1	WORD 1000h
val2	WORD 2000h
arrayB	BYTE 10h, 20h, 30h, 40h, 50h
arrayW	WORD 100h, 200h, 300h
arrayD	DWORD 10000h, 20000h

.code
main PROC

; MOVZX
mov		bx, 0A69Bh		;Initialixe BX reg
movzx	eax, bx			;EAX = 000A69Bh
movzx	edx, bl			;EDX = 0000009Bh
movzx	cx, bl			;CX = 009Bh
call	DumpRegs

; MOVSX
mov		bx, 0A69Bh		;Initialixe BX reg
movsx	eax, bx			;EAX = 000A69Bh
movsx	edx, bl			;EDX = 0000009Bh
movsx	cx, bl			;CX = 009Bh
call	DumpRegs

; Meomory-to-memory exchange
mov		ax, val1		;AX = 1000h
xchg	ax, val2		;AX = 2000h, val2 = 1000h
mov		val1, ax		;val1 = 2000h
call	DumpRegs

; Direct-offset Addressing (byte array)
mov		al, arrayB			;AL = 100h
xchg	al, [arrayB+1]		;AL = 200h
mov		al, [arrayB+2]		;AL = 300h
call	DumpRegs

; Direct-offset Addressing (word array)
mov		eax, arrayD		;EAX = 100h
mov		eax, [arrayD+4] ;EAX = 200h
call	DumpRegs

exit
main ENDP
	END main