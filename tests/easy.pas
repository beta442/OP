PROGRAM Circle_s_params;
CONST Pi = 3.14;
VAR
  R, C, S: REAL;
BEGIN {Circle_s_param}
  WRITELN('Введите радиус окружности r = ');
  READ(R);
  S := Pi*R*R;
  C := 2*Pi*R;
  WRITELN('Площадь круга, ограниченного окружностью S = ', S);
  WRITELN('Длина окружности C = ', C)
END. {Circle_s_param}  
