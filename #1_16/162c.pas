PROGRAM TestRemove(INPUT, OUTPUT);
{Программа тестирует модуль Queue:
 1) Записывает в очередь-Q INPUT, осуществляет эхо ввода
 2) Убирает лишние пробелы в очереди-Q с помощью процедуры
 3) Выводит очередь-Q в OUTPUT }

USES Queue;

PROCEDURE RemoveExtraBlanks;
{Удаляет лишние пробелы между словами на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '#';
  AddQ(LineEnd); {помечаем конец текста в очереди}
  HeadQ(Ch);  {Берём 1ый элемент очереди}  
  WHILE Ch = Blank
  DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END;      
  WHILE Ch <> LineEnd
  DO
    BEGIN
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN  
          AddQ(Ch);
          DelQ;
          HeadQ(Ch)
        END;
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;
      IF Ch <> LineEnd
      THEN
        AddQ(Blank)
    END;  
  DelQ {удаяем LineEnd из очереди}
END; {RemoveExtraBlanks}

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
  WRITE('Вход:');
  WriteQ;
  RemoveExtraBlanks;
  WRITE('Выход:');
  HeadQ(Ch);
  WriteQ;
  WRITELN
END. {TestRemove}
