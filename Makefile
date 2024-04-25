# riscv编译工具链前缀, 需要根据本机安装的软件进行修改
CROSS_COMPILE=riscv64-unknown-elf-
QEMU=qemu-system-riscv64

# 编译程序并且运行qemu
qemu: hello
	${QEMU} -machine virt -bios hello

# 链接生成可执行程序
hello: hello.o hello.ld
	${CROSS_COMPILE}ld -T hello.ld --no-dynamic-linker -m elf64lriscv -static -nostdlib -s -o hello hello.o

# 汇编得到.o文件
hello.o: hello.s
	${CROSS_COMPILE}as -march=rv64i -mabi=lp64 -o hello.o -c hello.s

clean:
	rm hello hello.o
