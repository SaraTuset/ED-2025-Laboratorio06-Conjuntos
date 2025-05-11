unit uMiConjunto;

interface

uses uListaEnlazadaSimple;

type
    tConjunto = record
        lista: tListaSimple;
        size: Integer;
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
   c.size:=0;
end;

procedure add(var c: tConjunto; x: integer);
begin
   if not in_list(c.lista, x) then
   begin
     insert_at_end(c.lista, x);
     c.size += 1;
   end;
end;

procedure remove(var c: tConjunto; x: integer);
begin
   delete(c.lista, x);
   c.size -= 1;
end;

function contains(c: tConjunto; x: integer): boolean;
begin
   in_list(c.lista, x);
end;

function is_empty_con(c: tConjunto): boolean;
begin
   is_empty_con := c.size = 0;
end;

function size(c: tConjunto): integer;
begin
    size := c.size;
end;

function to_string_con(c: tConjunto): string;
begin
   to_string_con := to_string(c.lista);
end;

procedure empty(var c: tConjunto);
begin
    while not is_empty(c.lista) do
    begin
      delete_at_begin(c.lista);
      c.size -= 1;
    end;
end;

{Otras operaciones}
procedure union(c1, c2: tConjunto; var c3: tConjunto);
var
  x, i: Integer;
begin
   for i:= 1 to size(c1) do
   begin
        x := first(c1.lista);
        add(c3, x);
        delete_at_begin(c1.lista);
        insert_at_end(c1.lista, x);
   end;
   for i:= 1 to size(c2) do
   begin
        x := first(c2.lista);
        add(c3, x);
        delete_at_begin(c2.lista);
        insert_at_end(c2.lista, x);
   end;

end;

procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
var
  x, i: Integer;
begin
   for i:= 1 to size(c1) do
   begin
        x := first(c1.lista);
        if contains(c2, x) then
           add(c3, x);
        delete_at_begin(c1.lista);
        insert_at_end(c1.lista, x);
   end;
end;

procedure difference(c1, c2: tConjunto; var c3: tConjunto);
var
  x, i: Integer;
begin
   for i:= 1 to size(c1) do
   begin
        x := first(c1.lista);
        if not contains(c2, x) then
           add(c3, x);
        delete_at_begin(c1.lista);
        insert_at_end(c1.lista, x);
   end;
end;

end.
