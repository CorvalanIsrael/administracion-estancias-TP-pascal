{$UNITPATH utils, controllers, models}

unit agregar_estancia;
    
interface
    uses 
    crt,
    estancia_controller in 'src/controllers/estancia_controller.pas',
    estancia_model in 'src/models/estancia_model.pas';
    
    procedure PintarAgregarEstancia();
    function crearEstancia(): TEstancia;
    
implementation

    function crearEstancia(): TEstancia;
    var 
    nuevaEstancia: TEstancia;
    nuevoDomicilio: TDomicilio;
    begin
        // TODO: Escribir lógica para almacenar TODOS los atributos necesarios y retornar una estancia base.
        write('Ingrese el nombre de la estancia: ');
        readln(nuevaEstancia.nombre);
        write('Ingrese el nombre y apellido del propietario: ');
        readln(nuevaEstancia.propietario);
        write('Ingrese el DNI del propietario: ');
        readln(nuevaEstancia.dni);
        write('Ingrese calle: ');
        readln(nuevoDomicilio.calle);
        write('Ingrese numero de vivienda: ');
        readln(nuevoDomicilio.numero);
        write('Ingrese piso: ');
        readln(nuevoDomicilio.piso);
        write('Ingrese ciudad: ');
        readln(nuevoDomicilio.ciudad);
        write('Ingrese codigo postal: ');
        readln(nuevoDomicilio.codigoPostal);

        nuevaEstancia.domicilio:= nuevoDomicilio;
        
        crearEstancia:= nuevaEstancia;
    end;


    procedure PintarAgregarEstancia();
    var 
    nuevaEstancia: TEstancia;

    begin
        ClrScr();
        writeln('=============================================');
        writeln('             AGREGAR UNA ESTANCIA            ');
        writeln('=============================================');
        writeln(' ');
        
        nuevaEstancia:= crearEstancia();

        guardarEstancia(nuevaEstancia);
    end;
end.