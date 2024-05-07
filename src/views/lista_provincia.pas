{$UNITPATH models}

unit lista_provincia;

interface
    uses 
        provincia_model in 'src/models/provincia_model.pas',
        provincia_controller in 'src/controller/provincia_controller.pas';
    
    procedure ProvinciasView();

implementation

    procedure ProvinciasView();
    var provincia: TProvincia;
        provinciasEncontradas: TListaDeProvincias; 
    begin
        provinciasEncontradas:= obtenerProvinciasController();
        writeln(' ');
        for provincia in provinciasEncontradas do
        begin
            writeln('Nombre: ', provincia.nombre, ' Código: ', provincia.codProvincia, ' Tel. Turismo: ', provincia.numeroTurismo);
        end;
        writeln(' ');
    end;

end.