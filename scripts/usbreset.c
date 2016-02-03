/* usbreset -- send a USB port reset to a USB device */
/* http://askubuntu.com/questions/645/how-do-you-reset-a-usb-device-from-the-command-line */
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <sys/ioctl.h>
#include <linux/usbdevice_fs.h>

/**
 * Remember to run `lsusb` to get the the bus and device ID
 *
 * Compile using
 * cc usbreset.c -o usbreset.o
 *
 * Execute using
 * sudo ./usbreset.o /dev/bus/usb/003/021
 *
 * 003 - represents the bus
 * 021 - represents the device ID
 */
int main(int argc, char **argv)
{
    const char *filename;
    int fd;
    int rc;

    if (argc != 2) {
        fprintf(stderr, "Usage: usbreset device-filename\n");
        return 1;
    }
    filename = argv[1];

    fd = open(filename, O_WRONLY);
    if (fd < 0) {
        perror("Error opening output file");
        return 1;
    }

    printf("Resetting USB device %s\n", filename);
    rc = ioctl(fd, USBDEVFS_RESET, 0);
    if (rc < 0) {
        perror("Error in ioctl");
        return 1;
    }
    printf("Reset successful\n");

    close(fd);
    return 0;
}