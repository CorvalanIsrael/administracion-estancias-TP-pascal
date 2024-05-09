{$UNITPATH models}
{$mode Delphi}

unit estancia_controller;

interface
    uses estancia_model in 'src/models/estancia_model.pas';

    function guardarEstanciaController(PEstancia: TEstancia): string;
    function modificarEstanciaController(PId: string): string;
    function eliminarEstanciaController(PId: string): string;
    function obtenerEstanciaController(PId: string): string;
    function obtenerTodasLasEstanciasController(): TListaDeEstancias;
    function obtenerEstanciasConPiscinaController(): TListaDeEstancias;
    function obtenerEstanciasDeUnaProvinciaController(PCodigoProvincia: string): TListaDeEstancias;

implementation

    function guardarEstanciaController(PEstancia: TEstancia): string;
    var
        archivo: file of TEstancia;
    begin
        try
            PEstancia.id:= 'identificarUnico'; // TODO: GenerarIdUtil()
            
            assignFile(archivo, 'data/estancias.dat');
            reset(archivo);
            seek(archivo, fileSize(archivo));
            write(archivo, PEstancia);

            closeFile(archivo);
            guardarEstanciaController:= 'Estancia creada con éxito' + PEstancia.id;
        except
            on E: TObject do
                guardarEstanciaController:= 'Error crear una estancia.';
        end;
    end;

    function modificarEstanciaController(PId: string): string;
    begin
        // TODO: lógica para actualizar en archivo
        writeln('Modificando estancia: ', PId);
        modificarEstanciaController:= 'Estancia modificada con éxito';
    end;

    function eliminarEstanciaController(PId: string): string;
    begin
        // TODO: lógica para eliminar en archivo
        writeln('Eliminando estancia: ', PId);
        eliminarEstanciaController:= 'Estancia eliminada con éxito';
    end;

    function obtenerEstanciaController(PId: string): string;
    begin
        // TODO: lógica para buscar en archivo
        writeln('Buscando estancia: ', PId);
        obtenerEstanciaController:= 'Estancia encontrada con éxito';
    end;

    function obtenerTodasLasEstanciasController(): TListaDeEstancias;
    var 
    archivo: file of TEstancia;
    estancia: TEstancia;
    estanciasEncontradas: TListaDeEstancias;
    begin
        assignFile(archivo, 'data/estancias.dat');
        reset(archivo);
        try
            while not Eof(archivo) do
            begin
                read(archivo, estancia);
                setLength(estanciasEncontradas, length(estanciasEncontradas) + 1);
                estanciasEncontradas[high(estanciasEncontradas)]:= estancia;
            end;
        finally
            closeFile(archivo);
            obtenerTodasLasEstanciasController:= estanciasEncontradas;
        end;
    end;

    function obtenerEstanciasConPiscinaController(): TListaDeEstancias;
    var estanciasEncontradas: TListaDeEstancias;
    begin
        // TODO: lógica para buscar todas las estancias con piscina en archivo
        writeln('Buscando estancias con piscina.');
        obtenerEstanciasConPiscinaController:= estanciasEncontradas;
    end;

    function obtenerEstanciasDeUnaProvinciaController(PCodigoProvincia: string): TListaDeEstancias;
    var estanciasEncontradas: TListaDeEstancias;
    begin
        // TODO: lógica para buscar todas las estancias de una provincia en archivo
        writeln('Buscando estancias con piscina.');
        obtenerEstanciasDeUnaProvinciaController:= estanciasEncontradas;
    end;
end.