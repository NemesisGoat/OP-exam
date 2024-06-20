Unit CMatr;
Interface
Uses Compl;
Uses Crt;
const n = 2;
Type MatrixC = array[1..n, 1..n] of Complex;

procedure InputMatrixC(var M: MatrixC);

procedure OutputMatrixC(var M: MatrixC);

procedure AddMatrixC(a, b: MatrixC; var c: MatrixC);

procedure MultMatrixC(a, b: MatrixC; var c: MatrixC);

procedure ProdMatrixC(t: real; a:MatrixC; var b:MatrixC);

procedure ZeroMatrixC(var a: MatrixC);

procedure OneMatrixC(var a: MatrixC);

function NormMatrixC(a: MatrixC): real;

procedure ExpMatrixC(a: MatrixC; var S:MatrixC);

procedure MenuCMatr;

procedure Wait;

Implementation

procedure InputMatrixC(var M: MatrixC);
var i, j:integer;
begin
  for i:=1 to n do
  for j:=1 to n do
    begin
      writeln('');
      InputZ(M[i, j]);
    end;
end;

procedure OutputMatrixC(var M: MatrixC);
var i, j: integer;
begin
  for i:=1 to n do
  begin
    write('    ');
    write('[');
    for j:= 1 to n-1 do
    begin
      OutputZ(M[i, j]);
      write(', ');
    end;
    OutputZ(M[i, n]);
    write(']');
    writeln('');
  end;
end;

procedure AddMatrixC(a, b: MatrixC; var c: MatrixC);
var i, j: integer;
begin
  for i:= 1 to n do
  for j:= 1 to n do
  Add(a[i,j], b[i,j], c[i,j]);
end;

procedure MultMatrixC(a, b: MatrixC; var c: MatrixC);
var i, j, k: integer; p, S: Complex;
begin
  for i:= 1 to n do
  for j:= 1 to n do
  begin
    Zero(S);
    for k:=1 to n do
    begin
      Mult(a[i, k], b[k, j], p);
      Add(S, p, S);
    end;
    c[i, j]:= S;
  end;
end;

procedure ProdMatrixC(t: real; a:MatrixC; var b:MatrixC);
var i, j: integer;
begin
  for i:=1 to n do
  for j:=1 to n do
    Prod(t, a[i, j], b[i, j]);
end;

procedure ZeroMatrixC(var a: MatrixC);
var i, j: integer;
begin
  for i:=1 to n do
  for j:=1 to n do
    zero(a[i,j]);
end;

procedure OneMatrixC(var a: MatrixC);
var i: integer;
begin
  for i:=1 to n do
    One(a[i,i]);
end;

function NormMatrixC(a: MatrixC): real;
var i, j: integer; p, S: real;
begin
  p:=0;
  for i:= 1 to n do
  begin
    S:= 0;
    for j:= 1 to n do
    S:= S + Module(a[i,j]);
    if S>p then p:=S;
  end;
  NormMatrixC:= p;
end;

procedure ExpMatrixC(a: MatrixC; var S:MatrixC);
const eps = 0.001;
var k:integer; p: MatrixC;
begin
  k:=0;
  OneMatrixC(p); 
  OneMatrixC(S);
  while NormMatrixC(p) >= eps do
  begin
    k:=k+1;
    MultMatrixC(p, a, p);
    ProdMatrixC(1/k, p, p);
    AddMatrixC(S, p, S);
  end;
end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MenuCMatr;
var Mode:integer; Ok:boolean; q:real; x,y,z:MatrixC;
begin
  begin
  Ok:= true;
  ClrScr;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите пункт');
    writeln('1. Сложение комплексных матриц');
    writeln('2. Умножение комплексных матриц');
    writeln('3. Умножение комплексной матрицы на скаляр');
    writeln('4. Норма комплексной матрицы');
    writeln('5. Экспонента комплексной матрицы');
    writeln('0. Выход');
    goToXY(40, 23);
    read(Mode);
    GoToXY(40, 23);
    ClearLine;
    case Mode of
      1: begin
            ClrScr;
            writeln('');
            InputMatrixC(x);
            writeln('');
            writeln('    Первая матрица:');
            writeln('');
            OutputMatrixC(x);
            InputMatrixC(y);
            writeln('');
            writeln('    Вторая матрица:');
            writeln('');
            OutputMatrixC(y);
            writeln('');
            AddMatrixC(x, y, z);
            writeln('');
            writeln('    Их сумма:');
            writeln('');
            OutputMatrixC(z);
            Wait
        end;
      2: begin
            ClrScr;
            writeln('');
            InputMatrixC(x);
            writeln('');
            writeln('    Первая матрица:');
            writeln('');
            OutputMatrixC(x);
            InputMatrixC(y);
            writeln('');
            writeln('    Вторая матрица:');
            writeln('');
            OutputMatrixC(y);
            writeln('');
            MultMatrixC(x, y, z);
            writeln('');
            writeln('    Их произведение:');
            writeln('');
            OutputMatrixC(z);
            Wait
         end;
      3: begin
           ClrScr;
            writeln('');
            InputMatrixC(x);
            writeln('');
            writeln('    Матрица:');
            writeln('');
            OutputMatrixC(x);
            GoToXY(4, 21);
            read(q);
            writeln('');
            write('   Скаляр: ' + q);
            writeln('');
            ProdMatrixC(q, x, z);
            writeln('');
            writeln('    Их произведение:');
            writeln('');
            OutputMatrixC(z);
            Wait
         end;
      4: begin
           ClrScr;
            writeln('');
            InputMatrixC(x);
            writeln('');
            writeln('    Матрица:');
            writeln('');
            OutputMatrixC(x);
            writeln('');
            write('   Норма матрицы: ' + NormMatrixC(x));
            writeln('');
            Wait
         end;
      5: begin
           ClrScr;
            writeln('');
            InputMatrixC(x);
            writeln('');
            writeln('    Матрица:');
            writeln('');
            OutputMatrixC(x);
            writeln('');
            ExpMatrixC(x, z);
            writeln('');
            writeln('    Её экспонента:');
            writeln('');
            OutputMatrixC(z);
            Wait;
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