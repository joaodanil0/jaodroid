#include "Oled.h"

#include <utils/Log.h>
#include <android-base/logging.h>
#include <sys/stat.h>
#include <sys/ioctl.h>

namespace aidl::casa::hal::oled {

    #define WRITE_STRING _IOW(190982, 'a', char *)
    #define CLEAR_DISPLAY _IO(190982, 'c')

    

    int Oled::writeValue(const char *file, const char *value, int command) {

        int fd;
        // int str_len = strlen(value) + 1;
        // int wrote = 0;

        fd = open(file, O_WRONLY);

        if (fd < 0) {
            LOG(INFO) << "Writing value FAIL" << value << '\n';
            perror("open");
            return -1;
        }

        switch (command)
        {
        case 0:
            LOG(INFO) << "Writing Clear Clear" << '\n';
            ioctl(fd, CLEAR_DISPLAY); 
            break;
        case 1:
            LOG(INFO) << "Writing value" << value << '\n';
            ioctl(fd, WRITE_STRING, (char *) value); 
            break;
        default:
            break;
        }

        // if(!write(fd, value, str_len)){
        //     close(fd);
        //     return -1;
        // }  

        close(fd);
        return 0;
    }

    ndk::ScopedAStatus Oled::clearDisplay(bool* _aidl_return) {
        LOG(INFO) << "Clear Display";
        *_aidl_return = this->writeValue(DISPLAY_OLED, "", 0) == 0;
        return ndk::ScopedAStatus::ok();
    }
    
    ndk::ScopedAStatus Oled::writeString(const std::string& in_text, bool* _aidl_return) {
        LOG(INFO) << "Writing String=(" << in_text.c_str() << ")";
        *_aidl_return = this->writeValue(DISPLAY_OLED, in_text.c_str(), 1) == 0;
        return ndk::ScopedAStatus::ok();
    }
}