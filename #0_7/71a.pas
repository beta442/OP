PROGRAM BubbleSort(INPUT, OUTPUT);
{Сортируем первую строку INPUT в OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  BEGIN { Копируем INPUT в F1 }
    REWRITE(F1);
    WHILE NOT EOLN
    DO
      BEGIN
        READ(Ch);
        WRITE(F1, Ch);
      END;
    WRITELN(F1)
  END;
  Sorted := 'Y';
  WHILE Sorted = 'N'
  DO
    BEGIN
      {Копируем F1 в F2,проверяя отсортированность
       и переставляя первые соседние символы по порядку}
      {Копируем F2 в F1}
    END;
  BEGIN {Копируем F1 в OUTPUT}
    RESET(F1);
    WHILE NOT EOLN(F1)
    DO
      BEGIN
        READ(F1, Ch);
        WRITE(Ch);
      END;
    WRITELN
  END
END. {BubbleSort}
