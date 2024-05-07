{$UNITPATH models}

unit constantes;

interface

    uses provincia_model in 'src/models/provincia_model.pas';

    const PROVINCIAS: TListaDeProvincias = (
        (nombre: 'Buenos Aires'; codProvincia: 'AR-B'; numeroTurismo: 1500000),
        (nombre: 'Ciudad Autónoma de Buenos Aires'; codProvincia: 'AR-C'; numeroTurismo: 2000000),
        (nombre: 'Catamarca'; codProvincia: 'AR-K'; numeroTurismo: 50000),
        (nombre: 'Chaco'; codProvincia: 'AR-H'; numeroTurismo: 100000),
        (nombre: 'Chubut'; codProvincia: 'AR-U'; numeroTurismo: 200000),
        (nombre: 'Córdoba'; codProvincia: 'AR-X'; numeroTurismo: 1000000),
        (nombre: 'Corrientes'; codProvincia: 'AR-W'; numeroTurismo: 300000),
        (nombre: 'Entre Ríos'; codProvincia: 'AR-E'; numeroTurismo: 400000),
        (nombre: 'Formosa'; codProvincia: 'AR-P'; numeroTurismo: 80000),
        (nombre: 'Jujuy'; codProvincia: 'AR-Y'; numeroTurismo: 150000),
        (nombre: 'La Pampa'; codProvincia: 'AR-L'; numeroTurismo: 100000),
        (nombre: 'La Rioja'; codProvincia: 'AR-F'; numeroTurismo: 70000),
        (nombre: 'Mendoza'; codProvincia: 'AR-M'; numeroTurismo: 300000),
        (nombre: 'Misiones'; codProvincia: 'AR-N'; numeroTurismo: 250000),
        (nombre: 'Neuquén'; codProvincia: 'AR-Q'; numeroTurismo: 150000),
        (nombre: 'Río Negro'; codProvincia: 'AR-R'; numeroTurismo: 200000),
        (nombre: 'Salta'; codProvincia: 'AR-A'; numeroTurismo: 250000),
        (nombre: 'San Juan'; codProvincia: 'AR-J'; numeroTurismo: 120000),
        (nombre: 'San Luis'; codProvincia: 'AR-D'; numeroTurismo: 150000),
        (nombre: 'Santa Cruz'; codProvincia: 'AR-Z'; numeroTurismo: 90000),
        (nombre: 'Santa Fe'; codProvincia: 'AR-S'; numeroTurismo: 800000),
        (nombre: 'Santiago del Estero'; codProvincia: 'AR-G'; numeroTurismo: 100000),
        (nombre: 'Tierra del Fuego, Antártida e Islas del Atlántico Sur'; codProvincia: 'AR-V'; numeroTurismo: 50000),
        (nombre: 'Tucumán'; codProvincia: 'AR-T'; numeroTurismo: 200000)
    );

    function ProvinciasConst(): TListaDeProvincias;

implementation
    function ProvinciasConst(): TListaDeProvincias;
    begin
        ProvinciasConst:= PROVINCIAS;
    end;
end. 