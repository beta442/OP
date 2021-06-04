PROGRAM TextFormat(INPUT, OUTPUT);
VAR
  W1, W2, W3, Scenario: CHAR;
BEGIN {TextFormat}
  Scenario := 'N'; 
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  IF EOLN
  THEN
    WHILE NOT EOLN
    DO
      BEGIN
        READ(W4);
        WHILE NOT EOLN
        DO
          BEGIN
            IF W4 = ' '                        
            THEN
              BEGIN
                WHILE NOT EOLN AND (W4 = ' ')  
                DO
                  READ(W4);
                WRITE(' ')  
              END
            ELSE
              WHILE (W4 <> ' ') AND NOT EOLN   {Печатать всё, кроме определенных случаев}
              DO
                BEGIN
                  W1 := W2;
                  W2 := W3;
                  W3 := W4; 