PROGRAM BubbleSort(INPUT, OUTPUT);
{Программа сортирует входные данные по принципу BubbleSort}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  RESET(F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      REWRITE(F2);      
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, Ch2);
              IF Ch2 < Ch1
              THEN
                BEGIN
                  Sorted := 'N';
                  WRITE(F2, Ch2)
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END  
            END;
          WRITELN(F2)  
        END;
      RESET(F2);
      REWRITE(F1);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch);
          WRITE(F1, Ch)
        END;
      WRITELN(F1);
      RESET(F1)    
    END;
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      READ(F2, Ch);
      WRITE(Ch)
    END    
END. {BubbleSort}
