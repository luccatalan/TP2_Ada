with MeasureDeviceObserver; use MeasureDeviceObserver;
limited with MeasureDevice;

package ADM is

   type T_ADM is new T_MeasureDeviceObserver with private;
   
   procedure computeAltitude(This : in out T_ADM);
   procedure update(sensor : access MeasureDevice.T_MeasureDevice);
   
private
   type T_ADM is new T_MeasureDeviceObserver with record
      status : Boolean;
      altitude : Float;
      pressureMean : Float;
   end record;

end ADM;
