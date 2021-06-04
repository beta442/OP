PROGRAM SarahRevere(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  Looking := 'Y';
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  WHILE Looking = 'Y'
  DO
    BEGIN {WHILE Looking = 'Y'}
      {Window is moving, cheking '#'}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN
        Looking := 'N';
      {Checking up 'land'}
      IF W1 = 'l'
      THEN
        IF W2 = 'a'
        THEN
          IF W3 = 'n'
          THEN
            IF W4 = 'd'
            THEN
              Looking := 'L';
      {Cheking up 'sea'}
      IF W2 = 's' {проверка 'sea'}
      THEN
        IF W3 = 'e'
        THEN
          IF W4 = 'a'
          THEN
            Looking := 'S';
    END; {WHILE Looking = 'Y'}
    IF Looking = 'L'
    THEN
      WRITELN('by land')
    ELSE
      IF Looking = 'S'
      THEN
        WRITELN('by sea')
      ELSE
        WRITELN('Sarah didn''t say');
  WRITELN
END. {SarahRevere}
