.686
.model flat
extern _ExitProcess@4 : PROC
public _main

.data
tablica_kodowa	db 00000000b, 2	; symbol dla 'A'
				db 00000001b, 2	; symbol dla 'B'
				db 00000010b, 3	; symbol dla 'C'
				db 00000110b, 3	; symbol dla 'D'

.code
_main PROC
	mov ecx, 0	; iterator po lancuchu
	mov eax, 0
	mov edx, 0	; edx- indeks tablicy wynikowej
ptl:
	mov al, [esi+ecx]- 'A'	; numer litery alfabetu wyciagam z pamieci
	mov al, tablica_kodowa[2*eax]	; al to indeks litery z alfabetu czyli jest to indeks tablicy
	add dl, tablica_kodowa[2*eax+1]	; zwiekszam o wartosc bajtowa ile zajmuje ten znak
	mov [edi+ecx], dl	; zapisanie wyniku pod adres wynikowy zwiekszony o ecx
	inc ecx
	cmp al, 0
	jnz ptl

	push 0
	call _ExitProcess@4
_main ENDP
END