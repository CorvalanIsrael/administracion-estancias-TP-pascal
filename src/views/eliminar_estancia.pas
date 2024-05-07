{$UNITPATH utils}

unit eliminar_estancia;
    
interface
    
    
procedure EliminarEstanciaView();
    
implementation
    uses crt;

    procedure EliminarEstanciaView();
    begin
        ClrScr();
        writeln('=============================================');
        writeln('             ELIMINAR UNA ESTANCIA           ');
        writeln('=============================================');
    end;

end.