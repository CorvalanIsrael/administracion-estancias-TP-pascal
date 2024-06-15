{$UNITPATH utils}

unit lista_estancias;
    
interface
    uses 
    crt,
    utils,
    estancia_model,
    estancia_controller;

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
    idEstancia: string;
    codigoProvincia: string;

    begin
        ClrScr();
        writeln('=============================================');
        writeln('               LISTA ESTANCIAS               ');
        writeln('=============================================');

        case opcion of
            3:  begin
                    write('Ingrese el id de la estancia: ');
                    readln(idEstancia);
                    estanciasEncontradas:= obtenerEstanciaController(idEstancia);
                    if (length(estanciasEncontradas) <> 0) then
                    begin
                        PintarEstancia(estanciasEncontradas);
                    end else
                    begin
                        writeln(' ');
                        writeln('No se encontro ninguna estancia con el id: ', idEstancia);
                        writeln(' ');
                    end;
                end;
            4:  begin
                    estanciasEncontradas:= obtenerTodasLasEstanciasController();
                    PintarEstancia(estanciasEncontradas);
                end;
            5:  begin
                    codigoProvincia:= ValidarCodigoProvinciaUtil();
                    estanciasEncontradas:= obtenerEstanciasDeUnaProvinciaController(codigoProvincia);
                    PintarEstancia(estanciasEncontradas);
                end;
            6:  begin
                    estanciasEncontradas:= obtenerEstanciasConPiscinaController();
                    PintarEstancia(estanciasEncontradas);
                end;
        end;
    end;

end.