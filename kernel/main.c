#define _extern_ extern int 
#include <stdbool.h>
#include "drivers.h" 

int main() {

    
    portByteOut(0x3d4, 14);
    
    
    int position = portByteIn(0x3d5);
    position = position << 8;

    portByteOut(0x3d4, 15);

    position += portByteIn(0x3d5);

    int offset = position * 2;
    char *string = "VX Project Union Initialized";
    unsigned int metaCharacter;
    char *video = (char *)0xb8000;

    for(int i = 0; string[i] != '\0'; i++) {
        video[offset + (i * 2)] = string[i];
        video[offset + (i * 2 + 1)] = 0x0f; 

    }

    return 0;
}
