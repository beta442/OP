PROGRAM BubbleSort(INPUT, OUTPUT);
{��������� ������ ������ INPUT � OUTPUT}
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
BEGIN {BubbleSort}
  BEGIN { �������� INPUT � F1 }
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
      {�������� F1 � F2,�������� �����������������
       � ����������� ������ �������� ������� �� �������}
      {�������� F2 � F1}
    END;
  BEGIN {�������� F1 � OUTPUT}
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
