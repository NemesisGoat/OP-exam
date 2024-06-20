Unit Vect;
Interface
Uses Crt;
const n = 3;
Type Vector = array[1..n] of real;

procedure InputVector(var V: Vector);

procedure OutputVector(var V: Vector);

procedure AddVector(a,b: Vector; var c: Vector);

function ScalMult(a, b: Vector): real;

procedure VectMult(a, b: Vector; var c: Vector);

function MixMult(a, b, c: Vector): real;

procedure SubVector(a, b: Vector; var c: Vector);

function ModuleVector(a: Vector): real;

procedure ScalVector(x: real; a: Vector; var c: Vector);

procedure MenuVect;

procedure Wait;


Implementation

procedure InputVector(var V: Vector);
var i:integer;
begin
  writeln('');
  for i:=1 to n do
    begin
      writeln('');
      write('   ');
      read(V[i]);
    end;
end;

procedure OutputVector(var V: Vector);
var i: integer;
begin
  write('    [');
  for i:=1 to n-1 do
    begin
      write(V[i]);
      write(', ');
    end;
  write(V[n]);
  write(']');
end;

procedure AddVector(a,b: Vector; var c: Vector);
var i: integer;
begin
  for i:= 1 to n do
  c[i]:= a[i] + b[i];
end;

function ScalMult(a, b: Vector): real;
var i:integer; S:real;
begin
  S:=0;
  for i:=1 to n do S:=S+a[i]*b[i];
  ScalMult:=S;
end;

procedure VectMult(a, b: Vector; var c: Vector);
begin
  c[1]:= a[2] * b[3] - a[3] * b[2];
  c[2]:= a[3] * b[1] - a[1] * b[3];
  c[3]:= a[1] * b[2] - a[2] * b[1];
end;

function MixMult(a, b, c: Vector): real;
var d:Vector;
begin
  VectMult(a, b, d);
  MixMult:= ScalMult(d, c);
end;

procedure SubVector(a, b: Vector; var c: Vector);
  var i: integer;
begin
  for i:= 1 to n do
  c[i]:= a[i] - b[i];
end;

function ModuleVector(a: Vector): real;
var S:real;
begin
  ModuleVector:= sqrt(ScalMult(a, a));
end;

procedure ScalVector(x: real; a: Vector; var c: Vector);
var i: integer;
begin
  for i:=1 to n do
  c[i]:= a[i] * x;
end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MenuVect;
var Mode:integer; Ok:boolean; q:real; x,y,z:Vector;
begin
  begin
  Ok:= true;
  ClrScr;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите пункт');
    writeln('1. Сложение векторов');
    writeln('2. Вычитание векторов');
    writeln('3. Скалярное произведение векторов');
    writeln('4. Векторное произведение векторов');
    writeln('5. Смешанное произведение векторов');
    writeln('6. Модуль вектора');
    writeln('7. Умножение вектора на скаляр');
    writeln('0. Выход');
    goToXY(40, 23);
    read(Mode);
    GoToXY(40, 23);
    ClearLine;
    case Mode of
      1: begin
            ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVector(x);
            InputVector(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVector(y);
            writeln('');
            AddVector(x, y, z);
            writeln('');
            writeln('    Их сумма:');
            writeln('');
            OutputVector(z);
            Wait
         end;
      2: begin
           ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVector(x);
            InputVector(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVector(y);
            writeln('');
            SubVector(x, y, z);
            writeln('');
            writeln('    Их разность:');
            writeln('');
            OutputVector(z);
            Wait
         end;
      3: begin
           ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVector(x);
            InputVector(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVector(y);
            writeln('');
            writeln('');
            writeln('    Их скалярное произведение: ' + ScalMult(x,y));
            writeln('');
            Wait
         end;
      4: begin
           ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVector(x);
            InputVector(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVector(y);
            writeln('');
            VectMult(x, y, z);
            writeln('');
            writeln('    Их векторное произведение:');
            writeln('');
            OutputVector(z);
            Wait
         end;
      5: begin
           ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Первый вектор:');
            writeln('');
            OutputVector(x);
            InputVector(y);
            writeln('');
            writeln('    Второй вектор:');
            writeln('');
            OutputVector(y);
            InputVector(z);
            writeln('');
            writeln('    Третий вектор:');
            writeln('');
            OutputVector(z);
            writeln('');
            writeln('');
            writeln('    Их смешанное произведение: ' + MixMult(x, y, z));
            writeln('');
            Wait
         end;
      6: begin
           ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Вектор:');
            writeln('');
            OutputVector(x);
            writeln('');
            writeln('');
            writeln('    Модуль вектора: ' + ModuleVector(x));
            writeln('');
            Wait
         end;
      7: begin
           ClrScr;
            writeln('');
            InputVector(x);
            writeln('');
            writeln('    Вектор:');
            writeln('');
            OutputVector(x);
            GoToXY(4, 15);
            read(q);
            writeln('');
            writeln('    Скаляр: ' + q);
            writeln('');
            writeln('    Их произведение:');
            writeln('');
            OutputVector(z);
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