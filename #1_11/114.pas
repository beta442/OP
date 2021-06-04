PROGRAM Revers(INPUT, OUTPUT);
VAR
  Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {Revers}
  {Записать из INPUT в F1}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch1);
      WRITE(F1, Ch1)
    END;
  WRITELN(F1);
  RESET(F1);
  {Работать пока F1 не станет пустым}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      {Записывать все символы, кроме последнего в F2}
      REWRITE(F2);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          Ch2 := Ch1;
          READ(F1, Ch1);
          WRITE(F2, Ch2)
        END;
      WRITELN(F2);
      RESET(F2);
      {Вывести последний}
      WRITE(Ch1);
      {Записать из F2 в F1}
      REWRITE(F1);
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, Ch1);
          WRITE(F1, Ch1)
        END;
      WRITELN(F1);
      RESET(F1)
    END
END. {Revers}
