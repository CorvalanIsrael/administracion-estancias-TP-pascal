{$UNITPATH models}

unit estancia_controller;

interface
    uses estancia_model in 'src/models/estancia_model.pas';

    function guardarEstancia(PEstancia: TEstancia): string;
    function modificarEstancia(PId: string): string;
    function eliminarEstancia(PId: string): string;
    function obtenerEstancia(PId: string): string;
    function obtenerTodasLasEstancias(): TListaDeEstancias;
    function obtenerEstanciasConPiscina(): TListaDeEstancias;
    function obtenerEstanciasDeUnaProvincia(PCodigoProvincia: string): TListaDeEstancias;

implementation

    function guardarEstancia(PEstancia: TEstancia): string;
    begin
        // TODO: lógica para guardar en archivo
        writeln('Guardando estancia: ', PEstancia.nombre);
        guardarEstancia:= 'Estancia guardada con éxito';
    end;

    function modificarEstancia(PId: string): string;
    begin
        // TODO: lógica para actualizar en archivo
        writeln('Modificando estancia: ', PId);
        modificarEstancia:= 'Estancia modificada con éxito';
    end;

    function eliminarEstancia(PId: string): string;
    begin
        // TODO: lógica para eliminar en archivo
        writeln('Eliminando estancia: ', PId);
        eliminarEstancia:= 'Estancia eliminada con éxito';
    end;

    function obtenerEstancia(PId: string): string;
    begin
        // TODO: lógica para buscar en archivo
        writeln('Buscando estancia: ', PId);
        obtenerEstancia:= 'Estancia encontrada con éxito';
    end;

    function obtenerTodasLasEstancias(): TListaDeEstancias;
    var estanciasEncontradas: TListaDeEstancias;
    begin
        // TODO: lógica para buscar todas las estancias en archivo
        writeln('Buscando estancias.');
        obtenerTodasLasEstancias:= estanciasEncontradas;
    end;

    function obtenerEstanciasConPiscina(): TListaDeEstancias;
    var estanciasEncontradas: TListaDeEstancias;
    begin
        // TODO: lógica para buscar todas las estancias con piscina en archivo
        writeln('Buscando estancias con piscina.');
        obtenerEstanciasConPiscina:= estanciasEncontradas;
    end;

    function obtenerEstanciasDeUnaProvincia(PCodigoProvincia: string): TListaDeEstancias;
    var estanciasEncontradas: TListaDeEstancias;
    begin
        // TODO: lógica para buscar todas las estancias de una provincia en archivo
        writeln('Buscando estancias con piscina.');
        obtenerEstanciasDeUnaProvincia:= estanciasEncontradas;
    end;
end.