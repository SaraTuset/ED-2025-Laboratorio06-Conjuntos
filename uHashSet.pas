unit uHashSet;

interface

const
    HashSetSize = 10;

type
    THashSet = array[0..HashSetSize-1] of string;

function hash_function(value: string): Integer;
procedure add(var hashset: THashSet; value: string);
function contains(var hashset: THashSet; value: string): Boolean;
procedure show_hashset_state(var hashset: THashSet);
procedure clear_hashset(var hashset: THashSet);

implementation


{ Ejercicio 3.1 Esta función deberás implementarla tú. }
function hash_function(value: string): Integer;
var
    sum_of_chars, i: Integer;
begin
    sum_of_chars := 0;
    for i := 0 to Length(value) do
        sum_of_chars := (sum_of_chars + ord(value[i])) mod HashSetSize;
    hash_function := sum_of_chars;
end;

procedure add(var hashset: THashSet; value: string);
var
    index: Integer;
begin
    index := hash_function(value);
    hashset[index] := value;
end;

function contains(var hashset: THashSet; value: string): Boolean;
var
    index: Integer;
begin
    index := hash_function(value);
    contains := hashset[index] = value;
end;

procedure show_hashset_state(var hashset: THashSet);
var
    index: Integer;
begin
    Write('Estado actual del HashSet: [');
    for index := Low(hashset) to High(hashset) do
    begin
        if hashset[index] <> '' then
        begin
            Write('"', hashset[index], '"');
            Write(' ');
        end;
    end;
    WriteLn(']');
end;

procedure clear_hashset(var hashset: THashSet);
var
    index: Integer;
begin
    for index := Low(hashset) to High(hashset) do
        hashset[index] := '';
end;

end.
