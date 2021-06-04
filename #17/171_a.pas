PROGRAM SortMonth_a(INPUT, OUTPUT);
{Программа сравнивает введённые значения месяцев}

USES DateIO;

VAR
  MonthName: Month;
BEGIN {SortMonth}
  ReadMonth(INPUT, MonthName);
  WriteMonth(OUTPUT, MonthName);
  WRITELN
END. {SortMonth} 
