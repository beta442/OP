PROGRAM SarahRevere(INPUT, OUTPUT);
{����� ᮤ�ন���� ���� (W1, W2, W3, W4)}
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  BEGIN {���樠������ W1,W2,W3,W4,Looking}
    W1 := ' ';
    W2 := ' ';
    W3 := ' ';
    W4 := ' ';
    Looking := 'Y'
  END; {���樠������ W1,W2,W3,W4,Looking}
  WHILE Looking = 'Y'
  DO
    BEGIN
      BEGIN {������� ����, �஢����� ����� ������}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        WRITE(W1, W2, W3, W4, ', ');
        IF W4 = '#'
        THEN {����� ������}
          Looking := 'N'
      END; {������� ����, �஢����� ����� ������}
      {�஢�ઠ ���� ���  'land'}
      {�஢�ઠ ���� ��� 'sea'}
    END;
  {������� ᮮ�饭�� Sarah}
END. {SarahRevere}
{https://vk.cc/aAQqUP}