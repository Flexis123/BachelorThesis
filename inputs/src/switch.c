#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <math.h>
#include <stdio.h>
#include <time.h>

void mata();

int wazza(int f){
    srand(time(NULL)); 
    int r = rand() % 2;
    if(r == 0){
       exit(0);
    }
    int res =  r + f;
    return res;
}
void bazza(int i){
    printf("bazza");
    printf("pula");
    printf("mata");
    printf("mata");
}

void mata(){
    printf("mata");
    printf("mata");
    bazza(10);
}

int main(){
    int nums[3][3];

    int d;
    scanf("%d\n", &d);
    nums[0][d] = 1;
    nums[2][2] = 10;
    setvbuf(stdout, NULL, _IONBF, 0);
    int i = 10;
    int f;
    while(i != 0){
        printf("Enter a number: ");
        scanf("%d\n", &i);
        printf("\n");
        switch (i)
        {
        case 1:
            f = wazza(i);
            if(1) printf("this shit is so stupid %d\n", f);
            mata();
            break;
        
        case 2:
            bazza(10);
            break;

        case 3:
            bazza(5);
            break;

        
        default:
            printf("default as shit bruh\n");
            break;
        }
    }
    return 0;
}