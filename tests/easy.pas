PROGRAM Circle_s_params;
CONST Pi = 3.14;
VAR
  R, C, S: REAL;
BEGIN {Circle_s_param}
  WRITELN('������� ������ ���������� r = ');
  READ(R);
  S := Pi*R*R;
  C := 2*Pi*R;
  WRITELN('������� �����, ������������� ����������� S = ', S);
  WRITELN('����� ���������� C = ', C)
END. {Circle_s_param}  
