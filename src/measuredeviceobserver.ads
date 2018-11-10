limited with MeasureDevice;

package MeasureDeviceObserver is

   type T_MeasureDeviceObserver is interface;
   type T_MeasureDeviceObserverClassAccess is access all T_MeasureDeviceObserver'Class;
   
   procedure update(This : access T_MeasureDeviceObserver; sensor : access MeasureDevice.T_MeasureDevice) is abstract;

end MeasureDeviceObserver;
