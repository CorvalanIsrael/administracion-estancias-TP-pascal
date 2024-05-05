{$UNITPATH models}

unit estancia_controller;

interface
    uses provincia_model in 'src/models/provincia_model.pas';

    function crearLasProvincias(): string;
    function obtenerTodasLasProvincias(): TListaDeProvincias;

implementation

    function crearLasProvincias(): string;
    begin
        // TODO: lógica para crear provincias en archivo
        writeln('Creando provincias...');
        crearLasProvincias:= 'Provincias creadas con éxito';
    end;

    function obtenerTodasLasProvincias(): TListaDeEstancias;
    var provinciasEncontradas: TListaDeProvincias;
    begin
        // TODO: lógica para buscar todas las provincias en archivo
        writeln('Buscando provincias...');
        obtenerTodasLasProvincias:= provinciasEncontradas;
    end;
end.