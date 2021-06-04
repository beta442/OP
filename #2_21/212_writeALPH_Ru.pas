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
  Letters: FILE OF SignsPlace;
BEGIN {Pseudo}
  ASSIGN(Letters, 'Letters.alph');
  REWRITE(Letters);
  PseudoLetter := [];                                                                           {Blank} {0}
  WRITE(Letters, PseudoLetter);    
  PseudoLetter := [2, 3, 4, 6, 10, 11, 15, 16, 17, 18, 19, 20, 21, 25];                         {1}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];           {2}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 6, 8, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];              {3}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 16, 21];                                               {4}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 9, 12, 13, 14, 16, 17, 18, 19, 20, 21, 25];                      {5}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21, 22, 23, 24, 25];                       {6}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 15, 16, 21, 22, 23, 24, 25];                   {7}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 3, 5, 7, 8, 9, 13, 17, 18, 19, 21, 23, 25];                               {8}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 10, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];                  {9}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 9, 10, 11, 13, 15, 16, 17, 20, 21, 25];                             {10}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 3, 5, 6, 9, 10, 11, 13, 15, 16, 17, 20, 21, 25];                          {11}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 4, 5, 6, 8, 11, 12, 16, 18, 21, 24, 25];                                  {12}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 25];                                     {13}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];                              {14}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];                            {15}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];                   {16}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 25];                               {17}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 21];                           {18}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];                               {19}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 8, 13, 18, 23];                                               {20}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 7, 9, 13, 17, 21];                                                     {21}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 8, 10, 11, 12, 13, 14, 15, 18, 23];                        {22}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 7, 9, 13, 17, 19, 21, 25];                                             {23}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 4, 6, 9, 11, 14, 16, 17, 18, 19, 20, 25];                                 {24}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 11, 12, 13, 14, 15, 20, 25];                                    {25}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 8, 10, 11, 13, 15, 16, 18, 20, 21, 22, 23, 24, 25];                 {26}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 8, 10, 11, 13, 15, 16, 17, 18, 19, 20, 25];                         {27}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 7, 12, 13, 14, 15, 17, 20, 22, 23, 24, 25];                            {28}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 11, 12, 13, 15, 16, 18, 20, 21, 22, 23, 25];                    {29}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 7, 12, 13, 14, 15, 17, 20, 22, 23, 24, 25];                               {30}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 9, 10, 12, 13, 14, 15, 19, 20, 21, 22, 23, 24];                  {31}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 3, 4, 5, 6, 8, 10, 11, 12, 13, 15, 16, 18, 20, 21, 23, 24, 25];           {32}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 5, 7, 10, 12, 13, 14, 15, 17, 20, 21, 25];                          {33}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [23];                                                                         {.}
  WRITE(Letters, PseudoLetter); 
  PseudoLetter := [16, 17, 22];                                                                 {,}
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [3, 8, 13, 23];                                                               {!}
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [1, 2, 3, 4, 5, 10, 13, 14, 15, 23];                                          {?}     
  WRITE(Letters, PseudoLetter); 
  PseudoLetter := [1, 6];                                                                       {'}     
  WRITE(Letters, PseudoLetter);                                                                 
  PseudoLetter := [11, 12, 13, 14, 15];                                                         {-}     {39}
  WRITE(Letters, PseudoLetter)    
END. {Pseudo}
