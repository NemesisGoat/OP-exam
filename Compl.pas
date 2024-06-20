Unit Compl;
Interface
uses Crt;
const n = 3;
Type Complex = record 
               Re, Im: real;
               end;     
procedure InputZ(var z:Complex);

procedure OutputZ(var z:Complex);

procedure Add(u, v: Complex; var w: Complex);

procedure Sub(u, v: Complex; var w: Complex);

procedure Mult(u, v: Complex; var w: Complex);

procedure Inv(z:Complex; var w:Complex);

procedure DivZ(u,v:Complex; var w:Complex);

procedure Prod(a:real; z:Complex; var w:Complex);

function Module(z:Complex): real;

procedure Zero(var z:Complex);

procedure One(var z:Complex);

procedure expC(z:Complex; var S:Complex);

procedure cosC(z:Complex; var S:Complex);

procedure sinC(z:Complex; var S:Complex);

procedure Codi(z:Complex; var w:Complex);

procedure MenuCompl;

procedure Wait;

Implementation     
procedure InputZ(var z:Complex);
begin
  write('   ');
  read(z.Re);
  write('   ');
  read(z.Im);
end;

procedure OutputZ(var z:Complex);
var zim:real;
begin
  zim:= z.Im;
  write(z.Re);
  if z.Im >= 0 then
    write('+')
  else
  begin
    write('-');
    z.Im:= -z.Im;
  end;
  write(z.Im + 'i');
  z.Im:= zim;
end;

procedure Add(u, v: Complex; var w: Complex);
begin
  w.Re:= u.Re + v.Re;
  w.Im:= u.Im + v.Im;
end;

procedure Sub(u, v: Complex; var w: Complex);
begin
  w.Re:= u.Re - v.Re;
  w.Im:= u.Im - v.Im;
end;

procedure Mult(u, v: Complex; var w: Complex);
begin
  w.Re:= u.Re * v.Re - u.Im * v.Im;
  w.Im:= u.Re * v.Im + v.Re * u.Im;
end;

procedure Inv(z:Complex; var w:Complex);
var q:real;
begin
   q:=sqr(z.Re)+sqr(z.Im);
   w.Re:=z.Re/q;
   w.Im:=-z.Im/q;
end;

procedure DivZ(u,v:Complex; var w:Complex);
var z:Complex;
begin
  Inv(v,z); Mult(u,z,w);
end;

procedure Prod(a:real; z:Complex; var w:Complex);
begin
  w.Re:= a * z.Re;
  w.Im:= a * z.Im;
end;

function Module(z:Complex): real;
begin
  Module:= sqrt(sqr(z.Re) + sqr(z.Im));
end;

procedure Zero(var z:Complex);
begin
  z.Re:= 0;
  z.Im:= 0;
end;

procedure One(var z:Complex);
begin
  z.Re:= 1;
  z.Im:= 0;
end;

procedure expC(z:Complex; var S:Complex);
const eps = 0.001;
var k:integer; P:Complex;
begin
  One(P);
  One(S);
  k:=0;
  while Module(P)>= eps do
  begin
    k:=k+1;
    Mult(P, z, P);
    Prod(1/k, P, P);
    Add(S, P, S);
  end;
end;

procedure cosC(z:Complex; var S:Complex);
const eps = 0.001;
var k:integer; P, z2:Complex;
begin
  Mult(z, z, z2);
  k:= 0;
  One(p);
  One(s);
  k:=0;
  while Module(P)>= eps do
  begin
    k:=k+2;
    Mult(P, z2, P);
    Prod(-1/(k-1) / k, P, P);
    Add(S, P, S);
  end;
end;

procedure sinC(z:Complex; var S:Complex);
const eps = 0.001;
var k:integer; P, z2:Complex;
begin
  Mult(z, z, z2);
  k:= 0;
  One(p);
  One(s);
  k:=0;
  while Module(P)>= eps do
  begin
    k:=k+2;
    Mult(P, z2, P);
    Prod(-1/(k+1) / k, P, P);
    Add(S, P, S);
  end;
end;

procedure Codi(z:Complex; var w:Complex);
begin
  w.Re:= z.Re;
  w.Im:= -z.Im;
end;

procedure Wait;
begin
  repeat until KeyPressed;
  while KeyPressed do ReadKey;
end;

procedure MenuCompl;
var Mode:integer; Ok:boolean; q:real; u,v,w:Complex;
begin
  begin
  Ok:= true;
  ClrScr;
  while Ok do
  begin
    ClrScr;
    writeln('Выберите пункт');
    writeln('1. Сложение комплексных чисел');
    writeln('2. Вычитание комплексных чисел');
    writeln('3. Умножение комплексных чисел');
    writeln('4. Инверсия комплексного числа');
    writeln('5. Деление комплексных чисел');
    writeln('6. Умножение комплексного числа на скаляр');
    writeln('7. Модуль комплексного числа');
    writeln('8. Экспонента комплексного числа');
    writeln('9. Косинус комплексного числа');
    writeln('10. Синус комплексного числа');
    writeln('0. Выход');
    goToXY(40, 23);
    read(Mode);
    GoToXY(40, 23);
    ClearLine;
    case Mode of
      1: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           InputZ(v);
           writeln('');
           write('   ');
           OutputZ(u);
           write(' + ');
           OutputZ(v);
           write(' = ');
           Add(u, v, w);
           OutputZ(w);
           Wait;
         end;
      2: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           InputZ(v);
           writeln('');
           write('   ');
           OutputZ(u);
           write(' - ');
           OutputZ(v);
           write(' = ');
           Sub(u, v, w);
           OutputZ(w);
           Wait;
         end;
      3: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           InputZ(v);
           writeln('');
           write('   ');
           OutputZ(u);
           write(' * ');
           OutputZ(v);
           write(' = ');
           Mult(u, v, w);
           OutputZ(w);
           Wait;
         end;
      4: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           write('   Число: ');
           OutputZ(u);
           writeln('');
           write('   Инвертированное число: ');
           Inv(u, w);
           OutputZ(w);
           Wait;
         end;
      5: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           InputZ(v);
           writeln('');
           write('   ');
           OutputZ(u);
           write(' / ');
           OutputZ(v);
           write(' = ');
           DivZ(u, v, w);
           OutputZ(w);
           Wait;
         end;
      6: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           GoToXY(3, 5);
           read(q);
           writeln('');
           write('   ');
           OutputZ(u);
           write(' * ' + q);
           write(' = ');
           Prod(q, u, w);
           OutputZ(w);
           Wait;
         end;
      7: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           write('   Число: ');
           OutputZ(u);
           writeln('');
           write('   Его модуль: ' + Module(u));
           Wait;
         end;
      8: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           write('   Число: ');
           OutputZ(u);
           writeln('');
           write('   Его экспонента: ');
           ExpC(u, w);
           OutputZ(w);
           Wait;
         end;
      9: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           write('   Число: ');
           OutputZ(u);
           writeln('');
           write('   Его косинус: ');
           CosC(u, w);
           OutputZ(w);
           Wait;
         end;
      10: begin
           ClrScr;
           writeln('');
           InputZ(u);
           writeln('');
           write('   Число: ');
           OutputZ(u);
           writeln('');
           write('   Его синус: ');
           SinC(u, w);
           OutputZ(w);
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