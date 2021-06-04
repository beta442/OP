PROGRAM BubbleSort(INPUT, OUTPUT);
{1)Копируем первую строку INPUT в F1
 2)Тестируем CheckingSorted - один проход
 3)Выводим F1 в OUTPUT}

PROCEDURE Copy(VAR F1, F2: TEXT);
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
    END;
  WRITELN(F2);
  RESET(F2)
END; {Copy}    

PROCEDURE CheckingSorted(VAR F1, F2: TEXT; VAR Sorted: CHAR);
VAR
  Ch1, Ch2: CHAR;
BEGIN {CheckingSort}
  IF NOT EOLN(F1)
  THEN
    BEGIN
      READ(F1, Ch1);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch2);
          IF Ch1 <= Ch2
          THEN
            BEGIN
              WRITE(F2, Ch1);
              Ch1 := Ch2
            END
          ELSE
            BEGIN
              WRITE(F2, Ch2);
              Sorted := 'N'
            END  
        END;
      WRITELN(F2, Ch1)  
    END
END; {CheckingSort}


VAR
  F1, F2: TEXT;
  Sorted: CHAR;
BEGIN {BubbleSort}
  Copy(INPUT, F1);
  REWRITE(F2);
  Sorted := 'Y';
  CheckingSorted(F1, F2, Sorted);
  Copy(F2, OUTPUT);
  WRITELN(Sorted)
END. {BubbleSort}
