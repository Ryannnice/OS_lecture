# include <stdio.h>
# include <unistd.h>
# include <stdlib.h>

int main (int argc , char *argv[] )
{
	printf("We are now in exec2.c ! ! \n ") ;
   	printf("PID -> exec2 : %d \n" , getpid() ) ;
   	
   	printf("In process_2 , receive message from process_1 : \n\n") ;

    for(int i = 0 ; i < argc ; i ++ )
    {
        printf(" %s " , argv[i] ) ;
    }

    printf("\nNow we are still in process_2 ! ") ;

   	return 0 ;
}