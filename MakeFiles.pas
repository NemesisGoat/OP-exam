Unit MakeFiles;


  Interface
  
uses crt;

type
  Student = record
    Name: string[10];
    Mark: string[3];
  end;

var
  Mode: integer;

procedure MakeFile;
procedure ViewFile;
procedure AddFile;
procedure MakeAndAddText;
procedure MyWrite(stroka: string);
procedure ViewText;
procedure FindStudentsWithTwos(ExamNumber: Integer);
procedure BadBoys(Exam: byte);
procedure Dvoechniki(N: Integer);
procedure FixMark;
procedure DeleteStudent;
procedure DeleteStudentsWithTwos(N: Integer);
procedure MenuMakeFiles;
procedure Wait;

  Implementation

procedure MakeFile;
var
  ch: char;
  Ok: boolean;
  FileName: string[12];
  StudentFile: file of Student;
  FlowStudent: Student;
begin
  ClrScr; Ok := True;
  writeln('Дайте имя файлу:');
  readln(FileName);
  assign(StudentFile, FileName);
  rewrite(StudentFile);
  with FlowStudent do
    while Ok do
    begin
      GoTOXY(30, 10);
      writeln('Будете еще вводить? y/n');
      GoToXY(30, 11); readln(ch);
      GoToXY(30, 11); ClearLine;
      if (ch = 'n') or (ch = 'т') then
      begin
        Ok := False;
        close(StudentFile);
      end
      else
      begin
        GoToXY(30, 20);
        writeln('Введите фамилию студента:');
        GoToXY(30, 21); readln(Name);
        ClrScr;
        GoToXY(30, 22);
        writeln('Введите его оценки:');
        GoToXY(30, 23); readln(Mark);
        ClrScr;
        write(StudentFile, FlowStudent);
      end;
    end;
end;

procedure ViewFile;
var
  k: integer;
  ch: char;
  FileName: string[12];
  StudentFile: file of Student;
  FlowStudent: Student;
begin
  ClrScr; k := 3;
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      k := k + 1;
      read(StudentFile, FlowStudent);
      GoToXY(1, k); writeln(Name);
      GoToXY(11, k); writeln(Mark);
    end;
  close(StudentFile);
end;

procedure AddFile;
var
  ch: char;
  Ok: boolean;
  FileName, NewName: string[12];
  StudentFile, NewFile: file of Student;
  FlowStudent: Student;
begin
  ClrScr; Ok := True;
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  NewName := 'aaaa';
  assign(NewFile, NewName);
  rewrite(NewFile);
  while not EOF(StudentFile) do
  begin
    read(StudentFile, FlowStudent);
    write(NewFile, FlowStudent);
  end;
  with FlowStudent do
    while Ok do
    begin
      GoToXY(30, 10); writeln('Будете еще вводить? y/n');
      GoToXY(30, 11); readln(ch);
      ClrScr;
      if (ch = 'n') or (ch = 'т') then
      begin
        Ok := false;
        close(NewFile);
      end
      else
      begin
        GoToXY(30, 20);
        writeln('Введите фамилию студента:');
        GoToXY(30, 21); readln(Name);
        ClrScr;
        GoToXY(30, 22);
        writeln('Введите его оценки:');
        GoToXY(30, 23); readln(Mark);
        write(NewFile, FlowStudent);
      end;
    end;
  close(StudentFile);
  erase(StudentFile);
  rename(NewFile, FileName);
end;

procedure MakeAndAddText;
var
  ch: char;
  Ok: boolean;
  TextName: string[12];
  Name: string[10];
  Mark: string[3];
  StudentText: Text;
begin
  ClrScr; Ok := True;
  writeln('Введите имя файла:');
  readln(TextName);
  assign(StudentText, TextName);
  {$I-}append(StudentText);
  {$I+}
  if not FileExists(TextName) then
    rewrite(StudentText); 
  while Ok do
  begin
    GoToXY(30, 10); writeln('Будете еще вводить? y/n');
    GoToXY(30, 11); readln(ch);
    ClrScr;
    if (ch = 'n') or (ch = 'т') then
    begin
      Ok := False;
      close(StudentText);
    end
    else
    begin
      GoToXY(30, 20);
      writeln('Введите фамилию студента:');
      GoToXY(30, 21); readln(Name);
      ClrScr;
      GoToXY(30, 22);
      writeln('Введите его оценки:');
      GoToXY(30, 23); readln(Mark);
      write(StudentText, Name:10, Mark:3);
    end;
  end;
end;

procedure MyWrite(stroka: string);
var
  result: string;
  i, n: byte;
begin
  result := stroka;
  n := length(stroka); i := 1;
  while(result[i] = ' ') and (i <= n) do i := i + 1;
  delete(result, 1, i - 1);
  write(result);
end;

procedure ViewText;
var
  k: integer;
  ch: char;
  TextName: string[12];
  Name: string[10];
  Mark: string[3];
  StudentText: Text;
begin
  ClrScr; k := 3;
  writeln('Введите имя файла:');
  readln(TextName);
  assign(StudentText, TextName);
  {$I-} reset(StudentText);
  {$I+}
  if not FileExists(TextName) then
    write('Файл ', TextName, ' не найден!')
  else
  begin
    while not EOF(StudentText) do
    begin
      k := k + 1;
      read(StudentText, Name, Mark);
      GoToXY(1, k); MyWrite(Name);
      GoToXY(12, k); write(Mark);
    end;
    close(StudentText);
  end;
end;

procedure FindStudentsWithTwos(ExamNumber: Integer);
var
  StudentFile: file of Student;
  FlowStudent: Student;
  i: Integer;
  FileName:string[12];
begin
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);

  writeln('Студенты с двойками по экзамену №', ExamNumber, ':');
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      if (Mark[ExamNumber] = '2') then
      begin
        writeln(Name);
      end;
    end;
  close(StudentFile);
end;


procedure BadBoys(Exam: byte);
var
  ch: char;
  k: byte;
  TextName: string[12];
  Name: string[10];
  Mark: string[3];
  StudentText: Text;
begin
  ClrScr; k := 3;
  writeln('Введите имя файла:');
  readln(TextName);
  assign(StudentText, TextName);
  {$I-} reset(StudentText);
  {$I+}
  if not FileExists(TextName) then
    write('Файл ', TextName, ' не найден!')
  else
  begin
    while not EOF(StudentText) do
    begin
      read(StudentText, Name, Mark);
      if Mark[Exam] = '2' then
      begin
        k := k + 1;
        GoToXY(1, k);
        MyWrite(Name);
      end;
    end;
    close(StudentText);
  end;
end;

procedure Dvoechniki(N: Integer);
var
  StudentFile: file of Student;
  FlowStudent: Student;
  i, TwoCount: Integer;
  FileName:string[12];
begin
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);

  writeln('Студенты с двойками по ', N, ' или большему количеству экзаменов:');
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      TwoCount := 0;
      for i := 1 to 3 do
      begin
        if (Mark[i] = '2') then
        begin
          TwoCount := TwoCount + 1;
        end;
      end;
      if (TwoCount >= N) then
      begin
        writeln(Name);
      end;
    end;
  close(StudentFile);
end;

procedure FixMark;
var
  ch: char;
  Ok: boolean;
  FileName, TempFileName: string[12];
  StudentFile, TempFile: file of Student;
  FlowStudent: Student;
  NameToFix: string[10];
  NewMark: string[3];
begin
  ClrScr; Ok := True;
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  TempFileName := 'temp.dat';
  assign(TempFile, TempFileName);
  rewrite(TempFile);
  writeln('Введите фамилию студента, чью оценку хотите исправить:');
  readln(NameToFix);
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      if Name = NameToFix then
      begin
        writeln('Текущая оценка: ', Mark);
        writeln('Введите новую оценку: ');
        readln(NewMark);
        Mark := NewMark;
      end;
      write(TempFile, FlowStudent);
    end;
  close(StudentFile);
  close(TempFile);
  erase(StudentFile);
  rename(TempFile, FileName);
    writeln('Оценка изменена!');
end;

procedure DeleteStudent;
var
  ch: char;
  Ok: boolean;
  FileName, NewName: string[12];
  StudentFile, NewFile: file of Student;
  FlowStudent: Student;
  NameToDelete: string[10];
begin
  ClrScr; Ok := True;
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  writeln('Введите фамилию студента, которого хотите удалить:');
  readln(NameToDelete);
  NewName := 'aaaa';
  assign(NewFile, NewName);
  rewrite(NewFile);
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      if Name <> NameToDelete then
        write(NewFile, FlowStudent);
    end;
  close(StudentFile);
  close(NewFile);
  erase(StudentFile);
  rename(NewFile, FileName);
    writeln('Студент удален!');
end;

procedure DeleteStudentsWithTwos(N: Integer);
var
  StudentFile, TempFile: file of Student;
  FlowStudent: Student;
  i, TwoCount: Integer;
  FileName, TempFileName: string[12];
begin
  writeln('Введите имя файла:');
  readln(FileName);
  assign(StudentFile, FileName);
  reset(StudentFile);
  TempFileName := 'temp.dat';
  assign(TempFile, TempFileName);
  rewrite(TempFile);
  writeln('Студенты, которые будут удалены:');
  with FlowStudent do
    while not EOF(StudentFile) do
    begin
      read(StudentFile, FlowStudent);
      TwoCount := 0;
      for i := 1 to 3 do
      begin
        if (Mark[i] = '2') then
        begin
          TwoCount := TwoCount + 1;
        end;
      end;
      if (TwoCount < N) then
      begin
        write(TempFile, FlowStudent);
      end
      else
      begin
        writeln(Name, ' ', Mark);
      end;
    end;
  close(StudentFile);
  close(TempFile);
  erase(StudentFile);
  rename(TempFile, FileName);
end;
  
procedure Wait;
  begin
    repeat until KeyPressed;
      while KeyPressed do ReadKey
  end;
  
procedure MenuMakeFiles;
  var
  Choice: Integer; Exam: integer;
begin
  ClrScr;
  writeln('1. Создать файл');
  writeln('2. Просмотреть файл');
  writeln('3. Добавить данные в файл');
  writeln('4. Студенты с двойкой по 1 экзамену');
  writeln('5. Студенты с двойкой по 2 экзамену');
  writeln('6. Студенты с двойкой по 3 экзамену');
  writeln('7. Ветераны');
  writeln('8. Конченные дебилы');
  writeln('0. Выход');
  
  GoToXY(40, 23); readln(Choice);
  GoToXY(40, 23); ClearLine;
  
  case Choice of
    1: 
    begin 
      MakeFile;
      MenuMakeFiles;
    end;
    2: 
    begin
      ViewFile; 
      Wait; 
      MenuMakeFiles;
    end;
    3: 
    begin 
      AddFile; 
      MenuMakeFiles;
    end;
//    4: 
//    begin 
//      MakeAndAddText; 
//      MenuMakeFiles;
//    end;
    4: 
    begin 
      ClrScr;
      FindStudentsWithTwos(1);
      Wait;
      MenuMakeFiles;
    end;
    5: 
    begin 
      ClrScr;
      FindStudentsWithTwos(2);
      Wait;
      MenuMakeFiles;
    end;
    6: 
    begin 
      ClrScr;
      FindStudentsWithTwos(3);
      Wait;
      MenuMakeFiles;
    end;
    7: 
    begin 
      ClrScr; 
      Dvoechniki(2);
      Wait; 
      MenuMakeFiles;
    end;
    8: 
    begin 
      ClrScr; 
      Dvoechniki(3);
      Wait; 
      MenuMakeFiles;
    end;
//    10: 
//    begin 
//      FixMark; 
//      Wait; 
//      MenuMakeFiles;
//    end;
//    11: 
//    begin 
//      DeleteStudent; 
//      Wait;
//      MenuMakeFiles;
//    end;
//    12: 
//    begin 
//      writeln('Введите количество двоек:'); 
//      readln(Exam); 
//      DeleteStudentsWithTwos(Exam);
//      Wait;
//      MenuMakeFiles;
//    end;
//    13: 
//    begin 
//      DeleteStudentsWithTwos(1);
//      Wait;
//      MenuMakeFiles;
//    end;
  else
    writeln('Неверный выбор, попробуйте еще раз.');
  end;
  readln;
end;

end.