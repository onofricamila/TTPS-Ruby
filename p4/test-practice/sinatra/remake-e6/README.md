## Como usar un middleware

1. En la app sinatra requerir relativo 'middleware.rb'
2. En un archivo vecino a la app llamado middleware escribir una clase que
implemente el metodo initialize(app) y call(env). En el call(env) estaria bueno hacer @app.call(env), guardar eso en variables, modificar cualquiera de los 3 componentes y devolver el array con los elementos necesarios.
3. En la clase de la app poner use NombreClaseMiddleware para implementarlo

ver --> http://webapps-for-beginners.rubymonstas.org/rack/method_path.html

para entender uso de la clave path info y request method de env