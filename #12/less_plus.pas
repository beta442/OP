PROGRAM LessPlus(INPUT, OUTPUT);
VAR
  Ch, Flag1, Flag2: CHAR;
BEGIN {LessPlus}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);         
      WHILE (Ch = ' ') AND NOT EOLN
      DO
        BEGIN
          READ(Ch);
          IF Flag2 = 'Y' 
          THEN
            Flag2 := 'N'
        END;  
      IF (Flag1 = 'Y') AND (Flag2 <> 'Y')
      THEN
        BEGIN  
          WRITE('/ /');
          Flag2 := 'Y' 
        END;                            
      WRITE(Ch);
      IF Flag1 <> 'Y'
      THEN
        Flag1 := 'Y'      
    END;
  WRITELN  
END. {LessPlus}
