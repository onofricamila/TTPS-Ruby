## NOTAS

 * `bin/rails generate -h` --> te da las opciones de generators para ejecutar
 
 *  `bin/rails destroy controller PoliteController` --> borra controller y los archs asociados. Por las dudas primero borre de routes.rb las rutas relacionadas.
 
 * para ver todas las rutas ejecutar en consola `$ bin/rails routes`

 * para crear modelo + migracion en un solo comando `$ bin/rails generate model Office tittle:string`

 * para crear primero migracion `$ bin/rails generate migration create_offices title:string`

 * para crear modelo sin migracion `$ bundle exec rails generate model Office --skip`
   **Nota**: Sin --skip va a haber un conflicto, porque al generar un modelo se crea una migración, y el TP pide hacerlo al revés. Usando --skip se saltea las migraciones.

* la validacion de la bd puede ir tanto en el modelo como en una migracion. 

* A scope represents a narrowing of a database query. Entonces, permite definir consultas sql espeficias en la clase, convirtiendolas asi en metodos que se pueden invocar.
Ejemplo de scopes:

```ruby
class Post < ActiveRecord::Base
  # estamos en un modelo
  scope :by_status, -> status { where(status: status) }
  scope :recent, -> { order("posts.updated_at DESC") }
end
```
And we can call them freely like this:

```ruby
Post.by_status('published').recent
# SELECT "posts".* FROM "posts" WHERE "posts"."status" = 'published' 
# ORDER BY posts.updated_at DESC
```

* A scaffold in Rails is a full set of model, database migration for that model, controller to manipulate it, views to view and manipulate the data, and a test suite for each of the above. Lo generamos haciendo `$ rails generate scaffold name`. En la practica hicimos `$ rails generate scaffold name -s` para que haga un skip de los archivos que ya existen.

* The most important methods of the I18n API are:

        translate # Lookup text translations
        localize  # Localize Date and Time objects to local formats

        I18n.t 'store.title'
        I18n.l Time.now
 
* para probar lo del idioma -->  http://localhost:3000/?locale=en (ya quedo configurado en es-AR)




