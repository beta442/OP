PROGRAM Stat(INPUT, OUTPUT);

FUNCTION ReadNumber(VAR F: TEXT): INTEGER;
{
  Хорошая версия + работает!
}
VAR
  Number, Digit: INTEGER;
  BlankEater: CHAR;
  Overflow: BOOLEAN;  
  FUNCTION ReadDigit(VAR F: TEXT): INTEGER;
  {
    Функция возвращает число, соответствующее символу-цифре
  }
  VAR
    Ch: CHAR;
    Digit: INTEGER;
  BEGIN {ReadDigit}
    IF NOT EOLN(F) 
    THEN
      READ(F, Ch);
    IF Ch = '0' THEN Digit := 0 ELSE
    IF Ch = '1' THEN Digit := 1 ELSE
    IF Ch = '2' THEN Digit := 2 ELSE
    IF Ch = '3' THEN Digit := 3 ELSE
    IF Ch = '4' THEN Digit := 4 ELSE
    IF Ch = '5' THEN Digit := 5 ELSE
    IF Ch = '6' THEN Digit := 6 ELSE
    IF Ch = '7' THEN Digit := 7 ELSE
    IF Ch = '8' THEN Digit := 8 ELSE
    IF Ch = '9' THEN Digit := 9 
                ELSE Digit := -1;    
    ReadDigit := Digit
  END; {ReadDigit}
BEGIN {ReadNumber}
  Number := 0;
  Digit := 0;
  Overflow := FALSE;
  WHILE NOT EOF(F) AND (Digit <> -1) AND NOT Overflow
  DO
    BEGIN         
      IF Number > 3276
      THEN
        Overflow := TRUE
      ELSE
        IF Number = 3276
        THEN
          IF Digit > 7
          THEN
            Overflow := TRUE;              
      IF Overflow     {>INTMAX? (32767)}
      THEN
        Number := -1
      ELSE
        Number := Number * 10 + Digit;
      Digit := ReadDigit(F);        
    END;
  ReadNumber := Number
END; {ReadNumber}

VAR
  Number, Sum, CountOfNumbers, MaxInt, MinInt, MathAverage: INTEGER;
BEGIN {TestFunction}
  MaxInt := 0;
  MinInt := 32767;
  MathAverage := 0;
  CountOfNumbers := 0;
  Sum := 0;
  WHILE NOT EOLN
  DO
    BEGIN
      Number := ReadNumber(INPUT);
      WRITELN(Number);
      IF Number < MinInt
      THEN
        MinInt := Number;
      IF Number > MaxInt
      THEN
        MaxInt := Number;
      Sum := Sum + Number;
      CountOfNumbers := CountOfNumbers + 1;
    END;
  IF CountOfNumbers <> 0
  THEN
    MathAverage := Sum DIV CountOfNumbers;
  WRITELN('MinInt:', MinInt, ', MaxInt:', MaxInt, ', MathAverage:', MathAverage)    
END. {TestFunction}
