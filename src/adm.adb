with Ada.Text_IO; use Ada.Text_IO;

package body ADM is

   procedure update(This : in out T_ADM; sensor : access T_MeasureDevice) is
   begin
      Put_Line("Update");
   end;
   
   procedure computeAltitude(This : in out T_ADM) is
   begin
      null;
   end;

end ADM;
