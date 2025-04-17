program conjuntos_ej4;

uses
    SysUtils, 
    uHashSet,
    math;


const
    HashSetSize = 10;

var
    my_hash_set: THashSet;
    intento: string;


{ Ejercicio 3.3.}
procedure histograma_colisiones;
var
    i, t: Integer;
    letra: Char;
    histograma: array[0..HashSetSize-1] of integer;

begin 
    // Inicializar el HashSet como vacío
    FillChar(histograma, SizeOf(histograma), 0);
    t := 0;
    WriteLn('Total de colisiones: ', t);
end;



begin
    // Inicializar el HashSet como vacío
    FillChar(my_hash_set, SizeOf(my_hash_set), 0);
    WriteLn('HashSet inicializado vacío.');
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    // Añadir elementos y mostrar el estado
    add(my_hash_set, 'Jones');
    WriteLn('''Jones'' está en el HashSet: ', contains(my_hash_set, 'Jones'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Lisa');
    WriteLn('''Lisa'' está en el HashSet: ', contains(my_hash_set, 'Lisa'));
    WriteLn('''Bob'' está en el HashSet: ', contains(my_hash_set, 'Bob')); // Aún no se ha añadido Bob
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Bob');
    WriteLn('''Bob'' está en el HashSet: ', contains(my_hash_set, 'Bob'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Siri');
    WriteLn('''Siri'' está en el HashSet: ', contains(my_hash_set, 'Siri'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');

    add(my_hash_set, 'Pete');
    WriteLn('''Pete'' está en el HashSet: ', contains(my_hash_set, 'Pete'));
    show_hashset_state(my_hash_set);
    WriteLn('--------------------');


    // Ejercicio 3.2. Busca una palabra que produzca una coliusión
    intento := 'AAAA';
    WriteLn('''', intento, ''' tiene el hash ', hash_function(intento));
    add(my_hash_set, intento);
    intento := 'BBBB';
    WriteLn('''', intento, ''' tiene el hash ', hash_function(intento));
    add(my_hash_set, intento);

    WriteLn('--------------------');
    show_hashset_state(my_hash_set);
    clear_hashset(my_hash_set);
    WriteLn('--------------------');
    WriteLn('Histograma de colisiones:');
    histograma_colisiones;

    ReadLn;
end.
