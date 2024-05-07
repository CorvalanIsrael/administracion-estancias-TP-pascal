{$UNITPATH models}

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
    begin
        // TODO: lógica para guardar en archivo
        writeln('Guardando estancia: ', PEstancia.nombre);
        guardarEstanciaController:= 'Estancia guardada con éxito';
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
    var estanciasEncontradas: TListaDeEstancias;
    begin
        // TODO: lógica para buscar todas las estancias en archivo
        writeln('Buscando estancias.');
        obtenerTodasLasEstanciasController:= estanciasEncontradas;
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