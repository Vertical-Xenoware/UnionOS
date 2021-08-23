#define _extern_ extern int 
#include <stdbool.h>
#include "drivers.h" 

void initPrint(int *cursorOffset, char *videoMemory, char *initString, int *attribute) {
    for(int i = 0; initString[i] != '\0'; i++) {
        videoMemory[*cursorOffset + (i * 2)] = initString[i];
        videoMemory[*cursorOffset + (i * 2 + 1)] = *attribute; 

    }
}

int main(void) {

    
    portByteOut(0x3d4, 14);
    
    
    int position = portByteIn(0x3d5);
    position = position << 8;

    portByteOut(0x3d4, 15);

    position += portByteIn(0x3d5);

    int *offset; 
    *offset = position * 2;
    int *color;
    *color = 0x0f;
    char *string = "Diskclavier Prodigy Activated";
    char *video = (char *)0xb8000;

    initPrint(offset, video, string, color);


    return 0;
}
