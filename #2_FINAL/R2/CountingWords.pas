UNIT CountingWords;

INTERFACE      
       
PROCEDURE CountWord(Word: STRING);                                              { Вставляет слово Word в бинарное дерево }
PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);                               { Печать содержимого дерева }

IMPLEMENTATION

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
  NodeFile = FILE OF TempNode; 

{ Реализовано бинарным деревом, с контролем по памяти  }
         
VAR
  WordAmount: INTEGER;
  Root: Tree;
  HasOverflow, TreeSaved: BOOLEAN; //HasOverflow - имеет ли переполнение на данный момент, TreeSaved - дерево хоть раз было сохранено

PROCEDURE WriteTempFile(VAR TempFile: NodeFile);
{ Имеется типизированный файл, состоящий из двух полей:
  поле1: слово-строка, поле2: счётчик(кол-во слов)
  Процедура печатает этот файл в OUTPUT }
VAR
  Temp: TempNode;
BEGIN
  RESET(TempFile);
  WHILE NOT EOF(TempFile)
  DO
    BEGIN
      READ(TempFile, Temp);
      WRITELN(Temp.Word)
    END
END;

PROCEDURE SaveTreeIntoFile(VAR Pointer: Tree; VAR TreeHolder: NodeFile);
{ Пройди по всем элементам дерева и сохрани их в TreeHolder }
VAR
  SavedNode: TempNode;
BEGIN { SaveTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      SaveTreeIntoFile(Pointer^.Left, TreeHolder);
      //подготовим контейнер SavedNode
      SavedNode.Word := Pointer^.Word;
      SavedNode.Counter := Pointer^.Counter;
      //который сохраним в типизированном файле TreeHolder
      WRITE(TreeHolder, SavedNode);
      
      SaveTreeIntoFile(Pointer^.Right, TreeHolder)
    END  
END; { SaveTree }

PROCEDURE MergeTreeBackUpWithHistory(VAR BackUpFile, HistoryFile: NodeFile);
{ Самая жёсткая процедура, имеются два файла - бэкап дерева и история работы
  дерева - то, что было в нём, если уже происходили сбросы дерева из оперативки }
VAR
  Temp1, Temp2: TempNode;  //с помощью этих ячеек будем тасовать файлы
  TempFile: NodeFile;      //файл, куда временно скопируем содержимое HistoryFile
  HasInsert: BOOLEAN;      //очень крутой флаг! контроллируем вставку
BEGIN { MergeTreeBackUpWithHistory }
  REWRITE(TempFile);
  RESET(HistoryFile);
  
  //ну тут понятно - просто сохранили историю в TempFile
  WHILE NOT EOF(HistoryFile)
  DO
    BEGIN
      READ(HistoryFile, Temp1);
      WRITE(TempFile, Temp1)
    END;
    
  REWRITE(HistoryFile);
  RESET(TempFile);     
  RESET(BackUpFile);
  

  //готовим наши файлы TempFile, BackUpFile для merge в HistoryFile
  WHILE NOT EOF(BackUpFile)
  DO
    BEGIN
      HasInsert := FALSE;
      READ(BackUpFile, Temp2);
      WHILE NOT EOF(TempFile)
      DO
        BEGIN
          READ(TempFile, Temp1);
          
          //просто листаем TempFile, транслируюя его в History, т.к. не нашли место для вставки
          //обратите внимание, здесь не активируется флаг вставки!!! (логично)
          IF Temp1.Word < Temp2.Word
          THEN
            BEGIN
              WRITE(HistoryFile, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-skipped insertion');
              CONTINUE
            END;  
          
          //наша остановочка, складываем счётчики, поступивший из дерева и уже лежавший в "системе"
          IF Temp1.Word = Temp2.Word
          THEN
            BEGIN
              Temp1.Counter := Temp1.Counter + Temp2.Counter;
              WRITE(HistoryFile, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-find equal');
              HasInsert := TRUE;
              BREAK
            END;
          
          //не нашли такого слова в системе, но нашли место для вставки
          IF Temp1.Word > Temp2.Word
          THEN
            BEGIN
              WRITE(HistoryFile, Temp2, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-find insertion place');
              HasInsert := TRUE;
              BREAK
            END;
          
          //самое интересное - два ниних условия, по сути допечатать то, что не прошло по верхним условиям
          IF EOF(TempFile) THEN WRITE(HistoryFile, Temp2)
              
        END; 
      
      //представьте 3 файла, два из которых вы merge в третий, это нужно просто смочь представить
      IF NOT HasInsert THEN WRITE(HistoryFile, Temp2)
      
    END;         

  //оставил отладочные команды :) разкомментируйте и увидите логи работы merge

  {WRITELN;
  WriteTempFile(TempFile);
  WRITELN('TempFile - What was');
  WRITELN;    
  WriteTempFile(BackUpFile);
  WRITELN('SavedTree - What need to be inserted');
  WRITELN;
  WriteTempFile(HistoryFile);
  WRITELN('History - after insertion');
  WRITELN;}

  //и конечно же удалаем наш бекап дерева, ибо уже соранили его         
  REWRITE(BackUpFile)  
END; { MergeTreeBackUpWithHistory }

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
  CurrentTreeBackUp, TreeHistory: NodeFile;

CONST
  MaxWordAmount = 20000;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ Кладёт слово в бинарное дерево, реализован контроль переполнения }

//Требуется знать устройтсво бинарного дерева!//

BEGIN { Insert }
  IF Pointer = NIL
  THEN
    BEGIN
      NEW(Pointer);
      Pointer^.Word := Word;        
      Pointer^.Counter := 1;
      Pointer^.Left := NIL;
      Pointer^.Right := NIL;
      WordAmount := WordAmount + 1   
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
END; { Insert }

CONST
  MaxWordSize = 50;

PROCEDURE WriteWordWithStatistic(VAR StatisticFile: TEXT; VAR Pointer: Tree);
{ Берёт ячейку из оперативной памяти и отформатированно печатает
  её содеримое в файл StatisticFile }
VAR
  BlankSize: INTEGER;
BEGIN { WriteWordWithStatistic }
  WRITE(StatisticFile, Pointer^.Word);
  
  IF Length(Pointer^.Word) < MaxWordSize
  THEN
    BlankSize := MaxWordSize - Length(Pointer^.Word)
  ELSE
    BlankSize := 1;  
  
  FOR BlankSize := BlankSize DOWNTO 0
  DO
    WRITE(StatisticFile, ' ');
    
  WRITELN(StatisticFile, Pointer^.Counter)   
           
END; { WriteWordWithStatistic }

PROCEDURE WriteSavedTreeTempFile(VAR StatisticFile: TEXT; VAR DataFile: NodeFile);
{ Тоже самое, что и предыдущая процедура, но работа уже с постоянной памятью
  Не делал функцию, возвращающую отформатированную строку, потому что
  в строке 255 символов, а вдруг попадётся большое слово и не отобразится счётчик? }
VAR
  BlankSize: INTEGER;
  Temp: TempNode;
BEGIN { WriteSavedTreeTempFile }
  RESET(DataFile);
  WHILE NOT EOF(DataFile)
  DO
    BEGIN
      READ(DataFile, Temp);
      
      WRITE(StatisticFile, Temp.Word);
      
      IF Length(Temp.Word) < MaxWordSize
      THEN
        BlankSize := MaxWordSize - Length(Temp.Word)
      ELSE
        BlankSize := 1;  
  
      FOR BlankSize := BlankSize DOWNTO 0
      DO
        WRITE(StatisticFile, ' ');
        
      WRITELN(StatisticFile, Temp.Counter)  
      
    END            
END; { WriteSavedTreeTempFile }

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
        WriteWordWithStatistic(DataFile, Pointer);
      PrintTree(Pointer^.Right, DataFile);
    END                                     
END; { PrintTree }    


PROCEDURE CountWord(Word: STRING);
BEGIN { CountWord }
  IF WordAmount < MaxWordAmount    //будем делать вставку, пока есть место в оперативке
  THEN
    Insert(Root, Word)
  ELSE
    BEGIN  //контроль переполнения
      Insert(Root, Word);          //нужно довставить то, что не вместилось   
      HasOverflow := TRUE;         
      SaveTreeIntoFile(Root, CurrentTreeBackUp); //оттранслирем содержимое дерева в типизированный файл
      TreeSaved := TRUE;
      EmptyTree(Root)                            //уничтожим дерево
    END;
  IF HasOverflow
  THEN
    BEGIN
      MergeTreeBackUpWithHistory(CurrentTreeBackUp, TreeHistory);  //по наличию переполнения единожды сливаем данные в файл-истории
      HasOverflow := FALSE
    END      
END; { CountWord }

PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);
{ Печать итогового файла статистики }
BEGIN { PrintFileStatistic }
  IF TreeSaved //значит предстоит работа с типизированными файлами
  THEN
    WriteSavedTreeTempFile(DataFile, TreeHistory)
  ELSE        //значит просто оттранслируем содержимое дерево, обойдя его, в файл
    PrintTree(Root, DataFile)
END; { PrintFileStatistic }
  
BEGIN { InsertTree }
  WordAmount := 0;
  HasOverflow := FALSE;
  TreeSaved := FALSE;
  Root := NIL;                              
  ASSIGN(CurrentTreeBackUp, '~Temp1.txt'); //файл будет временно содержать в себе бэкап дерева в момент переполнения, после уничтожения дерева
  REWRITE(CurrentTreeBackUp);
  ASSIGN(TreeHistory, '~Temp2.txt');//файл будет временно (почему так? я не понял. идея была в том, чтобы иметь доступ к этим файлам в любое время)
  REWRITE(TreeHistory)              //            содержать историю работы дерева (ну, бекап удаляется понятно почему, но почему нет истории???)
END. { InsertTree }
