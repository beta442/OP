PROGRAM TreeSort(INPUT, OUTPUT);
{ Сортировка бинарным деревом }
TYPE 
  Tree = ^Node;
  Node = RECORD
            Key: CHAR;
            BalanceLeft, BalanceRight: INTEGER;
            Left, Right: Tree;
         END;

VAR
  Root: Tree;
  Ch: CHAR;
  Balanced: BOOLEAN; 

PROCEDURE DoBalance(VAR Ptr: Tree);
VAR
  SavedRoot: Tree;
BEGIN { DoBalance }
  SavedRoot := Ptr;
  
  IF (Ptr^.Right = NIL) AND (Ptr^.Left^.Right = NIL)                            //Right rotation
  THEN
    BEGIN
      //WRITELN(' NOT BALANCED! NEEDS RIGHT ROTATION! FOR: ',
      //          Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);                          
      Ptr := SavedRoot^.Left;                                                   
      SavedRoot^.Left := NIL;                                                   //                                                   / <- Ptr
      Ptr^.Right := SavedRoot;                                                  // input: 321          ---------->                  3
      Ptr^.BalanceLeft := 1;                                                    //                                                 /
      Ptr^.BalanceRight := 1;                                                   //     Ptr -> 2       <----------                 2
      Ptr^.Left^.BalanceLeft := 0;                                              //          /  \                                 /
      Ptr^.Left^.BalanceRight := 0;                                             //         1    3                               1
      Ptr^.Right^.BalanceLeft := 0;                                             //
      Ptr^.Right^.BalanceRight := 0                                             //  1,3 now has Lbalance&RBalance = 0, but 2 has LBalance&RBalance = 1
    END;  
    
  IF (Ptr^.Left = NIL) AND (Ptr^.Right^.Left = NIL)                             //Left rotation
  THEN
    BEGIN                                              
      //WRITELN(' NOT BALANCED! NEEDS LEFT ROTATION! FOR: ',
      //          Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);           
      Ptr := SavedRoot^.Right;
      SavedRoot^.Right := NIL;                                                  //                                                   / <- Ptr
      Ptr^.Left := SavedRoot;                                                   // input: 123          ---------->                  1
      Ptr^.BalanceLeft := 1;                                                    //                                                 /
      Ptr^.BalanceRight := 1;                                                   //     Ptr -> 2        <----------                2
      Ptr^.Left^.BalanceLeft := 0;                                              //          /  \                                 /
      Ptr^.Left^.BalanceRight := 0;                                             //         1    3                               3
      Ptr^.Right^.BalanceLeft := 0;                                             //
      Ptr^.Right^.BalanceRight := 0                                             //  1,3 now has Lbalance&RBalance = 0, but 2 has LBalance&RBalance = 1
    END;  
    
  IF (Ptr^.Right = NIL) AND (Ptr^.Left^.Left = NIL)                             //Left-Right rotation
  THEN
    BEGIN
      //WRITELN(' NOT BALANCED! NEEDS LEFT-RIGHT ROTATION! FOR: ',
      //          Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);     
      Ptr := SavedRoot^.Left^.Right;
      Ptr^.Left := SavedRoot^.Left;
      Ptr^.Left^.Right := NIL;
      Ptr^.Right := SavedRoot;
      Ptr^.Right^.Left := NIL;
      Ptr^.BalanceLeft := 1;
      Ptr^.BalanceRight := 1;
      Ptr^.Left^.BalanceLeft := 0;
      Ptr^.Left^.BalanceRight := 0;
      Ptr^.Right^.BalanceLeft := 0;
      Ptr^.Right^.BalanceRight := 0
    END; 
     
  IF (Ptr^.Left = NIL) AND (Ptr^.Right^.Right = NIL)                            //Right-Left rotation
  THEN
    BEGIN
      //WRITELN(' NOT BALANCED! NEEDS RIGHT-LEFT ROTATION! FOR: ', 
      //          Ptr^.Key, ' ', Ptr^.BalanceLeft, ' ', Ptr^.BalanceRight);     
      Ptr := SavedRoot^.Right^.Left;
      Ptr^.Right := SavedRoot^.Right;
      Ptr^.Right^.Left := NIL;
      Ptr^.Left := SavedRoot;
      Ptr^.Left^.Right := NIL;
      Ptr^.BalanceLeft := 1;
      Ptr^.BalanceRight := 1;
      Ptr^.Left^.BalanceLeft := 0;
      Ptr^.Left^.BalanceRight := 0;
      Ptr^.Right^.BalanceLeft := 0;
      Ptr^.Right^.BalanceRight := 0   
    END;
  WRITELN(' ROTATION IS DONE! ', Ptr^.Left^.Key, ' ', Ptr^.Key, ' ', Ptr^.Right^.Key)     
END; { DoBalance }
 
PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR; VAR Balanced: BOOLEAN);           
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN 
      NEW(Ptr);
      Ptr^.Key := Data;
      WRITELN(' DATA IS SET ', Data);
      Ptr^.Left := NIL;
      Ptr^.Right := NIL;
      Ptr^.BalanceLeft := 0;
      Ptr^.BalanceRight := 0      
    END
  ELSE
    BEGIN
    IF Ptr^.Key > Data
    THEN
      BEGIN
        Ptr^.BalanceLeft := Ptr^.BalanceLeft + 1;
        Insert(Ptr^.Left, Data, Balanced);
        IF NOT Balanced
        THEN
          BEGIN
            DoBalance(Ptr);
            Balanced := TRUE;
            Ptr^.BalanceLeft := Ptr^.BalanceLeft - 1;
          END    
      END  
    ELSE
      BEGIN
        Ptr^.BalanceRight := Ptr^.BalanceRight + 1;      
        Insert(Ptr^.Right, Data, Balanced);
        IF NOT Balanced
        THEN
          BEGIN
            DoBalance(Ptr);
            Balanced := TRUE;
            Ptr^.BalanceRight := Ptr^.BalanceRight - 1;            
          END    
      END 
    END;  
            
  IF abs(Ptr^.BalanceLeft - Ptr^.BalanceRight) > 1
  THEN
    Balanced := FALSE;   
  
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
  Balanced := TRUE;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root, Ch, Balanced)
    END; 
  PrintTree(Root);
  WRITELN
END. { TreeSort }
