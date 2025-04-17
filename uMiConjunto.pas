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
    function contains(c: tConjunto; x: integer): boolean;
    function is_empty_con(c: tConjunto): boolean;
    function size(c: tConjunto): integer;
    function to_string_con(c: tConjunto): string;
    procedure empty(var c: tConjunto);

    {Otras operaciones}
    procedure union(c1, c2: tConjunto; var c3: tConjunto);
    procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
    procedure difference(c1, c2: tConjunto; var c3: tConjunto);


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

function contains(c: tConjunto; x: integer): boolean;
begin
  contains := in_list(c.lista, x);
end;

function is_empty_con(c: tConjunto): boolean;
begin
  is_empty_con := is_empty(c.lista);
end;

function size(c: tConjunto): integer;
begin
  size := num_elems(c.lista);
end;

function to_string_con(c: tConjunto): string;
begin
  to_string_con := to_string(c.lista);
end;

procedure empty(var c: tConjunto);
begin
  clear(c.lista);
end;

{Otras operaciones}
procedure union(c1, c2: tConjunto; var c3: tConjunto);
var
  x, i: Integer;
begin
  if not is_empty_con(c1) then
  for i:= 0 to num_elems(c1.lista) do
  begin
    x := first(c1.lista);
    add(c3, x);
    delete_at_begin(c1.lista);
    add(c1, x);
  end;
  if not is_empty_con(c2) then
  for i:= 0 to num_elems(c2.lista) do
  begin
    x := first(c2.lista);
    if not contains(c3, x) then
       add(c3, x);
    delete_at_begin(c2.lista);
    add(c2, x);
  end;
end;

procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
var
  x, i: Integer;
begin
  if not is_empty_con(c1) then
    for i:= 0 to num_elems(c1.lista) do
    begin
      x := first(c1.lista);
      if contains(c2, x) then
         add(c3, x);
      delete_at_begin(c1.lista);
      add(c1, x);
    end;

  if not is_empty_con(c2) then
  for i:= 0 to num_elems(c2.lista) do
  begin
    x := first(c2.lista);
    if not contains(c3, x) and contains(c1, x) then
       add(c3, x);
    delete_at_begin(c2.lista);
    add(c2, x);
  end;
end;

procedure difference(c1, c2: tConjunto; var c3: tConjunto);
var
  x, i: Integer;
begin
  if not is_empty_con(c1) then
  for i:= 0 to num_elems(c1.lista) do
  begin
    x := first(c1.lista);
    if not contains(c2, x) then
       add(c3, x);
    delete_at_begin(c1.lista);
    add(c1, x);
  end;
end;

end.
