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

* Siempre pasarle a la vista vers de instancia, osea crearlas en el controller

* <%= link_to 'Show', article_path(article) %> --> te hace un link a /articles/show/article_id

* Article class inherits from ApplicationRecord. ApplicationRecord inherits from ActiveRecord::Base which supplies a great deal of functionality to your Rails models for free, including basic database CRUD (Create, Read, Update, Destroy) operations, data validation, as well as sophisticated search support and the ability to relate multiple models to one another.

* Para mostrar una vista ... 

```ruby 
render 'new'
```

* DIFERENCIA IMPORTANTE --> The **render** method is used so that the @article object is passed back to the new template when it is rendered. This rendering is done within the same request as the form submission, whereas the **redirect_to** will tell the browser to issue another request.

### Pasos
1. Arranco una app en rails ejecutando en la terminal (habiendome posado en una carpeta) `rails new nombre_app` (para ver opciones al crear una app hacer `rails new -h`)

2. cd nombre_app + bundle install

3. Hacer `bin/rails server`

4. En otra terminal parada en nombre_app folder, hacer `bin/rails generate controller Welcome index` para generar un controller llamado welcome, con una primer action index.

5. Ir a app/views/welcome/index.html.erb y poner codigo html tipo Hello World

6. Hacer una asociacion controller#action como root.
Open the file config/routes.rb in your editor. This is your application's routing file which holds entries in a special DSL (domain-specific language) that tells Rails how to connect incoming requests to controllers and actions. Edit this file by adding the line of code root 'welcome#index'. It should look something like the following:
```ruby
Rails.application.routes.draw do
  get 'welcome/index'
 
  root 'welcome#index'
end
```
root 'welcome#index' tells Rails to map requests to the root of the application to the welcome controller's index action and get 'welcome/index' tells Rails to map requests to http://localhost:3000/welcome/index to the welcome controller's index action. 

7. Create a resource. 
In the Blog application, you will now create a new resource. A resource is the term used for a collection of similar objects, such as articles, people or animals. You can create, read, update and destroy items for a resource.
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

10. Crear un modelo.
Run `bin/rails generate model Article title:string text:text`.
Models in Rails use a singular name, and their corresponding database tables use a plural name. Rails provides a generator for creating models. Run `bin/rails generate model Article title:string text:text`. It creates 2 files: app/models/article.rb and db/migrate/YYYYMMDDHHMMSS_create_articles.rb. 
Migrations are Ruby classes that are designed to make it simple to create and modify database tables.

11. Running the migration: `in/rails db:migrate`

12. Para guardar algo en la db usamos la clase que se autogenero al hacer el modelo ubicada en /app/model/articles.rb. The @article.save method returns a boolean indicating whether the article was saved or not. Example:
```ruby
  @article = Article.new(params[:article])
 
  @article.save
  redirect_to @article
```

13. Al intentar agregar algo salta error ForbiddenAttsError, tenes que indicar en el controller que params esperas por seguridad. In this case, we want to both allow and require the title and text parameters for valid use of create. The syntax for this introduces **require** and **permit**.
```ruby
@article = Article.new(params.require(:article).permit(:title, :text))
```
14. We need to add the show action in app/controllers/articles_controller.rb and its respective view.
We use Article.find to find the article we're interested in, passing in params[:id] to get the :id parameter from the request. We also use an instance variable (prefixed with @) to hold a reference to the article object. We do this because Rails will pass all instance variables to the view.

Now, create a new file app/views/articles/show.html.erb.

15. Add links to navigate.
The link_to method is one of Rails' built-in view helpers. It creates a hyperlink based on text to display and where to go - in this case, to the path for articles. E.g:

```ruby
<%= link_to 'My Blog', controller: 'articles' %>

<%= link_to 'New article', new_article_path %>

# en new y show ..
<%= link_to 'Back', articles_path %>

```
If you want to link to an action in the same controller, you don't need to specify the :controller option, as Rails will use the current controller by default.

In development mode (which is what you're working in by default), Rails reloads your application with every browser request, so there's no need to stop and restart the web server when a change is made.

16. Validate params in the model.
Rails includes methods to help you validate the data that you send to models. Open the app/models/article.rb file and edit it:
```ruby
class Article < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 5 }
end
```
With the validation now in place, when you call @article.save on an invalid article, it will return false. If you open app/controllers/articles_controller.rb

Validations are covered in detail in Active Record Validations.


17. Hacer if @article.save bla bla considerando las validaciones hechas.

18. Si vas a testear en la vista un hacer en el controller en la accion que renderiza esa vista un new del resource. Ejemplo:

```ruby
# en controller de articles
  def new
      # importantisimo para testear @article.errors.any? en la vista del new
      @article = Article.new
  end
```

```ruby
# en vista de new article
  <% if @article.errors.any? %>
    <div id="error_explanation">
      <h2>
            <%= pluralize(@article.errors.count, "error") %> prohibited
            this article from being saved:
        </h2>
        <ul>
          <% @article.errors.full_messages.each do |msg| %>
            <li><%= msg %></li>
          <% end %>
        </ul>
    </div>
<% end %>
```

We check if there are any errors with @article.errors.any?, and in that case we show a list of all errors with @article.errors.full_messages.

pluralize is a rails helper that takes a number and a string as its arguments. If the number is greater than one, the string will be automatically pluralized.

19. Focus on editing a resource.
In the conreroller, we add the edit action with `@article = Article.find(params[:id])`. Passing the article object to the method, will automagically create url for submitting the edited article form. 
In the related view, we put a form like the new one but coding `<%= form_with(model: @article) do |form| %>`. This will automatically fill the fields.

Passing the article object to the method, will automagically create url for submitting the edited article form. This option tells Rails that we want this form to be submitted via the PATCH HTTP method which is the HTTP method you're expected to use to update resources according to the REST protocol.

The arguments to form_with could be model objects, say, model: @article which would cause the helper to fill in the form with the fields of the object. Passing in a symbol scope (scope: :article) just creates the fields but without anything filled into them.

20. Creamos action update haciendo `find` y testeando `update` como con `save`.

21. Deleting resources.
In the controller we add the action destroy which makes `@article = Article.find(params[:id])`, `@article.destroy`, and then redirects to the index by making `redirect_to articles_path`.
In the view which has the link to delete, we put `<%= link_to 'Destroy', article_path(article), method: :delete, data: { confirm: 'Are you sure?' } %>`.
The method: :delete and data: { confirm: 'Are you sure?' } options are used as HTML5 attributes so that when the link is clicked, Rails will first show a confirm dialog to the user, and then submit the link with method delete