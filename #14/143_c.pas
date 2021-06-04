PROGRAM ReverseSort_c(INPUT, OUTPUT);
{Программа
 1) Копирует N-строку из INPUT в F1
 3) Создаёт N файлов, содержащих 1-строку, из файла F1 
 (ВАЖНО!: НЕ создаёт пустых файлов)
 2) Выводит все файлы}

PROCEDURE Copy(VAR F1, F2: TEXT);  {F1 -> F2}
VAR                                                                            
  Ch: CHAR;
BEGIN {Copy}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END
END; {Copy}

PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2(чётные позиции) и F3(нечётные)}
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  Switch := '2';
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      IF Switch = '2'
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2'
        END        
    END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split}

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR
  F2, F3: TEXT;
  Ch: CHAR;
BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          Split(F1, F2, F3);
          WRITE('F2:');
          Copy(F2, OUTPUT);
          WRITELN('#');
          WRITE('F3:');
          Copy(F3, OUTPUT);
          WRITELN('#');
          RecursiveSort(F2);
          RecursiveSort(F3)
        END
      ELSE
        WRITELN('Вы ввели меньше двух символов')  
    END
  ELSE
    WRITELN('Вы ввели меньше двух символов')      
END; {RecursiveSort} 

VAR
  F1: TEXT;
BEGIN {ReverseSort}
  Copy(INPUT, F1);
  RecursiveSort(F1)
END. {ReverseSort} 
