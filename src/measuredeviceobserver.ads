package MeasureDeviceObserver is

   type T_MeasureDeviceObserver is interface;
   type T_MeasureDeviceObserverClassAccess is access all T_MeasureDeviceObserver'Class;
   
   procedure update(This : access T_MeasureDeviceObserver; sensorID : in Natural; sensorStatus : in Boolean; sensorPressure : in Float) is null;

end MeasureDeviceObserver;
