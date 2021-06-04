UNIT CountingWords1;

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

PROCEDURE CountWord(Word: STRING);                                              { ��������� ����� Word � �������� ������ }
PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);                               { ������ ����������� ������ }

IMPLEMENTATION

{ ����������� �������� �������, � ��������� �� ������  }

CONST
  MaxWordAmount = 20;
         
VAR
  WordAmount: INTEGER;
  WasOverflow: BOOLEAN;

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
  TempFile1, TempFile2: FILE OF TempNode;

PROCEDURE SaveNode(VAR SavedNode: TempNode);
{ ���� ������ ������������ ��������� � �������� � � �������������� ���� }
VAR
  Temp: TempNode;
BEGIN { SaveNode }
  RESET(TempFile1);
  REWRITE(TempFile2);
  
  //������� ���� �� ���� �����
  IF EOF(TempFile1) THEN WRITE(TempFile1, SavedNode);
  RESET(TempFile1);

  //����������� �1 � �2, ������� ���� ����� ��� ������� ������
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

  //������� ��������� �1 �� �2
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
{ ��������� ��� ������ ��������� ����� � DataFile }
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
{ ������ �� ���� ��������� ������ � ������� �� }
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
{ ����� ����� � �������� ������, ���������� �������� ������������ }

//��������� ����� ���������� ��������� ������!//

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
    
        { ����� ��� ���� � ������? 
          ����� ������ ��������� ������� �� 1, 
          ��� ������� � ������ }        
        IF Pointer^.Word = Word
        THEN
          Pointer^.Counter := Pointer^.Counter + 1
      END
  ELSE     
    BEGIN //�������� ������������
      SaveTree(Root);
      EmptyTree(Root);
      DISPOSE(Root);
      Root := NIL;
      WordAmount := 0;
      WasOverflow := TRUE
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
  Insert(Root, Word)
END; { CountWord }

PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);
BEGIN { PrintFileStatistic }
  IF WasOverflow
  THEN
    BEGIN
      SaveTree(Root); //��������� �������
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
