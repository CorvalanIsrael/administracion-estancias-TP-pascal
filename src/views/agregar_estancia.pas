{$UNITPATH utils, controllers, models, views}

unit agregar_estancia;
    
interface
    uses 
    crt,
    constantes in 'src/utils/constantes.pas',
    estancia_controller in 'src/controllers/estancia_controller.pas',
    estancia_model in 'src/models/estancia_model.pas',
    provincia_model in 'src/models/provincia_model.pas',
    lista_provincia in 'src/views/lista_provincia.pas';
    
    procedure AgregarEstanciaView();
    function validarCodigoProvincia(): string;
    function validarTienePiscina(): boolean;
    function crearEstancia(): TEstancia;
    

implementation

    function validarCodigoProvincia(): string;
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

        validarCodigoProvincia:= codProvincia;
    end;

    function validarTienePiscina(): boolean;
    var 
    respuestaInput: string;
    respuesta: boolean;
    begin
        repeat
            write('Ingrese si posee piscina (S/N): ');
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
    
        validarTienePiscina:= respuesta;
    end;

    function crearEstancia(): TEstancia;
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
        nuevoDomicilio.codProvincia:= validarCodigoProvincia();
        nuevaEstancia.domicilio:= nuevoDomicilio;
        // =============================
        write('Ingrese codigo postal: ');
        readln(nuevoDomicilio.codigoPostal);
        write('Ingrese las caracteristicas: ');
        readln(nuevaEstancia.caracteristicas);
        nuevaEstancia.tienePiscina:= validarTienePiscina();
        write('Ingrese la capacidad máxima: ');
        readln(nuevaEstancia.capacidadMaxima);

        crearEstancia:= nuevaEstancia;
    end;


    procedure AgregarEstanciaView();
    var 
    nuevaEstancia: TEstancia;

    begin
        ClrScr();
        writeln('=============================================');
        writeln('             AGREGAR UNA ESTANCIA            ');
        writeln('=============================================');
        writeln(' ');
        
        nuevaEstancia:= crearEstancia();

        guardarEstanciaController(nuevaEstancia);
    end;
end.