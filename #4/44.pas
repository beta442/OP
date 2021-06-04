PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать сообщения о том как идут британцы, в зависимости
от того, первым во входе встречается 'land', 'sea' или 'by air'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  BEGIN {Инициализация W1,W2,W3,W4,Looking}
    W1 := ' ';
    W2 := ' ';
    W3 := ' ';
    W4 := ' ';
    Looking := 'Y';
  END; {Инициализация W1,W2,W3,W4,Looking}
  WHILE Looking = 'Y'
  DO
    BEGIN
      BEGIN {Двигать окно, проверять конец данных}
        W1 := W2;
        W2 := W3;
        W3 := W4;
        READ(W4);
        IF W4 = '#'
        THEN {Конец данных}
          Looking := 'N'
      END; {Двигать окно, проверять конец данных}
      BEGIN {Проверка окна для  'land'}
        IF W1 = 'l'
        THEN
          IF W2 = 'a'
          THEN
            IF W3 = 'n'
            THEN
              IF W4 = 'd'
              THEN {'land' найдено}
                Looking := 'L'
      END; {Проверка окна для  'land'}
      BEGIN {Проверка окна для 'sea'}
        IF W2 = 's'
        THEN
          IF W3 = 'e'
          THEN
             IF W4 = 'a'
             THEN {'sea' найдено}
                Looking := 'S'
      END; {Проверка окна для 'sea'}
      BEGIN {Проверка окна для 'by air'}
        IF W2 = 'a'
        THEN
          IF W3 = 'i'
          THEN
            IF W4 = 'r'
            THEN
              Looking := 'A'
      END; {Проверка окна для 'by air'}
    END;
  BEGIN {Создать сообщение Sarah}
    IF Looking = 'L'
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF Looking = 'S'
      THEN
        WRITELN('The British are coming by sea.')
      ELSE
        IF Looking = 'A'
        THEN
          WRITELN('The British are coming by air.')
        ELSE
          WRITELN('Sarah didn''t say')
  END {Создать сообщение Sarah}
END. {SarahRevere}