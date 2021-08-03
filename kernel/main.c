#define _extern_ int extern 
#include <stdbool.h> 

int main() {

    int _1 = 4;
    int _2 = 5;

    int *op1 = &_1;
    int *op2 = &_2;

    _extern_ asm_add(int arg1, int arg2);
    
    char *string = "VXenoware, Union OS is licensed under MPL v2.0";
    char *video = (char *) 0xb8000;

    asm volatile("xchg bx, bx")
    *video = (char)asm_add(32, 67);

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
