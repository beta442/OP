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
  
BEGIN { TreeSort }
  Root := NIL;
  NEW(Root);
  IF NOT EOLN THEN READ(Ch);
  Root^.Key := Ch; 
  
  IF NOT EOLN THEN READ(Ch);
  NEW(Root^.Left);
  Root^.Left^.Key := Ch;
  
  IF NOT EOLN THEN READ(Ch);
  NEW(Root^.Right);  
  Root^.Right^.Key := Ch;
  
  WRITELN(' Left ELMNT: ', Root^.Left^.Key, ' ROOT: ', Root^.Key, ' Right ELMNT: ', Root^.Right^.Key)
END. { TreeSort }
