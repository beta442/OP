PROGRAM ProcedureTest(INPUT, OUTPUT);
{Тест процедуры ReadDigit}

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{В D возвращается цифра, соответствующая цифре-символу, прочтённому из F}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9
    END
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{В N возвращается число, прочитанное из F}
VAR
  Digit, PossibleFrontier: INTEGER;
  Overflow: BOOLEAN; 
BEGIN {ReadNumber}
  N := 0;
  IF NOT EOLN
  THEN
    BEGIN
      Digit := 0;
      Overflow := FALSE;
      PossibleFrontier := MAXINT DIV 10;    
      WHILE NOT Overflow AND (Digit <> -1)
      DO
        BEGIN
          IF (N > PossibleFrontier) OR ((N = PossibleFrontier) AND (Digit > 7))
          THEN
            Overflow := TRUE;
          IF Overflow
          THEN
            N := -1
          ELSE  
            N := N * 10 + Digit;
          ReadDigit(F, Digit)      
        END           
    END    
END; {ReadNumber}

VAR
  Number: INTEGER;
BEGIN {ProcedureTest}
  ReadNumber(INPUT, Number);
  IF Number = -1
  THEN
    WRITE('Err, overflow!')
  ELSE
    WRITE('Entered number:', Number);
  WRITELN    
END. {ProcedureTest}
