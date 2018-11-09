with MeasureDeviceObserver; use MeasureDeviceObserver;
with PressureSensor; use PressureSensor;
with ADM; use ADM;

procedure Main is
   ADM : T_MeasureDeviceObserverClassAccess;
   sensor : T_PressureSensor;
begin
   sensor.setId(1);
   ADM := new T_ADM;
   sensor.registerObserver(ADM);
   sensor.simulateMeasure;
end Main;
