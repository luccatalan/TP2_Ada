with MeasureDevice; use MeasureDevice;

package PressureSensor is

   type T_PressureSensor is new T_MeasureDevice with null record;
   
   procedure simulateMeasure(This : in out T_PressureSensor);

end PressureSensor;
