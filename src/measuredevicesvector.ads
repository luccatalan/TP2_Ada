with Ada.Containers.Indefinite_Vectors; use Ada.Containers;
with MeasureDeviceObserver; use MeasureDeviceObserver;

package MeasureDevicesVector is
   package DevicesVector is new Indefinite_Vectors(Natural, T_MeasureDeviceObserverClassAccess);
end;
