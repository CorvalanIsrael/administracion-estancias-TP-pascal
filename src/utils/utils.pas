{$UNITPATH views}

unit utils;
    
interface
    
procedure LeerOpcionMenuPrincipal();

implementation

uses 
    agregar_estancia in 'src/views/agregar_estancia.pas',
    eliminar_estancia in 'src/views/eliminar_estancia.pas',
    modificar_estancia in 'src/views/modificar_estancia.pas',
    lista_estancias in 'src/views/lista_estancias.pas';

    procedure LeerOpcionMenuPrincipal();
    var opcion: integer;
    begin
        readln(opcion);

        case opcion of
            1: PintarAgregarEstancia();
            2: PintarModificarEstancia();
            3: PintarEstancias(3);
            4: PintarEstancias(4);
            5: PintarEstancias(5);
            6: PintarEstancias(6);
            7: PintarEliminarEstancia();
            8: writeln('Cerrar programa');
        end;
    end;
    
end.