with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Float_Text_IO;
with MeasureDevice; 

package body ADM is

   procedure update(sensor : access MeasureDevice.T_MeasureDevice) is
   begin
      Put_Line("Update");
   end;
   
   procedure computeAltitude(This : in out T_ADM) is
   begin
      null;
   end;

end ADM;
