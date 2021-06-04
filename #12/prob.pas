PROGRAM LessPlus(INPUT, OUTPUT);
VAR
  Ch, Flag1, Flag2, Flag3: CHAR;
BEGIN {Test}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);     
      WHILE (Ch = ' ') AND NOT EOLN
      DO
        BEGIN
          READ(Ch);
          IF (Flag1 = 'Y') AND (Flag2 <> 'Y') AND NOT EOLN
          THEN
            BEGIN
              WRITE('/ /');
              Flag2 := 'Y'          
            END;   
          IF Ch <> ' '
          THEN
            Flag1 := 'Y'
        END;
      IF Flag2 = 'Y'
      THEN
        Flag2 := 'N';         
      WRITE(Ch)
    END;
  WRITELN  
END. {Test}
