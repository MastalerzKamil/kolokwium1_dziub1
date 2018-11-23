.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
Czw		dd 0AAAAAAAAh
przesuniecie EQU 1
.code
;_main PROC
	mov eax, 165296h
	mov ebx, 2*1024
	mul ebx
	add eax, 80000000h
	push 0
	call _ExitProcess@4
;_main ENDP
END