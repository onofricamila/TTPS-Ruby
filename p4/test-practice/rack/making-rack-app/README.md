## Pasos para crear una app rack

1. Ir a un directorio vacio y crear `archivo config.ru` (con ese nombre asi se levanta por defecto)
2. En ese archivo crear una clase con el nombre que quieras la cual debe implementar el `metodo call(env`), el cual `devuelve` un arreglo con formato: `[number, {}, array]`
3. `Abajo` del cuerpo de la clase pomer `run NombreClase.new` (lo que hace es mandarle el msj call a esa clase, por eso debe implememntarlo)
4. Desde consola parados en el dir donde esta ese archivo hacer `rackup`, y ver en el navegador como se ejecuta config.ru