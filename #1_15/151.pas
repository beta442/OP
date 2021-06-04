PROGRAM BubbleSort(INPUT, OUTPUT);
{1)Копируем первую строку INPUT в F1
 2)Сортируем F1 по принципу BubbleSort
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
  WRITELN(F2)
END; {Copy}

PROCEDURE BubbleSort(VAR F1: TEXT);
VAR
  Sorted, Ch1, Ch2: CHAR;
  F2: TEXT;
BEGIN {BubbleSort}
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      REWRITE(F2);
      RESET(F1);
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
        END;
      Copy(F2, F1)  
    END
END; {BubbleSort} 

VAR
  F1: TEXT;
 
BEGIN {BubbleSort}
  Copy(INPUT, F1);
  BubbleSort(F1);
  Copy(F1, OUTPUT)
END. {BubbleSort}
