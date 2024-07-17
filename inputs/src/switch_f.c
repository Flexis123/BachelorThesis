#include <stdio.h>

void foo() {} //rp 0

void baz() { //rp 1
    foo();
    foo();
}
void bar() { //rp 1
    foo();
}

int main(){ //rp3
    int i;
    scanf("%d\n", &i);

    if(i == 1){
        bar(); // 2.5
    }else{
        baz(); // 2
        bar(); // 2
    }

    baz();

}