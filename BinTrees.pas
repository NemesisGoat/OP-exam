// Бинарные деревья
unit BinTrees;

interface
Uses Crt;
type
  NodePtr = ^Node;
  Node = record
    Key: byte;
    Left, Right: NodePtr
  end;

procedure MenuBinTree;
procedure MakeTree(var Top: NodePtr);
procedure WayUpDown(Top: NodePtr);
procedure WayDownUp(Top: NodePtr);
procedure WayHoriz(Top: NodePtr; Level: byte);
function High(Top: NodePtr): byte;
procedure ViewTree(Top: NodePtr);
function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
procedure Wait;
implementation

var
  Ok: boolean;
  Top, Poisk: NodePtr;
  Mode, Level, SearchKey: byte;


procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;


procedure MakeNode(NewKey: byte; var Top: NodePtr);
begin
  if Top = nil then
  begin
    New(Top); Top^.Key := NewKey;
    Top^.Left := nil; Top^.Right := nil
  end
  else
  if NewKey < Top^.Key then MakeNode(NewKey, Top^.Left)
  else MakeNode(NewKey, Top^.Right)
end;


procedure MakeTree(var Top: NodePtr);
var
  i, n, InputKey: byte;
begin
  GoToXY(25, 18); writeln('Введите количество элементов');
  GoToXY(25, 19); readln(n);
  for i := 1 to n do
  begin
    GoToXY(25, 20); writeln('Введите очередной элемент');
    GoToXY(25, 21); readln(InputKey);
    GoToXY(25, 21); writeln(' ');
    MakeNode(InputKey, Top)
  end
end;


procedure WayUpDown(Top: NodePtr);
begin
  if Top <> nil then
  begin
    write(Top^.Key, ' ');
    WayUpDown(Top^.Left);
    WayUpDown(Top^.Right)
  end
end;


procedure WayDownUp(Top: NodePtr);
begin
  if Top <> nil then
  begin
    WayDownUp(Top^.Left);
    WayDownUp(Top^.Right);
    write(Top^.Key, ' ')
  end
end;


procedure WayHoriz(Top: NodePtr; Level: byte);
begin
  if Top <> nil then
    if Level = 1 then write(Top^.Key, ' ')
    else
    begin
      WayHoriz(Top^.Left, Level - 1);
      WayHoriz(Top^.Right, Level - 1)
    end
end;

function High(Top: NodePtr): byte;
var
  HighLeft, HighRight: byte;
begin
  if Top = nil then High := 0
  else
  begin
    HighLeft := High(Top^.Left);
    HighRight := High(Top^.Right);
    if HighLeft > HighRight then High := HighLeft + 1
    else High := HighRight + 1
  end
end;


procedure ViewTree(Top: NodePtr);
var
  i, HighTree: byte;
begin
  HighTree := High(Top);
  for i := 1 to HighTree do
  begin writeln; WayHoriz(Top, i) end
end;


function SearchNode(Top: NodePtr; SearchKey: byte): NodePtr;
begin
  if Top = nil then SearchNode := nil
  else
  if Top^.Key = SearchKey then SearchNode := Top
  else
  if SearchKey < Top^.Key then
    SearchNode := SearchNode(Top^.Left, SearchKey)
  else
    SearchNode := SearchNode(Top^.Right, SearchKey)
end;


procedure MenuBinTree; 

var Ok : boolean; Mode: integer;

begin
  Ok:= True;
  while Ok do
  begin
    ClrScr;
    writeln('1. Создание дерева');
    writeln('2. Обход сверху вниз');
    writeln('3. Обход снизу вверх');
    writeln('4. Обход вершин одного уровня');
    writeln('5. Высота дерева');
    writeln('6. Просмотр дерева');
    writeln('0. Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); ClrScr;
    
    case Mode of 
      1 : MakeTree(Top);
      2 : begin 
            WayUpDown(Top); 
            Wait
          end;
      3 : begin WayDownUp(Top); Wait end;
      4 : begin
            GoToXY(30, 18); writeln('Введите уровень');
            GoToXY(40, 19); readln(Level); ClrScr;
            WayHoriz(Top, Level); 
            Wait
          end;
      5 : begin writeln(High(Top):3); Wait end;
      6 : begin 
            ViewTree(Top); 
            Wait 
          end;
      0: Ok:= false
      else
      begin
        GoToXY(30, 24);
        writeln('Ошибка: Повторите ввод!');
        Wait;
      end;
    end;
  end;
end;
end.