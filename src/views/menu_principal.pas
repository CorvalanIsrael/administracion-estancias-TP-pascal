{$UNITPATH utils}

unit menu_principal;
    
interface

    uses 
        crt, 
        agregar_estancia in 'src/views/agregar_estancia.pas',
        eliminar_estancia in 'src/views/eliminar_estancia.pas',
        modificar_estancia in 'src/views/modificar_estancia.pas',
        lista_estancias in 'src/views/lista_estancias.pas',
        provincia_controller in 'src/controllers/provincia_controller.pas';

    procedure MenuPrincipalView();
    procedure LeerOpcionMenuPrincipal();
    
implementation

    procedure LeerOpcionMenuPrincipal();
    var 
    opcion: integer;
    begin
        readln(opcion);

        case opcion of
            1: AgregarEstanciaView();
            2: ModificarEstanciaView();
            3: EstanciasView(3);
            4: EstanciasView(4);
            5: EstanciasView(5);
            6: EstanciasView(6);
            7: EliminarEstanciaView();
            8: writeln('Cerrar programa');
        end;
    end;    

    procedure MenuPrincipalView();
    begin
        writeln(' ');
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