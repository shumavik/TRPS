{�������� ����������}
program V8new;
{$APPTYPE CONSOLE}
uses
  SysUtils, Windows ;
type Mymas=array  of Integer;
var
mas:Mymas;           // �������� ������
flag:boolean;   // ����
i,j,k,b:integer;     // min �������� �� max, ����� ��� ����������
max:Integer;         // ��������������� ��������� ������

// ��������������� ���������� ��� ������ ������� ���������� ���������
{P1,P2:TDateTime;
h1,m1,s1,ms1,h2,m2,s2,ms2:Word;
t:Integer ;}
//t1,t2,time,frec: Int64;


  Begin
    // QueryPerformanceFrequency(frec);
     j:=0;
     flag:=False;   //���� �� ������������ ����� ������� �������

   while (flag<>true) do
     begin
            Writeln('Enter size massive');
            Readln(j);

            if j>0 then  flag:=True     //������ ������� ������ ���� > 0
              else Writeln('size massive should be >0');
     end;

      SetLength(mas,j);
      i:=0;
      flag:=false;    //���� �� ������ ���������� �������

      while (flag<>True) and (i<>Length(mas)) do

        begin
              Writeln('Enter number from -20 to 5');
              Readln(b);

              if (b>=-20) and (b<5) then  // �������� �� ��������� ��������
                begin
                  mas[i]:=b;
                  Inc(i);
                end
              else
                  Writeln('Error Enter');

        end;

        Writeln('Massive:');
      for j:=0 to Length(mas)-1 do
        write(' ',mas[j]);
        Writeln;
      {
          P1:=Now;
           DecodeTime(P1,H1,m1,s1,ms1);
       }

       // QueryPerformanceCounter(t1);

    //for t:=0 to 100000000 do
     for j:=0 to Length(mas)-2 do     // �������� ������ �������� ����� ��������
         begin
               max:= mas[j];  k:=j;
              for i:=j+1 to Length(mas)-1 do if mas[i]>max then   //�������� ����� �� ���� ������

              begin max:=mas[i]; k:=i end;

               b:=mas[j]; mas[j]:=max; mas[k]:=b;
          end;

     {    P2:=Now;
          DecodeTime(P2,H2,m2,s2,ms2);
          Writeln;
          Writeln(H1,':',M1,':',S1,':',Ms1); //  ����� ������ ����������
          Writeln(H2,':',M2,':',S2,':',Ms2); //����� ���������
          Writeln(H2-H1,':',M2-M1,':',Abs(S2-S1),':',Abs(Ms2-Ms1));
     }

     //    QueryPerformanceCounter(t2);
     //     time:=(t2-t1);
     //     time:=time*1000000;
     //     time:=time div frec;   {� ������}  {� ��������}

 // writeln('  time:  ', time, ' = ' ,t2 , '-',t1);



      writeln('Sort Massive:');
  for i:=0 to Length(mas)-1 do
      write('  ',mas[i]);
     mas:=nil;
     readln;
       end.
