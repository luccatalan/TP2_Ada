with MeasureDeviceObserver; use MeasureDeviceObserver;
with Ada.Containers.Vectors; use Ada.Containers;

package ADM is

   type T_ADM is new T_MeasureDeviceObserver with private;
   
   package Float_Vector is new Vectors(Natural, Float);
   
   procedure computeAltitude(This : in out T_ADM);
   procedure update(This : access T_ADM; sensorID : in Natural; sensorStatus : in Boolean; sensorPressure : in Float);
   
private
   type T_ADM is new T_MeasureDeviceObserver with record
      status : Boolean;
      altitude : Float;
      pressureMean : Float;
      listOfPressure : Float_Vector.Vector;
   end record;

end ADM;
