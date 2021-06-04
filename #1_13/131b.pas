PROGRAM BubbleSort(INPUT, OUTPUT);
  { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE Copy(VAR C1, C2: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}             
  RESET(C1);
  REWRITE(C2);
  WHILE NOT EOLN(C1)
  DO
    BEGIN
      READ(C1, Ch);
      WRITE(C2, Ch)
    END;
  WRITELN(C2)
END; {Copy}
BEGIN { BubbleSort }
  { �������� INPUT � F1 }
  Copy(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { �������� F1 � F2,�������� �����������������
       � ����������� ������ �������� ������� �� �������}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);  
          WHILE NOT EOLN(F1)
          DO
            BEGIN
              READ(F1, Ch2); 
             {������� min(Ch1,Ch2) � F2, ���������
              ��������������� �������}
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END
            END;
          WRITELN(F2, Ch1)
        END;
      { �������� F2 � F1 }
      Copy(F2, F1)
    END;
  { �������� F1 � OUTPUT }
  Copy(F1, OUTPUT)
END.{ BubbleSort }
