{ќбменна€ сортировка}
program V8;
{$APPTYPE CONSOLE}
uses
  SysUtils, Windows ;

const N=10;
var
m:array  [1..N] of integer;
i,j,k,b,min:integer;

//¬спомогательные переменые дл€ замера
//t1,t2, time, frec: int64;
t:Integer;
       P1,P2: TDateTime;  // вспомогательные переменные
       H1,M1,S1,Ms1,H2,M2,S2,Ms2:word;


  Begin
   //   QueryPerformanceFrequency(frec);

      randomize;
  for i:=1 to N do begin m[i]:=random(15)-20;write('  ',m[i]) end;
   { for i:=1 to N do
    begin
          Writeln('Enter number');
          Readln(m[i]);
    end; }
   //  QueryPerformanceCounter(t1);

   // P1:= Now; // фиксаци€ времени начала
   //  DecodeTime(P1, H1, M1, S1, Ms1);

    //  for t:= 0 to 100000000 do
      for j:=1 to N do
         begin  min:= m[j]; k:=j;
              for i:=j to N do if m[i]<min then

              begin min:=m[i]; k:=i end;
               b:=m[j]; m[j]:=min; m[k]:=b;
          end;

     {  for j:=1 to N do
         begin  min:= m[j]; k:=j;
              for i:=j to N do if m[i]>min then

              begin min:=m[i]; k:=i end;
               b:=m[j]; m[j]:=min; m[k]:=b;
          end;

        P2:= Now; // фиксаци€  времени окончани€
        DecodeTime(P2, H2, M2, S2, Ms2);
      }

     //  QueryPerformanceCounter(t2);
      //   time:=(t2-t1);
       //  time:=time*1000000;
        // time:=time div frec;   {¬ тактах}  {¬ микросек}

     //  writeln('  time:  ', time, ' = ' ,t2 , '-',t1);


    { Writeln(H1,':',M1,':',S1,':',Ms1); //  врем€ начала выполнени€
     Writeln(H2,':',M2,':',S2,':',Ms2); //врем€ окончани€
     Writeln(H2-H1,':',M2-M1,':',Abs(S2-S1),':',Abs(Ms2-Ms1));
     }


      writeln;
  for i:=1 to N do begin write('  ',m[i]) end;
     readln;
       end.














