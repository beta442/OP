PROGRAM Pseudo(INPUT, OUTPUT);
{ Programm writes letters in pseudographics }
CONST
  Rows = 5;
  Columns = 5;
  
TYPE
  SignsPlace = SET OF 1 .. 25;
    
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
    
VAR
  PseudoLetter: SignsPlace;
BEGIN {Pseudo}
  PseudoLetter := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 25];
  WritePseudo(PseudoLetter)  
END. {Pseudo}
