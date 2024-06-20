uses Crt, Compl, CMatr, Vect, VectC,
     Raznoe, Stack, Queue, StudList, 
     MakeFiles,
     MakeTree, NodeTrees, BinTrees;
     
var Ok: boolean; Mode: integer;
begin
  Ok := true;
  while Ok do
  begin
    clrscr;
    
    writeln('Выберите пункт');
    writeln('1: Комплексные числа');
    writeln('2: Комплексные матрицы');
    writeln('3: Векторы');
    writeln('4: Комплексные векторы');
    writeln('5: Разное');
    writeln('6: Стек');
    writeln('7: Очередь');
    writeln('8: Список студентов');
    writeln('9: Создание файлов');
    writeln('10:Деревья');
    writeln('11.Бинарные деревья');
    writeln('0: Выход');
    
    GoToXY(40, 23); read(Mode);
    GoToXY(40, 23); clearline;
    case Mode of
      1: MenuCompl;
      2: MenuCMatr;
      3: MenuVect;
      4: MenuVectC;
      5: MenuRaznoe;
      6: MenuStack;
      7: MenuQueue;
      8: MenuStud;
      9: MenuMakeFiles;
      10: MenuTree;
      11: MenuBinTree;
      0: Ok := false
      else 
      begin
        GoToXY(30, 24);
        writeln('Ошибка: Повторите ввод!');
        Wait;
      end;
    end;
  end;
end.