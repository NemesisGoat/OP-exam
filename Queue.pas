unit Queue;

interface

uses Crt;

type 
  PtrQ = ^Queu;
  Queu = record
  Inf: Integer;
  Next: PtrQ;
end;

var Left, Right, Top: PtrQ;
    Value: Integer;

procedure MakeQueue;
procedure ViewQueue;
procedure AddQueue;
procedure MenuQueue;

implementation

procedure MakeQueue;
  var Ok: Boolean;
  begin
    Ok:= True;
    New(Top);
    writeln('Введите число');
    readln(Value);
    if Value = 999 then
    begin
      Ok:= False;
      Top^.Next:= nil;
    end
    else
    begin
      Ok := True;
      Top^.Inf := Value;
      Right := Top;
      Left := Top;
    end;
    
    while Ok do
    begin
      writeln('Введите число');
      readln(Value);
      if Value = 999 then
      begin
        Ok := False;
        Top^.Next := nil;
      end
      else
      begin
        New(Top);
        Right^.Next := Top;
        Top^.Inf := Value;
        Right := Top;
      end;
    end;
  end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure ViewQueue;
var PtrQ: PtrQ;
begin
  PtrQ := Left;
  while PtrQ <> nil do
  begin
    writeln(PtrQ^.Inf:4);
    PtrQ := PtrQ^.Next;
  end;
  Wait;
end;

procedure AddQueue;
begin
  New(Top);
  writeln('Введите число');
  readln(Value);
  Top^.Inf := Value;
  if Left = nil then
  begin
    Left := Top;
    Right := Top;
  end
  else
  begin
    Right^.Next := Top;
    Right := Top;
  end;
  Right^.Next := nil;
end;

procedure MenuQueue;
var Mode: Integer; Ok: Boolean;
begin
  Ok := True;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите операцию:');
    writeln('1: Создать очередь');
    writeln('2: Просмотреть очередь');
    writeln('3: Добавить элемент в очередь');
    writeln('0: Выйти в предыдущее меню');
    GoToXY(40, 23);
    readln(Mode);
    GoToXY(40, 23);
    writeln(' ');
    ClrScr;
    case Mode of
    1: MakeQueue;
    2: ViewQueue;
    3: AddQueue;
    0: Ok := False;
    else
    begin
      writeln('Ошибка! Неверный ввод.');
      Delay(2000);
    end;
    end;
  end;
end;

end.