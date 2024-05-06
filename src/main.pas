{$UNITPATH , models, utils, views}

program main;

uses 
    utils in 'src/utils/utils.pas',
    menu_principal in 'src/views/menu_principal.pas';

begin
    InicializarPrograma();
    PintarMenuPrincipal();
end.