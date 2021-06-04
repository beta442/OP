PROGRAM Less(INPUT, OUTPUT);
{Программа убирает лишние пробелы в тексте}
VAR
  Ch, Where: CHAR;
BEGIN {Less}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WHILE (Ch = ' ') AND NOT EOLN
      DO
        BEGIN
          READ(Ch);
          IF Ch <> ' '
          THEN
            Where := 'M';
          IF (Ch <> ' ') AND (Where = 'M')
          THEN
            WRITE(' ');            
        END;   
      IF Ch <> ' '
      THEN  
        WRITE(Ch)
    END;
  WRITELN  
END. {Less}
