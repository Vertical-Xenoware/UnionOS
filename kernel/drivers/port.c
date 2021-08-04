
extern unsigned char pBIAsm(unsigned short arg2);


unsigned char portByteIn(unsigned short port) {
    unsigned char result;
    
    //asm volatile("xchg bx, bx");
    result = pBIAsm(port);
    //asm volatile("xchg bx, bx");
    return result;
}