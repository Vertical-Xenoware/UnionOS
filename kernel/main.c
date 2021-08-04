#define _extern_ extern int 
#include <stdbool.h>
#include "drivers.h" 

int main() {

    int _1 = 4;
    int _2 = 5;

    int *op1 = &_1;
    int *op2 = &_2;
    
    //char *string = "VXenoware, Union OS is licensed under MPL v2.0";
    char *video = (char *) 0xb8000;

    unsigned short test = 2;
    *video = portByteIn(test);

    //*video = asm_add((int)32, (int)32);
    //asm volatile("xchg bx, bx");
    //*video = 32 + 32;

    /*for(int ii = 0; true; ii++) {
        if(string[ii] != '\0') {
            *video = string[ii];
            video++;
        } else
        {
            return 0;
        }
    }*/

    return 0;
}
