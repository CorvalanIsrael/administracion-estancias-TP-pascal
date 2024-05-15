## Guía del Proyecto
### Descripción del proyecto

Este proyecto es un sistema de gestión de estancias turísticas desarrollado en Pascal. Utiliza el patrón de diseño Modelo-Vista-Controlador (MVC) para organizar su estructura.

### Estructura del proyecto
El proyecto está organizado en los siguientes componentes:

- **Modelos:** Aquí encontramos las entidades que representan los datos del sistema. En este caso, contamos con los modelos TEstancia y TProvincia, que representan las estancias turísticas y las provincias respectivamente.

- **Controladores:** Los controladores son responsables de manejar la lógica de negocio de la aplicación. En este proyecto, tenemos controladores para las estancias y las provincias. Estos controladores se encargan de realizar operaciones como guardar, eliminar, modificar y obtener estancias y provincias.

- **Vistas:** Las vistas son responsables de presentar la información al usuario. En este proyecto, al estar enteramente escrito en Pascal, las vistas no son la excepción; están diseñadas para interactuar con el usuario a través de la consola.

- **Utils:** En esta carpeta se encuentran, métodos y constantes que pueden ser utilizadas en diferentes partes del código.

> El archivo ***.gitignore*** está configurado para ignorar la carpeta data y bin, donde se guardan los archivos .dat y binarios respectivamente. Esto se hace para evitar que estos archivos sean incluidos en el control de versiones.

### Ejecución del programa
Para ejecutar el programa, simplemente compila y ejecuta el archivo main.pas con el siguiente comando: 
```bash 
    mkdir -p ./bin && fpc -o./bin/main ./src/main.pas && ./bin/main
```
Una vez ejecutado, podrás interactuar con el sistema de gestión de estancias turísticas a través de la consola.
