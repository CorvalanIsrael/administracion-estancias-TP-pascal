{$UNITPATH views, models}
{$mode Delphi}

unit utils;
    
interface
    
procedure CrearArchivosUtil();
procedure InicializarProgramaUtil();
procedure LeerOpcionMenuPrincipalUtil();
function ValidarCodigoProvinciaUtil(): string;
function ValidarRespuestaSiONoUtil(PPregunta: string): boolean;

implementation

uses
    crt,
    sysUtils,
    constantes in 'src/utils/constantes.pas',

    provincia_model in 'src/models/provincia_model.pas',
    estancia_model in 'src/models/estancia_model.pas',

    agregar_estancia in 'src/views/agregar_estancia.pas',
    eliminar_estancia in 'src/views/eliminar_estancia.pas',
    modificar_estancia in 'src/views/modificar_estancia.pas',
    lista_estancias in 'src/views/lista_estancias.pas',
    lista_provincia in 'src/views/lista_provincia.pas',

    provincia_controller in 'src/controllers/provincia_controller.pas';

    function ValidarRespuestaSiONoUtil(PPregunta: string): boolean;
    var 
    respuestaInput: string;
    respuesta: boolean;
    begin
        repeat
            write(PPregunta, ' (S/N): ');
            readln(respuestaInput);
            if ((respuestaInput = 's') or (respuestaInput = 'S')) then
            begin
                respuestaInput:= 'S';
                respuesta:= true;
            end;
            if ((respuestaInput = 'n') or (respuestaInput = 'N')) then
            begin
                respuestaInput:= 'N';
                respuesta:= false;
            end;
        until ((respuestaInput = 'S') or (respuestaInput = 'N'));
    
        ValidarRespuestaSiONoUtil:= respuesta;
    end;


    function ValidarCodigoProvinciaUtil(): string;
    var 
    codProvincia, codigo: string;
    codigoValido: boolean;
    codigosProvincias: TCodigosProvincia;
    begin
        codigoValido:= false;
        codigosProvincias:= CodigosProvinciasConst();
        ProvinciasView();

        repeat 
            write('Ingrese codigo provincia: ');
            readln(codProvincia);

            for codigo in codigosProvincias do
            begin
                if (codProvincia = codigo) then
                begin
                    codigoValido:= true;
                end;
            end;

        until (codigoValido = true);

        ValidarCodigoProvinciaUtil:= codProvincia;
    end;

    procedure CrearArchivosUtil();
    var carpetaData: string;
        archivoEstancias: file of TEstancia;
        resultado: string;
    begin
        carpetaData := 'data';

        if not directoryExists(carpetaData) then
        begin
            createDir(carpetaData);
        end;

        if not fileExists(carpetaData + '\provincias.dat') then
        begin
            resultado:= crearProvinciasController();
            writeln(resultado);
        end;

        if not fileExists(CarpetaData + '\estancias.dat') then
        begin
            assignFile(archivoEstancias, carpetaData + '\estancias.dat');
            rewrite(archivoEstancias);
            closeFile(archivoEstancias);
        end;
    end;

    procedure InicializarProgramaUtil();

    begin
        try
            ClrScr();
            CrearArchivosUtil();
        except
            on E: Exception do
                writeln('Error: ', E.Message);
        end;
    end;

    procedure LeerOpcionMenuPrincipalUtil();
    var opcion: integer;
    begin
        readln(opcion);

        case opcion of
            1: AgregarEstanciaView();
            2: ModificarEstanciaView();
            3: EstanciasView(3);
            4: EstanciasView(4);
            5: EstanciasView(5);
            6: EstanciasView(6);
            7: EliminarEstanciaView();
            8: writeln('Cerrar programa');
        end;
    end;
    
end.