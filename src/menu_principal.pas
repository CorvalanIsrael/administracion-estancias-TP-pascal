{$UNITPATH views, controllers}

unit menu_principal;
    
interface

    uses 
        crt, 
        agregar_estancia,
        eliminar_estancia,
        modificar_estancia,
        lista_estancias,
        provincia_controller;

    procedure MenuPrincipalView();
    function LeerOpcionMenuPrincipal(): boolean;
    
implementation

    function LeerOpcionMenuPrincipal(): boolean;
    var 
    opcion: integer;
    begin
        readln(opcion);
        LeerOpcionMenuPrincipal:= false;

        case opcion of
            1: AgregarEstanciaView();
            2: ModificarEstanciaView();
            3: EstanciasView(3);
            4: EstanciasView(4);
            5: EstanciasView(5);
            6: EstanciasView(6);
            7: EliminarEstanciaView();
            8:  begin
                    writeln(' ');
                    writeln('Cerrarando programa...');
                    LeerOpcionMenuPrincipal:= true;
                end;
            else 
        end;
    end;    

    procedure MenuPrincipalView();
    var
    cerrarPrograma: boolean;
    begin
        cerrarPrograma:= false;
        ClrScr();
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
        cerrarPrograma:= LeerOpcionMenuPrincipal();

        if (cerrarPrograma = false) then
        begin
            writeln(' ');
            writeln('Presiona una tecla para volver al menú principal...');
            readln();
            MenuPrincipalView();
        end;
    end;

end.