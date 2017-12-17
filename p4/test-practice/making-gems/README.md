## Pasos para crear una gema ..

1. Crear una carpeta con el nombre de la gema
2. Crear una subcarpeta adentro de esta llamada lib, la cual tendra un archivo nombre_gema.rb que sera lo que tiene o hace la gema
3. En el directorio con el nombre de la gema hacer un file nombre_gema.gemspec
4. Crear en consola la gema haciendo  gem build nombre_gema.gemspec
5. Instalarla haciendo gem install file-que-dio-el-comando-anterior