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
    char *video = 0xb8000;
    for(unsigned int character = 0, metaCharacter = 1; video[offset + character] != '\0'; character += 2, metaCharacter += 2) {
        video[offset + character] = string[character];
        video[offset + metaCharacter] = 0x0f;
    }
    return 0;
}
