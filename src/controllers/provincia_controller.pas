{$UNITPATH models}
{$mode Delphi}

unit provincia_controller;

interface
    uses 
        sysUtils,
        provincia_model in 'src/models/provincia_model.pas',
        constantes in 'src/utils/constantes.pas';

    function crearProvinciasController(): string;
    function obtenerProvinciasController(): TListaDeProvincias;

implementation

    function crearProvinciasController(): string;
    var 
        archivo: file of TProvincia;
        provincias: TListaDeProvincias;
        provincia: TProvincia;
    begin
        provincias:= ConstProvincias();
        try
            assignFile(archivo, 'data/provincias.dat');
            rewrite(archivo);

            for provincia in provincias do
            begin
                write(archivo, provincia);
            end;
            
            closeFile(archivo);
            crearProvinciasController:= 'Provincias insertadas con éxito.'
        except
            on E: Exception do
                crearProvinciasController:= 'Error insertar las provincias: ' + E.Message;
        end;
    end;

    function obtenerProvinciasController(): TListaDeProvincias;
    var 
        archivo: file of TProvincia;
        provincia: TProvincia;
        provinciasEncontradas: TListaDeProvincias;
    begin
        assignFile(archivo, 'data/provincias.dat');
        reset(archivo);
        try
            while not Eof(archivo) do
            begin
                read(archivo, provincia);
                setLength(provinciasEncontradas, Length(provinciasEncontradas) + 1);
                provinciasEncontradas[High(provinciasEncontradas)]:= provincia;
            end;
        finally
            closeFile(archivo);
            obtenerProvinciasController:= provinciasEncontradas;
        end;
    end;
end.