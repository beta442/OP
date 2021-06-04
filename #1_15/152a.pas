PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать сообщения о том как идут британцы, в зависимости
от ключа Look}


PROCEDURE WriteAnswer(VAR Look: CHAR);
BEGIN {WriteAnsw}
  IF Look = 'N'
  THEN
    WRITELN('Sarah didn''t say')
  ELSE
    WRITE('British are coming by ');  
  IF Look = 'L'
  THEN
    WRITELN('land.');
  IF Look = 'S'
  THEN
    WRITELN('sea.');
  IF Look = 'A'
  THEN
    WRITELN('air.')      
END; {WriteAnsw}

VAR
  Looking: CHAR;
BEGIN {SarahRevere}
  IF NOT EOLN
  THEN
    READ(Looking);
  WriteAnswer(Looking)
END. {SarahRevere}
