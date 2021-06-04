PROGRAM TestRemove(INPUT,OUTPUT);
{Читает строку из входа, пропускает её через RemoveExtraBlanks}

USES Queue;

PROCEDURE RemoveExtraBlanks;
{Удаляет лишние пробелы между словами на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '#';
  AddQ(LineEnd); {помечаем конец текста в очереди}
  HeadQ(Ch);  {Ch = 1ый элемент}  
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
  WRITE('Вход: ');
  WriteQ;
  RemoveExtraBlanks;
  WRITE('Выход: ');
  HeadQ(Ch);
  WriteQ;
  WRITELN
END. {TestRemove}
