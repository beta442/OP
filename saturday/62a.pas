PROGRAM Split(INPUT, OUTPUT);
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
BEGIN {Split}
  BEGIN {������� INPUT �� Odds � Evens}
    READ(Ch);
    REWRITE(Odds);
    REWRITE(Evens);
    Next := 'E';
    WHILE Ch <> '#'
    DO
      BEGIN {���������� Ch � Odds ���
             Evens, ����� �� Next}
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
        WRITE(Next)
      END;
    WRITELN(Odds, '#');
    WRITELN(Evens, '#');
    RESET(Odds);
    RESET(Evens);
  END;
  {����� Odds � OUTPUT}
  {����� Evens � OUTPUT}
  WRITELN
END. {Split}
