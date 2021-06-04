PROGRAM Stat(INPUT, OUTPUT);
{ Программа опредеяет минимальное, максимальное и среднеарифмитическое число
  для файла целых чисел. Реализован контроль переполнения }

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
{В D возвращается цифра, соответствующая цифре-символу, прочтённому из F}
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN
  THEN
    BEGIN
      READ(F, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9
    END
END; {ReadDigit}

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
{В N возвращается число, прочитанное из F}
VAR
  Digit, PossibleFrontier: INTEGER;
  Overflow: BOOLEAN; 
BEGIN {ReadNumber}
  N := 0;
  IF NOT EOLN
  THEN
    BEGIN
      Digit := 0;
      Overflow := FALSE;
      PossibleFrontier := MAXINT DIV 10;    
      WHILE NOT Overflow AND (Digit <> -1)
      DO
        BEGIN
          IF (N > PossibleFrontier) OR ((N = PossibleFrontier) AND (Digit > 7))
          THEN
            Overflow := TRUE;
          IF Overflow
          THEN
            N := -1
          ELSE  
            N := N * 10 + Digit;
          ReadDigit(F, Digit)      
        END           
    END    
END; {ReadNumber}

VAR
  Number, Sum, CountOfNumbers, MaxNumber, MinNumber, MathAverage, Reminder: INTEGER;
  Overflow: BOOLEAN;
BEGIN {Stat}
  Overflow := FALSE;
  MaxNumber := 0;
  MinNumber := MAXINT;
  MathAverage := 0;
  CountOfNumbers := 0;
  Sum := 0;
  Number := 0;      
  WHILE NOT EOLN AND NOT Overflow AND (Number <> -1)     { Складываем числа, счётчик += 1 }
  DO
    BEGIN
      ReadNumber(INPUT, Number);    
      IF Number <> -1
      THEN
        BEGIN
          Sum := Sum + Number;            
          WRITELN(Number);
          IF Number < MinNumber           { Ищем макс. и миним. значения }
          THEN
            MinNumber := Number;
          IF Number > MaxNumber
          THEN
            MaxNumber := Number;
          CountOfNumbers := CountOfNumbers + 1;
        END;
      Overflow := (Sum + Number) > MAXINT;
      IF Overflow THEN WRITELN('Err, Overflow!')            
    END;
  IF MinNumber = MAXINT
  THEN
    MinNumber := 0;  
  IF CountOfNumbers <> 0
  THEN
    BEGIN
      MathAverage := Sum DIV CountOfNumbers;
      Reminder := Sum MOD CountOfNumbers;            { целый остаток? }
      IF ((Reminder * 10) MOD CountOfNumbers) <> 0   
      THEN
        Reminder := (Reminder * 100) DIV CountOfNumbers
    END;  
  IF Overflow
  THEN
    WRITE('Err, overflow!')
  ELSE
    BEGIN
      WRITELN('MinNumber  :', MinNumber: 10);
      WRITELN('MaxNumber  :', MaxNumber: 10);
      WRITELN('Sum        :', Sum: 10);
      WRITE('MathAverage:', MathAverage: 10);
      WRITELN('.', Reminder)
    END    
END. {Stat}
