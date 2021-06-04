PROGRAM InsertSort2 (INPUT, OUTPUT);
{ InsertionSort с применением указателей }
TYPE 
  NodePtr = ^Node;                                                              { Указатель для каждой ячейки Node }
  Node = RECORD
           Key: CHAR;
           Next: NodePtr
         END;
VAR
  FirstPtr, NewPtr, Curr, Prev: NodePtr;
  Found: BOOLEAN;
BEGIN {InsertSort2}
  FirstPtr := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      NEW(NewPtr);
      READ(NewPtr^.Key);
      {2.1. Поместить NewPtr в надлежащее место}
      Prev := NIL;
      Curr := FirstPtr;
      {2.1.1 Найдем значение Prev и Curr, такие что Prev^.Key <= NewPtr^.Key <= Curr^.Key
      NewPtr^.Key <= Curr^.Key}
      Found := FALSE;
      WHILE (Curr <> NIL) AND NOT Found
      DO
        IF NewPtr^.Key > Curr^.Key
        THEN
          BEGIN
            Prev := Curr;
            Curr := Curr^.Next;
          END
        ELSE
          Found := TRUE;
      NewPtr^.Next := Curr;
      IF Prev = NIL 
      THEN
        FirstPtr := NewPtr
      ELSE
        Prev^.Next := NewPtr;
    END;
  {2.2. Печать значений начиная с FirstPtr^.Key}
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITE(NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END;
  WRITELN    
END.  {InsertSort2}

