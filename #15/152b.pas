PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать сообщения о том как идут британцы, в зависимости
от того, первым во входе встречается 'land', 'sea' или 'by air'.}

PROCEDURE CheckingWindow(VAR W1, W2, W3, W4, Looking: CHAR);
BEGIN {CheckingWindow}
  IF ((W1 = 'L') OR (W1 = 'l')) AND ((W2 = 'A') OR (W2 = 'a'))
  AND ((W3 = 'N') OR (W3 = 'n')) AND ((W4 = 'D') OR (W4 = 'd')) {Land_Searc}
  THEN
    Looking := 'L';
  IF ((W2 = 'S') OR (W2 = 's')) AND ((W3 = 'E') OR (W3 = 'e')) 
  AND ((W4 = 'A') OR (W4 = 'a'))                                {Sea_Search}
  THEN
    Looking := 'S';
  IF ((W2 = 'A') OR (W2 = 'a')) AND ((W3 = 'I') OR (W3 = 'i'))
  AND ((W4 = 'R') OR (W4 = 'r'))                                {Air_Search}
  THEN
    Looking := 'A'
END; {CheckingWindow}

PROCEDURE WindowSearch(VAR F1: TEXT; VAR Looking: CHAR);
VAR
  W1, W2, W3, W4: CHAR;
BEGIN {MoveWindow}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';
  WHILE NOT EOLN(F1) AND (Looking = 'Y')
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(F1, W4);
      IF EOLN
      THEN
        Looking := 'N';
      CheckingWindow(W1, W2, W3, W4, Looking)
    END
END; {MoveWindow}

PROCEDURE WriteAnsw(VAR Look: CHAR);
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
  WindowSearch(INPUT, Looking);
  WriteAnsw(Looking)
END. {SarahRevere}
