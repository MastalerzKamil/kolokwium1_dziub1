.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
czestosc	dd 0ffh dup (0)
wyrazy		db 2 dup (-1)
.code
;_main PROC
	mov ecx, 1
	mov edi, offset wyrazy
	and ecx, 0000ffffh ; zerowanie starszej czesci aby uzyc indeksowania
ptl:
	mov al, [edi+ecx]
	and eax, 000000ffh
	add czestosc[eax], 1
	dec ecx
	cmp ecx, 0
	jnz ptl
	push 0
	call _ExitProcess@4
;_main ENDP
END