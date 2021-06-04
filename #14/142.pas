PROGRAM ReverseC(INPUT, OUTPUT);
PROCEDURE Reverse(VAR F: TEXT);
VAR
  Ch: CHAR;
BEGIN {Reverse}
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(Ch);
      WRITE(Ch);
      Reverse(F)
    END
END; {Reverse}
BEGIN {ReverseC}
  IF NOT EOLN
  THEN
    Reverse(INPUT)
  ELSE
    WRITELN  
END. {ReverseC}
