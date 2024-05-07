{$UNITPATH utils}

unit modificar_estancia;
    
interface
        
procedure ModificarEstanciaView();
    
implementation
    uses crt;

    procedure ModificarEstanciaView();
    begin
        ClrScr();
        writeln('=============================================');
        writeln('            MODIFICAR UNA ESTANCIA           ');
        writeln('=============================================');
    end;

end.