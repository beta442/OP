PROGRAM Less(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITE('Removed all spaces from INPUT: ');
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch);
        READ(Ch);
    END;
  WRITELN
END.

