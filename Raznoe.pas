Unit Raznoe;

  Interface
uses crt, Compl, VectC, CMatr, Vect;
const n = 3;

procedure MenuRaznoe;
  
  Implementation
  
procedure MenuRaznoe;
var Ok: boolean; Mode: integer;
    a, b, c: Matrix; t: real; 
    x, y, z: VectorC; k, u, w: Complex;
    s: Vector;
begin
  Ok := true;
  while Ok do
    begin
    clrscr;
    writeln('Выберите пункт:');
    writeln('1: Умножение комплексных матриц');
    writeln('2: Произведение скалярного вектора на скаляр');
    writeln('3: Скалярное произведение комплексных векторов');
    writeln('4: Косинус комплексного числа');
    writeln('5: Модуль вектора');
    writeln('0: Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); clearline;
  
    case Mode of
      1: begin
        InputMatrix(1, a); InputMatrix(50, b);
        MultMatrix(a, b, c);
        OutputMatrix(1, c);
        Wait;
      end;
      2: begin
        InputVectorC(1, x);
        writeln('Введите скаляр: '); read(t);
        ProdVectorC(t, x, z);
        OutputVectorC(z);
      end;
      3: begin
        InputVectorC(1, x); InputVectorC(10, y);
        k := ScalVectorC(x, y);
        writeln('Результат: '); write(k);
        Wait;
        Wait;
      end;
      4: begin
        InputC(u);
        cosC(u, w);
        OutputC(w);
      end;
      5: begin
        InputVector(1, s);
        t := ModulVector(s);
        writeln('Результат: ' + t);
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