PROGRAM Encryption(INPUT, OUTPUT);
{Translates characters from INPUT to Chiper code
   and prints new characters to OUTPUT}
CONST
  Len = 20;
TYPE         
  Alphabet = ' ' .. 'Z';
  Str = ARRAY [1 .. Len] OF Alphabet;
  Chiper = ARRAY [Alphabet] OF CHAR;
  LengthOf = 1 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  Length: LengthOf;
  
PROCEDURE Initialize(VAR Code: Chiper);
{Assign Code replacement cipher}
BEGIN {Initialize}
  Code['A'] := 'Z';
  Code['B'] := 'Y';
  Code['C'] := 'X';
  Code['D'] := '#';
  Code['E'] := 'V';
  Code['F'] := 'U';
  Code['G'] := 'T';
  Code['H'] := 'S';
  Code['I'] := 'I';
  Code['J'] := 'Q';
  Code['K'] := 'P';
  Code['L'] := '!';
  Code['M'] := 'N';
  Code['N'] := 'M';
  Code['O'] := '2';
  Code['P'] := 'K';
  Code['Q'] := '$';
  Code['R'] := 'D';
  Code['S'] := 'H';
  Code['T'] := '*';
  Code['U'] := 'F';
  Code['V'] := 'E';
  Code['W'] := 'T';
  Code['X'] := 'C';
  Code['Y'] := 'B';
  Code['Z'] := 'A';
  Code[' '] := '!'  
END;  {Initialize}

PROCEDURE Encode(VAR S: Str; VAR Length: LengthOf);
{Outputs characters from Code corresponding to characters from S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Length
  DO
    IF S[Index] IN [' ' .. 'Z']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  Initialize(Code);
  WHILE NOT EOF
  DO
    BEGIN
      {read string to Msg and output it}
      Length := 1;
      WHILE NOT EOLN AND (Length < Len)
      DO
        BEGIN
          READ(Msg[Length]);
          WRITE(Msg[Length]);
          Length := Length + 1
        END;       
      READLN;
      WRITELN;
      {print the encoded message}
      Encode(Msg, Length)
    END
END.  {Encryption}


