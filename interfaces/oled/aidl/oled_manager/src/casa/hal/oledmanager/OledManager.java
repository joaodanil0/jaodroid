package casa.hal.oledmanager;

import android.util.Log;
import android.os.ServiceManager;
import android.os.IBinder;
import android.os.RemoteException;

import casa.hal.oled.IOled;

public class OledManager 
{
    private IBinder service;
    private IOled oledInterface;   
    private static final String INTERFACE = "casa.hal.oled.IOled/default";
    private static OledManager instance;

    private OledManager()
    {
        service = ServiceManager.getService(INTERFACE);

        if(service == null)
            Log.e("OledManager", "Service not available");

        oledInterface = IOled.Stub.asInterface(service);

        if (oledInterface == null)
            Log.e("OledManager", "Oled Interface not available");        
        
    }

    public static OledManager getInstance()
    {
        if(instance == null)
            instance = new OledManager();
        
        return instance;
    }

    public boolean clearDisplay() throws RemoteException {
        return oledInterface.clearDisplay();
    }

    public boolean writeString(String text) throws RemoteException {
        return oledInterface.writeString(text);
    }
}

    