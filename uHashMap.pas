unit uHashMap;

interface

uses
    SysUtils;

const
    HashMapSize = 10;

type

    tEntrada = record
        key: string;
        value: Integer;
    end;

    tHashMap = array[0..HashMapSize-1] of tEntrada;

    procedure initialize(var map: tHashMap);
    procedure add(var map: tHashMap; key: string; value: Integer);
    procedure remove(var map: tHashMap; key: string);
    function contains(map: tHashMap; key: string): Boolean;
    procedure show_map_state(map: tHashMap);
    function hash_function(key: string): Integer;

implementation

procedure initialize(var map: tHashMap);
var
    i: Integer;
begin
    for i:= 0 to HashMapSize - 1 do
        map[i].key:= '';
end;

function hash_function(key: string): Integer;
var
    sum_of_chars, i: Integer;
begin
    sum_of_chars := 0;
    for i := 0 to Length(key) do
        sum_of_chars := (sum_of_chars + ord(key[i])) mod HashMapSize;
    hash_function := sum_of_chars;
end;

procedure add(var map: tHashMap; key: string; value: Integer);
var
    index: Integer;
begin
    index := hash_function(key);
    if map[index].key = '' then
    begin
      map[index].key:=key;
      map[index].value:=value;
    end;
end;

function contains(map: tHashMap; key: string): Boolean;
var
    index: Integer;
begin
    index := hash_function(key);
    contains := map[index].key = key;
end;

procedure remove(var map: tHashMap; key: string);
var
    index: Integer;
begin
    index := hash_function(key);
    map[index].key:= '';
end;

procedure show_map_state(map: tHashMap);
var
    i: Integer;
begin
    for i := 0 to HashMapSize-1 do
    begin
        WriteLn(Format('[%s: %d]', [map[i].key, map[i].value]));
    end;
end;

end.
