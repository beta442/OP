UNIT CountingWords;

INTERFACE      
       
PROCEDURE CountWord(Word: STRING);                                              { Âñòàâëÿåò ñëîâî Word â áèíàðíîå äåðåâî }
PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);                               { Ïå÷àòü ñîäåðæèìîãî äåðåâà }

IMPLEMENTATION

TYPE
  Tree = ^Node;
  Node = RECORD
           Word: STRING;      //ïîëå ÿ÷åéêè, ñîäåðæèò â ñåáå ñëîâî-ñèìâîëû
           Counter: INTEGER;  //ñ÷¸ò÷èê, ïîêàçûâàåò, êîë-âî îäèíàêîâî îáðàáîòàííûõ Word ïðè âñòàâêå â äåðåâî
           Left, Right: Tree  //óêàçàòåëè â áèíàðíîì äåðåâå         
         END;
            
  TempNode = RECORD
               Word: STRING;
               Counter: INTEGER
             END;
  NodeFile = FILE OF TempNode; 

{ Ðåàëèçîâàíî áèíàðíûì äåðåâîì, ñ êîíòðîëåì ïî ïàìÿòè  }
         
VAR
  WordAmount: INTEGER;
  Root: Tree;
  HasOverflow, TreeSaved: BOOLEAN; //HasOverflow - èìååò ëè ïåðåïîëíåíèå íà äàííûé ìîìåíò, TreeSaved - äåðåâî õîòü ðàç áûëî ñîõðàíåíî

PROCEDURE WriteTempFile(VAR TempFile: NodeFile);
{ Èìååòñÿ òèïèçèðîâàííûé ôàéë, ñîñòîÿùèé èç äâóõ ïîëåé:
  ïîëå1: ñëîâî-ñòðîêà, ïîëå2: ñ÷¸ò÷èê(êîë-âî ñëîâ)
  Ïðîöåäóðà ïå÷àòàåò ýòîò ôàéë â OUTPUT }
VAR
  Temp: TempNode;
BEGIN
  RESET(TempFile);
  WHILE NOT EOF(TempFile)
  DO
    BEGIN
      READ(TempFile, Temp);
      WRITELN(Temp.Word)
    END
END;

PROCEDURE SaveTreeIntoFile(VAR Pointer: Tree; VAR TreeHolder: NodeFile);
{ Ïðîéäè ïî âñåì ýëåìåíòàì äåðåâà è ñîõðàíè èõ â TreeHolder }
VAR
  SavedNode: TempNode;
BEGIN { SaveTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      SaveTreeIntoFile(Pointer^.Left, TreeHolder);
      //ïîäãîòîâèì êîíòåéíåð SavedNode
      SavedNode.Word := Pointer^.Word;
      SavedNode.Counter := Pointer^.Counter;
      //êîòîðûé ñîõðàíèì â òèïèçèðîâàííîì ôàéëå TreeHolder
      WRITE(TreeHolder, SavedNode);
      
      SaveTreeIntoFile(Pointer^.Right, TreeHolder)
    END  
END; { SaveTree }

PROCEDURE MergeTreeBackUpWithHistory(VAR BackUpFile, HistoryFile: NodeFile);
{ Ñàìàÿ æ¸ñòêàÿ ïðîöåäóðà, èìåþòñÿ äâà ôàéëà - áýêàï äåðåâà è èñòîðèÿ ðàáîòû
  äåðåâà - òî, ÷òî áûëî â í¸ì, åñëè óæå ïðîèñõîäèëè ñáðîñû äåðåâà èç îïåðàòèâêè }
VAR
  Temp1, Temp2: TempNode;  //ñ ïîìîùüþ ýòèõ ÿ÷ååê áóäåì òàñîâàòü ôàéëû
  TempFile: NodeFile;      //ôàéë, êóäà âðåìåííî ñêîïèðóåì ñîäåðæèìîå HistoryFile
  HasInsert: BOOLEAN;      //î÷åíü êðóòîé ôëàã! êîíòðîëëèðóåì âñòàâêó
BEGIN { MergeTreeBackUpWithHistory }
  REWRITE(TempFile);
  RESET(HistoryFile);
  
  //íó òóò ïîíÿòíî - ïðîñòî ñîõðàíèëè èñòîðèþ â TempFile
  WHILE NOT EOF(HistoryFile)
  DO
    BEGIN
      READ(HistoryFile, Temp1);
      WRITE(TempFile, Temp1)
    END;
    
  REWRITE(HistoryFile);
  RESET(TempFile);     
  RESET(BackUpFile);
  

  //ãîòîâèì íàøè ôàéëû TempFile, BackUpFile äëÿ merge â HistoryFile
  WHILE NOT EOF(BackUpFile)
  DO
    BEGIN
      HasInsert := FALSE;
      READ(BackUpFile, Temp2);
      WHILE NOT EOF(TempFile)
      DO
        BEGIN
          READ(TempFile, Temp1);
          
          //ïðîñòî ëèñòàåì TempFile, òðàíñëèðóþÿ åãî â History, ò.ê. íå íàøëè ìåñòî äëÿ âñòàâêè
          //îáðàòèòå âíèìàíèå, çäåñü íå àêòèâèðóåòñÿ ôëàã âñòàâêè!!! (ëîãè÷íî)
          IF Temp1.Word < Temp2.Word
          THEN
            BEGIN
              WRITE(HistoryFile, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-skipped insertion');
              CONTINUE
            END;  
          
          //íàøà îñòàíîâî÷êà, ñêëàäûâàåì ñ÷¸ò÷èêè, ïîñòóïèâøèé èç äåðåâà è óæå ëåæàâøèé â "ñèñòåìå"
          IF Temp1.Word = Temp2.Word
          THEN
            BEGIN
              Temp1.Counter := Temp1.Counter + Temp2.Counter;
              WRITE(HistoryFile, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-find equal');
              HasInsert := TRUE;
              BREAK
            END;
          
          //íå íàøëè òàêîãî ñëîâà â ñèñòåìå, íî íàøëè ìåñòî äëÿ âñòàâêè
          IF Temp1.Word > Temp2.Word
          THEN
            BEGIN
              WRITE(HistoryFile, Temp2, Temp1);
              //WRITELN(Temp1.Word, ' ', Temp2.Word, '<-find insertion place');
              HasInsert := TRUE;
              BREAK
            END;
          
          //ñàìîå èíòåðåñíîå - äâà íèíèõ óñëîâèÿ, ïî ñóòè äîïå÷àòàòü òî, ÷òî íå ïðîøëî ïî âåðõíèì óñëîâèÿì
          IF EOF(TempFile) THEN WRITE(HistoryFile, Temp2)
              
        END; 
      
      //ïðåäñòàâüòå 3 ôàéëà, äâà èç êîòîðûõ âû merge â òðåòèé, ýòî íóæíî ïðîñòî ñìî÷ü ïðåäñòàâèòü
      IF NOT HasInsert THEN WRITE(HistoryFile, Temp2)
      
    END;         

  //îñòàâèë îòëàäî÷íûå êîìàíäû :) ðàçêîììåíòèðóéòå è óâèäèòå ëîãè ðàáîòû merge

  {WRITELN;
  WriteTempFile(TempFile);
  WRITELN('TempFile - What was');
  WRITELN;    
  WriteTempFile(BackUpFile);
  WRITELN('SavedTree - What need to be inserted');
  WRITELN;
  WriteTempFile(HistoryFile);
  WRITELN('History - after insertion');
  WRITELN;}

  //è êîíå÷íî æå óäàëàåì íàø áåêàï äåðåâà, èáî óæå ñîðàíèëè åãî         
  REWRITE(BackUpFile)  
END; { MergeTreeBackUpWithHistory }

PROCEDURE EmptyTree(VAR Pointer: Tree);
{ Èñïîëüçóé äëÿ ïîëíîãî óíè÷òîæåíèÿ äåðåâà  }
BEGIN { EmptyTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      EmptyTree(Pointer^.Left);
      EmptyTree(Pointer^.Right);
      DISPOSE(Pointer);                   
      Pointer := NIL;
      WordAmount := WordAmount - 1
    END
END; { EmptyTree }

VAR
  CurrentTreeBackUp, TreeHistory: NodeFile;

CONST
  MaxWordAmount = 20000;

PROCEDURE Insert(VAR Pointer: Tree; Word: STRING);
{ Êëàä¸ò ñëîâî â áèíàðíîå äåðåâî, ðåàëèçîâàí êîíòðîëü ïåðåïîëíåíèÿ }

//Òðåáóåòñÿ çíàòü óñòðîéòñâî áèíàðíîãî äåðåâà!//

BEGIN { Insert }
  IF Pointer = NIL
  THEN
    BEGIN
      NEW(Pointer);
      Pointer^.Word := Word;        
      Pointer^.Counter := 1;
      Pointer^.Left := NIL;
      Pointer^.Right := NIL;
      WordAmount := WordAmount + 1   
    END
  ELSE
    BEGIN
      IF Pointer^.Word > Word
      THEN
        Insert(Pointer^.Left, Word);
        
      IF Pointer^.Word < Word
      THEN     
        Insert(Pointer^.Right, Word);
    
      { Ñëîâî óæå åñòü â äåðåâå? 
        Òîãäà ïðîñòî óâåëè÷èòü ñ÷¸ò÷èê íà 1, 
        áåç âñòàâêè â äåðåâî }        
      IF Pointer^.Word = Word
      THEN
        Pointer^.Counter := Pointer^.Counter + 1
    END
END; { Insert }

CONST
  MaxWordSize = 50;

PROCEDURE WriteWordWithStatistic(VAR StatisticFile: TEXT; VAR Pointer: Tree);
{ Áåð¸ò ÿ÷åéêó èç îïåðàòèâíîé ïàìÿòè è îòôîðìàòèðîâàííî ïå÷àòàåò
  å¸ ñîäåðèìîå â ôàéë StatisticFile }
VAR
  BlankSize: INTEGER;
BEGIN { WriteWordWithStatistic }
  WRITE(StatisticFile, Pointer^.Word);
  
  IF Length(Pointer^.Word) < MaxWordSize
  THEN
    BlankSize := MaxWordSize - Length(Pointer^.Word)
  ELSE
    BlankSize := 1;  
  
  FOR BlankSize := BlankSize DOWNTO 0
  DO
    WRITE(StatisticFile, ' ');
    
  WRITELN(StatisticFile, Pointer^.Counter)   
           
END; { WriteWordWithStatistic }

PROCEDURE WriteSavedTreeTempFile(VAR StatisticFile: TEXT; VAR DataFile: NodeFile);
{ Òîæå ñàìîå, ÷òî è ïðåäûäóùàÿ ïðîöåäóðà, íî ðàáîòà óæå ñ ïîñòîÿííîé ïàìÿòüþ
  Íå äåëàë ôóíêöèþ, âîçâðàùàþùóþ îòôîðìàòèðîâàííóþ ñòðîêó, ïîòîìó ÷òî
  â ñòðîêå 255 ñèìâîëîâ, à âäðóã ïîïàä¸òñÿ áîëüøîå ñëîâî è íå îòîáðàçèòñÿ ñ÷¸ò÷èê? }
VAR
  BlankSize: INTEGER;
  Temp: TempNode;
BEGIN { WriteSavedTreeTempFile }
  RESET(DataFile);
  WHILE NOT EOF(DataFile)
  DO
    BEGIN
      READ(DataFile, Temp);
      
      WRITE(StatisticFile, Temp.Word);
      
      IF Length(Temp.Word) < MaxWordSize
      THEN
        BlankSize := MaxWordSize - Length(Temp.Word)
      ELSE
        BlankSize := 1;  
  
      FOR BlankSize := BlankSize DOWNTO 0
      DO
        WRITE(StatisticFile, ' ');
        
      WRITELN(StatisticFile, Temp.Counter)  
      
    END            
END; { WriteSavedTreeTempFile }

PROCEDURE PrintTree(Pointer: Tree; VAR DataFile: TEXT);
{ Ïå÷àòü áèíàðíîãî äåðåâà }
BEGIN { PrintTree }
  IF Pointer <> NIL
  THEN
    BEGIN
      PrintTree(Pointer^.Left, DataFile);
      { Pointer^.Word = '' - ïðîáåë, åñëè õî÷åøü îòîáðàçèòü 
        êîë-âî ïðîáåëîâ â òåêñòå - óáåðè óñëîâèå }
      IF Pointer^.Word <> ''
      THEN 
        WriteWordWithStatistic(DataFile, Pointer);
      PrintTree(Pointer^.Right, DataFile);
    END                                     
END; { PrintTree }    


PROCEDURE CountWord(Word: STRING);
BEGIN { CountWord }
  IF WordAmount < MaxWordAmount    //áóäåì äåëàòü âñòàâêó, ïîêà åñòü ìåñòî â îïåðàòèâêå
  THEN
    Insert(Root, Word)
  ELSE
    BEGIN  //êîíòðîëü ïåðåïîëíåíèÿ
      Insert(Root, Word);          //íóæíî äîâñòàâèòü òî, ÷òî íå âìåñòèëîñü   
      HasOverflow := TRUE;         
      SaveTreeIntoFile(Root, CurrentTreeBackUp); //îòòðàíñëèðåì ñîäåðæèìîå äåðåâà â òèïèçèðîâàííûé ôàéë
      TreeSaved := TRUE;
      EmptyTree(Root)                            //óíè÷òîæèì äåðåâî
    END;
  IF HasOverflow
  THEN
    BEGIN
      MergeTreeBackUpWithHistory(CurrentTreeBackUp, TreeHistory);  //ïî íàëè÷èþ ïåðåïîëíåíèÿ åäèíîæäû ñëèâàåì äàííûå â ôàéë-èñòîðèè
      HasOverflow := FALSE
    END      
END; { CountWord }

PROCEDURE PrintFileStatistic(VAR DataFile: TEXT);
{ Ïå÷àòü èòîãîâîãî ôàéëà ñòàòèñòèêè }
BEGIN { PrintFileStatistic }
  IF TreeSaved //çíà÷èò ïðåäñòîèò ðàáîòà ñ òèïèçèðîâàííûìè ôàéëàìè
  THEN
    BEGIN
      //save lefted stuff
      SaveTreeIntoFile(Root, CurrentTreeBackUp);                                         
      MergeTreeBackUpWithHistory(CurrentTreeBackUp, TreeHistory);
      WriteSavedTreeTempFile(DataFile, TreeHistory)
    END  
  ELSE        //çíà÷èò ïðîñòî îòòðàíñëèðóåì ñîäåðæèìîå äåðåâî, îáîéäÿ åãî, â ôàéë
    PrintTree(Root, DataFile)
END; { PrintFileStatistic }
  
BEGIN { InsertTree }
  WordAmount := 0;
  HasOverflow := FALSE;
  TreeSaved := FALSE;
  Root := NIL;                              
  ASSIGN(CurrentTreeBackUp, '~Temp1.txt'); //ôàéë áóäåò âðåìåííî ñîäåðæàòü â ñåáå áýêàï äåðåâà â ìîìåíò ïåðåïîëíåíèÿ, ïîñëå óíè÷òîæåíèÿ äåðåâà
  REWRITE(CurrentTreeBackUp);
  ASSIGN(TreeHistory, '~Temp2.txt');//ôàéë áóäåò âðåìåííî (ïî÷åìó òàê? ÿ íå ïîíÿë. èäåÿ áûëà â òîì, ÷òîáû èìåòü äîñòóï ê ýòèì ôàéëàì â ëþáîå âðåìÿ)
  REWRITE(TreeHistory)              //            ñîäåðæàòü èñòîðèþ ðàáîòû äåðåâà (íó, áåêàï óäàëÿåòñÿ ïîíÿòíî ïî÷åìó, íî ïî÷åìó íåò èñòîðèè???)
END. { InsertTree }
