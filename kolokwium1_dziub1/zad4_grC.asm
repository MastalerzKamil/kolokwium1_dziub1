.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
x	dd 21
y	dd 5
.code
;_main PROC
	mov edi, offset x
	mov esi, offset y
	mov eax, [edi]	; x
	mov ebx, [esi]	; y
ptl:
	mov edx, 0	; aby starsza czesc dzielnej byla 0
	div ebx	; x = x % y
	mov ebx, edx	; aby dzielic przez ebx i moc wyzerowac edx ktory jest starsza czescia dzielnej
	xchg eax, edx	; swap(x, y)
	cmp ebx, 0
	jne ptl	; while(y!=0)
	push 0
	call _ExitProcess@4
;_main ENDP
END