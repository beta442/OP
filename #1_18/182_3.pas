PROGRAM ProcedureTest(INPUT, OUTPUT);
{���� ��������� ReadDigit}

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{� D ������������ �����, ��������������� �����-�������, ���������� �� F}
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
{� N ������������ �����, ����������� �� F}
VAR
  Digit: INTEGER;
  Overflow: BOOLEAN; 
BEGIN {ReadNumber}
  N := 0;
  Overflow := FALSE;
  IF NOT EOLN
  THEN
    BEGIN
      Digit := 0;
      WHILE NOT Overflow AND (Digit <> -1)
      DO
        BEGIN
          N := N * 10 + Digit;
          ReadDigit(F, Digit);
          Overflow := MAXINT < (N * 10 + Digit)     
        END           
    END;
  IF Overflow THEN N := -1      
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
