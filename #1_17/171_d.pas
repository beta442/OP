PROGRAM SortMonth_b(INPUT, OUTPUT);
{ѕрограмма сравнивает введЄнные значени€ мес€цев}

USES DateIO; {ReadMonth, WriteMonth}

PROCEDURE Copy(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}
  RESET(F1);
  REWRITE(F2);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2);
  RESET(F2)
END; {Copy}     

VAR
  F1: TEXT;
  MonthNameFirst, MonthNameSecond: Month;
BEGIN {SortMonth}
  Copy(INPUT, F1);
  IF NOT EOLN(F1)
  THEN
    ReadMonth(F1, MonthNameFirst);
  IF NOT EOLN(F1)
  THEN
    ReadMonth(F1, MonthNameSecond);
  IF (MonthNameFirst = NoMonth) OR (MonthNameSecond = NoMonth)    
  THEN
    WRITE('¬ходные данные записаны неверно')
  ELSE
    IF MonthNameFirst = MonthNameSecond
    THEN
      BEGIN
        WRITE('ќба мес€ца ');
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
