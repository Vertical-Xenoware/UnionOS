
unsigned char portByteIn(unsigned short port) {
    
    unsigned char result;
    __asm__(
        "in eax, edx;"
        :"=a" (result)
        :"d" (port) 
    );
    return result;
}



