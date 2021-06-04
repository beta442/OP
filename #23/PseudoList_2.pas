PROGRAM IncertionSort_bymyself_2(INPUT, OUTPUT);
CONST
  Max = 16;
  ListEnd = 0;
TYPE
  Count = 0 .. Max;
  Rec = RECORD
          Key: CHAR;
          NextIndex: Count
        END;
  ListRec = ARRAY [1 .. Max] OF Rec;
VAR
  Index, First, Prev, Curr: Count;
  List: ListRec;
  Found: BOOLEAN;
BEGIN { IncertionSort_bymyself_2 }
  First := 0;
  Index := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      IF Index < Max
      THEN
        BEGIN
          Index := Index + 1;
          READ(List[Index].Key)
        END
      ELSE
        BEGIN
          WRITELN('ERR! Overflow!');
          BREAK
        END;
      Prev := 0;
      Curr := First;
      Found := FALSE;
      WHILE (Curr <> ListEnd) AND NOT Found
      DO
        BEGIN
          IF List[Index].Key > List[Curr].Key
          THEN
            BEGIN
              Prev := Curr;
              Curr := List[Curr].NextIndex
            END
          ELSE
            Found := TRUE  
        END;
      IF Prev = 0
      THEN
        First := Index
      ELSE
        List[Prev].NextIndex := Index;
      List[Index].NextIndex := Curr        
    END;
  Index := First;
  WHILE Index <> ListEnd
  DO
    BEGIN
      WRITE(List[Index].Key);
      Index := List[Index].NextIndex
    END;
  WRITELN    
END. { IncertionSort_bymyself_2 }
