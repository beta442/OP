PROGRAM Practice(INPUT, OUTPUT);
{
 Процедуры с лекции про INTEGER
}
PROCEDURE Sum(VAR I,N,S: INTEGER);
BEGIN {Sum}
  READ(N);
  S := 0;
  I := 1;
  WHILE I <= N
  DO
    BEGIN
      S := S + 1;
      I := I + 1
    END;
  WRITELN('Сумма первых', N:2, ':', S:3)
END; {Sum}
PROCEDURE StringToInteger(VAR F: TEXT; VAR Base, Result: INTEGER);
{Base - система счисления на входе}

  PROCEDURE CharToDigit(VAR Ch: CHAR; VAR Result: INTEGER);
  BEGIN {CharToDigit}
    IF Ch = '0' THEN Result :=  0 ELSE
    IF Ch = '1' THEN Result :=  1 ELSE
    IF Ch = '2' THEN Result :=  2 ELSE
    IF Ch = '3' THEN Result :=  3 ELSE
    IF Ch = '4' THEN Result :=  4 ELSE
    IF Ch = '5' THEN Result :=  5 ELSE
    IF Ch = '6' THEN Result :=  6 ELSE
    IF Ch = '7' THEN Result :=  7 ELSE
    IF Ch = '8' THEN Result :=  8 ELSE
    IF Ch = '9' THEN Result :=  9 ELSE
    IF Ch = 'A' THEN Result := 10 ELSE
    IF Ch = 'B' THEN Result := 11 ELSE
    IF Ch = 'C' THEN Result := 12 ELSE
    IF Ch = 'D' THEN Result := 13 ELSE
    IF Ch = 'E' THEN Result := 14 ELSE
    IF Ch = 'F' THEN Result := 15
                ELSE Result := -1    
  END; {CharToDigit}

VAR
  Ch: CHAR;
  Digit: INTEGER;
BEGIN {StringToInteger}
  Result := 0;
  IF NOT EOLN
  THEN
    READ(F, Ch);
  WHILE (Ch <> '#') AND (Ch <> ' ')
  DO
    BEGIN
      CharToDigit(Ch, Digit);
      Result := (Result * Base) + Digit;
      READ(F, Ch)
    END;
  WRITELN('И число... ', Result)  
END; {StringToInteger}

PROCEDURE Copy(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}
  REWRITE(F2);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END; {Copy}

VAR
  Number, Base: INTEGER;
  F: TEXT;
BEGIN {Practice}
  WRITELN('Программа переводит числа из указанной системы счисления в десятичную');
  WRITE('Enter a number: ');
  Base := 2;
  StringToInteger(INPUT, Base, Number) 
END. {Practice}
