unit uConjunto2;

{$mode ObjFPC}{$H+}

interface
uses
 SysUtils;

const
  MAX_SET = 40;

type
    tConjunto = Set of 0 .. MAX_SET;

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
      c := [];
    end;

    procedure add(var c: tConjunto; x: integer);
    begin
      Include(c, x);
    end;

    procedure remove(var c: tConjunto; x: integer);
    begin
       Exclude(c, x);
    end;

    function contains(c: tConjunto; x: integer): boolean;
    begin
      contains := x in c;
    end;

    function is_empty_con(c: tConjunto): boolean;
    begin
       is_empty_con := [] = c;
    end;

    function size(c: tConjunto): integer;
    var
      i, count: Integer;
    begin
       count := 0;
       for i := 0 to MAX_SET do
           if i in c then
              count += 1;
       size := count;
    end;

    function to_string_con(c: tConjunto): string;
    var
      i: Integer;
      s: String;
    begin
       s := '';
       for i:= 0 to MAX_SET do
           if i in c then
              s += IntToStr(i) + ' ';
       to_string_con := s;
    end;

    procedure empty(var c: tConjunto);
    begin
       c := [];
    end;

    {Otras operaciones}
    procedure union(c1, c2: tConjunto; var c3: tConjunto);
    begin
       c3 := c1 + c2;
    end;

    procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
    begin
       c3 := c1 * c2;
    end;

    procedure difference(c1, c2: tConjunto; var c3: tConjunto);
    begin
       c3 := c1 - c2;
    end;

end.

