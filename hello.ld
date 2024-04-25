MEMORY {
    /* 
     1. 定义一块内存区域，权限为读写执行 
     2. 区域起始地址为0x80000000
     3. 大小为128K
    */
    dram_space (rwx) : ORIGIN = 0x80000000, LENGTH = 128
}

SECTIONS {
    /*
     定义text段的布局规则, 把hello.o中.text.bios段的内容放到.text段中
     将text段中的内容定位到dram_space区域中，即0x80000000中
     这段链接脚本的作用是配置链接器将程序的代码段（.text）定位到一个具有读写执行权限的、从0x80000000开始的128KB DRAM区域中。
    */
    .text : {
        hello.o(.text.bios)
    } > dram_space
}