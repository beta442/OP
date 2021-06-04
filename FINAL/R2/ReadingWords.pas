UNIT ReadingWords;

INTERFACE
                     
FUNCTION ReadWord(VAR Word: STRING): STRING;                                          { Читает из INPUT слово в Word, возвращает его }

IMPLEMENTATION

CONST
  ValidSymbols = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                  'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш',
                  'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я',
                  'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш',
                  'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я', '-'];
  SpecialSymbols = ['-'];                  

PROCEDURE DoCharSmall(VAR Symbol: CHAR);
{ Делает символ-Symbol строчным(маленьким), пример "А" -> "а"  }
BEGIN { DoCharSmall }
               { English alphabet }                    { Русский алфавит }
  IF Symbol = 'A' THEN Symbol := 'a' ELSE IF Symbol = 'А' THEN Symbol := 'а' ELSE
  IF Symbol = 'B' THEN Symbol := 'b' ELSE IF Symbol = 'Б' THEN Symbol := 'б' ELSE
  IF Symbol = 'C' THEN Symbol := 'c' ELSE IF Symbol = 'В' THEN Symbol := 'в' ELSE
  IF Symbol = 'D' THEN Symbol := 'd' ELSE IF Symbol = 'Г' THEN Symbol := 'г' ELSE
  IF Symbol = 'E' THEN Symbol := 'e' ELSE IF Symbol = 'Д' THEN Symbol := 'д' ELSE
  IF Symbol = 'F' THEN Symbol := 'f' ELSE IF Symbol = 'Е' THEN Symbol := 'е' ELSE
  IF Symbol = 'G' THEN Symbol := 'g' ELSE IF Symbol = 'Ё' THEN Symbol := 'ё' ELSE
  IF Symbol = 'H' THEN Symbol := 'h' ELSE IF Symbol = 'Ж' THEN Symbol := 'ж' ELSE
  IF Symbol = 'I' THEN Symbol := 'i' ELSE IF Symbol = 'З' THEN Symbol := 'з' ELSE
  IF Symbol = 'J' THEN Symbol := 'j' ELSE IF Symbol = 'И' THEN Symbol := 'и' ELSE
  IF Symbol = 'K' THEN Symbol := 'k' ELSE IF Symbol = 'Й' THEN Symbol := 'й' ELSE
  IF Symbol = 'L' THEN Symbol := 'l' ELSE IF Symbol = 'К' THEN Symbol := 'к' ELSE
  IF Symbol = 'M' THEN Symbol := 'm' ELSE IF Symbol = 'Л' THEN Symbol := 'л' ELSE
  IF Symbol = 'N' THEN Symbol := 'n' ELSE IF Symbol = 'М' THEN Symbol := 'м' ELSE
  IF Symbol = 'O' THEN Symbol := 'o' ELSE IF Symbol = 'Н' THEN Symbol := 'н' ELSE
  IF Symbol = 'P' THEN Symbol := 'p' ELSE IF Symbol = 'О' THEN Symbol := 'о' ELSE
  IF Symbol = 'Q' THEN Symbol := 'q' ELSE IF Symbol = 'П' THEN Symbol := 'п' ELSE
  IF Symbol = 'R' THEN Symbol := 'r' ELSE IF Symbol = 'Р' THEN Symbol := 'р' ELSE
  IF Symbol = 'S' THEN Symbol := 's' ELSE IF Symbol = 'С' THEN Symbol := 'с' ELSE
  IF Symbol = 'T' THEN Symbol := 't' ELSE IF Symbol = 'Т' THEN Symbol := 'т' ELSE
  IF Symbol = 'U' THEN Symbol := 'u' ELSE IF Symbol = 'У' THEN Symbol := 'у' ELSE
  IF Symbol = 'V' THEN Symbol := 'v' ELSE IF Symbol = 'Ф' THEN Symbol := 'ф' ELSE
  IF Symbol = 'W' THEN Symbol := 'w' ELSE IF Symbol = 'Х' THEN Symbol := 'х' ELSE
  IF Symbol = 'X' THEN Symbol := 'x' ELSE IF Symbol = 'Ц' THEN Symbol := 'ц' ELSE
  IF Symbol = 'Y' THEN Symbol := 'y' ELSE IF Symbol = 'Ч' THEN Symbol := 'ч' ELSE
  IF Symbol = 'Z' THEN Symbol := 'z' ELSE IF Symbol = 'Ш' THEN Symbol := 'ш' ELSE
                                          IF Symbol = 'Щ' THEN Symbol := 'щ' ELSE
                                          IF Symbol = 'Ъ' THEN Symbol := 'ъ' ELSE
                                          IF Symbol = 'Ы' THEN Symbol := 'ы' ELSE
                                          IF Symbol = 'Ь' THEN Symbol := 'ь' ELSE
                                          IF Symbol = 'Э' THEN Symbol := 'э' ELSE
                                          IF Symbol = 'Ю' THEN Symbol := 'ю' ELSE
                                          IF Symbol = 'Я' THEN Symbol := 'я' 
  
END; { DoCharSmall }

PROCEDURE DoCharBigger(VAR Symbol: CHAR);
{ Делает символ-Symbol прописным(заглавным), пример "а" -> "А" }
BEGIN { DoCharBigger }
               { English alphabet }                    { Русский алфавит }
  IF Symbol = 'a' THEN Symbol := 'A' ELSE IF Symbol = 'а' THEN Symbol := 'А' ELSE
  IF Symbol = 'b' THEN Symbol := 'B' ELSE IF Symbol = 'б' THEN Symbol := 'Б' ELSE
  IF Symbol = 'c' THEN Symbol := 'C' ELSE IF Symbol = 'в' THEN Symbol := 'В' ELSE
  IF Symbol = 'd' THEN Symbol := 'D' ELSE IF Symbol = 'г' THEN Symbol := 'Г' ELSE
  IF Symbol = 'e' THEN Symbol := 'E' ELSE IF Symbol = 'д' THEN Symbol := 'Д' ELSE
  IF Symbol = 'f' THEN Symbol := 'F' ELSE IF Symbol = 'е' THEN Symbol := 'Е' ELSE
  IF Symbol = 'g' THEN Symbol := 'G' ELSE IF Symbol = 'ё' THEN Symbol := 'Ё' ELSE
  IF Symbol = 'h' THEN Symbol := 'H' ELSE IF Symbol = 'ж' THEN Symbol := 'Ж' ELSE
  IF Symbol = 'i' THEN Symbol := 'I' ELSE IF Symbol = 'з' THEN Symbol := 'З' ELSE
  IF Symbol = 'j' THEN Symbol := 'J' ELSE IF Symbol = 'и' THEN Symbol := 'И' ELSE
  IF Symbol = 'k' THEN Symbol := 'K' ELSE IF Symbol = 'й' THEN Symbol := 'Й' ELSE
  IF Symbol = 'l' THEN Symbol := 'L' ELSE IF Symbol = 'к' THEN Symbol := 'К' ELSE
  IF Symbol = 'm' THEN Symbol := 'M' ELSE IF Symbol = 'л' THEN Symbol := 'Л' ELSE
  IF Symbol = 'n' THEN Symbol := 'N' ELSE IF Symbol = 'м' THEN Symbol := 'М' ELSE
  IF Symbol = 'o' THEN Symbol := 'O' ELSE IF Symbol = 'н' THEN Symbol := 'Н' ELSE
  IF Symbol = 'p' THEN Symbol := 'P' ELSE IF Symbol = 'о' THEN Symbol := 'О' ELSE
  IF Symbol = 'q' THEN Symbol := 'Q' ELSE IF Symbol = 'п' THEN Symbol := 'П' ELSE
  IF Symbol = 'r' THEN Symbol := 'R' ELSE IF Symbol = 'р' THEN Symbol := 'Р' ELSE
  IF Symbol = 's' THEN Symbol := 'S' ELSE IF Symbol = 'с' THEN Symbol := 'С' ELSE
  IF Symbol = 't' THEN Symbol := 'T' ELSE IF Symbol = 'т' THEN Symbol := 'Т' ELSE
  IF Symbol = 'u' THEN Symbol := 'U' ELSE IF Symbol = 'у' THEN Symbol := 'У' ELSE
  IF Symbol = 'v' THEN Symbol := 'V' ELSE IF Symbol = 'ф' THEN Symbol := 'Ф' ELSE
  IF Symbol = 'w' THEN Symbol := 'W' ELSE IF Symbol = 'х' THEN Symbol := 'Х' ELSE
  IF Symbol = 'x' THEN Symbol := 'X' ELSE IF Symbol = 'ц' THEN Symbol := 'Ц' ELSE
  IF Symbol = 'y' THEN Symbol := 'Y' ELSE IF Symbol = 'ч' THEN Symbol := 'Ч' ELSE
  IF Symbol = 'z' THEN Symbol := 'Z' ELSE IF Symbol = 'ш' THEN Symbol := 'Ш' ELSE
                                          IF Symbol = 'щ' THEN Symbol := 'Щ' ELSE
                                          IF Symbol = 'ъ' THEN Symbol := 'Ъ' ELSE
                                          IF Symbol = 'ы' THEN Symbol := 'Ы' ELSE
                                          IF Symbol = 'ь' THEN Symbol := 'Ь' ELSE
                                          IF Symbol = 'э' THEN Symbol := 'Э' ELSE
                                          IF Symbol = 'ю' THEN Symbol := 'Ю' ELSE
                                          IF Symbol = 'я' THEN Symbol := 'Я' 
  
END; { DoCharBigger }

CONST
  MaxWordLength = 50;

FUNCTION FormatWord(VAR Word: STRING): STRING;
{ Форматирует слово }
VAR
  I: INTEGER;
BEGIN { FormatWord }
  FOR I := 1 TO Length(Word)
  DO
    DoCharSmall(Word[I]);      //сделать все буквы строчными(маленькими)
  DoCharBigger(Word[1]);       //сделать первый символ строки прописным(большим)
    
  FormatWord := Word
END; { FormatWord }

FUNCTION ReadWord(VAR Word: STRING): STRING;
{ Читает слово из INPUT и кладёт его отформатированным во внешнюю переменную Word }
VAR
  Symbol: CHAR;
BEGIN { ReadWord }

  Word := '';

  WHILE NOT EOF AND (Symbol <> ' ') 
  DO
    BEGIN
      READ(Symbol);
      IF Symbol IN ValidSymbols
      THEN
        Word := Word + Symbol
      ELSE
        //Обрубаем считывание слова
        Symbol := ' '  
    END;

  //Игнорируем слова 1-длины, состоящие из специальных символов
  IF (Length(Word) = 1) AND (Word[1] IN SpecialSymbols)
  THEN
    Word := '';
  
  IF Word <> '' THEN Word := FormatWord(Word);
  
  ReadWord := Word   
END; { ReadWord }

BEGIN { ReadWord }

END. { ReadWord }
