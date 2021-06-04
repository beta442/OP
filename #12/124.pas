PROGRAM Less(INPUT, OUTPUT);
{Программа убирает лишние пробелы в тексте}
VAR
  Ch, Where: CHAR;
BEGIN {Less}
  Where := 'B';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);  
      IF Ch <> ' '
      THEN
        BEGIN
          WRITE(Ch);
          Where := 'M'
        END    
      ELSE
        BEGIN
          WHILE (Ch = ' ') AND NOT EOLN
          DO
            READ(Ch);  
          WHILE (Ch <> ' ') AND NOT EOLN
          DO
            BEGIN
              WRITE(Ch);
              READ(Ch);
              IF Ch = ' '
              THEN
                BEGIN
                  Where := 'B';
                  WRITE('\ ')
                END  
            END;        
          IF (Where = 'M') AND (Ch <> ' ')
          THEN
            WRITE(' /');
          IF EOLN AND (Ch <> ' ')
          THEN
            WRITE(Ch)
        END                                 
    END;
  WRITELN  
END. {Less}
