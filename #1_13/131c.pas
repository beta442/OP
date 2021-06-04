PROGRAM BubbleSort(INPUT, OUTPUT);
  { Сортируем первую строку INPUT в OUTPUT }
VAR
  F1, F2: TEXT;
PROCEDURE Copy(VAR C1, C2: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}             
  RESET(C1);
  REWRITE(C2);
  WHILE NOT EOLN(C1)
  DO
    BEGIN
      READ(C1, Ch);
      WRITE(C2, Ch)
    END;
  WRITELN(C2)
END; {Copy}
PROCEDURE Sorting(VAR C1, C2: TEXT);
VAR
  Ch1, Ch2, Sorted: CHAR;
BEGIN {Sorting}
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { Копируем F1 в F2,проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      Sorted := 'Y';
      RESET(C1);
      REWRITE(C2);
      IF NOT EOLN(C1)
      THEN
        BEGIN
          READ(C1, Ch1);  
          WHILE NOT EOLN(C1)
          DO
            BEGIN
              READ(C1, Ch2); 
             {Выводим min(Ch1,Ch2) в F2, записывая
              отсортированные символы}
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(C2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(C2, Ch2);
                  Sorted := 'N'
                END
            END;
          WRITELN(C2, Ch1)
        END;	  
      Copy(C2, C1)
    END  
END; {Sorting}    
BEGIN { BubbleSort }
  { Копируем INPUT в F1 }
  Copy(INPUT, F1);
  {Sorts}
  Sorting(F1, F2);
  { Копируем F1 в OUTPUT }
  Copy(F1, OUTPUT)
END.{ BubbleSort }
