Unit Favorites;
Interface
Uses Crt;

function Snake(): integer;

procedure Z;

procedure Square;

procedure MenuFavorites;

procedure Wait;

Implementation
const n=10;
function Snake(): integer;
var p, i, j, e: integer;
    a:array[1..n, 1..n] of integer;
begin
  p:=0;

for e:=1 to 7 do
  begin
    for j:=e to n-e+1 do
    begin
      p:= p + 1;
      a[e, j]:= p;
    end;
    
    for i:=e+1 to n-e+1 do
    begin
      p:= p + 1;
      a[i, j]:= p;
    end;
      
    for j:=n-e downto e do
      begin
        p:= p + 1;
        a[i, j]:= p;
      end;
      
    for i:=n-e downto e+1 do
      begin
        p:= p + 1;
        a[i, j]:= p;
      end;
  end;



  
  for i:=1 to n do
  for j:=1 to n do 
  begin
    GoToXY(4*j, i*2+3);
    write(a[i,j]);
  end;
  
end;

procedure Z;
var i, j, m: integer;
  a: array[1..n, 1..n] of integer;
  
begin
  
  for i := 1 to n do
  for j := 1 to n do
   a[i,j]:=0;
   
  for j:=1 to n-1 do a[1,j]:=1;
  for j:=1 to n do a[n+1 - j,j]:=1;
  for j:=2 to n do a[n,j]:=1;
  
  for i:=1 to n do
  for j:=1 to n do 
  begin
    GoToXY(4*j, i*2+3);
    write(a[i,j]);
  end;
end;

procedure Square;
var i, j, m: integer;
  a: array[1..n, 1..n] of integer;
  
begin
  
  for i := 1 to n do
  for j := 1 to n do
   a[i,j]:=0;
   
  for j:=1 to n-1 do a[1,j]:=1;
  for i:=1 to n do a[i, n]:=1;
  for j:=1 to n-1 do a[n,j]:=1;
  for i:=2 to n-1 do a[i, 1]:=1;
  
  for i:=1 to n do
  for j:=1 to n do 
  begin
    GoToXY(4*j, i*2+3);
    write(a[i,j]);
  end;
end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MenuFavorites;
var Mode:integer; Ok:boolean;
begin
  begin
  Ok:= true;
  ClrScr;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите пункт');
    writeln('1. Змейка');
    writeln('2. Z');
    writeln('3. Квадратик');
    writeln('0. Выход');
    goToXY(40, 23);
    read(Mode);
    GoToXY(40, 23);
    ClearLine;
    case Mode of
      1: begin
            ClrScr;
            Snake();
            Wait
         end;
      2: begin
            ClrScr;
            Z;
            Wait
         end;
      3: begin
            ClrScr;
            Square;
            Wait
         end;
      0: Ok:= False
    else
    begin
      GoToXY(30, 24);
      write('Ошибка! Повторите ввод!');
      Wait;
    end;
  end;
end;
end;
end;

Initialization

end.