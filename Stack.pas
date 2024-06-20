Unit Stack;

  Interface
uses crt;
Type Ptr=^Stac;
  Stac = record 
    Inf: integer;
    Next: Ptr;
  end;
var Top, Kon: Ptr;
    value: integer;
    
procedure MakeStack(var Top: Ptr);
procedure ViewStack(var Top:Ptr);
procedure AddStack(var Top:Ptr);
procedure DeleteStack(var Top:Ptr);
procedure ReverseStack(var Top:Ptr);
procedure wait;
procedure MenuStack;

  Implementation

procedure MakeStack(var Top: Ptr);
  var ok: boolean;
  begin
    Ok:= True;
    Top:= Nil;
    while Ok do
    begin
      writeln('Введите число (999, чтобы прекратить): '); 
      readln(value);
      if value = 999 then Ok:= False
      else
      begin
        New(kon);
        Kon^.Next:= Top;
        Kon^.Inf:= Value;
        Top:= Kon;
      end;
    end;
  end;
  
procedure ViewStack(var Top: Ptr);
  begin
    Kon:= Top;
    while Kon <> Nil do
    begin
      GoToXY(40, 40);
      writeln(Kon^.Inf: 4);
      Kon:= Kon^.Next
    end;
  end;
  
procedure AddStack(var Top: Ptr);
  Var Ok: boolean;
  begin
    Ok:= True;
    while Ok do
    begin
      writeln('Добавьте число (999, чтобы прекратить): ');
      readln(Value);
      if Value = 999 then Ok:= False
      else
      begin
        New(kon);
        Kon^.Next:= Top;
        kon^.Inf:= Value;
        Top:= Kon;
      end;
    end;
  end;
  
procedure DeleteStack(var Top: Ptr);
  var Temp: Ptr;
  begin
    while Top <> nil do
    begin
      Temp := Top;
      Top := Top^.Next;
      Dispose(Temp);
    end;
  end;
  
procedure ReverseStack(var Top: Ptr);
  var ReversedStack, Temp: Ptr;
  begin
    ReversedStack := nil;
    while Top <> nil do
    begin
      Temp := Top;
      Top := Top^.Next;
      Temp^.Next := ReversedStack;
      ReversedStack := Temp;
    end;
    Top := ReversedStack;
  end;
  
procedure wait;
  begin
    repeat until KeyPressed;
    while KeyPressed do ReadKey;
  end;

procedure MenuStack;
   var Ok: boolean; 
       Mode: integer;
   begin
     Ok:= true; 
     while Ok = true do
       begin
        ClrScr;
        writeln('Выберите пункт:');
        writeln('1: Создание стэка');
        writeln('2: Просмотр стэка');
        writeln('3: Добавление чисел в стэк');
        writeln('4: Удаление стэка');
        writeln('5: Перевернуть стэк');
        writeln('999: Прервать действие');
        writeln('0: Назад.');
          
         GoToXY(40, 23); read(Mode);
         GoToXY(40, 23); ClearLine;
         
         case Mode of
     1: begin
          ClrScr;
          writeln('Создание стэка');
          MakeStack(Top);
        end;
     2: begin
          ClrScr;
          writeln('Cтэк: ');
          ViewStack(Top);
          wait;
        end;
     3: begin
          ClrScr;
          writeln('Добавить число в стэк: ');
          AddStack(Top);
        end;
     4: begin
          ClrScr;
          writeln('Стэк удалён');
          DeleteStack(Top);
          wait;
        end;
     5: begin
          ClrScr;
          writeln('Стэк перевёрнут');
          ReverseStack(Top);
          wait; 
        end;
     0: begin
        ClrScr;
        ok:= False;
        end;
        
        else   
        begin
          GoToXY(30, 24);
          writeln('Ошибка! Повторите ввод:');
        end;
      end;
    end;
  end;
end.
