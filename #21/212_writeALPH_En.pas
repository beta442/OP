PROGRAM Pseudo(INPUT, OUTPUT);
{ Programm creates file of pseudo-symbols }

TYPE
  SignsPlace = SET OF 1 .. 25;
        
VAR
  PseudoLetter: SignsPlace;
  Letters: FILE OF SignsPlace;
BEGIN {Pseudo}
  ASSIGN(Letters, 'Letters_EN_Bin.txt');
  REWRITE(Letters);
  PseudoLetter := [];                                                                           {Blank} {0}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 6, 10, 11, 15, 16, 17, 18, 19, 20, 21, 25];                         {A}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 6, 8, 11, 12, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];              {B}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 16, 21, 22, 23, 24, 25];                               {C}
  WRITE(Letters, PseudoLetter);                                                                 
  PseudoLetter := [1, 2, 3, 4, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];                      {D}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 16, 21, 22, 23, 24, 25];                       {E}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 16, 21];                                   {F}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 13, 14, 15, 16, 20, 21, 22, 23, 24, 25];               {G}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 11, 12, 13, 14, 15, 16, 20, 21, 25];                            {H}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 8, 13, 18, 21, 22, 23, 24, 25];                               {I}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 8, 13, 16, 18, 21, 22, 23];                                   {J}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 4, 5, 6, 8, 11, 12, 16, 18, 21, 24, 25];                                  {K}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 6, 11, 16, 21, 22, 23, 24, 25];                                           {L}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 7, 9, 10, 11, 13, 15, 16, 20, 21, 25];                              {M}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 7, 10, 11, 13, 15, 16, 19, 20, 21, 25];                             {N}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];                   {O}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 10, 11, 12, 13, 14, 15, 16, 21];                           {P}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 6, 9, 11, 14, 16, 17, 18, 19, 25];                               {Q}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 6, 9, 11, 12, 13, 14, 16, 19, 21, 25];                           {R}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 11, 12, 13, 14, 15, 20, 21, 22, 23, 24, 25];               {S}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 8, 13, 18, 23];                                               {T}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 11, 15, 16, 20, 21, 22, 23, 24, 25];                            {U}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 11, 15, 17, 19, 23];                                            {V}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 8, 10, 11, 13, 15, 17, 18, 19, 23];                                 {W}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 7, 9, 13, 17, 19, 21, 25];                                             {X}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 5, 6, 10, 12, 14, 18, 23];                                                {Y}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 9, 13, 17, 21, 22, 23, 24, 25];                               {Z}     {26}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [17, 18, 19, 22, 23, 24];                                                     {.}
  WRITE(Letters, PseudoLetter); 
  PseudoLetter := [16, 17, 22];                                                                 {,}
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [2, 3, 4, 7, 8, 9, 12, 13, 14, 23];                                           {!}
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [1, 2, 3, 4, 5, 10, 13, 14, 15, 22, 23, 24];                                  {?}     {30}
  WRITE(Letters, PseudoLetter); 
  PseudoLetter := [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];                                              {'}     
  WRITE(Letters, PseudoLetter);                                                                 
  PseudoLetter := [11, 12, 13, 14, 15];                                                         {-}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 4, 7, 9];                                                                 {"}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [8, 18];                                                                      {:} 
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [8, 18, 19, 24];                                                              {;}     {35}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [4, 8, 12, 18, 24];                                                           {<}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 8, 14, 18, 22];                                                           {>}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [7, 11, 13, 15, 19];                                                          {~}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 7, 8, 9, 10];                                                    {`}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 6, 8, 10, 11, 13, 14, 15, 16, 22, 23, 24, 25];                      {@}     {40}
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [2, 4, 6, 7, 8, 9, 10, 12, 14, 16, 17, 18, 19, 20, 22, 24];                   {#}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 3, 4, 5, 6, 8, 11, 12, 13, 14, 15, 18, 20, 21, 22, 23, 24, 25];        //$     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 2, 5, 6, 7, 9, 13, 17, 19, 20, 21, 24, 25];                               {%}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [3, 7, 9, 11, 15];                                                            {^}     
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [2, 6, 8, 12, 13, 15, 16, 19, 21, 22, 23, 25];                                {&}     {45}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 3, 5, 7, 8, 9, 11, 12, 13, 14, 15, 17, 18, 19, 21, 23, 25];               {*}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [3, 7, 12, 17, 23];                                                           {(}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [3, 9, 14, 19, 23];                                                           {)}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [21, 22, 23, 24, 25];                                                         {_}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [3, 8, 11, 12, 13, 14, 15, 18, 23];                                           {+}     {50}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [6, 7, 8, 9, 10, 16, 17, 18, 19, 20];                                         {=}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 12, 17, 22, 23, 24];                                             {[}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 9, 14, 19, 22, 23, 24];                                             {]}
  WRITE(Letters, PseudoLetter);                  
  PseudoLetter := [2, 3, 4, 7, 11, 12, 17, 22, 23, 24];                                         //{
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 9, 14, 15, 19, 22, 23, 24];                                         //}     {55}
  WRITE(Letters, PseudoLetter);  
  PseudoLetter := [3, 8, 13, 18, 23];                                                           {|}     
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [5, 9, 13, 17, 21];                                                           {/}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [1, 7, 13, 19, 25];                                                           {\}
  WRITE(Letters, PseudoLetter);      
  PseudoLetter := [3, 7, 8, 13, 18, 22, 23, 24];                                                {1}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 9, 12, 13, 14, 17, 22, 23, 24];                                     {2}     {60}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 9, 12, 13, 14, 19, 22, 23, 24];                                     {3}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 4, 7, 9, 12, 13, 14, 19, 24];                                             {4}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 12, 13, 14, 19, 22, 23, 24];                                     {5}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 12, 13, 14, 17, 19, 22, 23, 24];                                 {6}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 9, 14, 19, 24];                                                     {7}     {65}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 9, 12, 13, 14, 17, 19, 22, 23, 24];                              {8}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 9, 12, 13, 14, 19, 22, 23, 24];                                  {9}
  WRITE(Letters, PseudoLetter);
  PseudoLetter := [2, 3, 4, 7, 9, 12, 14, 17, 19, 22, 23, 24];                                  {0}
  WRITE(Letters, PseudoLetter)
END. {Pseudo}
