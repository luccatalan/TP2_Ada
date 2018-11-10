with Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

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
      i : Integer := 0;
      g : Float := 9.807;
      p0 : Float := 1013.15;
      R : Float := 8.314;
      M : Float := 0.02896;
      T0 : Float := 288.0;
      h : Float := 0.0;
   begin
      -- Calcul pression moyenne
      This.pressureMean := 0.0;
      This.status := False;
      while i < Integer(This.listOfPressure.Length) loop 
         if This.listOfPressure.Element(i) /= -1.0 then 
            This.pressureMean := This.pressureMean + This.listOfPressure.Element(i);
            This.status := True;
         end if;
         i := i + 1;
      end loop;
      This.pressureMean := This.pressureMean / Float(This.listOfPressure.Length);
      -- Calcul altitude
      h := ((R * T0) / (M * g)) * Log(p0 / This.pressureMean);
   end;

end ADM;
