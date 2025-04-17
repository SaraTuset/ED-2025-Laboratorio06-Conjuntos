unit uMiConjunto;

interface

uses uListaEnlazadaSimple;

type
    tConjunto = record
        lista: tListaSimple;
    end;

    {Operaciones básicas}
    procedure init(var c: tConjunto);
    procedure add(var c: tConjunto; x: integer);
    procedure remove(var c: tConjunto; x: integer);
    function multiplicity(c: tConjunto; x: integer): boolean;
    function size(c: tConjunto): integer;
    procedure remove_all(var c: tConjunto);


implementation
{Operaciones básicas}
procedure init(var c: tConjunto);
begin
  initialize(c.lista);
end;

procedure add(var c: tConjunto; x: integer);
begin
  if not in_list(c.lista, x)then
     insert_at_end(c.lista, x);
end;

procedure remove(var c: tConjunto; x: integer);
begin
  if in_list(c.lista, x) then
     delete(c.lista, x);
end;

function multiplicity(c: tConjunto; x: integer): boolean;
var
  i, f, count: Integer;
begin
  count:= 0;
  if not is_empty(c.lista) then
  for i:= 0 to num_elems(c.lista) do
  begin
    f := first(c.lista);
    if f == x then
       count += 1;
    delete_at_begin(c.lista);
    add(c, f)
  end;
end;


function size(c: tConjunto): integer;
begin
  size := num_elems(c.lista);
end;


procedure remove_all(var c: tConjunto);
var
  i, f: Integer;
begin
  count:= 0;
  if not is_empty(c.lista) then
  for i:= 0 to num_elems(c.lista) do
  begin
    delete_at_begin(c.lista);
    if f <> x then
       add(c, f)
  end;
end;

end.
