PROGRAM SelectSort(INPUT, OUTPUT);
{Программа отсортирует входные данные}
VAR
  Ch, Min, C: CHAR;
  F1, F2: TEXT;
BEGIN {SelectSort}
  REWRITE(F1);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(F1, Ch)
    END;
  WRITELN(F1);
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      {Печатать Min в OUTPUT, остаток в F2}
      REWRITE(F2);
      Min := Ch;
      READ(F1, Ch);
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          {Выбираем новый Min, второй копируем в F2}
          IF Ch < Min
          THEN
            BEGIN
              WRITE(F2, Min);
              Min := Ch
            END
          ELSE
            WRITE(F2, Ch);
          READ(F1, Ch)
        END;
      WRITELN(F2);
      WRITELN;
      RESET(F2);
      WRITE('F2: ');
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          READ(F2, C);
          WRITE(C)
        END;
      WRITELN(' :F2');  
      WRITELN('Min: ', Min);
      {Копировать F2 в F1}
      RESET(F2);
      REWRITE(F1);
      READ(F2, Ch);
      WRITE('F1: ');
      WHILE NOT EOLN(F2)
      DO
        BEGIN
          WRITE(F1, Ch);
          WRITE(Ch);
          READ(F2, Ch)
        END;
      WRITELN(F1);
      WRITELN(' :F1');
      RESET(F1);
      READ(F1, Ch)
    END;
  WRITELN
END. {SelectSort}
