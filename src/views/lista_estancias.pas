{$UNITPATH utils}

unit lista_estancias;
    
interface
    uses 
    crt,
    estancia_model in 'src/models/estancia_model.pas',
    estancia_controller in 'src/controller/estancia_controller.pas';

procedure EstanciasView(opcion: integer);
procedure PintarEstancia(PListaDeEstancias: TListaDeEstancias);
    
implementation

    procedure PintarEstancia(PListaDeEstancias: TListaDeEstancias);
    var 
    estancia: TEstancia;
    begin
        
        for estancia in PListaDeEstancias do
        begin
            writeln('ID: ', estancia.id);
            writeln('Nombre: ', estancia.nombre);
            writeln('Propietario: ', estancia.propietario);
            writeln('DNI: ', estancia.dni);
            writeln('Telefono: ', estancia.telefono);
            writeln('Email: ', estancia.email);
            writeln('Caracteristicas: ', estancia.caracteristicas);            
            if (estancia.tienePiscina) then
            begin
                writeln('Tiene piscina: Sí');
            end 
            else
            begin
                writeln('Tiene piscina: No');
            end;
            writeln('Capacidad máxima: ', estancia.capacidadMaxima);
            writeln('Codigo Provincia:', estancia.domicilio.codProvincia);
            writeln('Ciudad:', estancia.domicilio.ciudad,  ' Código Postal: ', estancia.domicilio.codigoPostal);
            writeln('Calle:', estancia.domicilio.calle, ' Número:', estancia.domicilio.numero, ' Piso:', estancia.domicilio.piso);
            writeln(' ');
        end;
        writeln(' ');
    end;

    procedure EstanciasView(opcion: integer);
    var 
    estanciasEncontradas: TListaDeEstancias;
    begin
        ClrScr();
        writeln('=============================================');
        writeln('               LISTA ESTANCIAS               ');
        writeln('=============================================');

        case opcion of
            3: writeln('Mostrando una estancia');
            4:  begin
                    estanciasEncontradas:= obtenerTodasLasEstanciasController();
                    PintarEstancia(estanciasEncontradas);
                end;
            5: writeln('Mostrando todas las estancias de una provincia');
            6:  begin
                    estanciasEncontradas:= obtenerEstanciasConPiscinaController();
                    PintarEstancia(estanciasEncontradas);
                end;
        end;
    end;

end.