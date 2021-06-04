PROGRAM FormatText(INPUT, OUTPUT);
VAR
  W1: CHAR;          
PROCEDURE DeleteSpaces;
BEGIN {DeleteSpaces}
  WHILE (W1 = ' ') AND NOT EOLN
  DO
    READ(W1)
END; {DeleteSpaces}
PROCEDURE SkippingComments;
BEGIN {SkippingComments}
IF (W1 = '{') AND NOT EOLN
THEN
  BEGIN
    WRITE(' ');
    WHILE NOT EOLN AND (W1 <> '}')
    DO
      BEGIN
        WRITE(W1);
        READ(W1)
      END;
    IF NOT EOLN AND (W1 = '}')
    THEN
      BEGIN
        WRITE(W1);
        READ(W1);
        DeleteSpaces;
        WRITE(' ')
      END
  END          
END; {SkippingComments}
PROCEDURE IgnoreString;
BEGIN {IgnoreString}
IF (W1 = '''') AND NOT EOLN 
THEN
  BEGIN
    WRITE(W1);
    READ(W1);
    WHILE NOT EOLN AND (W1 <> '''')
    DO
      BEGIN
        WRITE(W1);
        READ(W1);
      END;
    IF (W1 = '''')   {drop '}
    THEN
      WRITE(W1);
    IF NOT EOLN
    THEN
      READ(W1)
    ELSE          {drop last character}
      W1 := ' ';
    DeleteSpaces  
  END        
END; {IgnoreString}
PROCEDURE BeginFound;
BEGIN {BeginFound}
  IF (W1 = 'B') AND NOT EOLN
  THEN
    BEGIN
      WRITE(W1);
      READ(W1);
      IF (W1 = 'E') AND NOT EOLN
      THEN
        BEGIN
          WRITE(W1);
          READ(W1);
          IF (W1 = 'G') AND NOT EOLN
          THEN
            BEGIN
              WRITE(W1);
              READ(W1);
              IF (W1 = 'I') AND NOT EOLN
              THEN
                BEGIN
                  WRITE(W1);
                  READ(W1);
                  IF (W1 = 'N') AND NOT EOLN
                  THEN
                    BEGIN
                      WRITE(W1);   
                      READ(W1);
                      IF (W1 = ' ') AND NOT EOLN
                      THEN
                        BEGIN
                          DeleteSpaces;
                          IF (W1 = '{') AND NOT EOLN
                          THEN
                            BEGIN
                              SkippingComments;
                              DeleteSpaces;
                              WRITELN
                            END
                          ELSE
                            WRITELN;    
                          IF (W1 = 'E') AND NOT EOLN
                          THEN
                            WHILE NOT EOLN 
                            DO
                              BEGIN
                                WRITE(W1);
                                READ(W1)
                              END
                          ELSE 
                            WRITE('  ')
                        END                           
                    END  
                END
            END
        END
    END
END; {BeginFound}
PROCEDURE FindBracket;
BEGIN {FindBracket(}
  IF (W1 = '(') AND NOT EOLN
  THEN
    BEGIN
      WRITE(W1);
      READ(W1);
      WHILE (W1 <> ')') AND NOT EOLN
      DO
        BEGIN
          DeleteSpaces;
          IgnoreString;     {Using as named}
          IF (W1 = ',') AND NOT EOLN   {If (Ch1,Ch2,'...')}
          THEN
            BEGIN
              WRITE(W1);
              READ(W1);
              IF W1 <> ' '
              THEN
                WRITE(' ');
              IgnoreString   {same}
            END;      
          IF NOT EOLN AND (W1 <> ',') AND (W1 <> ')')
          THEN
            BEGIN
              WRITE(W1);
              READ(W1)
            END    
        END 
    END      
END; {FindBracket(}
PROCEDURE CatchingEnd;
BEGIN {CatchingEnd}
IF (W1 = 'N') AND NOT EOLN   {for WRITELN_ / READLN_}
THEN
  BEGIN
    WRITE(W1);  
    READ(W1);
    IF (W1 = ' ') AND NOT EOLN
    THEN
      BEGIN
        DeleteSpaces;
        SkippingComments;
        IF (W1 = 'E') AND NOT EOLN
        THEN
          BEGIN
            WRITELN;
            WHILE NOT EOLN
            DO
              BEGIN
                WRITE(W1);
                READ(W1);
                DeleteSpaces
              END
          END
      END
  END;
IF (W1 = ')') AND NOT EOLN   {for WRITELN() / READLN() / READ() / WRITE()}
THEN
  BEGIN
    WRITE(W1);  
    READ(W1);
    IF (W1 <> ';') AND NOT EOLN
    THEN
      BEGIN
        DeleteSpaces;
        SkippingComments;
        IF (W1 = 'E') AND NOT EOLN
        THEN
          BEGIN
            WRITELN;
            WHILE NOT EOLN
            DO
              BEGIN
                WRITE(W1);
                READ(W1);
                DeleteSpaces
              END
          END
      END
  END;
IF (W1 = ';') AND NOT EOLN           {for WRITELN; / READLN;}
THEN
  BEGIN
    WRITE(W1);  
    READ(W1);              {W1 - ( ; | comment | E ) / ( comment E )
                            / ( ; comment ) / ( ; comment E )} 
    IF (W1 = ' ') AND NOT EOLN
    THEN
      BEGIN
        DeleteSpaces;
        SkippingComments;
        IF (W1 = 'E') AND NOT EOLN
        THEN
          BEGIN
            WRITELN;
            WHILE NOT EOLN
            DO
              BEGIN
                WRITE(W1);
                READ(W1);
                DeleteSpaces
              END
          END
        ELSE
          BEGIN
            WRITELN;
            WRITE('  ')
          END  
      END
    ELSE
      BEGIN
        WRITE(' ');               {must be after ';'}
        SkippingComments;
        DeleteSpaces;
        IF (W1 <> 'E') AND NOT EOLN
        THEN
          BEGIN
            WRITELN(' ');
            WRITE('  ')
          END;
        IF (W1 = ';') AND NOT EOLN
        THEN
          BEGIN
            WHILE (W1 = ';') AND NOT EOLN
            DO
              BEGIN
                WRITE(W1);
                READ(W1)
              END;
            DeleteSpaces;  
            SkippingComments;
            WRITELN;
            WRITE('  ')         
          END  
      END  
  END      
END; {CatchingEnd}
PROCEDURE Equally; {Ch1:=Ch2}
BEGIN {Equally}
  IF (W1 = ':') AND NOT EOLN
  THEN
    BEGIN
      WRITE(' ', W1);   
      IF NOT EOLN
      THEN
        BEGIN
          READ(W1);
          IF (W1 = '=') AND NOT EOLN
          THEN
            BEGIN
              WRITE(W1);
              IF W1 <> ' '
              THEN  
                W1 := ' '
            END
        END  
    END
END; {Equally} 
BEGIN {FormatText}
  IF NOT EOLN
  THEN
    BEGIN
      WHILE NOT EOLN
      DO
        BEGIN
          {IF W1 = ';'      im not sure what is this
          THEN
            BEGIN
              CatchingEnd;
              WRITE(W1)
            END;}
          READ(W1);       {Reading}
          IF W1 = ' '
          THEN
            BEGIN
              DeleteSpaces;
              IF (W1 <> ':') AND (W1 <> '(')   {for Ch1:=Ch2 / for WRITE_()}
              THEN
                WRITE(' ')
            END;  
          BeginFound;
          FindBracket;    {(...)} 
          Equally;        {Ch1:=Ch2?}
          CatchingEnd;
          WRITE(W1)       {Writing}
        END;
      WRITELN  
    END
  ELSE
    WRITE('You wrote nothing')
END.{FormatText}
