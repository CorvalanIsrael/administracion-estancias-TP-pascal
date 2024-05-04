{$UNITPATH utils}

unit modificar_estancia;
    
interface
        
procedure PintarModificarEstancia();
    
implementation
    uses crt;

    procedure PintarModificarEstancia();
    begin
        ClrScr();
        writeln('=============================================');
        writeln('            MODIFICAR UNA ESTANCIA           ');
        writeln('=============================================');
    end;

end.