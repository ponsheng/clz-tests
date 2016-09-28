#include<main.h>
#include<math.h>
#include <string.h>


int check(uint32_t num,int n)
{
	return ((!num)&&(n>>5))||((!(num>>(31-n)>>1))&&(num>>(31-n)));
}

int main()
{
    uint32_t num = 0;
	int n =clz(num);
	int is_check = 0;
	printf("zeros: %d  \n",n);
	printf("check:%d \n",check(num,n));
	FILE * output= fopen ( "output.txt", "w");
	printf("123");
	int count = 0;
	for(num=0 ; num < pow(2,32); num++)
	{
	    n = clz(num);
		is_check = check(num,n);
		if(!is_check)
			printf("incorrect %u  %u\n",num,n);
		if((num & (num - 1)) == 0)
			printf("power of 2: %u\n",count++);
		fprintf(output, "num %u zeros %u check %u\n",num,n,is_check );
	}
	fclose(output); 
	return 0;
}
