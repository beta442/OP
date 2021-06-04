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
IF ((W1 = '{') OR (W1 = '"')) AND NOT EOLN
THEN
  BEGIN
    IF W1 = '{'
    THEN
      WRITE(' ');
    WHILE NOT EOLN AND ((W1 <> '}') OR (W1 = '"'))
    DO
      BEGIN
        WRITE(W1);
        READ(W1)
      END;
    IF NOT EOLN AND ((W1 = '}') OR (W1 = '"'))
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
  WHILE ((W1 = 'B') OR (W1 = 'E') OR (W1 = 'G') 
  OR (W1 = 'I') OR (W1 = 'N')) AND NOT EOLN
  DO
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
              WRITELN
            END
          ELSE
            BEGIN
              DeleteSpaces;
              IF (W1 <> '(')
              THEN
                WRITELN
            END;        
          IF (W1 = 'E') AND NOT EOLN
          THEN
            WHILE NOT EOLN 
            DO
              BEGIN
                WRITE(W1);
                READ(W1);
                DeleteSpaces;     {END____.___comment}
                SkippingComments
              END
          ELSE
            IF W1 <> '('        {for LN___()}
            THEN 
              WRITE('  ')          
        END
    END
END; {BeginFound}
PROCEDURE WriteEnd;
BEGIN {WriteEnd}
IF (W1 = 'E') AND NOT EOLN
THEN
  BEGIN
    WRITELN;
    WHILE NOT EOLN
    DO
      BEGIN
        WRITE(W1);
        READ(W1);
        DeleteSpaces;
        SkippingComments
      END
  END
END; {WriteEnd;}
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
IF (W1 = 'N') AND NOT EOLN   {for WRITELN_END / READLN_END}
THEN
  BEGIN
    WRITE(W1);  
    READ(W1);
    DeleteSpaces;     {WRITELN_() / READLN_() OR WRITELN_; / READLN_; fix}
    FindBracket;      {for possible (...)}
    IF (W1 = ' ') AND NOT EOLN
    THEN
      BEGIN
        DeleteSpaces;
        SkippingComments;
        WriteEnd
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
        WriteEnd
      END
  END;
IF (W1 = ';') AND NOT EOLN           {for operator;}
THEN
  BEGIN
    WRITE(W1);
    READ(W1);                         
    DeleteSpaces;
    SkippingComments;    
    IF (W1 = 'E') AND NOT EOLN
    THEN
      WriteEnd
    ELSE
      BEGIN
        WRITELN;
        WRITE('  ')
      END;
    IF (W1 = ';') AND NOT EOLN
    THEN
      BEGIN
        WHILE (W1 <> ' ') AND NOT EOLN
        DO
          BEGIN
            WRITE(W1);
            READ(W1)
          END;
        DeleteSpaces;
        SkippingComments;
        IF (W1 = 'E') AND NOT EOLN
        THEN
          WriteEnd
        ELSE
          BEGIN    
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
              IF NOT EOLN
              THEN
                READ(W1);
              IF W1 = ' '
              THEN  
                DeleteSpaces;
              WRITE(' ')  
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
          IF (W1 <> ';')
          THEN
            READ(W1);       {Reading}
          IF W1 = ' '
          THEN
            BEGIN
              DeleteSpaces;
              IF (W1 <> ':') AND (W1 <> '(') AND (W1 <> 'B')  {for Ch1:=Ch2 / for WRITE_()}
              THEN
                WRITE(' ')
            END;  
          BeginFound;
          SkippingComments;
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
