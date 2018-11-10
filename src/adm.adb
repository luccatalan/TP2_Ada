with Ada.Text_IO; use Ada.Text_IO;

package body ADM is

   procedure update(This : access T_ADM; sensor : access T_MeasureDevice) is
      p : Float;
   begin
      if sensor.getStatus and sensor.getPressure <= 1013.15 then
         p := sensor.getPressure;
      else
         p := -1.0;
      end if;
      if This.listOfPressure.Last_Index = sensor.getId - 1 then
         This.listOfPressure.Append(p);
      else
         This.listOfPressure.Replace_Element(sensor.getId - 1, p); 
      end if;
      This.computeAltitude;
   end;
   
   procedure computeAltitude(This : in out T_ADM) is
   begin
      null;
   end;

end ADM;
