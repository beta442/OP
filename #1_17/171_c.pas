PROGRAM SortMonth_b(INPUT, OUTPUT);
{Программа сравнивает введённые значения месяцев}

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
    WRITE('Вы ничего не ввели');    
  IF (MonthNameFirst = NoMonth) OR (MonthNameSecond = NoMonth)    
  THEN
    WRITE('Входные данные записаны неверно')
  ELSE
    IF MonthNameFirst = MonthNameSecond
    THEN
      BEGIN
        WRITE('Оба месяца ');
        WriteMonth(OUTPUT, MonthNameFirst)
      END
    ELSE
      BEGIN
        WriteMonth(OUTPUT, MonthNameFirst);
        IF MonthNameFirst < MonthNameSecond
        THEN
          BEGIN
            WRITE(' предшедствует ');
            WriteMonth(OUTPUT, MonthNameSecond)
          END
        ELSE
          BEGIN
            WRITE(' следует за ');
            WriteMonth(OUTPUT, MonthNameSecond)
          END          
      END;
  WRITELN          
END. {SortMonth} 
