UNIT CountingWords1;

INTERFACE

TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;      //поле ячейки, содержит в себе слово-символы
           Counter: INTEGER;  //счётчик, показывает, кол-во одинаково обработанных Word при вставке в дерево
           Left, Right: Tree  //указатели в бинарном дереве         
         END;
            
  TempNode = RECORD
               Word: STRING;
               Counter: INTEGER
             END;  

PROCEDURE CountWord(Word: STRING);                                              { Вставляет слово Word в бинарное дерево }
PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);                               { Печать содержимого дерева }

IMPLEMENTATION

{ Реализовано бинарным деревом, с контролем по памяти  }

CONST
  MaxWordAmount = 20;
         
VAR
  WordAmount: INTEGER;
  WasOverflow: BOOLEAN;

PROCEDURE EmptyTree(VAR Pointer: Tree);
{ Используй для полного уничтожения дерева  }
BEGIN { EmptyTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      EmptyTree(Pointer^.Left);
      EmptyTree(Pointer^.Right);
      DISPOSE(Pointer);
      Pointer := NIL;
      WordAmount := WordAmount - 1
    END
END; { EmptyTree }

VAR
  TempFile1, TempFile2: FILE OF TempNode;

PROCEDURE SaveNode(VAR SavedNode: TempNode);
{ Бери ячейку динамической структуры и сохраняй её в типизированный файл }
VAR
  Temp: TempNode;
BEGIN { SaveNode }
  RESET(TempFile1);
  REWRITE(TempFile2);
  
  //запишем хотя бы одно слово
  IF EOF(TempFile1) THEN WRITE(TempFile1, SavedNode);
  RESET(TempFile1);

  //транслируем Т1 в Т2, попутно ищем место для вставки ячейки
  WHILE NOT EOF(TempFile1)
  DO
    BEGIN
      READ(TempFile1, Temp);
      IF SavedNode.Word = Temp.Word 
      THEN
        BEGIN
          SavedNode.Counter := SavedNode.Counter + Temp.Counter;
          WRITE(TempFile2, SavedNode);
          BREAK
        END;  

      IF SavedNode.Word > Temp.Word                       THEN WRITE(TempFile2, Temp);
      IF SavedNode.Word < Temp.Word                       THEN WRITE(TempFile2, SavedNode, Temp);
      IF EOF(TempFile1) AND (SavedNode.Word <> Temp.Word) THEN WRITE(TempFile2, SavedNode)
    END;

  //обновим состояние Т1 до Т2
  REWRITE(TempFile1);
  RESET(TempFile2);
  WHILE NOT EOF(TempFile2)
  DO
    BEGIN
      READ(TempFile2, Temp);
      WRITE(TempFile1, Temp)
    END  
  
END; { SaveNode }

PROCEDURE WriteTempFile(VAR DataFile: TEXT);
{ Используй для вывода бинарного файла в DataFile }
VAR
  Temp: TempNode;
BEGIN
  RESET(TempFile2);
  WHILE NOT EOF(TempFile2)
  DO
    BEGIN
      READ(TempFile2, Temp);
      WRITELN(DataFile, Temp.Word, ' ', Temp.Counter)
    END
END;

PROCEDURE SaveTree(VAR Pointer: Tree);
{ Пройди по всем элементам дерева и сохрани их }
VAR
  SavedNode: TempNode;
BEGIN { SaveTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      SaveTree(Pointer^.Left);
      SavedNode.Word := Pointer^.Word;
      SavedNode.Counter := Pointer^.Counter;
      SaveNode(SavedNode);
      SaveTree(Pointer^.Right)
    END   
END; { SaveTree }

VAR
  Root: Tree;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ Кладёт слово в бинарное дерево, реализован контроль переполнения }

//Требуется знать устройтсво бинарного дерева!//

BEGIN { Insert }
  IF WordAmount < MaxWordAmount
  THEN
    IF Pointer = NIL
    THEN
      BEGIN
        NEW(Pointer);
        Pointer^.Word := Word;        
        Pointer^.Counter := 1;
        Pointer^.Left := NIL;
        Pointer^.Right := NIL;
        WordAmount := WordAmount + 1  //      
      END
    ELSE
      BEGIN
        IF Pointer^.Word > Word
        THEN
          Insert(Pointer^.Left, Word);
          
        IF Pointer^.Word < Word
        THEN     
          Insert(Pointer^.Right, Word);
    
        { Слово уже есть в дереве? 
          Тогда просто увеличить счётчик на 1, 
          без вставки в дерево }        
        IF Pointer^.Word = Word
        THEN
          Pointer^.Counter := Pointer^.Counter + 1
      END
  ELSE     
    BEGIN //контроль переполнения
      SaveTree(Root);
      EmptyTree(Root);
      DISPOSE(Root);
      Root := NIL;
      WordAmount := 0;
      WasOverflow := TRUE
    END 
END; { Insert }

PROCEDURE PrintTree(Pointer: Tree; VAR DataFile: TEXT);
{ Печать бинарного дерева }
BEGIN { PrintTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      PrintTree(Pointer^.Left, DataFile);
      { Pointer^.Word = '' - пробел, если хочешь отобразить 
        кол-во пробелов в тексте - убери условие }
      IF Pointer^.Word <> ''
      THEN 
        WRITELN(DataFile, Pointer^.Word, ' ', Pointer^.Counter);
      PrintTree(Pointer^.Right, DataFile);
    END                                     
END; { PrintTree }    


PROCEDURE CountWord(Word: STRING);
BEGIN { CountWord }
  Insert(Root, Word)
END; { CountWord }

PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);
BEGIN { PrintFileStatistic }
  IF WasOverflow
  THEN
    BEGIN
      SaveTree(Root); //сохранить остатки
      WriteTempFile(DataFile);
    END
  ELSE
    PrintTree(Root, DataFile)
END; { PrintFileStatistic }
  
BEGIN { InsertTree }
  WordAmount := 0;
  WasOverflow := FALSE;
  Root := NIL;                //tree's root
  ASSIGN(TempFile1, '~Temp1.txt'); //file, which contains saved tree after tree's overflow event
  REWRITE(TempFile1);
  ASSIGN(TempFile2, '~Temp2.txt'); 
  REWRITE(TempFile2)
END. { InsertTree }
