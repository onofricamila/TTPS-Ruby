## Notas importantes

### Consideraciones
* No se instalaba la gema sqlite3 y tuve que hacer `sudo apt-get install libsqlite3-dev` para luego `gem install sqlite3` y anduvo :) 
source --> https://ridingwithrails.wordpress.com/2010/12/21/sqlite3-gem-error-during-bundle-install/

* Cuando quice hacer ` bin/rails server` por prinera vez, me salto error del tipo __"There was an error while trying to load the gem 'uglifier'. (Bundler::GemRequireError)
Gem Load Error is: Could not find a JavaScript runtime."__ Que pasa, we need a JS Runtime, so NodeJS is a good choice. Corrimos el comando `sudo apt-get install nodejs` y salio todo de 10.
source --> https://stackoverflow.com/questions/34420554/there-was-an-error-while-trying-to-load-the-gem-uglifier-bundlergemrequire#comment58768810_34472412

* Si usas el helper para armar un form al poner `url: resourceName_path` inmediatamente se lee el archivo routes y tipo se hace el linkeo con /resourceName segun el http verb (en caso del form esta en el template de new como el form envia por defecto parametros por post y /resourceName para POST ejecuta una accion del mismo controller llamada __create__, con los datos)

* Los datos enviados a un action como por ej create por un form se acceden en el controller de la forma `params[form_scope].inspect`

* Models in Rails use a singular name, and their corresponding database tables use a plural name. 

### Pasos
1. Arranco una app en rails ejecutando en la terminal (habiendome posado en una carpeta) `rails new nombre_app` (para ver opciones al crear una app hacer `rails new -h`)

2. cd nombre_app + bundle install

3. Hacer `bin/rails server`

4. En otra terminal parada en nombre_app folder, hacer `bin/rails generate controller Welcome index` para generar un controller llamado welcome, con una primer action index.

5. Ir a app/views/welcome/index.html.erb y poner codigo html tipo Hello World

6. Open the file config/routes.rb in your editor. This is your application's routing file which holds entries in a special DSL (domain-specific language) that tells Rails how to connect incoming requests to controllers and actions. Edit this file by adding the line of code root 'welcome#index'. It should look something like the following:
```ruby
Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
end
```
root 'welcome#index' tells Rails to map requests to the root of the application to the welcome controller's index action and get 'welcome/index' tells Rails to map requests to http://localhost:3000/welcome/index to the welcome controller's index action. 

7. In the Blog application, you will now create a new resource. A resource is the term used for a collection of similar objects, such as articles, people or animals. You can create, read, update and destroy items for a resource.
Rails provides a resources method which can be used to declare a standard REST resource. You need to add the article resource to the config/routes.rb so the file will look as follows:
```ruby
Rails.application.routes.draw do
  get 'welcome/index'
 
  resources :articles
 
  root 'welcome#index'
end
```
8. Trabajar las urls que se agregan en bin/rails routes con respecto a los resources agregando controllers con actions y views asociadas.

9. Considerar los helpers para armar html (como un form) (se escriben directo en el template)

10. Models in Rails use a singular name, and their corresponding database tables use a plural name. Rails provides a generator for creating models. Run `bin/rails generate model Article title:string text:text`. It creates 2 files: app/models/article.rb and db/migrate/YYYYMMDDHHMMSS_create_articles.rb. 
Migrations are Ruby classes that are designed to make it simple to create and modify database tables.

11. Running the migration: `in/rails db:migrate`

