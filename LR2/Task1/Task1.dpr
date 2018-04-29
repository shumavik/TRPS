{ Вар.3. Программа должна  формировать массив чисел от 3 до 25 ,
 а затем сортировать  элементы массива по
 возрастанию и  исключать повторяющиеся элементы}
program Task1;
{$APPTYPE CONSOLE}
uses
  SysUtils;


const n=10  ;

var
{m:array [1..N] of integer;}

//*******
  m:array  [1..N]  of Integer;
//*******

i,j,k,L,b:integer;

begin
  { TODO -oUser -cConsole Main : Insert code here }


  randomize; L:=N;
      for i:=1 to L do  begin m[i]:=random(25)+3; write(m[i],' ') end; writeln;
 {//*******
  L := N;
  for i:= 1 to L do
  begin
  Readln(m[i]);
  end;
  writeln;
  for i:=1 to L do
  write(m[i],' ');
  Writeln;
 //*******}

//Программа генерирует числа не от 3 до 25, а до 27 включительно
// надо random(23)+3

k:=1;

    repeat
        i:=1;
          repeat

                     if m[i] = m[i+1] then
                            begin  for j:=i+1 to L-1 do
                            m[j]:=m[j+1];
                            dec(L);
                            dec(i)
                             end
                     else
                      if m[i] > m[i+1] then
                            begin   {???? < - ?? ???????? непонятный комментарий}
                                  b:=m[i];
                                  m[i]:=m[i+1];
                                  m[i+1]:=b
                            end;
                      {      //***
                     for j:=1 to N do
                     write(m[j],' ');
                     Writeln;
                           //***}
                inc(i);
          until I<L-1;   //Неверное условие
    inc(k);
    until K>L-1;


for i:=1 to L do begin  write(m[i],' ') end;
readln;
end.

