PROGRAM Split(INPUT, OUTPUT);
  {Копирует INPUT в OUTPUT, сначала нечётные, а затем
   чётные элементы}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
PROCEDURE CopyOut(VAR F1: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyOut}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(Ch)
        END;
      READLN(F1)  
    END
END; {CopyOut} 
BEGIN {Split}
  WRITELN(Odds, 'abcd');
  WRITELN(Evens, '1234');
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN
END. {Split}

