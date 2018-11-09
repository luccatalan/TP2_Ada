with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package body PressureSensor is

   procedure simulateMeasure(This : in out T_PressureSensor) is
   G : Generator;
   p0 : Float;
   begin
      p0 := 1013.15;
      Reset(G);
      This.setPressure(Random(G) * 2.0 * p0);
      if Random(G) < 0.9 then
         This.setStatus(True);
      else
         This.setStatus(False);
      end if;
      This.notify;
   end simulateMeasure;

end PressureSensor;
