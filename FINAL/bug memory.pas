UNIT CountingWords;

INTERFACE     

TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;      //���� ������, �������� � ���� �����-�������
           Counter: INTEGER;  //�������, ����������, ���-�� ��������� ������������ Word ��� ������� � ������
           Left, Right: Tree  //��������� � �������� ������         
         END;
            
  TempNode = RECORD
               Word: STRING;
               Counter: INTEGER
             END;
  NodeFile = FILE OF TempNode;  
       
PROCEDURE WriteTempFile(VAR TempFile: NodeFile);
PROCEDURE CountWord(Word: STRING);                                              { ��������� ����� Word � �������� ������ }
PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);                               { ������ ����������� ������ }

IMPLEMENTATION

{ ����������� �������� �������, � ��������� �� ������  }
         
VAR
  WordAmount: INTEGER;
  Root: Tree;
  HadOverflow, TreeSaved: BOOLEAN;
  LastWord: STRING;

PROCEDURE WriteTempFile(VAR TempFile: NodeFile);
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

PROCEDURE SaveTreeIntoFile(VAR Pointer: Tree; VAR SavedTree: NodeFile);
{ ������ �� ���� ��������� ������ � ������� �� }
VAR
  SavedNode: TempNode;
BEGIN { SaveTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      SaveTreeIntoFile(Pointer^.Left, SavedTree);
      
      SavedNode.Word := Pointer^.Word;
      SavedNode.Counter := Pointer^.Counter;
      
      WRITE(SavedTree, SavedNode);
      
      SaveTreeIntoFile(Pointer^.Right, SavedTree)
    END  
END; { SaveTree }

PROCEDURE MergeTreeBackUpWithHistory(VAR BackUpFile, HistoryFile: NodeFile);
VAR
  Temp1, Temp2: TempNode;
BEGIN { MergeTreeBackUpWithHistory } 
  RESET(BackUpFile);
  WHILE NOT EOF(BackUpFile)
  DO
    BEGIN
      READ(BackUpFile, Temp1);
      WRITE(HistoryFile, Temp1)
    END;
  WriteTempFile(HistoryFile);
  WRITELN;       
  REWRITE(BackUpFile)  
END; { MergeTreeBackUpWithHistory }

{PROCEDURE MergeTreeBackUpWithHistory(VAR BackUpFile: NodeFile; VAR HistoryFile: NodeFile);
VAR
  TempFile: NodeFile;
  Temp1, Temp2: TempNode;
BEGIN  MergeTreeBackUpWithHistory 
  //WriteTempFile(BackUpFile);
  //WRITELN;
  REWRITE(TempFile);
  RESET(HistoryFile);
  WHILE NOT EOF(HistoryFile)
  DO
    BEGIN
      READ(HistoryFile, Temp1);
      WRITE(TempFile, Temp1)      
    END;
  REWRITE(HistoryFile);  
  RESET(BackUpFile);
  RESET(TempFile);
  WHILE NOT EOF(BackUpFile)
  DO
    BEGIN
      //WRITELN('HERE!!!!');
      IF NOT EOF(TempFile)
      THEN
        READ(TempFile, Temp1); 
      READ(BackUpFile, Temp2);
      WRITE(HistoryFile, Temp2);
      WRITELN(Temp1.Word, Temp2.Word);
      IF Temp1.Word < Temp2.Word
      THEN
        WRITE(HistoryFile, Temp1);
      IF Temp1.Word > Temp2.Word
      THEN
        WRITE(HistoryFile, Temp2, Temp1);
      IF Temp1.Word = Temp2.Word
      THEN
        BEGIN
          Temp1.Counter := Temp1.Counter + Temp2.Counter;
          WRITE(HistoryFile, Temp1)
        END;
      IF EOF(TempFile) AND (Temp1.Word <> Temp2.Word)
      THEN
        WRITE(HistoryFile, Temp2)      
    END;
  //WriteTempFile(HistoryFile);
  //WRITELN;                           
  WHILE NOT EOF(TempFile)
  DO
    BEGIN
      READ(TempFile, Temp1);
      WRITE(HistoryFile, Temp1)
    END;
  WriteTempFile(HistoryFile);
  WRITELN;  
  REWRITE(BackUpFile)  
END; { MergeTreeBackUpWithHistory }

PROCEDURE EmptyTree(VAR Pointer: Tree);
{ ��������� ��� ������� ����������� ������  }
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
  CurrentTreeBackUp, TreeHistory, TempFile: NodeFile;

CONST
  MaxWordAmount = 3;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ ����� ����� � �������� ������, ���������� �������� ������������ }

//��������� ����� ���������� ��������� ������!//

VAR
  Temp: TempNode;

BEGIN { Insert }
  IF Pointer = NIL
  THEN
    BEGIN
      NEW(Pointer);
      LastWord := Word;
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
    
      { ����� ��� ���� � ������? 
        ����� ������ ��������� ������� �� 1, 
        ��� ������� � ������ }        
      IF Pointer^.Word = Word
      THEN
        Pointer^.Counter := Pointer^.Counter + 1
    END
END; { Insert }

PROCEDURE PrintTree(Pointer: Tree; VAR DataFile: TEXT);
{ ������ ��������� ������ }
BEGIN { PrintTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      PrintTree(Pointer^.Left, DataFile);
      { Pointer^.Word = '' - ������, ���� ������ ���������� 
        ���-�� �������� � ������ - ����� ������� }
      IF Pointer^.Word <> ''
      THEN 
        WRITELN(DataFile, Pointer^.Word, ' ', Pointer^.Counter);
      PrintTree(Pointer^.Right, DataFile);
    END                                     
END; { PrintTree }    


PROCEDURE CountWord(Word: STRING);
BEGIN { CountWord }
  IF HadOverflow = TRUE
  THEN
    BEGIN
      MergeTreeBackUpWithHistory(CurrentTreeBackUp, TreeHistory);
      HadOverflow := FALSE
    END;
  IF WordAmount < MaxWordAmount
  THEN
    Insert(Root, Word)
  ELSE
    BEGIN  //�������� ������������
      Insert(Root, Word);  
      HadOverflow := TRUE;
      SaveTreeIntoFile(Root, CurrentTreeBackUp);
      EmptyTree(Root)
    END  
END; { CountWord }

PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);
BEGIN { PrintFileStatistic }
  //WRITELN;                 
  //WriteTempFile(TreeHistory);
  PrintTree(Root, DataFile)
END; { PrintFileStatistic }
  
BEGIN { InsertTree }
  WordAmount := 0;
  HadOverflow := FALSE;
  TreeSaved := FALSE;
  Root := NIL;                //tree's root
  ASSIGN(CurrentTreeBackUp, '~Temp1.txt'); //file, which contains saved tree after tree's overflow event
  REWRITE(CurrentTreeBackUp);
  ASSIGN(TreeHistory, '~Temp2.txt');
  REWRITE(TempFile);
  ASSIGN(TempFile, '~Temp3.txt'); 
  REWRITE(TreeHistory)
END. { InsertTree }
