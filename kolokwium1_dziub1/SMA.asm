.686
.model flat
extern _ExitProcess@4 : PROC
public _main

.data
n	dd 0
k	dd 0
m	dd 0

.code
_main PROC
	; edx - m
	; ecx - n
	; ebx - k
	; edi - adres gdzie zapisac srednie
	; esi - adres danych zrodlowych do srednich
	; TODO dodac testowe dane
	mov m, edx
	mov n, ecx
	mov k, ebx
	mov eax, 0	; na dane z pamieci
ptl_zewnetrzna:
	mov ecx, 0
	mov ax, [esi+2*ecx]	; pierwszy element do sredniej zwiekszony o iteracje podciagu
ptl_wewnetrzna:
	cmp ecx, n
	je koniec_sredniej
	inc ecx
	add ax, [esi+2*ecx]	; dodanie kolejnego elementu do licznika
	jmp ptl_wewnetrzna
koniec_sredniej:
	div word PTR n	; dzielenie sumy ax przez n scastowane do word
	add esi, k	; zwiekszam krok
	add edx, k	; zwiekszam wartosc do porownania czy juz koniec szeregu
	mov ax, [edi+2*ecx]	; mlodsza czesc wyniku z dzielenia do miejsca na wyniki
	mov dx, [edi+2*ecx]	; starsza czesc wyniku z dzielenia do miejsca na wyniki
	cmp edx, m-n
	jnz ptl_zewnetrzna
	push 0
	call _ExitProcess@4
_main ENDP
END