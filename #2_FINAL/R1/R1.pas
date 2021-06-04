PROGRAM CountWords(INPUT, OUTPUT);
{ Program is counting words }   

USES
  CountingWords;

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
  PrintStatistic(Statistic);  
  WRITELN
END. { CountWords }
