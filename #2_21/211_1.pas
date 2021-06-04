PROGRAM Pseudo(INPUT, OUTPUT);
CONST
  Rows = 5;
  Columns = 5;
  
TYPE
  SignsPlace = SET OF 1 .. 25;  
  
PROCEDURE WritePseudo(VAR PseudoLetter: SignsPlace);
VAR
  Row, PositionInRow: INTEGER;
  PROCEDURE WriteLine(VAR PseudoLetter: SignsPlace; VAR Row, Column: INTEGER);
  BEGIN {WriteLine}
    FOR Column := Column TO (Row * Rows)
    DO
      IF Column IN PseudoLetter
      THEN
        BEGIN
          WRITE('#');
          PseudoLetter := PseudoLetter - [Column]
        END  
      ELSE
        WRITE(' ');
    Column := Column + 1;                 
    WRITELN  
  END; {WriteLine} 
BEGIN {WritePseudo}
  PositionInRow := 1;
  Row := 1;
  WHILE Row <> Rows
  DO
    BEGIN
      CASE Row OF
        1 : WriteLine(PseudoLetter, Row, PositionInRow);
        2 : WriteLine(PseudoLetter, Row, PositionInRow);
        3 : WriteLine(PseudoLetter, Row, PositionInRow);
        4 : WriteLine(PseudoLetter, Row, PositionInRow);
        5 : WriteLine(PseudoLetter, Row, PositionInRow)                        
      END;
      Row := Row + 1;
    END   
END; {WritePseudo}    
VAR
  PseudoLetter: SignsPlace;
BEGIN {Pseudo}
  PseudoLetter := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];
  WritePseudo(PseudoLetter); 
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 25];
  WritePseudo(PseudoLetter)
END. {Pseudo}
