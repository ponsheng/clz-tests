#include<main.h>
#include<math.h>
#include <string.h>

#define MAX_NUM 0x00FFFFFF

int check(uint32_t num,int n)
{
    return ((!num)&&(n>>5))||((!(num>>(31-n)>>1))&&(num>>(31-n)));
}

int main()
{
    uint32_t num = 0;
    int n =clz(num);
    int is_check = 0;
    //FILE * output= fopen ( "output.txt", "w");
    int count = 0;
    num = 0;
    while(1) {
        n = clz(num);
        is_check = check(num,n);
        if((num & (num - 1)) == 0)
            printf("power of 2: %u\n",count++);
        if(!is_check)
            printf("incorrect %u  %u\n",num,n);
        //fprintf(output,  "%u %u %u\n",num,n,is_check );
        if(num == MAX_NUM)
            break;
        else
            num++;
    }
    //fclose(output);
    return 0;
}
