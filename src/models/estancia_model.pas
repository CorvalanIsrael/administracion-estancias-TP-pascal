unit estancia_model;

interface

type TDomicilio = record
    calle: string;
    numero: string;
    piso: string;
    ciudad: string;
    cod_provincia: string;
    codigoPostal: string;
end;

type TEstancia = record
    id: string;
    nombre: string;
    propietario: string;
    dni: string;
    domicilio: TDomicilio;
    telefono: string;
    email: string;
    caracteristicas: string;
    tienePiscina: boolean;
    capacidadMaxima: integer;
end;

type TListaDeEstancias = array of TEstancia;

implementation
    
end.