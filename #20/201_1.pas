PROGRAM Prime(INPUT, OUTPUT);
CONST
  MaxNumber = 100;
VAR
  Number, Prime, Temp: INTEGER;
  Sieve: SET OF 2 .. 100;
BEGIN {Prime}
  Number := 2;
  Prime := 2;
  Sieve := [2 .. MaxNumber];
  WRITE('Primes in range to ', MaxNumber, ': ');
  WHILE Sieve <> []
  DO
    BEGIN
      IF Prime IN Sieve
      THEN
        WRITE(Prime, ' ');
      Temp := Number;
      WHILE Number <= MaxNumber
      DO
        BEGIN
          IF Number MOD Prime = 0
          THEN
            Sieve := Sieve - [Number];
          Number := Number + 1  
        END;  
      Number := Temp + 1;
      Prime := Number
    END;
  WRITELN  
END. {Prime}
  
