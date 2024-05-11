{$UNITPATH models}

unit constantes;

interface
    uses 
        estancia_model in 'src/models/estancia_model.pas',
        provincia_model in 'src/models/provincia_model.pas';

    const COD_PROVINCIAS: TCodigosProvincia = ('AR-B', 'AR-C', 'AR-K', 'AR-H','AR-U','AR-X','AR-W','AR-E','AR-P','AR-Y','AR-L','AR-F','AR-M','AR-N','AR-Q','AR-R','AR-A','AR-J','AR-D','AR-Z','AR-S','AR-G','AR-V','AR-T');

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
    
    const ESTANCIAS_MOCK: TListaDeEstancias = (
        (
            id: 'mock-2';
            nombre: 'Casa de los Simpson';
            propietario: 'Homer Simpson';
            dni: '87654321B';
            domicilio: (
                calle: 'Avenida Siempreviva';
                numero: '742';
                piso: '1';
                ciudad: 'Springfield';
                codProvincia: 'SP';
                codigoPostal: '54321';
            );
            telefono: '123456789';
            email: 'homer@example.com';
            caracteristicas: 'Hogar familiar';
            tienePiscina: False;
            capacidadMaxima: 6;
        ),
        (
        id: 'mock-1';
        nombre: 'Casa del Sr. Burns';
        propietario: 'Sr. Burns';
        dni: '12345678A';
        domicilio: (
            calle: 'Calle Falsa';
            numero: '123';
            piso: '2';
            ciudad: 'Springfield';
            codProvincia: 'SP';
            codigoPostal: '12345';
        );
        telefono: '987654321';
        email: 'burns@example.com';
        caracteristicas: 'Mansión lujosa';
        tienePiscina: True;
        capacidadMaxima: 10;
    ));

    function ProvinciasConst(): TListaDeProvincias;
    function CodigosProvinciasConst(): TCodigosProvincia;
    function EstanciasMockConst(): TListaDeEstancias;

implementation
    function ProvinciasConst(): TListaDeProvincias;
    begin
        ProvinciasConst:= PROVINCIAS;
    end;

    function CodigosProvinciasConst(): TCodigosProvincia ;
    begin
        CodigosProvinciasConst:= COD_PROVINCIAS;
    end;

    function EstanciasMockConst(): TListaDeEstancias;
    begin
        EstanciasMockConst:= ESTANCIAS_MOCK;
    end;
end. 