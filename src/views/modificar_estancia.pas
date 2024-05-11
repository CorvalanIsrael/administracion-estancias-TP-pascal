{$UNITPATH utils}

unit modificar_estancia;
    
interface
        
procedure ModificarEstanciaView();
    
implementation
    uses 
        crt,
        utils in 'src/utils/utils.pas',
        estancia_model in 'src/models/estancia_model.pas',
        estancia_controller in 'src/controller/estancia_controller.pas';

    procedure ModificarEstanciaView();
    var
    idEstancia: string;
    resultado: string;

    resultadoBusqueda: TListaDeEstancias;

    estanciaEncontrada: TEstancia;
    estanciaModificada: TEstancia;

    begin
        ClrScr();
        writeln('=============================================');
        writeln('            MODIFICAR UNA ESTANCIA           ');
        writeln('=============================================');
        write('Ingrese el id de la estancia que desea modificar: ');
        readln(idEstancia);

        resultadoBusqueda:= obtenerEstanciaController(idEstancia);
        
        if (length(resultadoBusqueda) <> 0) then
        begin
            estanciaEncontrada:= resultadoBusqueda[0];
            writeln(' ');
            writeln('Los campos que se dejen en blanco no serán alterados: ');
            estanciaModificada:= CrearEstanciaUtil();

            resultado:= modificarEstanciaController(estanciaEncontrada, estanciaModificada);
        end else 
        begin
            resultado:= 'No se encontró una estancia con el id: ' + idEstancia;            
        end;
    end;

end.