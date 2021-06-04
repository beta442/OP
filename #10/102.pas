PROGRAM TextFormat(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, W6, W7, W8, Scenario: CHAR;
BEGIN {TextFormat}
  Scenario := 'N';  {Nothing}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  W5 := ' ';
  W6 := ' ';
  W7 := ' ';
  W8 := ' ';
  WHILE NOT EOLN AND (Scenario <> 'S')
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      W4 := W5;
      W5 := W6;
      W6 := W7;
      W7 := W8;
      READ(W8);
      IF (Scenario = 'N') AND (W2 = 'B') AND (W3 = 'E') AND (W4 = 'G') 
      AND (W5 = 'I') AND (W6 = 'N') AND (W7 = ' ')  {Проверка на единственно первый BEGIN}
      THEN
        BEGIN
          WRITELN;
          WRITE('  ', W8);
          Scenario := 'B'
        END
      ELSE
        IF (Scenario = 'B') AND ((W6 = ')') AND (W7 = ' ') 
        OR (W5 = 'L') AND (W6 = 'N') AND (W7 = ' ') 
        OR (W5 = ';') AND (W6 = ' ') AND (W7 = 'E'))  {Ищем END}
        THEN
          BEGIN
            WRITELN;
            WRITE('END.');
            Scenario := 'S'
          END      
        ELSE
          IF (W6 = ';') OR (W6 = '}') AND (W7 = ' ')       {осуществляем перенос}
          THEN
            BEGIN
              WRITELN;
              WRITE('  ', W8)
            END
          ELSE
            IF ((W7 <> ' ') AND (W8 = ':')) OR ((W8 <> ' ') 
            AND ((W7 = ',') OR (W7 = '='))) 
            AND NOT ((W7 = ':') AND (W8 = '='))           {форматируем ситуации Ch1:=Ch2 / Ch1,Ch2,'AAA' -> Ch1 := Ch2 / Ch1, Ch2, 'AAA'}
            THEN
              BEGIN
                WRITE(' ', W8)
              END
            ELSE 
              WRITE(W8)                      
    END;
  WHILE NOT EOLN AND (Scenario <> 'F')  {Печать комментария, если есть}
  DO
    BEGIN
      READ(W8);
      IF (W8 = '{')
      THEN
        BEGIN
          WRITE(' ', W8);
          Scenario := 'F'
        END  
    END;
  WHILE NOT EOLN 
  DO
    BEGIN
      READ(W8);
      WRITE(W8)
    END                  
END.{TextFormat}