.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
Czw		dd 0, 1, 2
Pt		dw 3, 4, 5, 6
Sb		dw 7, 8, 9, 10, 11, 12, 13

.code
;_main PROC
	mov edi, offset Pt - offset Czw
	mov eax, dword ptr Sb[edi+2]
	push 0
	call _ExitProcess@4
;_main ENDP
END