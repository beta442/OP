PROGRAM TreeSort(INPUT, OUTPUT);
{ Сортировка бинарным деревом }
TYPE 
  Tree = ^Node;
  Node = RECORD
            Key: CHAR;
            Balance,               //Разность высот поддеревьев
            BalanceLeft,           //Высота левого поддерева
            BalanceRight: INTEGER; //Высота правого поддерева
            Rotated: BOOLEAN;      //Был ли совершён поворот вокруг этой ячейки?
            Left, Right: Tree;
         END;

VAR
  Root: Tree;
  Ch: CHAR;

PROCEDURE DoRotate(VAR Ptr: Tree);
{ Вращает дерево в районе Ptr->Node, если баланс нарушен }
VAR
  SavedRoot: Tree;
BEGIN { DoBalance }
  SavedRoot := Ptr; 
  { Смотри статью на вики про 4 вращения АВЛ-дерева }  
  IF (Ptr^.Right <> NIL) AND  { Левое вращение }
     (abs(Ptr^.Right^.Balance - Ptr^.BalanceLeft) = 2) AND (Ptr^.Right^.BalanceLeft <= Ptr^.Right^.BalanceRight)
  THEN
    BEGIN                                              
      WRITELN(' NOT BALANCED! NEEDS LEFT ROTATION! FOR: ',
                Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);
      Ptr := SavedRoot^.Right;
      SavedRoot^.Right := Ptr^.Left;
      Ptr^.Left := SavedRoot
    END;  
    
  IF (Ptr^.Left <> NIL) AND  { Правое вращение }
     (abs(Ptr^.Left^.Balance - Ptr^.BalanceRight) = 2) AND (Ptr^.Left^.BalanceRight <= Ptr^.Left^.BalanceLeft)
  THEN
    BEGIN
      WRITELN(' NOT BALANCED! NEEDS RIGHT ROTATION! FOR: ',
                Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);
      Ptr := SavedRoot^.Left;
      SavedRoot^.Left := Ptr^.Right;
      Ptr^.Right := SavedRoot                                       
    END;    
                        
  IF (Ptr^.Right <> NIL) AND (Ptr^.Right^.Left <> NIL) AND   { Левое большое вращение }
     (abs(Ptr^.Right^.Balance - Ptr^.BalanceLeft) = 2) AND
     (Ptr^.Right^.Left^.Balance > Ptr^.Right^.BalanceRight)
  THEN
    BEGIN
      WRITELN(' NOT BALANCED! NEEDS RIGHT-LEFT ROTATION! FOR: ', 
                Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);     
      Ptr := SavedRoot^.Right^.Left;
      SavedRoot^.Right^.Left := Ptr^.Right;
      Ptr^.Right := SavedRoot^.Right;
      SavedRoot^.Right := Ptr^.Left;
      Ptr^.Left := SavedRoot
    END;  
    
  IF (Ptr^.Left <> NIL) AND (Ptr^.Left^.Right <> NIL)  AND  { Правое большое вращение }
     (abs(Ptr^.Left^.Balance - Ptr^.BalanceRight) = 2) AND
     (Ptr^.Left^.Right^.Balance > Ptr^.Left^.BalanceLeft)
  THEN
    BEGIN
      WRITELN(' NOT BALANCED! NEEDS LEFT-RIGHT ROTATION! FOR: ',
                Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);     
      Ptr := SavedRoot^.Left^.Right;
      SavedRoot^.Left^.Right := Ptr^.Left;
      Ptr^.Left := SavedRoot^.Left;
      SavedRoot^.Left := Ptr^.Right;
      Ptr^.Right := SavedRoot                                           
    END; 
     
  WRITELN('HERE! ', Ptr^.Key);     
  //Ptr^.Balance := abs(Ptr^.BalanceLeft - Ptr^.BalanceRight);
  Ptr^.Rotated := TRUE;
  //WRITELN(' ROTATION IS DONE! ', Ptr^.Left^.Key, ' ', Ptr^.Key, ' ', Ptr^.Right^.Key)     
END; { DoBalance }
 
PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR);          
BEGIN {Insert} 
  IF Ptr = NIL
  THEN
    BEGIN 
      NEW(Ptr);
      Ptr^.Key := Data;
      WRITELN(' DATA IS SET ', Data);
      Ptr^.Left := NIL;
      Ptr^.Right := NIL;
      Ptr^.Balance := 0;           { 0,-1,1 - поддеревья сбалансированы, 
                                     как только 2 - балансирование, Balance снова}
      Ptr^.BalanceLeft := -1;      {-1 = поддерево пусто, 0 = в поддереве 
                                     1 элемент, 1 = в поддереве 2 элемента и т.д.}
      Ptr^.BalanceRight := -1;
      Ptr^.Rotated := FALSE      
    END
  ELSE
    BEGIN
      IF Ptr^.Key > Data
      THEN
        BEGIN
          Ptr^.BalanceLeft := Ptr^.BalanceLeft + 1;  {на этом этапе точно извес
                                                      тно: у какого поддерева увеличится высота на 1 ���������}
          Ptr^.Balance := abs(Ptr^.BalanceLeft - Ptr^.BalanceRight);
          WRITELN(' Ptr -> ', Ptr^.Key, ' Balance: ', Ptr^.Balance);                                                      
          Insert(Ptr^.Left, Data);
        END  
      ELSE
        BEGIN
          Ptr^.BalanceRight := Ptr^.BalanceRight + 1;      
          Ptr^.Balance := abs(Ptr^.BalanceLeft - Ptr^.BalanceRight);
          WRITELN(' Ptr -> ', Ptr^.Key, ' Balance: ', Ptr^.Balance);                                                                
          Insert(Ptr^.Right, Data);
        END
    END; 
  //WRITELN(' Ptr -> ', Ptr^.Key, ' Balance: ', Ptr^.Balance); 
  //Ptr^.Balance := abs(Ptr^.BalanceLeft - Ptr^.BalanceRight);
  
  //WRITELN(' Ptr -> ', Ptr^.Key, ' Balance: ', Ptr^.Balance);
  IF (Ptr^.Balance > 1) AND NOT Ptr^.Rotated
  THEN
    DoRotate(Ptr);
  IF (Ptr^.Left <> NIL) AND (Ptr^.Left^.Rotated)
  THEN  
    BEGIN
      Ptr^.BalanceLeft := Ptr^.BalanceLeft - 1;
      Ptr^.Left^.Rotated := FALSE
    END;
  IF (Ptr^.Right <> NIL) AND (Ptr^.Right^.Rotated)
  THEN  
    BEGIN
      Ptr^.BalanceRight := Ptr^.BalanceRight - 1;
      Ptr^.Right^.Rotated := FALSE
    END;  
  //WRITELN(' FOR: ', Ptr^.Key, ' LeftBalance: ', Ptr^.BalanceLeft, ' RightBalance: ', Ptr^.BalanceRight);  
END;  {Insert}

PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  
    BEGIN
      PrintTree(Ptr^.Left);
      WRITE(Ptr^.Key);
      PrintTree(Ptr^.Right);
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
  WRITELN(' ', Root^.Balance, Root^.Left^.Balance, Root^.Right^.Balance);
  WRITELN
END. { TreeSort }
