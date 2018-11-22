.686
.model flat
extern _ExitProcess@4 : PROC
public _main

.data
Czw		dd 0AAAAAAAAh
przesuniecie EQU 1
.code
_main PROC
	mov cl, 3
	mov esi, offset Czw
	mov ax, [esi]	; pobieram 2 bajty na zapas jakby bit w cl byl starszy od 4
	mov bl, 0	; miejsce na wynik
	mov ch,  0 ; o ile przesunac rejestr z wynikiem
	clc
ptl:
	shr cl, przesuniecie	; przesuwam az nie zapali sie CF=1 Wtdy znak, ze byl to bit do przesuniecia
	inc ch
	jnc ptl
	xchg cl, ch	; zamieniam aby w przesunac o zawartosc ch ale skladnia dla shr wymaga cl
	shr ax, cl	;usuwam bity ktore sa wczesniej i ich nie chce
	mov bl, przesuniecie	; przechodze na 1 bajt
	shl bl, 5
	shr bl, 5
	push 0
	call _ExitProcess@4
_main ENDP
END