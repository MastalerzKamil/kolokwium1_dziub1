.686
.model flat
extern _ExitProcess@4 : PROC
;public _main

.data
pamiec			dw 0AC00h, 1200h
przesuniecie	dw 0
dane			dd 0
.code
;_main PROC
	mov esi, offset pamiec
	mov dl, 00010000b
	mov bx, 124Ah
	mov eax, 0
	mov ax, bx	; kopia bx w ax
	and ax, 01FFh ; maska dla 9 bitow danych z bx. 
	and dx, 00FFh	; aby w dh byly same zera a dl bit od ktorego trzeba zaczac zapisywac do pamieci
	mov przesuniecie, dx
	mov bx, dx	; do mnozenia <-> przesuniecia w lewo
	mov dx, 0	; aby starsza czesc wyniku monozenia byla 0
	mul bx	; przesuniecie do bitu  od ktorego zaczyna sie zapis. operacja DX:AX=AX*BX
;przenoszenie calego wyniku przesuniecia do ebx
	mov bx, dx	; starsza czesc
	shl ebx, 16
	mov bx, ax	; mlodsza czesc
	mov dane, ebx	; dane przesuniete do adanego bitu
; robienie maski dla danych z pamieci
	mov eax, [esi]
	and eax, 0FFFFFE00h	; maska na 9 bitow z [esi]
	mov edx, 0
	mov bx, przesuniecie
	mul bx	; przesuniecie w lewo o dl
	mov bx, dx	; laczenie do rejestru ebx
	shl ebx, 16
	mov bx, ax	; caly wynik z pamieci z maska przesunieta dla danych
	mov ebx, dane
	or eax, ebx	; laczenie przesunietych danych
	mov [esi], eax
	push 0
	call _ExitProcess@4
;_main ENDP
END