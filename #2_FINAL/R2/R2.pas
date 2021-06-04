PROGRAM CountWords(INPUT, OUTPUT);
{ Program is counting words }   

USES
  ReadingWords, CountingWords;

VAR
  Word: STRING;
  Statistic: TEXT;
                 
BEGIN { CountWords }
  ASSIGN(Statistic, 'Statistic.txt');                                                                                                                       
  REWRITE(Statistic);
  WHILE NOT EOF
  DO
    BEGIN
      Word := ReadWord(Word);
      CountWord(Word)             
    END; 
  PrintFileStatistic(Statistic);  
  WRITELN
END. { CountWords }
