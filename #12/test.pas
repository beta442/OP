PROGRAM Result(INPUT, OUTPUT);
VAR
  Ch, F: CHAR;
BEGIN {Result}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      F := 'N';      
      IF NOT EOLN AND ((Ch = ' ') OR (Ch = '1'))
      THEN
        BEGIN
          READ(Ch);
          IF (Ch >= '0') AND (Ch <= '9')
          THEN
            F := 'Y'  
        END;  
      IF F <> 'Y'
      THEN
        BEGIN
          IF Ch = '1'
          THEN
            WRITE('8 ');    
          IF Ch = '2'
          THEN
            WRITE('9 ');    
          IF Ch = '3'
          THEN
            WRITE('10 ');    
          IF Ch = '4'
          THEN
            WRITE('11 ');    
          IF Ch = '5'
          THEN
            WRITE('12 ');    
          IF Ch = '6'
          THEN
            WRITE('13 ');    
          IF Ch = '7'
          THEN
            WRITE('14 ')
        END
      ELSE
        BEGIN
          IF Ch = '0'
          THEN
            WRITE('3 ');    
          IF Ch = '1'
          THEN
            WRITE('4 ');    
          IF Ch = '2'
          THEN
            WRITE('5 ');    
          IF Ch = '3'
          THEN
            WRITE('6 ');    
          IF Ch = '4'
          THEN
            WRITE('7 ');    
          IF Ch = '5'
          THEN
            WRITE('8 ');    
          IF Ch = '6'
          THEN
            WRITE('9 ');    
          IF Ch = '7'
          THEN
            WRITE('10 ');
          IF Ch = '8'
          THEN
            WRITE('11 ');
          IF Ch = '9'
          THEN
            WRITE('12 ')                        
        END                                                                                                                                                                                      
    END
END. {Result}
