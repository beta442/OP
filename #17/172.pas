PROGRAM SarahRevere(INPUT, OUTPUT); 
{Џечать сообщения о том как идут британцы, в зависимости
 от того, первым во входе встречается ли 'land', 'sea'}
VAR
  W1, W2, W3, W4: CHAR;
  Looking, Land, Sea: BOOLEAN; 
BEGIN {SarahRevere}   
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE;
  WHILE Looking AND NOT (Land OR Sea) AND NOT EOLN  
  DO
    BEGIN
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF EOLN THEN Looking := FALSE;
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      Sea := (W1 = 's') AND (W2 = 'e') AND (W3 = 'a');
    END;
  IF Land
  THEN
    WRITE('The British are coming by land')
  ELSE  
    IF Sea
    THEN
      WRITE('The British are coming by sea')
    ELSE
      WRITE('Sarah didn''t say');
  WRITELN      
END.  {SarahRevere}

