
#include <aidl/casa/hal/oled/BnOled.h>

namespace aidl::casa::hal::oled {

    class Oled : public BnOled {
        public:
            static inline const char DISPLAY_OLED[] = "/dev/ssd1306_device";

        public:
            static int writeValue(const char *file, const char *value, int command);
            ndk::ScopedAStatus clearDisplay(bool* _aidl_return) override;
            ndk::ScopedAStatus writeString(const std::string& in_text, bool* _aidl_return) override;
        };
}