.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
liczbaA		db 128 dup (?)
liczbaB		db 128 dup (?)

.code
;_main PROC
	mov ecx, 0
	mov esi, offset liczbaA
	mov edi, offset liczbaB
ptl:
	mov al, [esi+ecx]	; od najmniejszej liczby dodaje
	adc [edi+ecx], al	; dodaje z CF w przypadku przeniesienia
	inc ecx
	cmp ecx, 128
	jnz ptl
	push 0
	call _ExitProcess@4
;_main ENDP
END