Unit VectC;

  Interface

uses crt, Compl; {menu;}
const n = 3;
Type VectorC = array [1..n] of Complex;
procedure InputVectorC(k: integer; var A: VectorC);
procedure OutputVectorC(A: VectorC);
procedure AddVectorC(x, y: VectorC; var z: VectorC);
procedure SubVectorC(x, y: VectorC; var z: VectorC);
function ScalVectorC(a, b: VectorC): Complex;
procedure VectorCMult(a, b: VectorC; var c: VectorC);
function ModulVectorC (a: VectorC): real;
procedure ProdVectorC(t: real; u: VectorC; var w: VectorC);
procedure MultComplexVectorC(k: Complex; u: VectorC; var w: VectorC); 

procedure MenuVectC;

  Implementation
  
uses crt;

procedure InputVectorC(k: integer; var A: VectorC);
var i: integer;
begin
  GoToXY(10 + k, 23); 
  write('Введите вектор: ');
  for i := 1 to n do
  begin
      GoToXY(i * 10 + 16 + k, 23); 
      write('Re:');
      readln(A[i].Re); 
      GoToXY(i * 10 + 16 + k, 24);
      write('Im:');
      readln(A[i].Im); 
  end;
  GoToXY(10 + k, 23); clearline;
  GoToXY(10 + k, 24); clearline;
  for i := 1 to n do
  begin
      GoToXY(i * 10 + 16 + k, 23); 
      clearline; 
  end;
end;

procedure OutputVectorC(A: VectorC);
var i: integer;
begin
  GoToXY(1, 7); 
  write('Результат: ');
  for i := 1 to n do
  begin
      GoToXY(i * 10 + 16, 28); 
      write('Re:');
      writeln(A[i].Re); 
      GoToXY(i * 10 + 16, 29);
      write('Im:');
      writeln(A[i].Im); 
  end;
end; 

procedure AddVectorC(x, y: VectorC; var z: VectorC);
var i: integer;
begin
  for i := 1 to n do
    Add(x[i], y[i], z[i]);
end;

procedure SubVectorC(x, y: VectorC; var z: VectorC); 
var i: integer;
begin
  for i := 1 to n do
    Sub(x[i], y[i], z[i]);
end;

function ScalVectorC(a, b: VectorC): Complex;
var i: integer; s: Complex;
begin
  Zero(s);
  for i := 1 to n do
  begin
    s.Re := s.Re + a[i].Re * b[i].Re + a[i].Im * b[i].Im;
    s.Im := s.Im + a[i].Re * b[i].Im - a[i].Im * b[i].Re;
  end;
  ScalVectorC := s; 
end;

procedure VectorCMult(a, b: VectorC; var c: VectorC);
var i: integer;
begin
  for i := 1 to n do
    Mult(a[i], b[i], c[i]);
end;

function ModulVectorC (a: VectorC): real;
var i: integer; s: real;
begin
  s := 0;
  for i := 1 to n do
    s := s + sqr(a[i].Re) + sqr(a[i].Im);
  ModulVectorC := sqrt(s);
end;

procedure ProdVectorC(t: real; u: VectorC; var w: VectorC);
var i: integer;
begin
  for i := 1 to n do
  begin
    Prod(t, u[i], w[i]);
  end;
end;

procedure MultComplexVectorC(k: Complex; u: VectorC; var w: VectorC); 
var i: integer;
begin
  for i := 1 to n do
  begin
    Mult(k, u[i], w[i]);
  end;
end;

procedure MenuVectC;
var Ok: boolean; Mode: integer; a, b, c: VectorC; t: real; k: Complex;
begin
  Ok := true;
  while Ok do
    begin
    clrscr;
    writeln('Выберите пункт:');
    writeln('1: Сложение комплексных векторов');
    writeln('2: Разность комплексных векторов');
    writeln('3: Скалярное произведение комплексных векторов');
    writeln('4: Векторное произведение');
    writeln('5: Модуль вектора');
    writeln('6: Произведение скалярного вектора на скаляр');
    writeln('7: Произведение скалярного вектора на комплексное число');
    writeln('0: Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); clearline;
  
    case Mode of
      1: begin
        InputVectorC(1, a); InputVectorC(1, b);
        AddVectorC(a, b, c);
        OutputVectorC(c);
        Wait;
      end;
      2: begin
        InputVectorC(1, a); InputVectorC(1, b);
        SubVectorC(a, b, c);
        OutputVectorC(c);
        Wait;
      end;
      3: begin
        InputVectorC(1, a); InputVectorC(1, b);
        k := ScalVectorC(a, b);
        writeln('Результат: '); write(k);
        Wait;
      end;
      4: begin
        InputVectorC(1, a); InputVectorC(1, b);
        VectorCMult(a, b, c);
        OutputVectorC(c);
        Wait;
      end;
      5: begin
        InputVectorC(1, a);
        t := ModulVectorC(a);
        writeln('Результат: ' + t);
        Wait;
      end;
      6: begin
        InputVectorC(1, a);
        writeln('Введите скаляр: '); read(t);
        ProdVectorC(t, a, c);
        OutputVectorC(c);
      end;
      7: begin
        InputVectorC(1, a);
        writeln('Введите число: '); read(k.Re);
        write(' + '); read(k.Im); write(' * i');
        MultComplexVectorC(k, a, b);
        OutputVectorC(b);
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