{$UNITPATH utils}

unit menu_principal;
    
interface
    
procedure PintarMenuPrincipal();
    

implementation
    uses crt, 
        utils in 'src/utils/utils.pas';

    procedure PintarMenuPrincipal();
    begin
        ClrScr();
        writeln('=============================================');
        writeln('            SELECCIONA UNA OPCION            ');
        writeln('=============================================');
        writeln('(1) Dar de alta una estancia');
        writeln('(2) Modificar una estancia');
        writeln('(3) Ver una estancia');
        writeln('(4) Ver todas las estancias');
        writeln('(5) Ver todas las estancias de una provincia');
        writeln('(6) Ver todas las estancias con piscina');
        writeln('(7) Dar de bajo una estancia');
        writeln('(8) Cerrar programa');
        writeln(' ');
        write('Ingrese una opcion: ');
        LeerOpcionMenuPrincipal();
    end;

end.