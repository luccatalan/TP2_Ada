with MeasureDeviceObserver; use MeasureDeviceObserver;
with PressureSensor; use PressureSensor;
with ExternalADM; use ExternalADM;
with ADM; use ADM;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   ADM : T_MeasureDeviceObserverClassAccess;
   sensor1, sensor2 : T_PressureSensor;
   extADM : T_ExternalADM;
begin
   sensor1.setId(0);
   sensor2.setId(1);
   extADM.setId(2);
   ADM := new T_ADM;
   sensor1.registerObserver(ADM);
   sensor2.registerObserver(ADM);
   extADM.registerObserver(ADM);
   sensor1.simulateMeasure(True, 1000.0);
   sensor2.simulateMeasure(True, 500.0);
   Put_Line("Result Test 1");
   extADM.simulateMeasure(True, 300.0);
   -- Test 1
   Put_Line("Result Test 2");
   sensor1.simulateMeasure(False, 1000.0);
   -- Test 2
   sensor2.simulateMeasure(False, 500.0);
   Put_Line("Result Test 3");
   extADM.simulateMeasure(False, 300.0);
   -- Test 3
   Put_Line("Result Test 4");
   sensor1.simulateMeasure(True, 1500.0);
   -- Test 4
   sensor2.simulateMeasure(True, 500.0);
   Put_Line("Result Test 5");
   extADM.simulateMeasure(True, 500.0);
   -- Test 5
end Main;
