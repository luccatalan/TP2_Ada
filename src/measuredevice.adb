package body MeasureDevice is

   function getPressure(This : in out T_MeasureDevice) return Float is
   begin
      return This.pression;
   end;
   
   function getStatus(This : in out T_MeasureDevice) return Boolean is
   begin
      return This.status;
   end;
   
   function getId(This : in out T_MeasureDevice) return Natural is
   begin
      return This.id;
   end;
   
   procedure setPressure(This : in out T_MeasureDevice; Pressure : in Float) is
   begin
      This.pression := Pressure;
   end;
   
   procedure setStatus(This : in out T_MeasureDevice; Status : in Boolean) is
   begin
      This.status := Status;
   end;
   
   procedure setId(This : in out T_MeasureDevice; id : in Natural) is
   begin
      This.id := id;
   end;
   
   procedure registerObserver(This : in out T_MeasureDevice; Observer : in MeasureDeviceObserver.T_MeasureDeviceObserverClassAccess) is
   begin
      This.observers.Append(Observer);
   end;
   
   procedure notify(This : access T_MeasureDevice) is
      i : Integer := 0;
   begin
      while i < Integer(This.observers.Length) loop
         This.observers.Element(i).update(This);
         i := i + 1;
      end loop;
   end;
     
end MeasureDevice;
