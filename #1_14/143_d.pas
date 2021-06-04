PROGRAM ReverseSort_c(INPUT, OUTPUT);
{Программа
 1) Копирует из INPUT в F1
 2) Рекурсивно сортирует F1
 3) Копирует F1 в OUTPUT}

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

PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Склеивает и сортирует F2 и F3 в F1 }
VAR
  Ch2, Ch3: CHAR;
BEGIN {Merge}
  REWRITE(F1);
  RESET(F2);
  RESET(F3);
  READ(F2, Ch2);
  READ(F3, Ch3);
  WHILE NOT EOLN(F2) OR NOT EOLN(F3)  
  DO 
    BEGIN
      IF Ch2 < Ch3
      THEN   
        BEGIN
          WRITE(F1, Ch2);
          IF NOT EOLN(F2)    
          {Если конец строки в одном из файлов -> подготовить Ch3}
          THEN
            READ(F2, Ch2)
          ELSE
            READ(F3, Ch2)
        END
      ELSE
        BEGIN
          WRITE(F1, Ch3);
          {Если конец строки в одном из файлов -> подготовить Ch3}
          IF NOT EOLN(F3)
          THEN
            READ(F3, Ch3)
          ELSE
            READ(F2, Ch3)
        END
    END;
  IF Ch2 < Ch3  {Вывод остатка в правильном порядке}
  THEN
    WRITE(F1, Ch2, Ch3)
  ELSE
    WRITE(F1, Ch3, Ch2);
  WRITELN(F1)      
END; {Merge} 

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
      {На вход в Split попадёт только файлы, содержащие N-строку, где 2<=N}
      THEN
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          {В Merge НЕ поступят пустые файлы}
          Merge(F1, F2, F3)
        END
      ELSE
        BEGIN
          WRITELN('Вы ввели меньше двух символов');
          WRITE('В F1 только один символ:')  
        END  
    END
  ELSE
    WRITELN('Вы ввели меньше двух символов, в F1 пусто') 
END; {RecursiveSort} 

VAR
  F1: TEXT;
BEGIN {ReverseSort}
  Copy(INPUT, F1);
  RecursiveSort(F1);
  Copy(F1, OUTPUT)
END. {ReverseSort} 
