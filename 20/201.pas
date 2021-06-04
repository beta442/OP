PROGRAM Prime(INPUT, OUTPUT);
{ Программа находит простые числа в заданном диапазоне }
CONST
  MinNumber = 2;
  MaxNumber = 100;
TYPE
  Numbers = SET OF MinNumber .. MaxNumber;
VAR
  NumberInSieve, Prime: INTEGER;
  Sieve: Numbers;
BEGIN {Prime}
  Sieve := [MinNumber .. MaxNumber];
  Prime := MinNumber;                                             // First prime
  WRITELN('Primes in range up to ', MaxNumber, ' will be: ');
  WHILE Sieve <> []
  DO
    BEGIN
      IF Prime IN Sieve
      THEN
        BEGIN
          WRITE(Prime, ' ');
          NumberInSieve := Prime;                                        // Init number
          WHILE NumberInSieve <= MaxNumber
          DO
            BEGIN
              Sieve := Sieve - [NumberInSieve];
              NumberInSieve := NumberInSieve + Prime;  //  Number is already multiple to Prime
            END
        END;   
      Prime := Prime + 1   
    END;
  WRITELN      
END. {Prime}
