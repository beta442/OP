UNIT BinaryTree;

INTERFACE

TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;      //поле ячейки, содержит в себе слово-символы
           Counter: INTEGER;  //счётчик, показывает, кол-во одинаково обработанных Word при вставке в дерево
           Left, Right: Tree  //указатели в бинарном дереве         
         END;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);                              { Вставляет слово Word в бинарное дерево }
PROCEDURE PrintTree(Pointer: Tree; VAR DataFile: TEXT);                         { Печатает бинарное дерево в DataFile }
                                                                                
IMPLEMENTATION

CONST
  MaxWordAmount = MAXINT;
         
VAR
  MaxWordLength, WordAmount: INTEGER;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ Кладёт слово в бинарное дерево }

//Требуется знать устройтсво бинарного дерева!//

BEGIN { Insert }
  IF WordAmount <= MaxWordAmount
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
    WRITE('Word amount limit - ', MaxWordAmount, ' - has reached');
END; { Insert }

CONST
  MaxWordSize = 100;

PROCEDURE WriteWordStatistic(Pointer: Tree; VAR DataFile: TEXT);
{ Печатает слово и его счётчик отформатированно, в зависимости от длины слова }
VAR
  BlankSize: INTEGER;
BEGIN
  WRITE(DataFile, Pointer^.Word);
  IF Length(Pointer^.Word) < MaxWordSize
  THEN
    BEGIN
      BlankSize := MaxWordSize - Length(Pointer^.Word);
      WHILE BlankSize <> 0
      DO
        BEGIN
          WRITE(DataFile, ' ');
          BlankSize := BlankSize - 1
        END
    END
  ELSE
    WRITE(DataFile, ' ');
  WRITELN(DataFile, Pointer^.Counter)  
END; 

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
        WriteWordStatistic(Pointer, DataFile);
      PrintTree(Pointer^.Right, DataFile);
    END  
END; { PrintTree }           

BEGIN { InsertTree }
  WordAmount := 0
END. { InsertTree }
