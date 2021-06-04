UNIT Queue;

INTERFACE

PROCEDURE EmptyQ; {Очистить очередь}
PROCEDURE AddQ(VAR Elt: CHAR); {Добавить в конец очереди элемент (символ)}
PROCEDURE DelQ; {Удалить 1ый элемент очереди}
PROCEDURE HeadQ(VAR Elt: CHAR); {Поместить в Elt 1ый элемент очереди}
PROCEDURE WriteQ; {Печать очереди} 

IMPLEMENTATION

VAR
  Q: TEXT;

PROCEDURE EmptyQ;
{Q := < , /, R>}
BEGIN {EmptyQ}
  REWRITE(Q);
  WRITELN(Q);
  RESET(Q)
END; {EmptyQ}

PROCEDURE CopyOpen(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {CopyOpen}
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END
END; {CopyOpen} 

PROCEDURE DelQ;
{ Q = < ,  /, R> -->
 (Q = < ,ax/, R>, где a - символ и x - строка)|
  Q:= < , x/, R> }
VAR
  Ch: CHAR;
  Temp: TEXT;
BEGIN {DelQ}
  READ(Q, Ch);
  IF NOT EOF(Q)
  THEN
    BEGIN
      REWRITE(Temp);
      CopyOpen(Q, Temp);
      WRITELN(Temp);
      RESET(Temp);
      REWRITE(Q);
      CopyOpen(Temp, Q);
      WRITELN(Q)
    END;
  RESET(Q)  
END; {DelQ}

PROCEDURE HeadQ(VAR Elt: CHAR);
{(Q = < ,  /, R> --> Elt := '#')|
 (Q = < ,ax/, R>, где a - символ, а x - строка,
  Elt:= 'a') }
BEGIN {HeadQ}
  IF NOT EOLN(Q)
  THEN
    READ(Q, Elt)
  ELSE
    Elt := '#';
  RESET(Q)        
END; {HeadQ} 

PROCEDURE AddQ(VAR Elt: CHAR);
{(Q = < , x/, R>, где x - строка, а Elt = a) -->
 Q = < ,xa/, R> }
VAR
  Temp: TEXT;
BEGIN {AddQ}  
  REWRITE(Temp);
  CopyOpen(Q, Temp);
  WRITELN(Temp, Elt);
  REWRITE(Q);
  RESET(Temp);
  CopyOpen(Temp, Q);
  WRITELN(Q);
  RESET(Q)
END; {AddQ}  

PROCEDURE WriteQ;
{(Q = < , x/,R> и OUTPUT =<y, , W>, где y и x - строки) -->
  OUTPUT := <y&x/, , W> }
BEGIN {WriteQ}
  CopyOpen(Q, OUTPUT);
  WRITELN('#');
  RESET(Q)
END;{WriteQ}

BEGIN {Queue}
END. {Queue} 
