#include<main.h>
#include<math.h>

int check(uint32_t num,int n)
{
	printf("%u  %u  \n",(unsigned int)num>>(32-n),num>>(31-n));
	return (!(num>>(31-n)>>1)) && (num>>(31-n));
}

int main()
{
    uint32_t num = pow(2,31);
	int n =clz(num);
	printf("%d  \n",n);
	printf("%d \n",check(num,n));
    
	return 0;
}
