program bingo;

uses uBomboBingo, uCartonBingo;

type
  listaCartones =  Array [1..3] of tCarton;

var
  bombo: tBombo;
  cartones: listaCartones;

procedure inicializar(VAR bombo: tBombo; VAR cartones: listaCartones);
var
  carton: tCarton;
begin
  uBomboBingo.initialize(bombo);
  for carton in cartones do
      uCartonBingo.initialize(carton);
end;

procedure jugar(bombo: tBombo; cartones: listaCartones);
var
  bingo: Boolean;
  numero: Integer;
  carton: tCarton;
begin
  inicializar(bombo, cartones);
  bingo := False;
  while not bingo do
  begin
    numero := extraer_numero(bombo);
    WriteLn(numero);
    for carton in cartones do
        if consultar_numero(carton, numero) then
           if consultar_linea(carton) then
              if consultar_bingo(carton) then
                 begin
                      WriteLn('BINGO');
                      bingo:= True;
                 end;

  end;
end;

begin
  jugar(bombo, cartones);
end.

