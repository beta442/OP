PROGRAM Lex(INPUT, OUTPUT);
VAR
  F1, F2: TEXT;
PROCEDURE Lexico(VAR F1, F2: TEXT);
{Result 0, 1, 2 если лексикографический порядок F1 =, <, > чем F2       
соответственно. Фактические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2, Result: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  IF NOT EOLN(F1) 
  THEN
    BEGIN
      IF EOLN(F2)
      THEN
        Result := '2'
    END  
  ELSE
    BEGIN
      IF NOT EOLN(F2)
      THEN
        Result := '1'
    END;  
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END; {WHILE}
  WRITE(Result)
END; {Lexico}
BEGIN {Lex}
  REWRITE(F1);
  REWRITE(F2);
  Lexico(F1, F2)
END. {Lex}
