PROGRAM FormatText(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Scenario: CHAR;
BEGIN {FormatText}
  Scenario := 'N'; 
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  IF NOT EOLN
  THEN
    WHILE NOT EOLN
    DO
      BEGIN
        READ(W4);
        WHILE NOT EOLN
        DO
          BEGIN
            IF W4 = ' '                        {������ ������ �������}
            THEN
              BEGIN
                WHILE NOT EOLN AND (W4 = ' ')  
                DO
                  READ(W4);
                WRITE(' ')  
              END              
            ELSE
              WHILE (W4 <> ' ') AND NOT EOLN   {�������� ��, ����� ������������ �������}
              DO
                BEGIN
                  W1 := W2;
                  W2 := W3;
                  W3 := W4;
                  {������������ ����������� � ������� ��������, �� ���� ����������� 
                   ����� �������� ����, ���������� � �������: �������� ����� (�����������)}
                  IF (W4 = '{')                  
                  THEN
                    BEGIN
                      IF Scenario <> 'N'
                      THEN
                        WRITE(' ');
                      WRITE(W4);
                      WHILE NOT EOLN AND (W4 <> '}')
                      DO
                        BEGIN
                          READ(W4);
                          IF NOT EOLN
                          THEN
                            WRITE(W4)
                        END;
                      IF Scenario <> 'N'
                      THEN
                        BEGIN
                          WRITELN;
                          {WRITE('  ');}
                          Scenario := 'M'
                        END                 
                    END
                  ELSE
                    IF W4 = ','              
                    THEN
                      BEGIN
                        WRITE(W4);
                        IF NOT EOLN
                        THEN
                          READ(W4);
                        IF NOT EOLN AND (W4 <> ' ')
                        THEN
                          BEGIN
                            WRITE(' ', W4);
                            READ(W4)
                          END    
                      END
                    ELSE
                      BEGIN
                        IF Scenario <> 'N'
                        THEN
                          BEGIN
                            WRITELN;
                            {WRITE('  ');}
                            Scenario := 'M'
                          END;
                        WRITE(W4) {�������� ������, ���� ��� �������� ������ ��������������}
                      END;      
                  IF NOT EOLN
                  THEN
                    READ(W4);
                  IF (Scenario = 'M') AND (W4 = 'E')   {END possible found}
                  THEN
                    WRITELN('END.')
                  ELSE
                    IF Scenario = 'M'
                    THEN
                      WRITE('  ');    
                  IF (W2 = 'I') AND (W3 = 'N') AND (W4 = ' ') 
                  OR (W2 = ')') AND (W3 = ';') AND (W4 = ' ') 
                  OR ((W3 = ')') OR (W3 = 'N')) AND (W4 = ' ')    
                  THEN
                    BEGIN
                      Scenario := 'S';  {Something interesting found}
                      READ(W4)          {��������� �����, ��� �������� �� �����������}
                    END       
                END;
          END;      
        IF EOLN {������� ��������� ������, ���� ������ �� ����� ������}
        THEN    
          WRITELN(W4)          
      END
  ELSE
    WRITELN('You wrote nothing')          
END. {FormatText}
