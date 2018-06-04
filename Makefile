kernel:
	nasm -f bin -o doaku.bin doaku.asm

clean:
	touch a~
	rm *~
	rm doaku.bin

run:
	clear
	qemu-system-x86_64 -drive file=./doaku.bin,format=raw \
		-m 32
