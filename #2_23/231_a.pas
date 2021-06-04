PROGRAM InsertionSort_a(INPUT, OUTPUT);
{ ��������� ������� ������ Key/Next
  � ��������� � �� INPUT }
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  Count = ListEnd .. Max;
  Rec = RECORD
          Key: CHAR;
          Next: Count
        END;
  RecArray = ARRAY [1 .. Max] OF Rec;
VAR
  Index: Count;
  Arr: RecArray;
BEGIN { InsertionSort }
  Index := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      { �������� ������ � ������, ���� ��������� ������������, 
        ����� ������������ � �������� �� ������ }
      IF Index < Max
      THEN
        BEGIN
          Index := Index + 1;
          READ(Arr[Index].Key)
        END
      ELSE
        BEGIN
          WRITELN('Overflow!');
          BREAK
        END
    END;
  Index := 1;
  WHILE Index <> Max
  DO
    BEGIN
      WRITE(Arr[Index].Key);
      Index := Index + 1
    END;
  WRITELN
END. { InsertionSort }    
