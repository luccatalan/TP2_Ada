with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;

package body ExternalADM is

   procedure simulateMeasure(This : in out T_ExternalADM) is
   G : Generator;
   p0 : Float;
   begin
      p0 := 1013.15;
      Reset(G);
      This.pression := Random(G) * 2 * p0;
      if Random(G) < 0.7 then
         This.status := True;
      else
         This.status := False;
      end if;
   end simulateMeasure;
                            
end ExternalADM;
