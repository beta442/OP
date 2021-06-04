UNIT Pseudo_ver2;

INTERFACE

TYPE
  SignsPlace = SET OF 1 .. 25;
  SignsLine  = SET OF 1 .. 250;

FUNCTION   FindLetterNumberEn(VAR F: TEXT): INTEGER;                            { Sets to each letter in F-file equal number in EN_alphabet }

PROCEDURE  GetPseudoLetterLine(VAR Number: INTEGER; VAR F: TEXT);               { Prepearing alph-file before creating Pseudo-symbol } 
PROCEDURE  CreatingPseudoLine(VAR F: TEXT);                                     { Makes PseudoLine of signs }                                                                                                
PROCEDURE  WritingPseudoLine;                                                   { Use it after CreatingPseudoLine proc, 
                                                                                  to write out letters in pseudo_graphic style! 10 chars - max }
PROCEDURE  WritePseudo(VAR PseudoLetter: SignsPlace);                           { Writes ONE! letter in pseudo graphics }

IMPLEMENTATION

CONST
  Rows = 5;
  Columns = 5;

VAR
  AlphEn, AlphRu: TEXT;
  Pseudos: SignsLine;                                                           
  LetterAmount: INTEGER;  

FUNCTION FindLetterNumberEn(VAR F: TEXT): INTEGER;
VAR
  Letter: CHAR;
  Number: INTEGER;  
BEGIN {FindLetterNumberEn}
  Number := -1;
  IF NOT EOLN(F)
  THEN
    BEGIN
      READ(F, Letter);         
      IF (Letter = 'A') OR (Letter = 'a') THEN Number := 1 ELSE
      IF (Letter = 'B') OR (Letter = 'b') THEN Number := 2 ELSE
      IF (Letter = 'C') OR (Letter = 'c') THEN Number := 3 ELSE
      IF (Letter = 'D') OR (Letter = 'd') THEN Number := 4 ELSE
      IF (Letter = 'E') OR (Letter = 'e') THEN Number := 5 ELSE
      IF (Letter = 'F') OR (Letter = 'f') THEN Number := 6 ELSE
      IF (Letter = 'G') OR (Letter = 'g') THEN Number := 7 ELSE
      IF (Letter = 'H') OR (Letter = 'h') THEN Number := 8 ELSE
      IF (Letter = 'I') OR (Letter = 'i') THEN Number := 9 ELSE
      IF (Letter = 'J') OR (Letter = 'j') THEN Number := 10 ELSE
      IF (Letter = 'K') OR (Letter = 'k') THEN Number := 11 ELSE
      IF (Letter = 'L') OR (Letter = 'l') THEN Number := 12 ELSE
      IF (Letter = 'M') OR (Letter = 'm') THEN Number := 13 ELSE
      IF (Letter = 'N') OR (Letter = 'n') THEN Number := 14 ELSE
      IF (Letter = 'O') OR (Letter = 'o') THEN Number := 15 ELSE
      IF (Letter = 'P') OR (Letter = 'p') THEN Number := 16 ELSE
      IF (Letter = 'Q') OR (Letter = 'q') THEN Number := 17 ELSE
      IF (Letter = 'R') OR (Letter = 'r') THEN Number := 18 ELSE
      IF (Letter = 'S') OR (Letter = 's') THEN Number := 19 ELSE
      IF (Letter = 'T') OR (Letter = 't') THEN Number := 20 ELSE
      IF (Letter = 'U') OR (Letter = 'u') THEN Number := 21 ELSE
      IF (Letter = 'V') OR (Letter = 'v') THEN Number := 22 ELSE
      IF (Letter = 'W') OR (Letter = 'w') THEN Number := 23 ELSE
      IF (Letter = 'X') OR (Letter = 'x') THEN Number := 24 ELSE
      IF (Letter = 'Y') OR (Letter = 'y') THEN Number := 25 ELSE
      IF (Letter = 'Z') OR (Letter = 'z') THEN Number := 26 ELSE
      IF (Letter = '.')                   THEN Number := 27 ELSE
      IF (Letter = ',')                   THEN Number := 28 ELSE
      IF (Letter = '!')                   THEN Number := 29 ELSE      
      IF (Letter = '?')                   THEN Number := 30 ELSE   
      IF (Letter = '''')                  THEN Number := 31 ELSE
      IF (Letter = '-')                   THEN Number := 32 ELSE
      IF (Letter = '"')                   THEN Number := 33 ELSE
      IF (Letter = ':')                   THEN Number := 34 ELSE
      IF (Letter = ';')                   THEN Number := 35 ELSE
      IF (Letter = '<')                   THEN Number := 36 ELSE
      IF (Letter = '>')                   THEN Number := 37 ELSE
      IF (Letter = '~')                   THEN Number := 38 ELSE
      IF (Letter = '`')                   THEN Number := 39 ELSE
      IF (Letter = '@')                   THEN Number := 40 ELSE
      IF (Letter = '#')                   THEN Number := 41 ELSE
      IF (Letter = '$')                   THEN Number := 42 ELSE
      IF (Letter = '%')                   THEN Number := 43 ELSE
      IF (Letter = '^')                   THEN Number := 44 ELSE
      IF (Letter = '&')                   THEN Number := 45 ELSE
      IF (Letter = '*')                   THEN Number := 46 ELSE
      IF (Letter = '(')                   THEN Number := 47 ELSE
      IF (Letter = ')')                   THEN Number := 48 ELSE
      IF (Letter = '_')                   THEN Number := 49 ELSE
      IF (Letter = '+')                   THEN Number := 50 ELSE
      IF (Letter = '=')                   THEN Number := 51 ELSE
      IF (Letter = '[')                   THEN Number := 52 ELSE
      IF (Letter = ']')                   THEN Number := 53 ELSE
      IF (Letter = '{')                   THEN Number := 54 ELSE
      IF (Letter = '}')                   THEN Number := 55 ELSE
      IF (Letter = '|')                   THEN Number := 56 ELSE
      IF (Letter = '/')                   THEN Number := 57 ELSE
      IF (Letter = '\')                   THEN Number := 58 ELSE
      IF (Letter = '1')                   THEN Number := 59 ELSE
      IF (Letter = '2')                   THEN Number := 60 ELSE
      IF (Letter = '3')                   THEN Number := 61 ELSE
      IF (Letter = '4')                   THEN Number := 62 ELSE
      IF (Letter = '5')                   THEN Number := 63 ELSE
      IF (Letter = '6')                   THEN Number := 64 ELSE
      IF (Letter = '7')                   THEN Number := 65 ELSE
      IF (Letter = '8')                   THEN Number := 66 ELSE
      IF (Letter = '9')                   THEN Number := 67 ELSE
      IF (Letter = '0')                   THEN Number := 68 ELSE                                                      
      IF (Letter = ' ')                   THEN Number := 69      
                                          ELSE Number := -1
    END      
  ELSE
    WRITELN('Err, file is empty...');
  FindLetterNumberEn := Number                                         
END; {FindLetterNumberEn}

PROCEDURE GetPseudoLetterLine(VAR Number: INTEGER; VAR F: TEXT);
{ Leave cursor behind symbol-number - prepeared for reading SignsPlace }
VAR
  Symb: CHAR;
BEGIN {GetPseudoLetterLine}
  RESET(F);
  WHILE NOT EOF(F) AND (Number - 1 <> -1)
  DO
    BEGIN
      READLN(F, Symb);
      Number := Number - 1;
    END;
  READ(F, Symb) 
END; {GetPseudoLetterLine}

PROCEDURE CreatingPseudoLine(VAR F: TEXT);
VAR
  Number, Sign: INTEGER;
BEGIN {CreatingPseudoLines}
  Pseudos := [];                                                                { Prepare Line }
  LetterAmount := 0;
  WHILE NOT EOLN(F)
  DO
    BEGIN                     
      Number := FindLetterNumberEn(F);                                          { Get char's number }
      GetPseudoLetterLine(Number, AlphEn);                                      { Prepare AlphEn for working }
      WHILE NOT EOLN(AlphEn)
      DO
        BEGIN
          READ(AlphEn, Sign);
          Pseudos := Pseudos + [Sign + LetterAmount * 25];
        END;
      LetterAmount := LetterAmount + 1    
    END    
END; {CreatingPseudoLines}

PROCEDURE WritingPseudoLine;
VAR
  Sign, Line, PositionType: INTEGER;
BEGIN {WritingPseudoLine}
  Line := 1;
  Sign := 1;
  WHILE Sign <= 250
  DO
    BEGIN
      PositionType := Sign MOD 25;
      IF ((PositionType >=  1) AND (PositionType <=  5) AND (Line = 1)) OR
         ((PositionType >=  6) AND (PositionType <= 10) AND (Line = 2)) OR
         ((PositionType >= 11) AND (PositionType <= 15) AND (Line = 3)) OR
         ((PositionType >= 16) AND (PositionType <= 20) AND (Line = 4)) OR
         (((PositionType  = 0) OR ((PositionType >= 21) AND (PositionType <= 24)))
                                                        AND (Line = 5))                                  
      THEN
        BEGIN
          IF Sign IN Pseudos
          THEN
            WRITE('#')
          ELSE
            WRITE(' ');
          IF Sign MOD 5 = 0 THEN WRITE(' ')
        END;
      IF Sign MOD 250 = 0
      THEN
        BEGIN
          WRITELN;
          IF Line = 1 THEN Sign :=  5;
          IF Line = 2 THEN Sign := 10;
          IF Line = 3 THEN Sign := 15;
          IF Line = 4 THEN Sign := 20;
          Line := Line + 1;
        END;
      Sign := Sign + 1      
    END  
END; {WritingPseudoLine}

PROCEDURE WritePseudo(VAR PseudoLetter: SignsPlace);
VAR
  PositionInRow: INTEGER;
BEGIN {WritePseudo}
  FOR PositionInRow := 1 TO (Rows * Columns)
  DO
    BEGIN
      IF PositionInRow IN PseudoLetter
      THEN
        WRITE('#')
      ELSE
        WRITE(' ');
      IF (PositionInRow MOD 5) = 0
      THEN
        WRITELN    
    END;
  WRITELN    
END; {WritePseudo}

BEGIN {Pseudo}
  ASSIGN(AlphEn, 'Letters_EN.txt');
  ASSIGN(AlphRu, 'Letters_RU.txt')    
END. {Pseudo}
