PROGRAM TestRemove(INPUT, OUTPUT);
{Программа тестирует модуль Queue:
 1) Записывает в Q INPUT
 2) Выводит Q в OUTPUT}
USES Queue;
VAR
  Ch: CHAR;
BEGIN {TestRemove}
  EmptyQ;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      AddQ(Ch)
    END;
  WRITE('Вход: ');
  WriteQ;
  EmptyQ;
  WRITE('Выход: ');
  WriteQ
END. {TestRemove}
