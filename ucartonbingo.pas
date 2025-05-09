unit uCartonBingo;

{$mode ObjFPC}{$H+}

interface

type
  tCarton = record
    conjunto: Set of 1..90;
    lineas: Array [1..15] of Integer;
  end;

procedure initialize(var carton: tCarton);
procedure tachar_numero(var carton: tCarton; numero: Integer);
function consultar_numero(carton: tCarton; numero: Integer):Boolean;
function consultar_linea(carton: tCarton):Boolean;
function consultar_bingo(carton: tCarton):Boolean;

implementation

procedure initialize(var carton: tCarton);
var
   r, i: Integer;
begin
   for i:= 1 to 15 do
   begin
        Randomize;
        r := Random(90) + 1;
        carton.lineas[i] := r;
        include(carton.conjunto, r);
   end;
end;

procedure tachar_numero(var carton: tCarton; numero: Integer);
var
   i: Integer;
   tachado: Boolean;
begin
   i := 0;
   tachado:= False;
   while (i < 15) and not tachado do
   begin
        i += 1;
        if carton.lineas[i] = numero then
        begin
          tachado := True;
          carton.lineas[i] := 0;
        end;
   end;

end;

function consultar_numero(carton: tCarton; numero: Integer):Boolean;
begin
   consultar_numero := numero in carton.conjunto;
end;

function consultar_linea(carton: tCarton):Boolean;
var
   i: Integer;
   linea: Boolean;
begin
   i := 0;
   linea:= False;
   while (i < 3) and not linea do
        linea := (carton.lineas[(5*i) + 1] = 0) and (carton.lineas[(5*i) + 2] = 0) and (carton.lineas[(5*i) + 3] = 0) and (carton.lineas[(5*i) +4] = 0) and (carton.lineas[(5*i) + 5] = 0);
   consultar_linea := linea;
end;

function consultar_bingo(carton: tCarton):Boolean;
var
   i: Integer;
   bingo: Boolean;
begin
   i := 0;
   bingo:= True;
   while (i < 15) and bingo do
   begin
        i += 1;
        bingo := carton.lineas[i] = 0;
   end;
   consultar_bingo := bingo;
end;

end.

