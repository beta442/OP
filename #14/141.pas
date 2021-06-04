PROGRAM ReverseC(INPUT, OUTPUT);
PROCEDURE Reverse(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(Ch);
      Reverse(F);
      WRITE(Ch)
    END
END; {Reverse}
BEGIN {ReverseC}
  IF NOT EOLN
  THEN
    Reverse(INPUT)
  ELSE
    WRITELN  
END. {ReverseC}
