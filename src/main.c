#include<main.h>
#include<math.h>
#include <string.h>
#include <time.h>


#define LAST_NUM 0x000FFFFF

static double diff_in_second(struct timespec t1, struct timespec t2)
{
    struct timespec diff;
    if (t2.tv_nsec-t1.tv_nsec < 0) {
        diff.tv_sec  = t2.tv_sec - t1.tv_sec - 1;
        diff.tv_nsec = t2.tv_nsec - t1.tv_nsec + 1000000000;
    } else {
        diff.tv_sec  = t2.tv_sec - t1.tv_sec;
        diff.tv_nsec = t2.tv_nsec - t1.tv_nsec;
    }
    return (diff.tv_sec + diff.tv_nsec / 1000000000.0);
}

int main()
{
    uint32_t num = 0;
	struct timespec start, end;
    double cpu_time;

    char output_txt[] = "output/output_" ALG ".txt";
	FILE * output= fopen (output_txt, "w");
	int count = 0;
	num = 0;
	while(1)
	{	    
		clock_gettime(CLOCK_REALTIME, &start);
		clz(num);
		clock_gettime(CLOCK_REALTIME, &end);
		cpu_time = diff_in_second(start, end);

		if((num & (num - 1)) == 0)
			printf("power of 2: %u\n",count++);
		//cpu_time*10^6
		fprintf(output,  "%u %lf\n",num,cpu_time*1000000 );
		if(num == LAST_NUM)
			break;
		else
			num++;
	}
	fclose(output); 
	return 0;
}
