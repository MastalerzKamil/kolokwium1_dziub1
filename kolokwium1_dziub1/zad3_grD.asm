.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
adres		dd 00ddeeffh

.code
;_main PROC
	call adres
	push 0
	call _ExitProcess@4
;_main ENDP
END