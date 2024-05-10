{$UNITPATH utils, controllers, models, views}

unit agregar_estancia;
    
interface
    uses 
    crt,
    utils in 'src/utils/utils.pas',
    estancia_controller in 'src/controllers/estancia_controller.pas',
    estancia_model in 'src/models/estancia_model.pas',
    provincia_model in 'src/models/provincia_model.pas';
    
    procedure AgregarEstanciaView();
    function validarTienePiscina(): boolean;
    function crearEstancia(): TEstancia;
    

implementation

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
        nuevaEstancia.tienePiscina:= validarTienePiscina();
        write('Ingrese la capacidad máxima: ');
        readln(nuevaEstancia.capacidadMaxima);

        nuevaEstancia.domicilio:= nuevoDomicilio;
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