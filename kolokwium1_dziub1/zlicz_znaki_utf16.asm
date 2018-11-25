.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data

.code
;_main PROC
	mov ecx, 0	; iterator po pamieci
	mov eax, 0	; licznik szukanych slow
ptl:
	mov dx, [esi+ecx]
	cmp dx, 0
	jz koniec_wyrazu
	shr dx, 10	; aby przedrostek 4-bajtowej liczby wydobyc
	cmp dx, 110111b
	jz znaleziono_4bajty
	inc eax
	add ecx, 2
	jmp ptl
znaleziono_4bajty:
	inc eax
	add ecx, 4
	jmp ptl
koniec_wyrazu:
	push 0
	call _ExitProcess@4
;_main ENDP
END