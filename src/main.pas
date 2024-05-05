{$UNITPATH controllers, models, utils, views}

program main;

uses 
    menu_principal in 'src/views/menu_principal.pas',
    provincia_controller in 'src/controllers/provincia_controller.pas';

begin
    crearLasProvincias();
    PintarMenuPrincipal();
end.