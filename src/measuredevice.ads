with MeasureDeviceObserver;
with MeasureDevicesVector;

package MeasureDevice is

   type T_MeasureDevice is abstract tagged private;
   
   procedure simulateMeasure(This : in out T_MeasureDevice) is abstract;
   procedure simulateMeasure(This : in out T_MeasureDevice; status : in Boolean; pressure : in Float); -- Permet de faire les tests
   function getPressure(This : in out T_MeasureDevice) return Float;
   function getStatus(This : in out T_MeasureDevice) return Boolean;
   procedure setPressure(This : in out T_MeasureDevice; Pressure : in Float);
   procedure setStatus(This : in out T_MeasureDevice; Status : in Boolean);
   function getId(This : in out T_MeasureDevice) return Natural;
   procedure setId(This : in out T_MeasureDevice; id : Natural);
   procedure notify(This : access T_MeasureDevice);
   procedure registerObserver(This : in out T_MeasureDevice; Observer : in MeasureDeviceObserver.T_MeasureDeviceObserverClassAccess);

   
private
   type T_MeasureDevice is abstract tagged record
      pression : Float;
      status : Boolean;
      observers : MeasureDevicesVector.DevicesVector.Vector; 
      id : Natural;
   end record;
  
end MeasureDevice;
