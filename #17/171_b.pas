PROGRAM SortMonth_b(INPUT, OUTPUT);
{��������� ���������� �������� �������� �������}

USES DateIO; {ReadMonth, WriteMonth}

VAR
  F1: TEXT;
  MonthNameFirst, MonthNameSecond: Month;
BEGIN {SortMonth}
  Copy(INPUT, F1);
  ReadMonth(F1, MonthNameFirst);
  ReadMonth(F1, MonthNameSecond);
  IF (MonthNameFirst = NoMonth) OR (MonthNameSecond = NoMonth)    
  THEN
    WRITE('������� ������ �������� �������')
  ELSE
    IF MonthNameFirst = MonthNameSecond
    THEN
      BEGIN
        WRITE('��� ������ ');
        WriteMonth(OUTPUT, MonthNameFirst)
      END
    ELSE
      BEGIN
        WriteMonth(OUTPUT, MonthNameFirst);
        IF MonthNameFirst < MonthNameSecond
        THEN
          BEGIN
            WRITE(' ������������� ');
            WriteMonth(OUTPUT, MonthNameSecond)
          END
        ELSE
          BEGIN
            WRITE(' ������� �� ');
            WriteMonth(OUTPUT, MonthNameSecond)
          END          
      END;
  WRITELN          
END. {SortMonth} 
