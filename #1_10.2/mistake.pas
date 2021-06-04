PROGRAM FormatText(INPUT, OUTPUT); {Делал дома}
VAR
  W1, W2, W3, W4: CHAR;
BEGIN {FormatText}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  IF NOT EOF
  THEN
    IF NOT EOLN
    THEN
      WHILE NOT EOLN
      DO
        BEGIN
          W1 := W2;
          W2 := W3;
          W3 := W4;
          READ(W4);    
          IF W4 = '{'                 
          THEN
            BEGIN  {Totally ignoring comments}
              WHILE NOT EOLN AND (W4 <> '}')
              DO
                BEGIN
                  WRITE(W4);
                  READ(W4)
                END;
              WRITE(W4);
              IF NOT EOLN
              THEN
                READ(W4)
              ELSE
                W4 := ''    
            END;   {Totally ignoring comments}
          IF (W2 = 'I') AND (W3 = 'N') AND (W4 = ' ')
          THEN
            BEGIN {BEGIN time}
              WRITE(W4);
              IF NOT EOLN
              THEN
                BEGIN
                  READ(W4);
                  IF W4 = '{'   {Is BEGIN commented?}
                  THEN
                    BEGIN
                      WHILE NOT EOLN AND (W4 <> '}')
                      DO
                        BEGIN
                          WRITE(W4);
                          READ(W4)
                        END;
                      WRITELN(W4);
                      IF NOT EOLN
                      THEN
                        READ(W4) 
                      ELSE
                        W4 := '';
                      IF NOT EOLN
                      THEN
                        BEGIN
                          READ(W4);
                          IF W4 = 'E'           {Is END after BEGIN comment?}
                          THEN
                            WHILE NOT EOLN
                            DO
                              BEGIN
                                WRITE(W4);
                                READ(W4)
                              END
                          ELSE
                            WRITE(' ')    
                        END              
                    END;
                  IF W4 = 'E'            {Is END after BEGIN?}
                  THEN
                    BEGIN
                      WRITELN;
                      WHILE NOT EOLN
                      DO
                        BEGIN
                          WRITE(W4);
                          READ(W4)
                        END
                    END                        
                END;
              WRITE(' '); {BEGIN found}                   
            END; {BEGIN time}
          IF W4 = '('                               
          THEN
            BEGIN  {Let's check some brackets and totally ignore 'em}
              WHILE NOT EOLN AND (W4 <> ')')
              DO
                BEGIN
                  WRITE(W4);
                  READ(W4);
                  IF (W4 = ',') AND NOT EOLN          {is that Ch1,Ch2 issue?}
                  THEN
                    BEGIN
                      READ(W4);
                      IF W4 <> ' '
                      THEN
                        WRITE(', ')
                    END                                           
                END                                                
            END;  {Let's check some brackets and totally ignore 'em}
          IF (W4 = ')') AND NOT EOLN      
          THEN                                             
            BEGIN  {making new line}                                        
              WRITE(W4);                                   
              READ(W4);
              IF (W4 = ' ') AND NOT EOLN
              THEN
                BEGIN
                  WRITE(W4);
                  READ(W4);
                  IF W4 = 'E'
                  THEN
                    BEGIN
                      WRITELN;
                      WHILE NOT EOLN
                      DO
                        BEGIN
                          WRITE(W4);
                          READ(W4)
                        END
                    END          
                  ELSE
                    BEGIN
                      WRITE(W4);
                      READ(W4)
                    END
                END;     
              IF (W4 = ';') AND NOT EOLN
              THEN
                BEGIN
                  WRITELN(W4);
                  READ(W4);
                  IF NOT EOLN
                  THEN
                    BEGIN
                      READ(W4);
                      IF W4 = 'E'       {empty operator}
                      THEN
                        WHILE NOT EOLN
                        DO
                          BEGIN
                            WRITE(W4);
                            READ(W4)
                          END
                      ELSE
                        BEGIN
                          WRITE('  ');
                          IF NOT EOLN
                          THEN
                            BEGIN
                              WRITE(W4);
                              READ(W4)
                            END
                        END          
                    END      
                END                                                                              
            END; {making new line}  
          IF (W2 <> '') AND (W3 = ';') AND (W4 = ' ')
          THEN
            BEGIN
              WRITELN(W4);
              IF NOT EOLN               {possible END}
              THEN
                BEGIN
                  READ(W4);
                  IF W4 = 'E'
                  THEN
                    BEGIN
                      WHILE NOT EOLN
                      DO
                        BEGIN
                          WRITE(W4);
                          READ(W4)
                        END
                    END      
                  ELSE
                    WRITE('  ') 
                END
            END;         
          IF (W4 = ':') AND (W3 <> ' ') 
          OR (W3 = '=') AND (W4 <> ' ')  {is that Ch1:=Ch2 issue?}
          THEN
            WRITE(' ');
          IF (W4 = ' ') AND NOT EOLN
          THEN
            BEGIN
              WRITE(W4);
              READ(W4);
              IF W4 = ' '
              THEN
              WHILE NOT EOLN AND (W4 = ' ')
              DO
                READ(W4)        
            END;                                       
          WRITE(W4)
        END  
    ELSE    
      WRITE('You wrote nothing')
END. {FormatText}    
