{$UNITPATH utils}

unit eliminar_estancia;
    
interface
    
    
procedure PintarEliminarEstancia();
    
implementation
    uses crt;

    procedure PintarEliminarEstancia();
    begin
        ClrScr();
        writeln('=============================================');
        writeln('             ELIMINAR UNA ESTANCIA           ');
        writeln('=============================================');
    end;

end.