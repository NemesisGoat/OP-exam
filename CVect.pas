Unit Cvect;
Interface
Uses Crt;
Uses Compl;
const n = 3;
Type VectorC = array[1..n] of Complex;

procedure InputVectorC(var V: VectorC);

procedure OutputVectorC(var V: VectorC);

procedure AddVectorC(x, y: VectorC; var z: VectorC);

procedure SubVectorC(x, y: VectorC; var z: VectorC);

procedure ScalMultC(a, b: VectorC; var c: Complex);

procedure VectMultC(a, b: VectorC; var c: VectorC);

function MixMultC(a, b, c: VectorC): Complex;

function ModuleVectorC(a: VectorC): real;

procedure MenuCVect;

procedure Wait;

Implementation

procedure InputVectorC(var V: VectorC);
var i:integer;
begin
  for i:=1 to n do
    begin
      writeln('');
      InputZ(V[i]);
    end;
end;

procedure OutputVectorC(var V: VectorC);
var i: integer;
begin
  write('   [');
  for i:=1 to n-1 do
    begin
      (OutputZ(V[i]));
      write(', ');
    end;
  OutputZ(V[n]);
  write(']');
end;

procedure AddVectorC(x, y: VectorC; var z: VectorC);
var i: integer;
begin
  for i:=1 to n do
    begin
      Add(x[i], y[i], z[i]);
    end;
end;

procedure SubVectorC(x, y: VectorC; var z: VectorC);
var i: integer;
begin
  for i:=1 to n do
    begin
      Sub(x[i], y[i], z[i]);
    end;
end;

procedure ScalMultC(a, b: VectorC; var c: Complex);
var i: integer; ab, bi: Complex;
begin
  Zero(c);
  for i:=1 to n do
  begin
    Codi(b[i], bi);
    Mult(a[i], bi, ab);
    Add(C, ab, C);
  end; 
end;

procedure VectMultC(a, b: VectorC; var c: VectorC);
var ab1, ab2: Complex;
begin
  Mult(a[2], b[3], ab1);
  Mult(a[3], b[2], ab2);
  Sub(ab1, ab2, c[1]);
  Mult(a[3], b[1], ab1);
  Mult(a[1], b[3], ab2);
  Sub(ab1, ab2, c[2]);
  Mult(a[1], b[2], ab1);
  Mult(a[2], b[1], ab2);
  Sub(ab1, ab2, c[3]);
end;

function MixMultC(a, b, c: VectorC): Complex;
var d:VectorC; k: Complex;
begin
  VectMultC(a, b, d);
  ScalMultC(d, c, k);
  MixMultC:= k;
end;

function ModuleVectorC(a: VectorC): real;
var i:integer; S:real;
begin
  S:=0;
  for i:=1 to n do
  S:= S + sqr(a[i].Re) + sqr(a[i].Im);
  ModuleVectorC:= sqrt(S);
end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MenuCVect;
var Mode:integer; Ok:boolean; q:real; c:Complex; x,y,z:VectorC;
begin
  begin
  Ok:= true;
  ClrScr;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите пункт');
    writeln('1. Сложение комплексных векторов');
    writeln('2. Вычитание комплексных векторов');
    writeln('3. Скалярное произведение комплексных векторов');
    writeln('4. Векторное произведение комплексных векторов');
    writeln('5. Смешанное произведение комплексных векторов');
    writeln('6. Модуль комплексного вектора');
    writeln('0. Выход');
    goToXY(40, 23);
    read(Mode);
    GoToXY(40, 23);
    ClearLine;
    case Mode of
      1: begin
            ClrScr;
            writeln('');
            InputVectorC(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVectorC(x);
            writeln('');
            InputVectorC(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVectorC(y);
            writeln('');
            AddVectorC(x, y, z);
            writeln('');
            writeln('    Их сумма:');
            writeln('');
            OutputVectorC(z);
            Wait
         end;
      2: begin
           ClrScr;
            writeln('');
            InputVectorC(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVectorC(x);
            writeln('');
            InputVectorC(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVectorC(y);
            writeln('');
            SubVectorC(x, y, z);
            writeln('');
            writeln('    Их разность:');
            writeln('');
            OutputVectorC(z);
            Wait
         end;
      3: begin
           ClrScr;
            writeln('');
            InputVectorC(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVectorC(x);
            writeln('');
            InputVectorC(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVectorC(y);
            writeln('');
            writeln('');
            ScalMultC(x, y, c);
            write('    Их скалярное произведение: ');
            OutputZ(c);
            writeln('');
            Wait
         end;
      4: begin
           ClrScr;
            writeln('');
            InputVectorC(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVectorC(x);
            writeln('');
            InputVectorC(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVectorC(y);
            writeln('');
            VectMultC(x, y, z);
            writeln('');
            writeln('    Их векторное произведение:');
            writeln('');
            OutputVectorC(z);
            Wait
         end;
      5: begin
           ClrScr;
            writeln('');
            InputVectorC(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVectorC(x);
            writeln('');
            InputVectorC(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVectorC(y);
            writeln('');
            InputVectorC(z);
            writeln('');
            writeln('    Третий вектор:');
            writeln('');
            OutputVectorC(z);
            writeln('');
            writeln('');
            write('    Их смешанное произведение: ');
            c:= MixMultC(x, y, z);
            OutputZ(c);
            writeln('');
            Wait
         end;
      6: begin
           ClrScr;
            writeln('');
            InputVectorC(x);
            writeln('');
            writeln('    Вектор:');
            writeln('');
            OutputVectorC(x);
            writeln('');
            writeln('');
            writeln('    Модуль вектора: ' + ModuleVectorC(x));
            writeln('');
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