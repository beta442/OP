PROGRAM SarahRevere(INPUT, OUTPUT);
{����� ���ﭨ� Looking �� ���᪥ ��।������� �宦�����}
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  BEGIN {���樠������ W1,W2,W3,W4,Looking}
    W1 := ' ';
    W2 := ' ';
    W3 := ' ';
    W4 := ' ';
    Looking := 'Y';
  END; {���樠������ W1,W2,W3,W4,Looking}
  WHILE Looking = 'Y'
  DO
    BEGIN
      BEGIN {������� ����, �஢����� ����� ������}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        IF W4 = '#'
        THEN {����� ������}
          Looking := 'N'
      END; {������� ����, �஢����� ����� ������}
      BEGIN {�஢�ઠ ���� ���  'land'}
        IF W1 = 'l'
        THEN
          IF W2 = 'a'
          THEN
            IF W3 = 'n'
            THEN
              IF W4 = 'd'
              THEN {'land' �������}
                Looking := 'L'
      END; {�஢�ઠ ���� ���  'land'}
      BEGIN {�஢�ઠ ���� ��� 'sea'}
        IF W2 = 's'
        THEN
          IF W3 = 'e'
          THEN
             IF W4 = 'a'
             THEN {'sea' �������}
                Looking := 'S'
      END; {�஢�ઠ ���� ��� 'sea'}
    END;
  WRITELN('Looking is ', Looking)
  {������� ᮮ�饭�� Sarah}
END. {SarahRevere}