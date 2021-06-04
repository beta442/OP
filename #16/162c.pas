PROGRAM TestRemove(INPUT, OUTPUT);
{��������� ��������� ������ Queue:
 1) ���������� � �������-Q INPUT, ������������ ��� �����
 2) ������� ������ ������� � �������-Q � ������� ���������
 3) ������� �������-Q � OUTPUT }

USES Queue;

PROCEDURE RemoveExtraBlanks;
{������� ������ ������� ����� ������� �� ����� ������}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '#';
  AddQ(LineEnd); {�������� ����� ������ � �������}
  HeadQ(Ch);  {���� 1�� ������� �������}  
  WHILE Ch = Blank
  DO
    BEGIN
      DelQ;
      HeadQ(Ch)
    END;      
  WHILE Ch <> LineEnd
  DO
    BEGIN
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN  
          AddQ(Ch);
          DelQ;
          HeadQ(Ch)
        END;
      WHILE Ch = Blank
      DO
        BEGIN
          DelQ;
          HeadQ(Ch)
        END;
      IF Ch <> LineEnd
      THEN
        AddQ(Blank)
    END;  
  DelQ {������ LineEnd �� �������}
END; {RemoveExtraBlanks}

VAR
  Ch: CHAR;

BEGIN {TestRemove}
  EmptyQ;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      AddQ(Ch)
    END;
  WRITE('����:');
  WriteQ;
  RemoveExtraBlanks;
  WRITE('�����:');
  HeadQ(Ch);
  WriteQ;
  WRITELN
END. {TestRemove}
