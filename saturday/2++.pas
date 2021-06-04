PROGRAM CountChar(INPUT, OUTPUT);
VAR
  Ch, AB, AC, AD, AE: CHAR;
BEGIN
  AB := '0';
  AC := '0';
  AD := '0';
  AE := '0';
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF AD = '0'
      THEN
        AD := '1'
      ELSE
        IF AD = '1'
        THEN
          AD := '2'
        ELSE
          IF AD = '2'
          THEN
            AD := '3'
          ELSE
            IF AD = '3'
            THEN
              AD := '4'
            ELSE
              IF AD = '4'
              THEN
                AD := '5'
              ELSE
                IF AD = '5'
                THEN
                  AD := '6'
                ELSE
                  IF AD = '6'
                  THEN
                    AD := '7'
                  ELSE
                    IF AD = '7'
                    THEN
                      AD := '8'
                    ELSE
                      IF AD = '8'
                      THEN
                        AD := '9'
                      ELSE
                        IF AD = '9'
                        THEN
                          AD := '0';
      IF AD = '0'
      THEN
        IF AC = '0'
        THEN
          AC := '1'
        ELSE
          IF AC = '1'
          THEN
            AC := '2'
          ELSE
            IF AC = '2'
            THEN
              AC := '3'
            ELSE
              IF AC = '3'
              THEN
                AC := '4'
              ELSE
                IF AC = '4'
                THEN
                  AC := '5'
                ELSE
                  IF AC = '5'
                  THEN
                    AC := '6'
                  ELSE
                    IF AC = '6'
                    THEN
                      AC := '7'
                    ELSE
                      IF AC = '7'
                      THEN
                        AC := '8'
                      ELSE
                        IF AC = '8'
                        THEN
                          AC := '9'
                        ELSE
                          IF AC = '9'
                          THEN
                            AC := '0';
      IF AD = '0'
      THEN
        IF AC = '0'
        THEN
          IF AB = '0'
          THEN
            AB := '1'
          ELSE
            IF AB = '1'
            THEN
              AB := '2'
            ELSE
              IF AB = '2'
              THEN
                AB := '3'
              ELSE
                IF AB = '3'
                THEN
                  AB := '4'
                ELSE
                  IF AB = '4'
                  THEN
                    AB := '5'
                  ELSE
                    IF AB = '5'
                    THEN
                      AB := '6'
                    ELSE
                      IF AB = '6'
                      THEN
                        AB := '7'
                      ELSE
                        IF AB = '7'
                        THEN
                          AB := '8'
                        ELSE
                          IF AB = '8'
                          THEN
                            AB := '9'
                          ELSE
                            IF AB = '9'
                            THEN
                              AB := '9';
      READ(Ch);
      IF AD = '9'
      THEN
        IF AC = '9'
        THEN
          IF AB = '9'
          THEN
            IF Ch <> '#'
            THEN
              AE := '1';
      IF AE = '1'
      THEN
        BEGIN
          WRITELN('Err, overflowed!');
          Ch := '#';
        END;
    END;
  IF AE <> '1'
  THEN
    WRITELN('Number of characters is ', AB, AC, AD)
END.
