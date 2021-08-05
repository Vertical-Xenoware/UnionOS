
extern unsigned char pBIAsm(unsigned short arg1);
extern void pBOAsm(unsigned short arg1, unsigned char arg2);
extern unsigned short pWIAsm(unsigned short arg1);
extern void pWOAsm(unsigned short arg1, unsigned char arg2);


unsigned char portByteIn(unsigned short port) {
    unsigned char result;
    
    //asm volatile("xchg bx, bx");
    result = pBIAsm(port);
    //asm volatile("xchg bx, bx");
    return result;
}

void portByteOut(unsigned short port, unsigned char data) {
    pBOAsm(port, data);
}

unsigned char portWordIn(unsigned short port) {
    unsigned char result;
    
    //asm volatile("xchg bx, bx");
    result = pWIAsm(port);
    //asm volatile("xchg bx, bx");
    return result;
}

void portWordOut(unsigned short port, unsigned char data) {
    pWOAsm(port, data);
}