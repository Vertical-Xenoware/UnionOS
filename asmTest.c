

//int addSum(int *arg1, int *arg2);

int main() {

    int _1 = 4;
    int _2 = 5;

    int *op1 = &_1;
    int *op2 = &_2;

    extern asm_add(int arg1, int arg2);
    asm_add(1, 2);
    return 0;
}

/*int addSum(int *arg1, int *arg2) {

    int result;

    __asm__(
        "add eax, ebx;"
        :"=a" (result)
        :"a" (*arg1), "b" (*arg2)
    );

    return result;
}*/