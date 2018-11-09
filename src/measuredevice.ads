with Ada.Containers.Vectors;
use Ada.Containers;

limited with MeasureDeviceObserver;

package MeasureDevice is

   type T_MeasureDevice is abstract tagged private;
   package DevicesVector is new Vectors(Natural, MeasureDeviceObserver.T_MeasureDeviceObserverAccess);
   
   procedure simulateMeasure(This : in out T_MeasureDevice) is abstract;
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
      observers : DevicesVector.Vector; 
      id : Natural;
   end record;
   
end MeasureDevice;
