unit NodeTrees;

interface

Uses Crt;

type
  NodePtr = ^Node;
  Node = record
    Name: char;
    Key: byte;
    Left, Right: NodePtr;
  end;

procedure MakeSubTrees(Leaf: NodePtr);
procedure Wait;
procedure MakeTree(var Top: NodePtr);
procedure WayUpDown(Top: NodePtr);
procedure WayDownUp(Top: NodePtr);
procedure WayHoriz(Top: NodePtr; Level: byte);
function High(Top: NodePtr): byte;
procedure ViewTree(Top: NodePtr);
procedure SearchNode(Top: NodePtr; var Leaf: NodePtr);
procedure AddSubTree(Top: NodePtr);
procedure BeautifulViewBT(Top: NodePtr; x, y: integer);
procedure MenuTree;

  Implementation

var
  Key, Symbol: char;
  Flag: boolean;
  Top, Leaf: NodePtr;
  Level, Mode: byte;

procedure MakeSubTrees(Leaf: NodePtr);
var
  top: NodePtr;
begin
  GoToXY(30, 18); 
  writeln('Введите текущий узел:');
  GoToXY(55, 18); 
  readln(Leaf^.Name);
  ClrScr;
  GoToXY(30, 18); 
  writeln(Leaf^.Name, ' имеет левое поддерево?:у/n');
  GoToXY(40, 19); 
  readln(Key);
  ClrScr;
  if Key in ['y', 'Y', 'н', 'Н'] then
  begin
    new(Top); 
    Leaf^.Left := Top;
    MakeSubTrees(Top)
  end
  else 
    Leaf^.Left := nil;
    GoToXY(30, 18); 
    writeln(Leaf^.Name, ' имеет правое поддерево?:у/n');
    GoToXY(40, 19); 
    readln(Key);
    ClrScr;
    if Key in ['y', 'Y', 'н', 'Н'] then
    begin
      new(Top); 
      Leaf^.Right := Top; 
      MakeSubTrees(Top)
    end
    else Leaf^.Right := nil;
end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MakeTree(var Top: NodePtr);
begin
  new(Top);
  MakeSubTrees(Top)
end;

procedure WayUpDown(Top: NodePtr);
begin
  if Top <> nil then
  begin
    write(Top^.Name, ' ');
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
    write(Top^.Name, ' ')
  end;
end;

procedure WayHoriz(Top: NodePtr; Level: byte);
begin
  if Top <> nil then
    if Level = 1 then write(Top^.Name, ' ')
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
    if HighLeft > HighRight then 
      High := HighLeft + 1
    else High := HighRight + 1
  end
end;

procedure ViewTree(Top: NodePtr);
var
  i, HighTree: byte;
begin
  HighTree := High(Top);
  for i := 1 to HighTree do
  begin
    writeln; 
    WayHoriz(Top, i)
  end
end;

procedure SearchNode(Top: NodePtr; var Leaf: NodePtr);
begin
  if (Top <> nil) and (Flag = True) then
  begin
    if Symbol = Top^.Name then
    begin
      Flag := False; 
      Leaf := Top
    end
    else
    begin
      SearchNode(Top^.Left, Leaf);
      SearchNode(Top^.Right, Leaf)
    end
  end
end;

procedure AddSubTree(Top: NodePtr);
begin
  GoToXY(30, 19); 
  writeln('Введите искомый узел');
  GoToXY(40, 21); 
  readln(Symbol);
  Flag := True; 
  SearchNode(Top, Leaf); 
  ClrScr;
  if Flag = True then
  begin
    write('Узел ', Symbol, ' не найден'); 
    Wait
  end
  else
  begin
    GoToXY(25, 20);
    writeln('Желаете построить левое поддерево у ', Leaf^.Name, '? y/n');
    GoToXY(40, 21); 
    readln(Key);
    GoToXY(25, 20);
    Clearline;
    GoToXY(40, 21); 
    Clearline;
    if Key in ['y', 'Y', 'н', 'Н'] then
    begin
      if Leaf^.Left <> Nil then
      begin
        GoToXY(25,19);
        writeln('Левое поддерево у ', Leaf^.Name, ' уже есть');
        GoToXY(25, 21);
        writeln('Всё-таки удалить?');
        GoToXY(40,23);
        readln(key);
        GoToXY(25, 21); 
        Clearline;
        GoToXY(40, 23); 
        Clearline;
        if key in ['y', 'Y', 'н', 'Н'] then
        begin
          MakeTree(Top);
          Leaf^.Left:=Top;
        end;
      end
      else
        begin
          MakeTree(Top);
          Leaf^.Left:=Top;
        end;
    end
    else
    begin
      GoToXY(25, 20);
    writeln('Желаете построить правое поддерево у ', Leaf^.Name, '? y/n');
    GoToXY(40, 21); 
    readln(Key);
    GoToXY(25, 20);
    Clearline;
    GoToXY(40, 21); 
    Clearline;
    if Key in ['y', 'Y', 'н', 'Н'] then
    begin
      if Leaf^.Right <> Nil then
      begin
        GoToXY(25,19);
        writeln('Правое поддерево у ', Leaf^.Name, ' уже есть');
        GoToXY(25, 21);
        writeln('Всё-таки удалить?');
        GoToXY(40,23);
        readln(key);
        GoToXY(25, 21); 
        Clearline;
        GoToXY(40, 23); 
        Clearline;
        if key in ['y', 'Y', 'н', 'Н'] then
        begin
          MakeTree(Top);
          Leaf^.Right:=Top;
        end;
      end
      else
        begin
          MakeTree(Top);
          Leaf^.Right:=Top;
        end;
    end;
    end;
  end;
end;

procedure DeleteSubTree(Top: NodePtr);
begin
  GoToXY(30, 19); 
  writeln('Введите искомый узел');
  GoToXY(40, 21); 
  readln(Symbol);
  Flag := True; 
  SearchNode(Top, Leaf); 
  ClrScr;
  if Flag = True then
  begin
    write('Узел ', Symbol, ' не найден'); 
    Wait
  end
  else
  begin
    GoToXY(25, 20);
    writeln('Желаете удалить узел ', Leaf^.Name, '? y/n');
    GoToXY(40, 21); 
    readln(Key);
    GoToXY(25, 20);
    Clearline;
    GoToXY(40, 21); 
    Clearline;
    if Key in ['y', 'Y', 'н', 'Н'] then Leaf := Nil
  end;
end;

procedure BeautifulViewBT(Top: NodePtr; x, y: integer);
begin
  if Top = nil then
    Exit;

  GoToXY(x, y);
  write(Top^.Name);

  if Top^.Left <> nil then
  begin
    GoToXY(x - 2, y + 1);
    write('/');
    BeautifulViewBT(Top^.Left, x - 4, y + 2);
  end;

  if Top^.Right <> nil then
  begin
    GoToXY(x + 2, y + 1);
    write('\');
    BeautifulViewBT(Top^.Right, x + 4, y + 2);
  end;
end;

procedure MenuTree;
var
  ok: boolean;
  Mode, Level: byte;
  Top: NodePtr;
begin
  Ok := True;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите пункт меню:');
    writeln('1. Создать дерево');
    writeln('2. Посмотреть дерево');
    writeln('3. Поиск сверху вниз');
    writeln('4. Поиск снизу вверх');
    writeln('5. Поиск вертикали одного уровня');
    writeln('6. Высота дерева');
    writeln('7. Добавить поддерево');
    //writeln('8. Красивый вывод');
    writeln('8. Удалить поддерево');
    writeln('0. Выход');
    GoToXY(40, 23); readln(Mode);
    ClrScr;
    case Mode of
      1: MakeTree(Top);
      2:
        begin
          ViewTree(Top); 
          Wait
        end;
      3:
        begin
          WayUpDown(Top); 
          Wait
        end;
      4:
        begin
          WayDownUp(Top); 
          Wait
        end;
      5:
        begin
          GoToXY(30, 18); 
          writeln('Введите уровень');
          GoToXY(40, 19); 
          readln(Level); 
          ClrScr;
          WayHoriz(Top, Level); 
          Wait
        end;
      6:
        begin
          writeln(High(Top):3); 
          Wait
        end;
      7: AddSubTree(Top);
      8: DeleteSubTree(Top);
      9:
        begin
          BeautifulViewBT(Top, 40, 2);
          Wait;
        end;
      0: Ok := False
    else
      begin
        GoToXY(30, 24); writeln('Ошибка!');
        Wait
      end
    end
  end;
end;
end.
