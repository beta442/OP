PROGRAM FormatText(INPUT, OUTPUT);
VAR
  W1: CHAR;          {да, мне хватило}
PROCEDURE DeleteSpaces;
BEGIN {DeleteSpaces}
  WHILE NOT EOLN AND (W1 = ' ')
  DO
    READ(W1)
END; {DeleteSpaces}
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
          READ(W1)
        END
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
                  IF (W1 = 'N')
                  THEN
                    BEGIN
                      WRITELN(W1);   {There can be comment}
                      W1 := ' '
                    END  
                END
            END
        END
    END
END; {BeginFound}
PROCEDURE FindBracket;
BEGIN {FindBracket_(}
  IF (W1 = '(') AND NOT EOLN
  THEN
    BEGIN
      WRITE(W1);
      READ(W1);
      WHILE NOT EOLN AND (W1 <> ')')
      DO
        BEGIN  
          IF (W1 = ' ')    {for WRITE( Ch1,...)}
          THEN
            DeleteSpaces;
          IgnoreString; {Using as named}        
          IF (W1 = ',') AND NOT EOLN
          THEN
            BEGIN
              WRITE(W1);
              READ(W1);
              IF W1 <> ' '
              THEN
                WRITE(' ');
              IF W1 = ''''      {for issue ('','')}
              THEN
                IgnoreString   {again}
            END;
          WRITE(W1);
          IF NOT EOLN
          THEN
            READ(W1)
        END;
      IF NOT EOLN AND (W1 = ')')    {Checking possible END}
      THEN
        BEGIN
          WRITE(W1);
          READ(W1)
        END;  
      IF (W1 <> ';') AND NOT EOLN
      THEN
        BEGIN
          WRITELN;
          IF NOT EOLN
          THEN
            BEGIN
              WHILE NOT EOLN
              DO
                BEGIN
                  READ(W1);
                  WRITE(W1)
                END;
              W1 := ' '   {Delete last character}
            END      
        END        
    END  
END; {FindBracket_(}
PROCEDURE Issue1; {; issue}
BEGIN {; issue}
  IF (W1 = ';') AND NOT EOLN {find ;}
  THEN
    BEGIN
      WRITE(W1);
      READ(W1);
      IF W1 = ' '      {nothing special, just make new line}
      THEN
        BEGIN
          WRITE(W1);
          IF NOT EOLN AND (W1 <> ' ')   {how it's working?!?!}
          THEN                  
            READ(W1);          
          WRITELN;
          WRITE(' ')   {remember about (Reading) and (Writing)}
        END;
      IF (W1 = ';') AND NOT EOLN     {;; ?}
      THEN
        BEGIN
          WHILE NOT EOLN AND (W1 = ';')
          DO
            BEGIN
              WRITE(W1);
              READ(W1)
            END;
          WRITELN(W1)      
        END                  
    END
END; {; issue}
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
          READ(W1);       {Reading}
          IF W1 = ' '
          THEN
            BEGIN
              DeleteSpaces;
              IF W1 <> ':'   {for Ch1:=Ch2}
              THEN
                WRITE(' ')
            END;  
          BeginFound;
          FindBracket;    {(...)}  
          Equally;         {Ch1:=Ch2?}
          Issue1;         {; or ;;}
          WRITE(W1)       {Writing}
        END;
      WRITELN  
    END
  ELSE
    WRITE('You wrote nothing')
END.{FormatText}
