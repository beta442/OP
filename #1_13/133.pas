PROGRAM Split(INPUT, OUTPUT);
  {�������� INPUT � OUTPUT, ������� ��������, � �����
   ������ ��������}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
PROCEDURE CopyOut(VAR F1: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyOut}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(Ch)
        END;
      READLN(F1)  
    END
END; {CopyOut} 
BEGIN {Split}
  {��������� INPUT � Odds � Evens}
  BEGIN
    REWRITE(Odds);
    REWRITE(Evens);
    Next := 'O';
    WHILE NOT EOLN
    DO
    {��������� Ch, �������� � ����, ��������� �����
     Next,����������� Next}
    BEGIN
      READ(Ch);  
      IF Next = 'O'
      THEN
        BEGIN
          WRITE(Odds, Ch);
          Next := 'E'
        END
      ELSE
        BEGIN
          WRITE(Evens, Ch);
          Next := 'O'  
        END
    END;    
    WRITELN(Odds);
    WRITELN(Evens)
  END;
  CopyOut(Odds);
  CopyOut(Evens);
  WRITELN
END. {Split}

