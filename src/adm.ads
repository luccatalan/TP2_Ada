with MeasureDeviceObserver; use MeasureDeviceObserver;
with MeasureDevice; use MeasureDevice;

package ADM is

   type T_ADM is new T_MeasureDeviceObserver with private;
   type T_ADMAccess is access all T_ADM;
   
   procedure computeAltitude(This : in out T_ADM);
   procedure update(This : in out T_ADM; sensor : access T_MeasureDevice);
   
private
   type T_ADM is new T_MeasureDeviceObserver with record
      status : Boolean;
      altitude : Float;
      pressureMean : Float;
   end record;

end ADM;
