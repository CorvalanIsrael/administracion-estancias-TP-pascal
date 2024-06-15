{$UNITPATH utils}

unit eliminar_estancia;
    
interface
    
    
procedure EliminarEstanciaView();
    
implementation
    uses 
        crt,
        estancia_controller;

    procedure EliminarEstanciaView();
    var
    idEstancia: string;
    resultado: string;
    begin
        ClrScr();
        writeln('=============================================');
        writeln('             ELIMINAR UNA ESTANCIA           ');
        writeln('=============================================');
        write('Ingrese el id de la estancia que desea eliminar: ');
        readln(idEstancia);

        resultado:= eliminarEstanciaController(idEstancia);
        writeln(' ');
        writeln(resultado);
    end;

end.