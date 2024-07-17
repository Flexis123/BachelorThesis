#include <stdio.h>

int main() {
    int i;
    scanf("%d\n", &i);
    if(1){
        b1:
        printf("b1");
        printf("%d\n", i);
        goto b2;
    }else{
        b2:
        printf("b2");
        goto b1;
    }
}