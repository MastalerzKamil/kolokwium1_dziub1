.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data

.code
;_main PROC
	mov eax, 165296h
	shl eax, 0Bh
	sub eax, 40000000h
	push 0
	call _ExitProcess@4
;_main ENDP
END