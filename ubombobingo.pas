unit uBomboBingo;

{$mode ObjFPC}{$H+}

interface

type
  tBombo = Array [1 .. 90] of Boolean;

procedure initialize(VAR bombo: tBombo);
function extraer_numero(VAR bombo: tBombo): Integer;
procedure introducir_numero(VAR bombo: tBombo; numero: Integer);
function restantes(bombo: tBombo): Integer;

implementation

procedure initialize(VAR bombo: tBombo);
var
  i:Integer;
begin
  for i:= 1 to 90 do
      bombo[i] := True;
end;

function extraer_numero(VAR bombo: tBombo): Integer;
var
  i:Integer;
  found: Boolean;
begin
  found := False;
  while not found do
  begin
    Randomize;
    i := Random(90) + 1;
    found := bombo[i];
  end;
  extraer_numero := i;
end;

procedure introducir_numero(VAR bombo: tBombo; numero: Integer);
begin
  bombo[numero] := True;
end;

function restantes(bombo: tBombo): Integer;
var
  i, count:Integer;
begin
  count := 0;
  for i:= 1 to 90 do
      if bombo[i] then
         count += 1;
  restantes := count;

end;

end.

