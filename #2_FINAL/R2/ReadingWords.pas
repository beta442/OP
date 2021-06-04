UNIT ReadingWords;

INTERFACE
                     
FUNCTION ReadWord(VAR Word: STRING): STRING;                                          { ������ �� INPUT ����� � Word, ���������� ��� }

IMPLEMENTATION

CONST
  ValidSymbols = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                  '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
                  '�', '�', '�', '�', '�', '�', '�',
                  '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
                  '�', '�', '�', '�', '�', '�', '�', '-'];
  SpecialSymbols = ['-'];                  

PROCEDURE DoCharSmall(VAR Symbol: CHAR);
{ ������ ������-Symbol ��������(���������), ������ "�" -> "�"  }
BEGIN { DoCharSmall }
               { English alphabet }                    { ������� ������� }
  IF Symbol = 'A' THEN Symbol := 'a' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'B' THEN Symbol := 'b' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'C' THEN Symbol := 'c' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'D' THEN Symbol := 'd' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'E' THEN Symbol := 'e' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'F' THEN Symbol := 'f' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'G' THEN Symbol := 'g' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'H' THEN Symbol := 'h' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'I' THEN Symbol := 'i' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'J' THEN Symbol := 'j' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'K' THEN Symbol := 'k' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'L' THEN Symbol := 'l' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'M' THEN Symbol := 'm' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'N' THEN Symbol := 'n' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'O' THEN Symbol := 'o' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'P' THEN Symbol := 'p' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'Q' THEN Symbol := 'q' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'R' THEN Symbol := 'r' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'S' THEN Symbol := 's' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'T' THEN Symbol := 't' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'U' THEN Symbol := 'u' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'V' THEN Symbol := 'v' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'W' THEN Symbol := 'w' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'X' THEN Symbol := 'x' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'Y' THEN Symbol := 'y' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'Z' THEN Symbol := 'z' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' 
  
END; { DoCharSmall }

PROCEDURE DoCharBigger(VAR Symbol: CHAR);
{ ������ ������-Symbol ���������(���������), ������ "�" -> "�" }
BEGIN { DoCharBigger }
               { English alphabet }                    { ������� ������� }
  IF Symbol = 'a' THEN Symbol := 'A' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'b' THEN Symbol := 'B' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'c' THEN Symbol := 'C' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'd' THEN Symbol := 'D' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'e' THEN Symbol := 'E' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'f' THEN Symbol := 'F' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'g' THEN Symbol := 'G' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'h' THEN Symbol := 'H' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'i' THEN Symbol := 'I' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'j' THEN Symbol := 'J' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'k' THEN Symbol := 'K' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'l' THEN Symbol := 'L' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'm' THEN Symbol := 'M' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'n' THEN Symbol := 'N' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'o' THEN Symbol := 'O' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'p' THEN Symbol := 'P' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'q' THEN Symbol := 'Q' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'r' THEN Symbol := 'R' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 's' THEN Symbol := 'S' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 't' THEN Symbol := 'T' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'u' THEN Symbol := 'U' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'v' THEN Symbol := 'V' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'w' THEN Symbol := 'W' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'x' THEN Symbol := 'X' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'y' THEN Symbol := 'Y' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
  IF Symbol = 'z' THEN Symbol := 'Z' ELSE IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' ELSE
                                          IF Symbol = '�' THEN Symbol := '�' 
  
END; { DoCharBigger }

CONST
  MaxWordLength = 50;

FUNCTION FormatWord(VAR Word: STRING): STRING;
{ ����������� ����� }
VAR
  I: INTEGER;
BEGIN { FormatWord }
  FOR I := 1 TO Length(Word)
  DO
    DoCharSmall(Word[I]);      //������� ��� ����� ���������(����������)
  DoCharBigger(Word[1]);       //������� ������ ������ ������ ���������(�������)
    
  FormatWord := Word
END; { FormatWord }

FUNCTION ReadWord(VAR Word: STRING): STRING;
{ ������ ����� �� INPUT � ����� ��� ����������������� �� ������� ���������� Word }
VAR
  Symbol: CHAR;
BEGIN { ReadWord }

  Word := '';

  WHILE NOT EOF AND (Symbol <> ' ') 
  DO
    BEGIN
      READ(Symbol);
      IF Symbol IN ValidSymbols
      THEN
        Word := Word + Symbol
      ELSE
        //�������� ���������� �����
        Symbol := ' '  
    END;

  //���������� ����� 1-�����, ��������� �� ����������� ��������
  IF (Length(Word) = 1) AND (Word[1] IN SpecialSymbols)
  THEN
    Word := '';
  
  IF Word <> '' THEN Word := FormatWord(Word);
  
  ReadWord := Word   
END; { ReadWord }

BEGIN { ReadWord }

END. { ReadWord }
