#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include<sys/ioctl.h>
 
#define WRITE_STRING _IOW(190982, 'a', char *)
#define CLEAR_DISPLAY _IO(190982, 'c')

// #define RD_VALUE _IOR('a','b',int32_t*)
// #define RD_VALUE2 _IOR('a','d',char *)

 
int main()
{
        int fd;
        // int32_t value, number;
        char word[1024];

        printf("\nOpening Driver\n");
        fd = open("/dev/ssd1306_device", O_WRONLY);
        printf("Error: %d", fd);
        if(fd < 0) {
                printf("Cannot open device file...\n");
                perror("open");
                return 0;
        }
 
        printf("Enter the String to send\n");
        // scanf("%d",&number);
        fgets(word, sizeof(word), stdin);
        printf("Writing Value to Driver\n");
        ioctl(fd, WRITE_STRING, (char *) &word); 

        // printf("Clearing Display\n");
        // ioctl(fd, CLEAR_DISPLAY); 
 
        // printf("Reading Value from Driver\n");
        // ioctl(fd, RD_VALUE2, (char *) &result);
        // printf("Value is %s\n", result);
 
        printf("Closing Driver\n");
        close(fd);
}