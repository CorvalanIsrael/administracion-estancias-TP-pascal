{$UNITPATH views, models}
{$mode Delphi}

unit utils;
    
interface
    
procedure CrearArchivos();
procedure InicializarPrograma();
procedure LeerOpcionMenuPrincipal();

implementation

uses
    crt,
    sysUtils,
    provincia_model in 'src/models/provincia_model.pas',
    estancia_model in 'src/models/estancia_model.pas',
    agregar_estancia in 'src/views/agregar_estancia.pas',
    eliminar_estancia in 'src/views/eliminar_estancia.pas',
    modificar_estancia in 'src/views/modificar_estancia.pas',
    lista_estancias in 'src/views/lista_estancias.pas',
    provincia_controller in 'src/controllers/provincia_controller.pas';


    procedure CrearArchivos();
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

    procedure InicializarPrograma();

    begin
        try
            ClrScr();
            CrearArchivos();
        except
            on E: Exception do
                writeln('Error: ', E.Message);
        end;
    end;

    procedure LeerOpcionMenuPrincipal();
    var opcion: integer;
    begin
        readln(opcion);

        case opcion of
            1: PintarAgregarEstancia();
            2: PintarModificarEstancia();
            3: PintarEstancias(3);
            4: PintarEstancias(4);
            5: PintarEstancias(5);
            6: PintarEstancias(6);
            7: PintarEliminarEstancia();
            8: writeln('Cerrar programa');
        end;
    end;
    
end.