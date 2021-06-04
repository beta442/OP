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
  Digit: INTEGER;
BEGIN {ReadNumber}
  N := 0;
  Digit := 0;
  WHILE Digit <> -1
  DO
    BEGIN
      N := N * 10 + Digit;
      ReadDigit(F, Digit)      
    END     
END; {ReadNumber}

VAR
  Number: INTEGER;
BEGIN {ProcedureTest}
  IF NOT EOLN
  THEN
    BEGIN
      ReadNumber(INPUT, Number);
      WRITE('Entered number:', Number)
    END
  ELSE
    WRITE('Empty');    
  WRITELN    
END. {ProcedureTest}
