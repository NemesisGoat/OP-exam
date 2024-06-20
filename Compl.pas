Unit Compl;

  Interface
  
uses crt; {menu;}
type Complex = record
  Re, Im : real;
end;
procedure Add( u, v: Complex; var w: Complex);
procedure Sub( u, v: Complex; var w: Complex);
procedure Mult( u, v: Complex; var w: Complex);
procedure Inv( z: Complex; var w: Complex);
procedure Divz( u, v: Complex; var w: Complex);
procedure Prod( a: real; z: Complex; var w: Complex);
function Modul( z: Complex): real;
procedure Sum(z: Complex; var w: real);
procedure One(var z: Complex);
procedure Zero(var z: Complex);
procedure InputC(var z: Complex);
procedure OutputC(z: Complex);
procedure expC(z: Complex; var s: Complex);
procedure cosC(z: Complex; var s: Complex);
procedure sinC(z: Complex; var s: Complex);
procedure Codj (z: Complex; var w: Complex);

procedure MenuCompl;
procedure Wait;


  Implementation
  
procedure Add( u, v: Complex; var w: Complex);
begin
  w.Re := u.Re + v.Re;
  w.Im := u.Im + v.Im;
end;

procedure Sub( u, v: Complex; var w: Complex);
begin
  w.Re := u.Re - v.Re;
  w.Im := w.Im - v.Im;
end;

procedure Mult( u, v: Complex; var w: Complex);
begin
  w.Re := u.Re * v.Re - u.Im * v.Im;
  w.Im := u.Re * v.Im + u.Im * v.Re;
end;

procedure Inv( z: Complex; var w: Complex);
var q: real;
begin
  q := sqr(z.Re) + sqr(z.Im);
  w.Re := z.Re / q;
  w.Im := -z.Im / q;
end; 

procedure Divz( u, v: Complex; var w: Complex);
var q: Complex;
begin
  Inv(v, q);
  Mult(u, q, w);
end;

procedure Prod( a: real; z: Complex; var w: Complex);
begin
  w.Re := z.Re * a;
  w.Im := z.Im * a;
end;

function Modul( z: Complex): real;
begin
  Modul := sqrt(sqr(z.Re) + sqr(z.Im));
end;

procedure Sum( z: Complex; var w: real);
begin
  w := (1 - exp(ln(Modul(z))*20) * (z.Re + z.Im)) / (1 - Modul(z));
end; 

procedure One (var z: Complex);
begin
  z.Re := 1;
  z.Im := 0;
end;

procedure Zero (var z: Complex);
begin
  z.Re := 0;
  z.Im := 0;
end;

procedure InputC (var z: Complex);
begin
  GoToXY(10, 25); write ('Введите целую часть числа: '); read(z.Re);
  GoToXY(10, 26); write ('Введите мнимую часть числа: '); read(z.Im);
end;

procedure OutputC (z: Complex);
begin
  GoToXY(10, 28); write('Результат: '); write(z.Re:2:3, ' + ', z.Im:2:3, '*i');
end;

procedure expC (z: Complex; var s: Complex);
const eps = 0.001;
var k: integer; p: Complex;
begin 
  One(p); One(s); k := 0;
  while Modul(p) >= eps do
  begin
    k := k+1;
    Mult(p, z, p);
    Prod(1/k, p, p);
    Add(s, p, s);
  end;
end;

procedure cosC(z: Complex; var s: Complex);
const eps = 0.001;
var k: integer; p, z2: Complex;
begin
  Mult(z, z, z2);
  k := 0;
  One(p);
  One(s);
  while Modul(p) >= eps do
  begin
    k := k + 2;
    Mult(p, z2, p);
    Prod(-1 / (k - 1) / k, p, p);
    Add(s, p, s);
  end;
end;

procedure sinC(z: Complex; var s: Complex);
const eps = 0.001;
var k: integer; p, z2: Complex;
begin
  Mult(z, z, z2);
  k := 0;
  One(p);
  One(s);
  while Modul(p) >= eps do
  begin
    k := k + 2;
    Mult(p, z2, p);
    Prod(-1 / (k + 1) / k, p, p);
    Add(s, p, s);
  end;
end;

procedure Codj (z: Complex; var w: Complex);
begin
  w.Re := z.Re;
  w.Im := -z.Im;
end;

procedure MenuCompl;
var Ok: boolean; Mode: integer; u, v, w, z: Complex; a: real;
begin
  Ok := true;
  while Ok do
    begin
    clrscr;
    writeln('Выберите пункт:');
    writeln('1: Сложение комплексных чисел');
    writeln('2: Разность комплексных чисел');
    writeln('3: Умножение комплексных чисел');
    writeln('4: Инверсия комплексных чисел');
    writeln('5: Деление комплексных чисел');
    writeln('6: Умножение комплексного числа на скаляр');
    writeln('7: Модуль комплексного числа');
    writeln('8: Сумма последовательности комплексного числа');
    writeln('9: Экспонента комплексного числа');
    writeln('10: Косинус комплексного числа');
    writeln('11: Синус комплексного числа');
    writeln('0: Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); clearline;
  
    case Mode of
      1: begin
        InputC(u); InputC(v);
        Add(u, v, w);
        OutputC(w);
        Wait;
      end;
      2: begin
        InputC(u); InputC(v);
        Sub(u, v, w);
        OutputC(w);
        Wait;
      end;
      3: begin
        InputC(u); InputC(v);
        Mult(u, v, w);
        OutputC(w);
        Wait;
      end;
      4: begin
        InputC(u);
        Inv(u, w);
        OutputC(w);
        Wait;
      end;
      5: begin
        InputC(u); InputC(v);
        Divz(u, v, w);
        OutputC(w);
        Wait;
      end;
      6: begin
        read(a); InputC(z);
        Prod(a, z, w);
        OutputC(w);
        Wait;
      end;
      7: begin
        InputC(z);
        a := Modul(z);
        writeln(a);
        Wait;
      end;
      8: begin
        InputC(u);
        Sum(u, a);
        writeln(a);
        Wait;
      end;
      9: begin
        InputC(v);
        expC(v, w);
        OutputC(w);
        Wait;
      end;
      10: begin
        InputC(u);
        cosC(u, w);
        OutputC(w);
        Wait;
      end;
      11: begin
        InputC(u);
        sinC(u, w);
        OutputC(w);
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
