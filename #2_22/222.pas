PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 26;
  FileName = 'Chiper.txt';
TYPE
  LengthOf = 0 .. Len;
  Str = ARRAY [1 .. Len] OF CHAR;
  Chiper = ARRAY [1 .. Len] OF CHAR;
VAR
  Msg: Str;
  Code: Chiper;
  Length : LengthOf;
  ChiperFile: TEXT;

PROCEDURE Initialize(VAR Code: Chiper; ChiperFile: TEXT);
{Присвоить Code шифр замены}
VAR
  Symbol: CHAR;
  Index: INTEGER;
BEGIN {Initialize}
  Index := 1;
  WHILE NOT EOF(ChiperFile)
  DO
    BEGIN
      READ(ChiperFile, Symbol);
      READLN(ChiperFile, Code[Index]);
      Index := Index + 1 
    END
END;  {Initialize}

PROCEDURE Encode(VAR S: Str);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Len
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(Code[Index])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}

BEGIN {Encryption}
  {Инициализировать Code}
  ASSIGN(ChiperFile, FileName);
  Initialize(Code, ChiperFile);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      Length := 0;
      WHILE NOT EOLN AND (Length < Len)
      DO
        BEGIN
          Length := Length + 1;
          READ(Msg[Length]);
          WRITE(Msg[Length])
        END;
      READLN;
      WRITELN;
      {распечатать кодированное сообщение}
      Encode(Msg)
    END
END.  {Encryption}

