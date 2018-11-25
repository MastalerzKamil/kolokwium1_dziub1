.686
.model flat
extern _ExitProcess@4 : PROC
public _main

.data
sygnal_s	dd 64 dup (?)
kernel		dw 4 dup (?)
sygnal_y	dd 61 dup (?)
suma_i		dd 0	;suma iloczynow z petli wewnetrznej
.code
_main PROC
	mov ebx, 0	; n=0
	mov edx, 0
ptl_n:
	mov ecx, 0	; poczatek petli zewnetrznej
	mov suma_i, 0
ptl_i:
	mov dx, kernel[2*ecx]
	mov eax, sygnal_s[ebx+4*ecx]
	mul dx	; wynik dx:ax = s[n+1]*k[i]
	add suma_i, edx
	add suma_i, eax
	inc ecx
	cmp ecx, 4
	jbe ptl_i

	mov eax, suma_i
	mov eax, sygnal_y[4*ebx]
	inc ebx
	cmp ebx, 61
	jbe ptl_n
	push 0
	call _ExitProcess@4
_main ENDP
END