.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
znak	db 12, 16,1,2,3,4,5,6
.code
;_main PROC
	push offset znak
	mov edx, 2
	mov esi, [esp]
	and edx, 000000FFh
	mov al, [esi+edx]
	push 0
	call _ExitProcess@4
;_main ENDP
END