Unit CMatr;

  Interface
  
uses crt, Compl; {menu;}
const n = 4;
type Matrix = array[1..n, 1..n] of Complex;
procedure InputMatrix(k: integer; var A: Matrix);
procedure OutputMatrix(k: integer; A: Matrix);
procedure AddMatrix (a, b: Matrix; var c: Matrix);
procedure MultMatrix (a, b: Matrix; var c: Matrix);
procedure ProdMatrix (k: real; a: Matrix; var c: Matrix);
procedure ZeroMatrix (var a: Matrix);
procedure OneMatrix (var a: Matrix);
function NormMatrix(a: Matrix) : real;
procedure ExpMatrix (a: Matrix; var S: Matrix);

procedure MenuCMatr;
  
  Implementation

procedure InputMatrix(k: integer; var A: Matrix);
var i, j: integer;
begin
  GoToXY(20 + k, 13);
  write('Введите матрицу: ');
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      GoToXY(j * 10 + k + 20, 13 + i * 3);
      write('(');
      read(A[i, j].Re);
      GoToXY(j * 10 + 23 + k, 13 + i * 3);
      write(',');
      GoToXY(j * 10 + 25 + k, 13 + i * 3);
      read(A[i, j].Im);
      GoToXY(j * 10 + 27 + k, 13 + i * 3);
      write(')')
    end;
  end;
end;

procedure OutputMatrix(k: integer; A: Matrix); // Матрица выводится в одну строку!!!
var i, j: integer;
begin
  GoToXY(20 + k, 23);
  write('Результат: ');
  for i := 1 to n do
  begin
    for j := 1 to n do
    begin
      GoToXY(j * 7 + k + 20, 23 + i * 3);
      write('(');
      write(A[i, j].Re);
      GoToXY(j * 7 + 23 + k, 23 + i * 3);
      write(',');
      GoToXY(j * 7 + 25 + k, 23 + i * 3);
      write(A[i, j].Im);
      GoToXY(j * 7 + 27 + k, 23 + i * 3);
      write(')')
    end;
  end;
end;

procedure AddMatrix (a, b: Matrix; var c: Matrix);
var i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      Add(a[i, j], b[i, j], c[i, j]);
end;

procedure MultMatrix (a, b: Matrix; var c: Matrix);
var i, j, k: integer; p, s: Complex;
begin
  for i := 1 to n do
    for j := 1 to n do
    begin
      Zero(s);
      for k := 1 to n do
      begin
        Mult(a[i, k], b[k, j], p);
        Add(s, p, s);
      end;
    c[i, j] := s;
    end;
end;

procedure ProdMatrix (k: real; a: Matrix; var c: Matrix);
var i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      Prod(k, a[i, j], c[i, j]);
end;

procedure ZeroMatrix (var a: Matrix);
var i, j: integer;
begin
  for i := 1 to n do
    for j := 1 to n do
      Zero(a[i, j]);
end;

procedure OneMatrix (var a: Matrix);
var i, j: integer;
begin
  ZeroMatrix(a);
  for i := 1 to n do
    One(a[i, i]);
end;

function NormMatrix(a: Matrix) : real;
var i, j: integer; p, s: real;
begin
  p := 0;
  for i := 1 to n do
  begin
    s := 0;
    for j := 1 to n do
      s := s + Modul(a[i, j]);
    if s > p then
      p := s;
  end;
  NormMatrix := p;
end;

procedure ExpMatrix (a: Matrix; var S: Matrix);
const eps = 0.001;
var k: integer; p: Matrix;
begin
  k := 0;
  OneMatrix(p);
  OneMatrix(s);
  while NormMatrix(p) >= eps do
  begin
    k := k + 1;
    MultMatrix(p, a, p);
    ProdMatrix(1/k, p, p);
    AddMatrix(s, p, S);
  end;
end;

procedure MenuCMatr;
var Ok: boolean; Mode: integer; a, b, c: Matrix; k: real;
begin
  Ok := true;
  while Ok do
    begin
    clrscr;
    writeln('Выберите пункт:');
    writeln('1: Сложение комплексных матриц');
    writeln('2: Умножение комплексных матриц');
    writeln('3: Умножение комплексной матрицы на скаляр');
    writeln('4: Матрица из комплексных нулей');
    writeln('5: Матрица с компрексными единицами по диагонали');
    writeln('6: Норма комплексной матрицы');
    writeln('7: Экспонента комплексной матрицы');
    writeln('0: Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); clearline;
  
    case Mode of
      1: begin
        InputMatrix(1, a); InputMatrix(50, b);
        AddMatrix(a, b, c);
        OutputMatrix(1, c);
        Wait;
      end;
      2: begin
        InputMatrix(1, a); InputMatrix(50, b);
        MultMatrix(a, b, c);
        OutputMatrix(1, c);
        Wait;
      end;
      3: begin
        InputMatrix(1, a);
        writeln('Введите скаляр: '); read(k);
        ProdMatrix(k, a, c);
        OutputMatrix(50, c);
        Wait;
      end;
      4: begin
        ZeroMatrix(a);
        OutputMatrix(1, a);
        Wait;
      end;
      5: begin
        OneMatrix(a);
        OutputMatrix(1, a);
        Wait;
      end;
      6: begin
        InputMatrix(1, a);
        k := NormMatrix(a);
        writeln('Результат: ' + k);
        Wait;
      end;
      7: begin
        InputMatrix(1, a);
        ExpMatrix(a, c);
        OutputMatrix(50, c);
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
  
End.