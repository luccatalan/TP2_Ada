with MeasureDevice; use MeasureDevice;

package ExternalADM is

   type T_ExternalADM is new T_MeasureDevice with null record;
   
   procedure simulateMeasure(This : in out T_ExternalADM);

end ExternalADM;
