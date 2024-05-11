{$UNITPATH views, models}
{$mode Delphi}

unit utils;
    
interface

    uses
        crt,
        sysUtils,
        constantes in 'src/utils/constantes.pas',
        provincia_model in 'src/models/provincia_model.pas',
        estancia_model in 'src/models/estancia_model.pas',
        provincia_controller in 'src/controllers/provincia_controller.pas',
        lista_provincia in 'src/views/lista_provincia.pas';

    procedure CrearArchivosUtil();
    procedure InicializarProgramaUtil();
    function ValidarCodigoProvinciaUtil(): string;
    function ValidarRespuestaSiONoUtil(PPregunta: string): boolean;
    function CrearEstanciaUtil(): TEstancia;

implementation

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

    function CrearEstanciaUtil(): TEstancia;
    var 
    nuevaEstancia: TEstancia;
    nuevoDomicilio: TDomicilio;
    begin
        write('Ingrese el nombre de la estancia: ');
        readln(nuevaEstancia.nombre);
        write('Ingrese el nombre y apellido del propietario: ');
        readln(nuevaEstancia.propietario);
        write('Ingrese el DNI del propietario: ');
        readln(nuevaEstancia.dni);
        // ========= DOMICILIO =========
        write('Ingrese calle: ');
        readln(nuevoDomicilio.calle);
        write('Ingrese numero de vivienda: ');
        readln(nuevoDomicilio.numero);
        write('Ingrese piso: ');
        readln(nuevoDomicilio.piso);
        write('Ingrese ciudad: ');
        readln(nuevoDomicilio.ciudad);
        nuevoDomicilio.codProvincia:= ValidarCodigoProvinciaUtil();
        // =============================
        write('Ingrese telefono: ');
        readln(nuevaEstancia.telefono);
        write('Ingrese email: ');
        readln(nuevaEstancia.email);
        write('Ingrese codigo postal: ');
        readln(nuevoDomicilio.codigoPostal);
        write('Ingrese las caracteristicas: ');
        readln(nuevaEstancia.caracteristicas);
        nuevaEstancia.tienePiscina:= ValidarRespuestaSiONoUtil('Ingrese si posee piscina');
        write('Ingrese la capacidad máxima: ');
        readln(nuevaEstancia.capacidadMaxima);

        nuevaEstancia.domicilio:= nuevoDomicilio;
        CrearEstanciaUtil:= nuevaEstancia;
    end;

    procedure CrearArchivosUtil();
    var 
    archivoEstancias: file of TEstancia;
    resultado: string;
    begin

        if not directoryExists('data') then
        begin
            createDir('data');
        end;

        if not fileExists('data/provincias.dat') then
        begin
            resultado:= crearProvinciasController();
            writeln(resultado);
        end;

        if not fileExists('data/estancias.dat') then
        begin
            assignFile(archivoEstancias, 'data/estancias.dat');
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

end.