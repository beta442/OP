PROGRAM SelectSort(INPUT, OUTPUT);
{��������� �������, �������������� #, �� INPUT � OUTPUT.}
VAR
  Ch, Min: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  BEGIN {���������� INPUT � F1 � ��� � OUTPUT}
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
  {����������� F1 � OUTPUT, ��������� ��������� SelectSort}
END. {SelectSort}