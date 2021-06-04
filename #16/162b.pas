PROGRAM TestRemove(INPUT, OUTPUT);
{Программа тестирует модуль Queue:
 1) Записывает в очередь-Q INPUT
 2) Удаляет 1ый элемент очереди-Q
 3) Выводит очередь-Q в OUTPUT }
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
  DelQ;
  WRITE('Выход: ');
  WriteQ
END. {TestRemove}
