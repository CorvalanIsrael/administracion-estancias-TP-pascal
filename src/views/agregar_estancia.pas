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