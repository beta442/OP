PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN {Split}
  BEGIN {Разбить INPUT на Odds и Evens}
    READ(Ch);
    REWRITE(Odds);
    REWRITE(Evens);
    Next := 'E';
    WHILE Ch <> '#'
    DO
      BEGIN {Записывать Ch в Odds или
             Evens, глядя на Next}
        IF Next = 'E'
        THEN
          BEGIN {Current Ch is Odd}
            WRITE(Odds, Ch);
            READ(Ch);
            Next := 'O'
          END
        ELSE
          BEGIN {Current Ch is Even}
            WRITE(Evens, Ch);
            READ(Ch);
            Next := 'E'
          END;
      END;
    WRITELN(Odds, '#');
    WRITELN(Evens, '#');
    RESET(Odds);
    RESET(Evens);
  END;
  BEGIN {Вывод Odds в OUTPUT}
    READ(Odds, Ch);
    WHILE Ch <> '#'
    DO
      BEGIN
        WRITE(Ch);
        READ(Odds, Ch)
      END
  END;
  {Вывод Evens в OUTPUT}
  WRITELN
END. {Split}
