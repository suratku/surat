; Copyright (C) 2006 - 2014 MikeOS Developers
; http://mikeos.sourceforge.net/write-your-own-os.html
;
; Isi Puisi Copyright (C) 2018 Suratku


BITS 16

start:
    mov ax, 07C0h	; Standart Bootloader
    add ax, 288
    mov ss, ax
    mov sp, 4096

    mov ax, 07C0h
    mov ds, ax

    ; Tampilkan Puisi
    call baris_baru
    call baris_baru

    mov si, kalimat1
    call puisi
    call baris_baru

    mov si, kalimat2
    call puisi
    call baris_baru

    mov si, kalimat3
    call puisi
    call baris_baru

    mov si, kalimat4
    call puisi
    call baris_baru

    call baris_baru




    jmp $		    ; Ini bisa menyebabkan PC Hang, karena makan memory!!!!


    kalimat1 db 'Ya Allah, Jadikanlah Al-Qur`an Pengobat Hatiku, ', 0
    kalimat2 db 'Penerang Dadaku, ', 0
    kalimat3 db 'Pengusir Kesedihanku, ', 0
    kalimat4 db 'Dan Penghilang Keresahanku ', 0


puisi:		; Fungsi untuk mem print
    mov ah, 0Eh

.repeat:
    lodsb		; Ambil data dari kalimat
    cmp al, 0		; bandingkan, apakah isinya sudah 0
    je .done	        ; kalau benar, berhenti
    int 10h	        ; kalau tidak benar berisi nol, maka print
			; int 10h adalah perintah ke bios untuk mem print char tsb
    jmp .repeat		; ulangi

.done:			; selesai
    ret



baris_baru:		; Fungsi untuk pindah ke baris baru
	pusha

	mov ah, 0Eh

	mov al, 13
	int 10h
	mov al, 10
	int 10h

	popa
	ret


    times 510-($-$$) db 0Eh	; Isi sisa byte dengan 0
    dw 0xAA55			; Standard PC boot signature


