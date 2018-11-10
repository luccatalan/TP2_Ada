limited with MeasureDevice;

package MeasureDeviceObserver is

   type T_MeasureDeviceObserver is interface;
   type T_MeasureDeviceObserverClassAccess is access all T_MeasureDeviceObserver'Class;
   
   procedure update(This : in out T_MeasureDeviceObserver; sensor : access MeasureDevice.T_MeasureDevice) is null;

end MeasureDeviceObserver;
