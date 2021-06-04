PROGRAM Prime(INPUT, OUTPUT);
{ The program implements sieve of Eratosthenes }
CONST
  MaxNumber = 226;
VAR
  Prime, Number, Temp: INTEGER;  
  Sieve: SET OF 2 .. 10000;
BEGIN {Prime}
  Sieve := [2 .. MaxNumber];
  Prime := 2;
  Number := 2;
  WRITE('Primes: ');
  WHILE Sieve <> []
  DO
    BEGIN
      IF Prime IN Sieve
      THEN
        WRITE(Prime, ' ');
      Temp := Number;
      IF Number IN Sieve
      THEN
        BEGIN
          WHILE Number <= MaxNumber
          DO
            BEGIN
              IF Number MOD Prime = 0
              THEN
                Sieve := Sieve - [Number];  
              Number := Number + 1    
            END
        END;
      Number := Temp + 1;
      Prime := Number        
    END; 
  WRITELN       
END. {Prime}
