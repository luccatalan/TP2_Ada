with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;

package body ADM is
      
   procedure update(This : access T_ADM; sensorID : in Natural; sensorStatus : in Boolean; sensorPressure : in Float) is
      p : Float;
   begin
      if sensorStatus and sensorPressure >= 0.0 and sensorPressure <= 1013.15 then
         p := sensorPressure;
      else
         p := -1.0;
      end if;
      if This.listOfPressure.Last_Index = sensorID - 1 then
         This.listOfPressure.Append(p);
      else
         This.listOfPressure.Replace_Element(sensorID, p); 
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
      nbPressure : Integer := 0;
   begin
      -- Calcul pression moyenne
      This.pressureMean := 0.0;
      This.status := False;
      while i < Integer(This.listOfPressure.Length) loop 
         if This.listOfPressure.Element(i) /= -1.0 then 
            This.pressureMean := This.pressureMean + This.listOfPressure.Element(i);
            This.status := True;
            nbPressure := nbPressure + 1;
         end if;
         i := i + 1;
      end loop;
      This.pressureMean := This.pressureMean / Float(nbPressure);
      -- Calcul altitude
      h := ((R * T0) / (M * g)) * Log(p0 / This.pressureMean);
      Put(h);
      Ada.Text_IO.New_Line(1);
      Put(This.pressureMean);
      Ada.Text_IO.New_Line(1);
      Ada.Text_IO.Put(Boolean'Image(This.status));
      Ada.Text_IO.New_Line(2);
   end;
   
end ADM;
