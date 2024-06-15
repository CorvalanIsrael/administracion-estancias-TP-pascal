{$UNITPATH utils, controllers, models, views}
{$codepage utf-8}
unit agregar_estancia;
    
interface
    uses 
    crt,
    utils,
    estancia_controller,
    estancia_model,
    provincia_model;
    
    procedure AgregarEstanciaView();

implementation

    procedure AgregarEstanciaView();
    var 
    nuevaEstancia: TEstancia;

    begin
        ClrScr();
        writeln('=============================================');
        writeln('             AGREGAR UNA ESTANCIA            ');
        writeln('=============================================');
        writeln(' ');
        
        nuevaEstancia:= CrearEstanciaUtil();

        guardarEstanciaController(nuevaEstancia);
    end;
end.