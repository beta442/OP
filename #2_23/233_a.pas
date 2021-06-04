PROGRAM InsertSort2(INPUT, OUTPUT);
{ InsertionSort с применением указателей }
TYPE 
  NodePtr = ^Node;                                                              { ”казатель дл€ каждой €чейки Node }
  Node = RECORD
           Key: CHAR;
           Next: NodePtr
         END;
VAR
  FirstPtr, NewPtr, Curr, Prev: NodePtr;
  Found: BOOLEAN;
BEGIN {InsertSort2}
  FirstPtr := NEW(NewPtr);
  WHILE NOT EOLN
  DO
    BEGIN
      READ(NewPtr^.Key);    
      NewPtr := NewPtr^.Next
    END;
  {2.2. ѕечать значений начина€ с FirstPtr^.Key}
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITE(NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END;
  WRITELN 
END. {InsertionSort2}      
