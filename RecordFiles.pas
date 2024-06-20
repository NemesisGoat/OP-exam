Unit RecordFiles;

  Interface

uses Crt;

Type Student = record
    name: string[10];
    mark: string[3];
  end;

procedure MakeFile;
procedure AddFile;
procedure ViewFile;
procedure Wait;
procedure MenuRecordFiles;
  
  Implementation

  procedure MakeFile;
    var ch: char;
        Ok: boolean;
        FileName: string[12];
        StudentFile: File of Student;
        FlowStudent: Student;
    begin
      Ok:= true;
      writeln('Введите имя файла:');
      readln(FileName);
      assign(StudentFile, FileName);
      rewrite(StudentFile);
        with FlowStudent do 
          while Ok do
            begin
              GoToXY(30, 10); writeln('Будете еще выводить?');
              GoToXY(30, 11); readln(ch);
              GoToXY(30, 11); ClearLine;
              if (ch = 'n') or (ch = 'т') then
                begin
                  Ok:= false;
                  close(StudentFile);
                end
              else
                begin
                  GoToXY(30, 20); writeln('Введите фамилию студента:');
                  GoToXY(30, 21); readln(Name);
                  GoToXY(30, 22); writeln('Введите его оценки:');
                  GoToXY(30, 23); readln(Mark);
                  GoToXY(30, 20); ClearLine;
                  GoToXY(30, 21); ClearLine;
                  GoToXY(30, 22); ClearLine;
                  GoToXY(30, 23); ClearLine;
                  write(StudentFile, FlowStudent);
                end;
            end;
    end;
    
   procedure AddFile;
    var
     ch: Char;
      Ok: Boolean;
      FileName, NewName: string[12];
      StudentFile, NewFile: file of Student;
      FlowStudent: Student;
    begin
      Ok := True;
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
      close(StudentFile);
      reset(NewFile); 
      seek(NewFile, FileSize(NewFile));
      repeat
        GoToXY(30, 20); writeln('Введите фамилию студента:');
        GoToXY(30, 21); readln(FlowStudent.Name);
        GoToXY(30, 22); writeln('Введите его оценки:');
        GoToXY(30, 23); readln(FlowStudent.Mark);
        GoToXY(30, 20); ClearLine;
        GoToXY(30, 21); ClearLine;
        GoToXY(30, 22); ClearLine;
        GoToXY(30, 23); ClearLine;
        write(NewFile, FlowStudent);
        GoToXY(30, 10); writeln('Хотите еще вводить?');
        GoToXY(30, 11); readln(ch);
        GoToXY(30, 11); ClearLine;
      until (ch = 'n') or (ch = 'т');
      close(NewFile);
      erase(StudentFile); 
      rename(NewFile, FileName); 
    end;
      
    procedure ViewFile;
      var k: integer;
          FileName: string[12];
          StudentFile: file of Student;
          FlowStudent: Student;
      begin
        k:= 1;
        writeln('Введите имя файла: ');
        readln(FileName);
        assign(StudentFile, FileName);
        reset(StudentFile);
        with FlowStudent do
          while not EOF (StudentFile) do
          begin
            k:= k + 1;
            read(StudentFile, FlowStudent);
            GoToXY(1,k); write(Name);
            GoToXY(11,k); write(Mark);
          end;
          close(StudentFile);
      end;
      
      procedure Wait;
      begin
        repeat until KeyPressed;
          while KeyPressed do ReadKey
      end;
      
      procedure MenuRecordFiles;
  var Mode: integer; Ok: boolean;
    begin
      Ok:= true;
      while Ok do
        begin
          ClrScr;
          writeln('Выберете пункт');
          writeln('1:  Создать файл');
          writeln('2:  Добавить в файл');
          writeln('3:  Просмотр файла');
          writeln('0:  Выход');
          readln(Mode);
          ClrScr;
          case Mode of
            1: begin
                ClrScr;
                MakeFile;
               end;
            2: begin
                ClrScr;
                AddFile;
                Wait;
               end;
            3: begin
                ClrScr;
                ViewFile;
                Wait;
               end;
            0: Ok:= false;
          end
       end
    end;
    
 end.