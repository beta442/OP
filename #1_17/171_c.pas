PROGRAM SortMonth_b(INPUT, OUTPUT);
{��������� ���������� �������� �������� �������}

USES DateIO; {ReadMonth, WriteMonth}

VAR
  MonthNameFirst, MonthNameSecond: Month;
BEGIN {SortMonth}
  IF NOT EOLN
  THEN
    BEGIN
      ReadMonth(INPUT, MonthNameFirst);
      ReadMonth(INPUT, MonthNameSecond)
    END
  ELSE
    WRITE('�� ������ �� �����');    
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
