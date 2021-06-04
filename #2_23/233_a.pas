PROGRAM InsertSort2(INPUT, OUTPUT);
{ InsertionSort � ����������� ���������� }
TYPE 
  NodePtr = ^Node;                                                              { ��������� ��� ������ ������ Node }
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
  {2.2. ������ �������� ������� � FirstPtr^.Key}
  NewPtr := FirstPtr;
  WHILE NewPtr <> NIL
  DO
    BEGIN
      WRITE(NewPtr^.Key);
      NewPtr := NewPtr^.Next
    END;
  WRITELN 
END. {InsertionSort2}      
