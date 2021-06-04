UNIT Pseudo_ver1;

INTERFACE

TYPE
  SignsPlace = SET OF 1 .. 25;
  SignsLine  = SET OF 1 .. 250;

FUNCTION   FindLetterNumberEn(VAR F: TEXT): INTEGER;                            { Sets to each letter in F-file equal number in EN_alphabet }
FUNCTION   GetPseudoLetterEn(VAR Number: INTEGER): SignsPlace;                  { Getting from alph-file letter in pseudo graphic} {Number = 1/2/3/4... =>
                                                                                                                                    Letter = A/B/C/D...   }
PROCEDURE  CreatingPseudoLines(VAR F: TEXT);                                    { Makes 5 lines of letters from F-file in pseudo_graphic style }                                                                                               
PROCEDURE  WritingPseudoLines;                                                  { Use it after CreatingPseudoLines proc, 
                                                                                                             to write out letters in pseudo_graphic style }
PROCEDURE  WritePseudo(VAR PseudoLetter: SignsPlace);                           { Writes ONE! letter in pseudo graphics }

IMPLEMENTATION

CONST
  Rows = 5;
  Columns = 5;

VAR
  AlphEn: FILE OF SignsPlace;
  AlphRu: FILE OF SignsPlace;
  Line1, Line2, Line3, Line4, Line5: SignsLine;
  I: INTEGER;  

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
      IF (Letter = ' ')                   THEN Number := 0 ELSE         
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
      IF (Letter = '0')                   THEN Number := 68                                                       
                                          ELSE Number := -1
    END      
  ELSE
    WRITELN('Err, file is empty...');
  FindLetterNumberEn := Number                                         
END; {FindLetterNumberEn}

FUNCTION GetPseudoLetterEn(VAR Number: INTEGER): SignsPlace;
VAR
  PseudoLetter: SignsPlace;
BEGIN {GetPseudoLetterEn}
  RESET(AlphEn);
  IF Number = -1
  THEN
    PseudoLetter := [];
  WHILE NOT EOF(AlphEn) AND (Number <> -1)
  DO
    BEGIN
      Number := Number - 1;
      READ(AlphEn, PseudoLetter)
    END;  
  GetPseudoLetterEn := PseudoLetter  
END; {GetPseudoLetterEn}

PROCEDURE CreatingPseudoLines(VAR F: TEXT);
VAR
  Number, Sign, LetterAmount: INTEGER;
  PseudoLetter: SignsPlace;
BEGIN {CreatingPseudoLines}
  Line1 := []; Line2 := []; Line3 := []; Line4 := []; Line5 := [];          {Prepare Lines}
  LetterAmount := 0;
  WHILE NOT EOLN(F)
  DO
    BEGIN                     
      Number := FindLetterNumberEn(F);                                          {Get char's number}
      PseudoLetter := GetPseudoLetterEn(Number);                                {Get set of pseudoletter for equal number}
      FOR Sign := 1  TO 5  DO 
      IF  Sign IN PseudoLetter THEN Line1 := Line1 + [Sign + LetterAmount * 5];     
      FOR Sign := 6  TO 10 DO 
      IF  Sign IN PseudoLetter THEN Line2 := Line2 + [Sign + LetterAmount * 5]; 
      FOR Sign := 11 TO 15 DO 
      IF  Sign IN PseudoLetter THEN Line3 := Line3 + [Sign + LetterAmount * 5]; 
      FOR Sign := 16 TO 20 DO 
      IF  Sign IN PseudoLetter THEN Line4 := Line4 + [Sign + LetterAmount * 5]; 
      FOR Sign := 21 TO 25 DO 
      IF  Sign IN PseudoLetter THEN Line5 := Line5 + [Sign + LetterAmount * 5]; 
      LetterAmount := LetterAmount + 1  
    END             
END; {CreatingPseudoLines}

PROCEDURE WritingPseudoLines;
VAR
  Sign: INTEGER;
BEGIN {WritingPseudoLines}
  FOR Sign := 1 TO 124
  DO
    BEGIN
      IF Sign IN Line1  THEN WRITE('#') ELSE WRITE(' ');
      IF Sign MOD 5 = 0 THEN WRITE(' ')
    END;
  WRITELN;  
  FOR Sign := 6 TO 129
  DO
    BEGIN
      IF Sign IN Line2  THEN WRITE('#') ELSE WRITE(' ');
      IF Sign MOD 5 = 0 THEN WRITE(' ')
    END;
  WRITELN;
  FOR Sign := 11 TO 134
  DO
    BEGIN
      IF Sign IN Line3  THEN WRITE('#') ELSE WRITE(' ');
      IF Sign MOD 5 = 0 THEN WRITE(' ')
    END;
  WRITELN;
  FOR Sign := 16 TO 139
  DO
    BEGIN
      IF Sign IN Line4  THEN WRITE('#') ELSE WRITE(' ');
      IF Sign MOD 5 = 0 THEN WRITE(' ')
    END;
  WRITELN;
  FOR Sign := 21 TO 144
  DO
    BEGIN
      IF Sign IN Line5  THEN WRITE('#') ELSE WRITE(' ');
      IF Sign MOD 5 = 0 THEN WRITE(' ')
    END      
END; {WritingPseudoLines}

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
  ASSIGN(AlphEn, 'Letters_EN_Bin.txt');
  ASSIGN(AlphRu, 'Letters_RU_Bin.txt')    
END. {Pseudo}
