package casa.hal.oled;

@VintfStability
interface IOled {
    boolean clearDisplay();
    boolean writeString(in String text);
}