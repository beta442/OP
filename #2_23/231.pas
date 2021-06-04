PROGRAM InsertionSort(INPUT, OUTPUT);
{ Сортирует символы из INPUT }
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
  First, Index, Prev, Curr: Count;
  Arr: RecArray;
  Found: BOOLEAN;
BEGIN {InsertionSort}
  First := 0;
  Index := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      { Помещать запись в список, если позволяет пространство, 
        иначе игнорировать и сообщать об ошибке }
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
        END;
      { Поиск нужной позиции }    
      Prev := 0;
      Curr := First;
      Found := FALSE;
      WHILE (Curr <> ListEnd) AND NOT Found
      DO
        BEGIN
          IF Arr[Index].Key > Arr[Curr].Key
          THEN
            BEGIN
              Prev := Curr;
              Curr := Arr[Curr].Next
            END
          ELSE 
            Found := TRUE  
        END;
      { Включение Arr[Index] в связанный список }  
      IF Prev = 0
      THEN
        First := Index
      ELSE
        Arr[Prev].Next := Index;
      Arr[Index].Next := Curr        
    END;
  { Печать списка начиная с Arr[First] }  
  Index := First;
  WHILE Index <> ListEnd
  DO
    BEGIN
      WRITE(Arr[Index].Key);
      Index := Arr[Index].Next
    END;
  WRITELN  
END. {InsertionSort}
