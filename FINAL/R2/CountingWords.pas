UNIT CountingWords;

INTERFACE      
       
PROCEDURE CountWord(Word: STRING);                                              { ��������� ����� Word � �������� ������ }
PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);                               { ������ ����������� ������ }

IMPLEMENTATION

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

{ ����������� �������� �������, � ��������� �� ������  }
         
VAR
  WordAmount: INTEGER;
  Root: Tree;
  HasOverflow, TreeSaved: BOOLEAN; //HasOverflow - ����� �� ������������ �� ������ ������, TreeSaved - ������ ���� ��� ���� ���������

PROCEDURE WriteTempFile(VAR TempFile: NodeFile);
{ ������� �������������� ����, ��������� �� ���� �����:
  ����1: �����-������, ����2: �������(���-�� ����)
  ��������� �������� ���� ���� � OUTPUT }
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
{ ������ �� ���� ��������� ������ � ������� �� � TreeHolder }
VAR
  SavedNode: TempNode;
BEGIN { SaveTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      SaveTreeIntoFile(Pointer^.Left, TreeHolder);
      //���������� ��������� SavedNode
      SavedNode.Word := Pointer^.Word;
      SavedNode.Counter := Pointer^.Counter;
      //������� �������� � �������������� ����� TreeHolder
      WRITE(TreeHolder, SavedNode);
      
      SaveTreeIntoFile(Pointer^.Right, TreeHolder)
    END  
END; { SaveTree }

PROCEDURE MergeTreeBackUpWithHistory(VAR BackUpFile, HistoryFile: NodeFile);
{ ����� ������ ���������, ������� ��� ����� - ����� ������ � ������� ������
  ������ - ��, ��� ���� � ��, ���� ��� ����������� ������ ������ �� ���������� }
VAR
  Temp1, Temp2: TempNode;  //� ������� ���� ����� ����� �������� �����
  TempFile: NodeFile;      //����, ���� �������� ��������� ���������� HistoryFile
  HasInsert: BOOLEAN;      //����� ������ ����! ������������� �������
BEGIN { MergeTreeBackUpWithHistory }
  REWRITE(TempFile);
  RESET(HistoryFile);
  
  //�� ��� ������� - ������ ��������� ������� � TempFile
  WHILE NOT EOF(HistoryFile)
  DO
    BEGIN
      READ(HistoryFile, Temp1);
      WRITE(TempFile, Temp1)
    END;
    
  REWRITE(HistoryFile);
  RESET(TempFile);     
  RESET(BackUpFile);
  

  //������� ���� ����� TempFile, BackUpFile ��� merge � HistoryFile
  WHILE NOT EOF(BackUpFile)
  DO
    BEGIN
      HasInsert := FALSE;
      READ(BackUpFile, Temp2);
      WHILE NOT EOF(TempFile)
      DO
        BEGIN
          READ(TempFile, Temp1);
          
          //������ ������� TempFile, ����������� ��� � History, �.�. �� ����� ����� ��� �������
          //�������� ��������, ����� �� ������������ ���� �������!!! (�������)
          IF Temp1.Word < Temp2.Word
          THEN
            BEGIN
              WRITE(HistoryFile, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-skipped insertion');
              CONTINUE
            END;  
          
          //���� �����������, ���������� ��������, ����������� �� ������ � ��� �������� � "�������"
          IF Temp1.Word = Temp2.Word
          THEN
            BEGIN
              Temp1.Counter := Temp1.Counter + Temp2.Counter;
              WRITE(HistoryFile, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-find equal');
              HasInsert := TRUE;
              BREAK
            END;
          
          //�� ����� ������ ����� � �������, �� ����� ����� ��� �������
          IF Temp1.Word > Temp2.Word
          THEN
            BEGIN
              WRITE(HistoryFile, Temp2, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-find insertion place');
              HasInsert := TRUE;
              BREAK
            END;
          
          //����� ���������� - ��� ����� �������, �� ���� ���������� ��, ��� �� ������ �� ������� ��������
          IF EOF(TempFile) THEN WRITE(HistoryFile, Temp2)
              
        END; 
      
      //����������� 3 �����, ��� �� ������� �� merge � ������, ��� ����� ������ ����� �����������
      IF NOT HasInsert THEN WRITE(HistoryFile, Temp2)
      
    END;         

  //������� ���������� ������� :) ���������������� � ������� ���� ������ merge

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

  //� ������� �� ������� ��� ����� ������, ��� ��� �������� ���         
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
  CurrentTreeBackUp, TreeHistory: NodeFile;

CONST
  MaxWordAmount = 20000;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ ����� ����� � �������� ������, ���������� �������� ������������ }

//��������� ����� ���������� ��������� ������!//

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
    
      { ����� ��� ���� � ������? 
        ����� ������ ��������� ������� �� 1, 
        ��� ������� � ������ }        
      IF Pointer^.Word = Word
      THEN
        Pointer^.Counter := Pointer^.Counter + 1
    END
END; { Insert }

CONST
  MaxWordSize = 50;

PROCEDURE WriteWordWithStatistic(VAR StatisticFile: TEXT; VAR Pointer: Tree);
{ ���� ������ �� ����������� ������ � ���������������� ��������
  � ��������� � ���� StatisticFile }
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
{ ���� �����, ��� � ���������� ���������, �� ������ ��� � ���������� �������
  �� ����� �������, ������������ ����������������� ������, ������ ���
  � ������ 255 ��������, � ����� �������� ������� ����� � �� ����������� �������? }
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
        WriteWordWithStatistic(DataFile, Pointer);
      PrintTree(Pointer^.Right, DataFile);
    END                                     
END; { PrintTree }    


PROCEDURE CountWord(Word: STRING);
BEGIN { CountWord }
  IF WordAmount < MaxWordAmount    //����� ������ �������, ���� ���� ����� � ����������
  THEN
    Insert(Root, Word)
  ELSE
    BEGIN  //�������� ������������
      Insert(Root, Word);          //����� ���������� ��, ��� �� ����������   
      HasOverflow := TRUE;         
      SaveTreeIntoFile(Root, CurrentTreeBackUp); //������������ ���������� ������ � �������������� ����
      TreeSaved := TRUE;
      EmptyTree(Root)                            //��������� ������
    END;
  IF HasOverflow
  THEN
    BEGIN
      MergeTreeBackUpWithHistory(CurrentTreeBackUp, TreeHistory);  //�� ������� ������������ �������� ������� ������ � ����-�������
      HasOverflow := FALSE
    END      
END; { CountWord }

PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);
{ ������ ��������� ����� ���������� }
BEGIN { PrintFileStatistic }
  IF TreeSaved //������ ��������� ������ � ��������������� �������
  THEN
    WriteSavedTreeTempFile(DataFile, TreeHistory)
  ELSE        //������ ������ ������������� ���������� ������, ������ ���, � ����
    PrintTree(Root, DataFile)
END; { PrintFileStatistic }
  
BEGIN { InsertTree }
  WordAmount := 0;
  HasOverflow := FALSE;
  TreeSaved := FALSE;
  Root := NIL;                              
  ASSIGN(CurrentTreeBackUp, '~Temp1.txt'); //���� ����� �������� ��������� � ���� ����� ������ � ������ ������������, ����� ����������� ������
  REWRITE(CurrentTreeBackUp);
  ASSIGN(TreeHistory, '~Temp2.txt');//���� ����� �������� (������ ���? � �� �����. ���� ���� � ���, ����� ����� ������ � ���� ������ � ����� �����)
  REWRITE(TreeHistory)              //            ��������� ������� ������ ������ (��, ����� ��������� ������� ������, �� ������ ��� �������???)
END. { InsertTree }
