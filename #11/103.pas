PROGRAM Last(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN {Last}
  IF NOT EOLN
  THEN
    BEGIN
      WHILE NOT EOLN
      DO
        READ(Ch);
      WRITE(Ch)
    END
  ELSE
    WRITE('You wrote nothing')
END. {Last}

PROGRAM WithoutLast(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN {WithoutLast}
  IF NOT EOLN
  THEN
    BEGIN
      READ(Ch);
      WHILE NOT EOLN
      DO
        BEGIN
          WRITE(Ch);
          READ(Ch)
        END
    END
  ELSE
    WRITE('You wrote nothing')
END. {WithoutLast}

PROGRAM Copy(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN {Copy}
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);      
      WRITE(Ch)
    END
END. {Copy}

PROGRAM Last(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN {Last}
  IF NOT EOLN
  THEN
    BEGIN
      WHILE NOT EOLN AND (Ch1 <> Ch2)
      DO
        BEGIN
          Ch2 := Ch1;
          READ(Ch1)
        END;
      RESET(INPUT);


    END
  ELSE
    WRITE('You wrote nothing')
END. {Last}
