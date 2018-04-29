{ќбменна€ сортировка}
program V8new;
{$APPTYPE CONSOLE}
uses
  SysUtils, Windows ;
type Mymas=array  of Integer;
var
mas:Mymas;           // открытый массив
flag:boolean;   // ‘лаг
i,j,k,b:integer;     // min замен€ем на max, чтобы им€ переменной
max:Integer;         // соответствовало контектсу задачи

// вспомогательные переменные дл€ замера времени выполнени€ программы
{P1,P2:TDateTime;
h1,m1,s1,ms1,h2,m2,s2,ms2:Word;
t:Integer ;}
//t1,t2,time,frec: Int64;


  Begin
    // QueryPerformanceFrequency(frec);
     j:=0;
     flag:=False;   //‘лаг на правильность ввода размера массива

   while (flag<>true) do
     begin
            Writeln('Enter size massive');
            Readln(j);

            if j>0 then  flag:=True     //–азмер массива должен быть > 0
              else Writeln('size massive should be >0');
     end;

      SetLength(mas,j);
      i:=0;
      flag:=false;    //‘лаг на полное заполнение массива

      while (flag<>True) and (i<>Length(mas)) do

        begin
              Writeln('Enter number from -20 to 5');
              Readln(b);

              if (b>=-20) and (b<5) then  // ѕроверка на требуемый диапазон
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
     for j:=0 to Length(mas)-2 do     // улучшили проход сократив число итераций
         begin
               max:= mas[j];  k:=j;
              for i:=j+1 to Length(mas)-1 do if mas[i]>max then   //итераций стало на одну меньше

              begin max:=mas[i]; k:=i end;

               b:=mas[j]; mas[j]:=max; mas[k]:=b;
          end;

     {    P2:=Now;
          DecodeTime(P2,H2,m2,s2,ms2);
          Writeln;
          Writeln(H1,':',M1,':',S1,':',Ms1); //  врем€ начала выполнени€
          Writeln(H2,':',M2,':',S2,':',Ms2); //врем€ окончани€
          Writeln(H2-H1,':',M2-M1,':',Abs(S2-S1),':',Abs(Ms2-Ms1));
     }

     //    QueryPerformanceCounter(t2);
     //     time:=(t2-t1);
     //     time:=time*1000000;
     //     time:=time div frec;   {¬ тактах}  {¬ микросек}

 // writeln('  time:  ', time, ' = ' ,t2 , '-',t1);



      writeln('Sort Massive:');
  for i:=0 to Length(mas)-1 do
      write('  ',mas[i]);
     mas:=nil;
     readln;
       end.
