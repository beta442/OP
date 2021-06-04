UNIT BinaryTree;

INTERFACE

TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;      //���� ������, �������� � ���� �����-�������
           Counter: INTEGER;  //�������, ����������, ���-�� ��������� ������������ Word ��� ������� � ������
           Left, Right: Tree  //��������� � �������� ������         
         END;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);                              { ��������� ����� Word � �������� ������ }
PROCEDURE PrintTree(Pointer: Tree; VAR DataFile: TEXT);                         { �������� �������� ������ � DataFile }
                                                                                
IMPLEMENTATION

CONST
  MaxWordAmount = MAXINT;
         
VAR
  MaxWordLength, WordAmount: INTEGER;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ ����� ����� � �������� ������ }

//��������� ����� ���������� ��������� ������!//

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
    
        { ����� ��� ���� � ������? 
          ����� ������ ��������� ������� �� 1, 
          ��� ������� � ������ }        
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
{ �������� ����� � ��� ������� ����������������, � ����������� �� ����� ����� }
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
        WriteWordStatistic(Pointer, DataFile);
      PrintTree(Pointer^.Right, DataFile);
    END  
END; { PrintTree }           

BEGIN { InsertTree }
  WordAmount := 0
END. { InsertTree }
