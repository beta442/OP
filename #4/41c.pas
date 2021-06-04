PROGRAM PaulRevere(INPUT, OUTPUT);
{Печать соответствующего сообщения ,зависящего от
 входа:  '...by land'  для L;  '...by sea'  для LL;
 иначе печать сообщения об ошибке}
VAR
  Lanterns: CHAR;
BEGIN {PaulRevere}
  {Read Lanterns}
  READ(Lanterns);
  {Issue Paul Revere's message}
  IF Lanterns = 'L'
  THEN
    BEGIN {Checking for next 'L'}
      READ(Lanterns);
      IF Lanterns <> 'L'
      THEN {Only one 'L' found}
        WRITELN('The British are coming by land.')
      ELSE {'LL' found}
        WRITELN('The British are coming by sea.')
    END {Checking for next 'L'}
  ELSE
    WRITELN('The North Church shows only ''', Lanterns, '''.')
END. {PaulRevere}
{https://vk.cc/aAQqUP}