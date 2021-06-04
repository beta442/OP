PROGRAM SelectSort(INPUT, OUTPUT);
{Сортирует символы, предшествующие #, из INPUT в OUTPUT.}
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  BEGIN {Копировать INPUT в F1 и эхо в OUTPUT}
    REWRITE(F1);
    WRITE(OUTPUT, 'INPUT DATA: ');
    READ(INPUT, Ch);
    WHILE Ch <> '#'
    DO
      BEGIN
        WRITE(F1, Ch);
        WRITE(OUTPUT, Ch);
        READ(INPUT, Ch)
      END;
    WRITELN(OUTPUT);
    WRITELN(F1, '#')
  END;
  {Сортировать F1 в OUTPUT, используя стратегию SelectSort}
END. {SelectSort}