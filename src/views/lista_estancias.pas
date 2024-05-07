{$UNITPATH utils}

unit lista_estancias;
    
interface
    
    
procedure EstanciasView(opcion: integer);
    
implementation
    uses crt;
    
    procedure EstanciasView(opcion: integer);
    begin
        ClrScr();
        writeln('=============================================');
        writeln('               LISTA ESTANCIAS               ');
        writeln('=============================================');

        case opcion of
            3: writeln('Mostrando una estancia');
            4: writeln('Mostrando todas las estancias');
            5: writeln('Mostrando todas las estancias de una provincia');
            6: writeln('Mostrando todas las estancias con piscina');
        end;
    end;

end.