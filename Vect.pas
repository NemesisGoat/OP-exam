Unit Vect;

  Interface
  
uses crt; {menu;}
const n = 3;
Type Vector = array [1..n] of real;
procedure InputVector(k: integer; var A: Vector);
procedure OutputVector (k: integer; A: Vector);
procedure AddVector(a, b: Vector; var c: Vector);
procedure SubVector(a, b: Vector; var c: Vector);
function ScalMult(a, b: Vector): real;
procedure VectorMult (a, b: Vector; var c: Vector);
function MixMult (a, b, c:Vector) : real;
function ModulVector (a: Vector): real;
procedure ProdVector(t: real; a: Vector; var b: Vector);

procedure MenuVect;
procedure Wait;
  
  Implementation
  
uses crt;

procedure InputVector(k: integer; var A: Vector);
var i: integer;
begin
  GoToXY(10, 23 + k); 
  write('Введите вектор: ');
  for i := 1 to n do
  begin
      GoToXY(i * 10 + 16, 23 + k); 
      readln(A[i]);
  end;
  GoToXY(10, 23 + k); clearline;
  for i := 1 to n do
  begin
      GoToXY(i * 10 + 16, 23 + k); 
      clearline;
  end;
end;

procedure OutputVector (k: integer; A: Vector);
var i: integer;
begin
  GoToXY(10, 27 + k); 
  write('Результат: ');
  for i := 1 to n do
  begin
      GoToXY(i * 10 + 16, 28 + k); 
      writeln(A[i]);
  end;
end;

procedure AddVector(a, b: Vector; var c: Vector);
var i: integer;
begin
  for i := 1 to n do
    c[i] := a[i] + b[i];
end;

procedure SubVector(a, b: Vector; var c: Vector);
var i: integer;
begin
  for i := 1 to n do
    c[i] := a[i] - b[i];
end;

function ScalMult(a, b: Vector): real;
var i: integer; s: real;
begin
  s := 0;
  for i := 1 to n do
    s := s + a[i] * b[i];
  ScalMult := s;
end;

procedure VectorMult (a, b: Vector; var c: Vector);
begin
  c[1] := a[2] * b[3] - a[3] * b[2];
  c[2] := a[3] * b[1] - a[1] * b[3];
  c[3] := a[1] * b[2] - a[2] * b[1];
end;

function MixMult (a, b, c:Vector) : real;
var d: Vector;
begin
  VectorMult(a, b, d);
  MixMult := ScalMult(d, c);
end;

function ModulVector (a: Vector): real;
begin
  ModulVector := sqrt(ScalMult(a, a));
end;

procedure ProdVector(t: real; a: Vector; var b: Vector);
var i: integer;
begin
  for i := 1 to n do
    b[i] := t * a[i];
end;

procedure MenuVect;
var Ok: boolean; Mode: integer; a, b, c: Vector; t: real;
begin
  Ok := true;
  while Ok do
    begin
    clrscr;
    writeln('Выберите пункт:');
    writeln('1: Сложение векторов');
    writeln('2: Разность векторов');
    writeln('3: Скалярное произведение векторов');
    writeln('4: Векторное произведение');
    writeln('5: Смешанное произведение');
    writeln('6: Модуль вектора');
    writeln('7: Умножение вектора на число');
    writeln('0: Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); clearline;
  
    case Mode of
      1: begin
        InputVector(1, a); InputVector(1, b);
        AddVector(a, b, c);
        OutputVector(6, c);
        Wait;
      end;
      2: begin
        InputVector(1, a); InputVector(1, b);
        SubVector(a, b, c);
        OutputVector(6, c);
        Wait;
      end;
      3: begin
        InputVector(1, a); InputVector(1, b);
        t := ScalMult(a, b);
        writeln('Результат: ' + t);
        Wait;
      end;
      4: begin
        InputVector(1, a); InputVector(1, b);
        VectorMult(a, b, c);
        OutputVector(6, c);
        Wait;
      end;
      5: begin
        InputVector(1, a); InputVector(1, b); InputVector(1, c);
        t := MixMult(a, b, c);
        writeln('Результат: ' + t);
        Wait;
      end;
      6: begin
        InputVector(1, a);
        t := ModulVector(a);
        writeln('Результат: ' + t);
        Wait;
      end;
      7: begin
        InputVector(1, a);
        writeln('Введите число: '); read(t);
        ProdVector(t, a, b);
        OutputVector(5, b);
        Wait;
      end;
      0: Ok := false
      else
      begin
        writeln('Ошибка: Повторите ввод!');
        Wait;
      end;
    end;
  end;
end; 

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;
  
End.