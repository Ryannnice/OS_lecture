#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>


int main()
{
    fork() ;
    printf("OS lecture is awesome ! \n PID = %d \n" , getpid() ) ;

    return 0 ;
}