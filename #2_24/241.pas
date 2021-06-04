PROGRAM TreeSort(INPUT, OUTPUT);
{ Программа сортирует данные с помощью BinTree }
TYPE 
  Tree = ^Node;
  Node = RECORD
            Key: CHAR;
            Left, Right: Tree;
         END;
VAR
  Root: Tree;
  Ch: CHAR; 
 
PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR);
{ Процедура вставляет новые элементы в дерево }
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN
      NEW(Ptr);
      Ptr^.Key := Data;
      Ptr^.Left := NIL;
      Ptr^.Right := NIL
    END
  ELSE
    IF Ptr^.Key > Data
    THEN
      Insert(Ptr^.Left, Data)
    ELSE
      Insert(Ptr^.Right, Data)
END;  {Insert}

PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  
    BEGIN
      PrintTree(Ptr^.Left);
      WRITE(Ptr^.Key);
      PrintTree(Ptr^.Right)
    END
END;  {PrintTree} 
  
BEGIN { TreeSort }
  Root := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root, Ch)
    END;  
  PrintTree(Root);
  WRITELN
END. { TreeSort }
