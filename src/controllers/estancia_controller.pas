{$UNITPATH models}
{$mode Delphi}

unit estancia_controller;

interface
    uses estancia_model in 'src/models/estancia_model.pas';

    function guardarEstanciaController(PEstancia: TEstancia): string;
    function modificarEstanciaController(PId: string): string;
    function eliminarEstanciaController(PId: string): string;
    function obtenerEstanciaController(PId: string): TListaDeEstancias;
    function obtenerTodasLasEstanciasController(): TListaDeEstancias;
    function obtenerEstanciasConPiscinaController(): TListaDeEstancias;
    function obtenerEstanciasDeUnaProvinciaController(PCodigoProvincia: string): TListaDeEstancias;

implementation

    function guardarEstanciaController(PEstancia: TEstancia): string;
    var
    archivo: file of TEstancia;
    begin
        try
            PEstancia.id:= 'identificadorUnico'; // TODO: GenerarIdUtil()
            
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
    var
    archivoTemp: file of TEstancia;
    archivoOriginal: file of TEstancia;
    estancia: TEstancia;
    seEncontro: boolean;
    begin
        try
            assignFile(archivoOriginal, 'data/estancias.dat');
            reset(archivoOriginal);

            assignFile(archivoTemp, 'data/temp.dat');
            rewrite(archivoTemp);
            
            while not Eof(archivoOriginal) do
            begin
                read(archivoOriginal, estancia);
                if (estancia.id <> PId) then
                begin
                    write(archivoTemp, estancia);
                end else 
                begin
                    seEncontro:= true;
                end;
            end;

            closeFile(archivoOriginal);
            closeFile(archivoTemp);

            erase(archivoOriginal);
            rename(archivoTemp, 'data/estancias.dat');

            if (seEncontro) then
            begin
                eliminarEstanciaController:= 'Estancia eliminada con éxito';
            end else 
            begin
                eliminarEstanciaController:= 'No se encontro una estancia con el id: ' + PId;
            end;

        except
            on E: TObject do
                eliminarEstanciaController := 'Error al eliminar la estancia';
        end;
    end;

    function obtenerEstanciaController(PId: string): TListaDeEstancias;
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
                if (estancia.id = PId) then 
                begin
                    setLength(estanciasEncontradas, length(estanciasEncontradas) + 1);
                    estanciasEncontradas[high(estanciasEncontradas)]:= estancia;
                end; 
            end;
        finally
            closeFile(archivo);
            obtenerEstanciaController:= estanciasEncontradas;
        end;
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
                if (estancia.tienePiscina) then 
                begin
                    setLength(estanciasEncontradas, length(estanciasEncontradas) + 1);
                    estanciasEncontradas[high(estanciasEncontradas)]:= estancia;
                end; 
            end;
        finally
            closeFile(archivo);
            obtenerEstanciasConPiscinaController:= estanciasEncontradas;
        end;
    end;

    function obtenerEstanciasDeUnaProvinciaController(PCodigoProvincia: string): TListaDeEstancias;
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
                if (estancia.domicilio.codProvincia = PCodigoProvincia) then 
                begin
                    setLength(estanciasEncontradas, length(estanciasEncontradas) + 1);
                    estanciasEncontradas[high(estanciasEncontradas)]:= estancia;
                end; 
            end;
        finally
            closeFile(archivo);
            obtenerEstanciasDeUnaProvinciaController:= estanciasEncontradas;
        end;
    end;
end.