PROGRAM TestRemove(INPUT, OUTPUT);
{��������� ��������� ������ Queue:
 1) ���������� � �������-Q INPUT
 2) ������� 1�� ������� �������-Q
 3) ������� �������-Q � OUTPUT }
USES Queue;
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
  WRITE('����: ');
  WriteQ;
  DelQ;
  WRITE('�����: ');
  WriteQ
END. {TestRemove}
