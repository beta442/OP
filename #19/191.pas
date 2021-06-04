PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  NameFile: TEXT;
  Ch: CHAR;
  Ave, TotalScore, ClassTotal: INTEGER;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  REWRITE(NameFile);
  WHILE Student <= ClassSize
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      WRITELN('Enter second name:');
      WHILE NOT EOLN
      DO
        BEGIN
          READ(Ch);        
          WRITE(NameFile, Ch)
        END;
      WRITE(NameFile, '''s: ');  
      READLN;
      WRITELN('Enter scores:');
      WHILE WhichScore <= 4
      DO
        BEGIN
          READ(NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN;
      TotalScore := TotalScore * 100;
      Ave := TotalScore DIV NumberOfScores;
      IF Ave MOD 100 >= 50
      THEN
        WRITE(NameFile, Ave DIV 100 + 1)
      ELSE
        WRITE(NameFile, Ave DIV 100);
      WRITELN(NameFile, ' ');    
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
    END;
  WRITELN('Student''s average:');
  RESET(NameFile);  
  WHILE NOT EOF(NameFile)
  DO
    BEGIN
      READ(NameFile, Ch);
      WRITE(Ch)
    END;       
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 100, '.', ClassTotal MOD 100)
END.  {AverageScore}

