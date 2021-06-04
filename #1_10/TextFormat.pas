PROGRAM TextFormat(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Scenario: CHAR;
BEGIN {TextFormat}
  Scenario := 'N';
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  WHILE NOT EOLN AND (Scenario <> 'E')
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '{'
      THEN
        BEGIN
          WRITE(W4);  
          WHILE W4 <> '}'
          DO
            BEGIN
              READ(W4);
              WRITE(W4)
            END;
          WRITELN  
        END;  
      IF (Scenario <> 'B') AND (W1 = 'G') AND (W2 = 'I') AND (W3 = 'N')
      AND (W4 = ' ')
      THEN
        BEGIN
          WRITELN('BEGIN');
          WRITE('  ');
          Scenario := 'B'
        END
      ELSE
        BEGIN
          IF (W3 = ';') AND (W4 = ' ')
          THEN
            BEGIN
              WRITELN;
              WRITE('  ')
            END
          ELSE
            BEGIN  
              IF (W2 = 'N') AND (W3 = ' ') OR (W2 = ')') AND (W3 = ' ')
              OR (W1 = ';') AND (W2 = ' ') AND (W3 = 'E') OR (W2 = '}') AND (W3 = ' ') AND (W4 = 'E')
              THEN
                BEGIN
                  WRITELN;
                  WRITE('END.');
                  Scenario := 'E'
                END
              ELSE
                WRITE(W4)
            END        
        END                       
    END          
END. {TextFormat}                
