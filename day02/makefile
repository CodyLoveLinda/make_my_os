IMG=ipl.img
SRC=ipl2.nas

$(IMG):$(SRC)
	nasm $^ -o $@

run:
	qemu-system-x86_64 -drive format=raw,file=$(IMG)
