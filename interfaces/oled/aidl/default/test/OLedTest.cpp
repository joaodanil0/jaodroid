#include <aidl/casa/hal/oled/IOled.h>
#include <android/binder_manager.h>

#include <iostream>
#include <string>

using ::aidl::casa::hal::oled::IOled;


int main(int argc, char *argv[]) {

    std::shared_ptr<IOled> mHal;
    std::string a;
    bool c;

    if (argc != 2) {
        // std::cout << "USAGE ./LedTest <none|heartbeat|default-on>\n";
        exit(0);
    }

    AIBinder* binder = AServiceManager_waitForService("casa.hal.oled.IOled/default");

    if (binder == nullptr){
        std::cout << "Failed to get cpu service\n";
        exit(-1);
    }

    mHal = IOled::fromBinder(ndk::SpAIBinder(binder));

     if (strcmp(argv[1], "clear") == 0){
        mHal->clearDisplay(&c);
        std::cout << "Clear display" << std::endl;
     }
     else{
        mHal->writeString(argv[1], &c);
        std::cout << "Writing String:" << c << std::endl;
     }
    


    return 0;
}