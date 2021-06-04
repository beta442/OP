PROGRAM CountReverses(INPUT, OUTPUT);
{Считаем кол-во ревёрсов в входной строке}
USES
  Count3;
VAR
  W1, W2, W3, Hundreds, Tens, Ones: CHAR;
BEGIN {UseCount3}
  Start;
  Hundreds := '0';
  Tens := '0';
  Ones := '0';   
  IF NOT EOLN
  THEN
    BEGIN
      READ(W1);
      WRITE('Ввод: ', W1);
      IF NOT EOLN
      THEN
        BEGIN
          READ(W2);
          WRITE(W2);
          WHILE NOT EOLN
          DO
            BEGIN
              READ(W3);
              WRITE(W3);
              IF ((W2 >= W1) AND (W2 >= W3)) OR ((W2 < W1) AND (W2 < W3))
              THEN
                BEGIN
                  Bump;
                  Value(Hundreds, Tens, Ones)
                END;
              W1 := W2;
              W2 := W3
            END  
        END
    END
  ELSE
    WRITELN('Вы ничего не ввели');
  WRITELN;    
  WRITELN('Кол-во ревёрсов: ', Hundreds, Tens, Ones)     
END. {UseCount3}
