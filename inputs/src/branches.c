#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <math.h>

void wazza(int i){
    if(i) {
        printf("lol");
        abs(i);
        if(i == 10){
            printf("i is 10");
        }else if(i == 5){
            printf("thtrhhrt");
        }
    }
    printf("i is not even");
}


//rp 6
int main(){
    int i = 10;
    while(i != 0){
        scanf("%d\n", &i);

        int c = i % 2;
        if(c){
           // wazza(c); 
        }
    }

    for(int i = 0; i < 15; i++){
        printf("lololol");
    }
    return 0;
}