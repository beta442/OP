PROGRAM BubbleSort_a(INPUT, OUTPUT);
{1)�������� ������ ������ INPUT � F1
 2)������� F1 � OUTPUT}

PROCEDURE Copy(VAR F1, F2: TEXT);
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
    END;
  WRITELN(F2)
END; {Copy}

VAR
  F1: TEXT;
BEGIN {BubbleSort}
  Copy(INPUT, F1);
  Copy(F1, OUTPUT)
END. {BubbleSort}
