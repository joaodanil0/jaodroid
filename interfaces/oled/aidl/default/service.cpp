#define LOG_TAG "casa.hal.oled"

#include <android-base/logging.h>
#include <android/binder_process.h>
#include <binder/ProcessState.h>

#include <android/binder_manager.h>
#include <binder/IServiceManager.h>

#include "Oled.h"



using aidl::casa::hal::oled::Oled;
using std::string_literals::operator""s;

int main(){
    LOG(INFO) << "Initiating Oled Service";
    const std::string name = Oled::descriptor + "/default"s;

    android::ProcessState::initWithDriver("/dev/vndbinder");

    ABinderProcess_startThreadPool();

    LOG(INFO) << "Service is starting...";

    std::shared_ptr<Oled> userLed = ndk::SharedRefBase::make<Oled>();

    CHECK_EQ(STATUS_OK, AServiceManager_addService(userLed->asBinder().get(), name.c_str()));

    LOG(INFO) << "started...";

    ABinderProcess_joinThreadPool();

    return EXIT_FAILURE;  // should not reach
}