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
    function FusionarEstanciaUtil(PEstancia: TEstancia; PEstanciaModificada: TEstancia): TEstancia;

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

    function FusionarEstanciaUtil(PEstancia: TEstancia; PEstanciaModificada: TEstancia): TEstancia;
    var
    estanciaFucion: TEstancia;
    begin
        if (PEstanciaModificada.nombre <> '') then
        begin
            estanciaFucion.nombre:= PEstanciaModificada.nombre;
        end else 
        begin
            estanciaFucion.nombre:= PEstancia.nombre;
        end;

        if (PEstanciaModificada.propietario <> '') then
        begin
            estanciaFucion.propietario:= PEstanciaModificada.propietario;
        end else 
        begin
            estanciaFucion.propietario:= PEstancia.propietario;
        end;

        if (PEstanciaModificada.dni <> '') then
        begin
            estanciaFucion.dni:= PEstanciaModificada.dni;
        end else 
            estanciaFucion.dni:= PEstancia.dni;
        begin
        end;

        if (PEstanciaModificada.domicilio.calle <> '') then
        begin
            estanciaFucion.domicilio.calle:= PEstanciaModificada.domicilio.calle;
        end else 
        begin
            estanciaFucion.domicilio.calle:= PEstancia.domicilio.calle;
        end;

        if (PEstanciaModificada.domicilio.numero <> '') then
        begin
            estanciaFucion.domicilio.numero:= PEstanciaModificada.domicilio.numero;
        end else 
        begin
            estanciaFucion.domicilio.numero:= PEstancia.domicilio.numero;
        end;

        if (PEstanciaModificada.domicilio.piso <> '') then
        begin
            estanciaFucion.domicilio.piso:= PEstanciaModificada.domicilio.piso;
        end else 
        begin
            estanciaFucion.domicilio.piso:= PEstancia.domicilio.piso
        end;

        if (PEstanciaModificada.domicilio.ciudad <> '') then
        begin
            estanciaFucion.domicilio.ciudad:= PEstanciaModificada.domicilio.ciudad;
        end else 
        begin
            estanciaFucion.domicilio.ciudad:= PEstancia.domicilio.ciudad;
        end;

        if (PEstanciaModificada.domicilio.codigoPostal <> '') then
        begin
            estanciaFucion.domicilio.codigoPostal:= PEstanciaModificada.domicilio.codigoPostal;
        end else 
        begin
            estanciaFucion.domicilio.codigoPostal:= PEstancia.domicilio.codigoPostal;
        end;

        if (PEstanciaModificada.telefono <> '') then
        begin
            estanciaFucion.telefono:= PEstanciaModificada.telefono;
        end else 
        begin
            estanciaFucion.telefono:= PEstancia.telefono;
        end;

        if (PEstanciaModificada.email <> '') then
        begin
            estanciaFucion.email:= PEstanciaModificada.email;
        end else 
        begin
            estanciaFucion.email:= PEstancia.email;
        end;

        if (PEstanciaModificada.caracteristicas <> '') then
        begin
            estanciaFucion.caracteristicas:= PEstanciaModificada.caracteristicas;
        end else 
        begin
            estanciaFucion.caracteristicas:= PEstancia.caracteristicas;
        end;

        if (PEstanciaModificada.capacidadMaxima <> 0) then
        begin
            estanciaFucion.capacidadMaxima:= PEstanciaModificada.capacidadMaxima;
        end else 
        begin
            estanciaFucion.capacidadMaxima:= PEstancia.capacidadMaxima;
        end;

        estanciaFucion.id:= PEstancia.id;
        estanciaFucion.tienePiscina:= PEstanciaModificada.tienePiscina;
        estanciaFucion.domicilio.codProvincia:= PEstanciaModificada.domicilio.codProvincia;

        fusionarEstanciaUtil:= estanciaFucion;
    end;

end.