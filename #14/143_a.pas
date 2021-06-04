PROGRAM ReverseSort_a(INPUT, OUTPUT);
{Программа
 1) Копирует INPUT в F1
 2) Копирует F1 в OUTPUT}

PROCEDURE Copy(VAR F1, F2: TEXT);  {F1 -> F2}
VAR                                                                            
  Ch: CHAR;
BEGIN {Copy}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END
END; {Copy}

VAR
  F1, F2, F3: TEXT;
BEGIN {ReverseSort}
  Copy(INPUT, F1);
  Copy(F1, OUTPUT)
END. {ReverseSort} 
