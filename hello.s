# 指示全局符号
.global _start

# 标识代码段
.section .text.bios

_start: 
# 把一个立即数移动到a1寄存器
# 0x10000000是串口的映射地址，在改地址写入8个字节数据将会被发送到串口
li a1, 0x10000000

# addi: 立即数加法指令, a0: 通用寄存器 x0: 0寄存器，其值总是0
# 1. 把0x68移动到x0寄存器，然后吧x0寄存器的值移动到a0寄存器
addi a0, x0, 0x68
# sb store byte: 从a0寄存器移动一个字节的内容到a1寄存器中存储的内存地址中
sb a0, (a1)

addi a0, x0, 0x65
sb a0, (a1) # 'e'

addi a0, x0, 0x6C
sb a0, (a1) # 'l'

addi a0, x0, 0x6C
sb a0, (a1) # 'l'

addi a0, x0, 0x6F
sb a0, (a1) # 'o'

loop: 
j loop
