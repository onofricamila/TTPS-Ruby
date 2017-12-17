# Practica 4

## Puntos teoricos Sinatra

### 1. ¿Qué es Rack? ¿Qué define? ¿Qué requisitos impone?

https://medium.com/whynotio/what-is-rack-in-ruby-7e0615f1d9b6

http://codefol.io/posts/What-is-Rack-A-Primer

Rack is a _ruby gem_ that describes itself as: `a minimal interface between webservers supporting Ruby and Ruby frameworks`

A minimal interface is nothing more than a component that is common ground and sits between two other components that need to work together.

When building web apps with Ruby we always have two components that need to work together; the web server and the Ruby app.

We need something that will give us flexibility in the web server and framework we use without sacrificing lots of time to switch around. Something in the middle that both web servers and Ruby apps can agree to speak to who can translate for both of them. Thus Rack is born!

This means that we can now change our web server or Ruby app framework at any time without any worry about communication between our server and app, so long as what we’re switching to uses the Rack interface.

**Usage example**

Your app server (let’s say unicorn) gets an HTTP request. Somebody wants to post to http://your_site.com/people/127/fire_with_cause.

Unicorn receives the request, parses it, hands it to Rack, and then Rack gives it to your Sinatra app (or Rails, or Padrino, or your framework of choice) as a request, usually a method call. This is where Rails routing takes over, for instance.

Rack keeps Sinatra from having to know anything specific about unicorn. Or mongrel. Or thin. Or lighttpd. Or any of the many other wacky app servers out there. 

**Wrapping up**

The Rack interface sits between our chosen web servers and Ruby apps to give us complete flexibility in switching between what technologies we want to use in our stack.

Rack sits between all the frameworks (Rails, Sinatra, Rulers) and all the app servers (thin, unicorn, Rainbows, mongrel) as an **adapter**.

**Benefits of Rack:**

* Easily switch web servers
* Easily switch Ruby frameworks

**How Do I Use It?**

En sinatra, es simple utilizar los middlewares Rack con el método **use** (son como capas de un pancake que hacen algun tipo de procesamiento).

```ruby
$ rake middleware
use ActionDispatch::Static
use Rack::Lock
use Rack::Runtime
use Rack::MethodOverride
use ActionDispatch::RequestId
use Rails::Rack::Logger
use ActionDispatch::ShowExceptions
use ActionDispatch::DebugExceptions
use ActionDispatch::RemoteIp
use ActionDispatch::Reloader
use ActionDispatch::Callbacks
use ActiveRecord::ConnectionAdapters::ConnectionManagement
use ActiveRecord::QueryCache
use ActionDispatch::Cookies
use ActionDispatch::Session::CookieStore
use ActionDispatch::Flash
use ActionDispatch::ParamsParser
use ActionDispatch::Head
use Rack::ConditionalGet
use Rack::ETag
use ActionDispatch::BestStandardsSupport
run RailsGame::Application.routes

```

Each of those things is a Rack middleware that’s doing a little piece of the processing.

Like Rack::Lock, up near the top? That keeps more than one thread from running in your Rails server at once so that you don’t have to make all your code thread-safe.

Or Rails::Rack::Logger? That makes sure your requests get logged to the Rails logfiles.

And what if you added one? Maybe you could fix a lot of nasty bugs with bad HTTP requests if you could just reject them immediately, before they got a chance to screw up your web framework…

Rack ships with a bunch of middlewares and Rails has a bunch of others that it adds. You can even insert your own into the stack if you mess with config.ru in your Rails app.

**Mas datos**

Sinatra se apoya en rack, una interface con el webserver modular.
La capacidad más importante de rack es la de soportar middlewares: Esto es, componentes que operan entre la aplicación y el web server monitoreando o manipulando los reqs/resp HTTP proveyendo así de varios tipos de funcionalidades comunes.
En sinatra, es simple utilizar los middlewares Rack con el método `use`

Rack es una gema que provee una interface entre WebServers y Frameworks basados en Ruby.
To use Rack, provide an "app": an object that responds to the call method, taking the environment hash as a parameter, and returning an Array with three elements:
* The **HTTP status** response code **(string)**
* A **Hash of headers** (responds to **each**)
* The **response body**, which must respond to **each** 


### Requisitos

1. Tener instalada la gema rack
2. En el directorio de nuestra app, tener un archivo llamado `config.ru`, que representa a la app
4. El archivo ese config.ru debe tener una clase que iplemente el metodo `call(env)`, y luego de definir esa clase, al final del archivo debemos incuir la sentencia `run ClassName.new`
3. Desde consola y parados en el dir de nuestra app, correr `rackup` (por defecto levanta el archivo config.ru)

**NOTA:** si queres no ponerle el nombre config.ru al archivo de tu app, ponele el nombre que quieras tipo app.rb considerando vas a tener que hacer require 'rack' y abajo Rack::Handler::WEBrick.run(YourClass.new, :Port => 9292). Ademas, parado en el dir de tu app no se levanta haciendo un simple 'rackup', sino que hay que hacer ruby app.rb o rackup app.rb


##  :loudspeaker: OBJETOS QUE PODRIAN SER 'RACKABLES'

Aquel que posea un metodo call que recibe un hash de entorno y devuelve un array (respetando orden) con la siguiente info sobre la respuesta HTTP ...
  1. status code, hash de cabeceras http, y un objeto que implementa el mixin Enumerable (si algo implementa el mixin Enumerable sabes entiende el metodo each)
  2. status code, hash de cabeceras http, y un objeto que responde al each
  3. status code, hash de cabeceras http, y un array como body 
---

### 2. How to build your first rack app

1. Run in your console `gem list rack`. Does that show something like rack (1.6.1) (or any other version number)? If it doesn’t, install Rack with the command `gem install rack.`

2. In a new directory rack create a file config.ru with the following content:

```ruby
class Application
  def call(env)
    status  = 200
    headers = { "Content-Type" => "text/html" }
    body    = ["Yay, your first web application! <3"]

    [status, headers, body]
  end
end

run Application.new
```
We define a **class Application, (notice the name could be whichever)**, and, on the last line, **create an instance of it, which we pass to the method run**. **The method ru**n is defined by Rack, and **expects to be passed something that responds to the method call**. 

**That’s why we defined a method call on our class. This method takes one argument env.** It does not use the env (whatever that is), yet, but instead just returns the same static array whenever it is called.

This array contains 3 things:

*   The number 200, which represents the status code,
*   a hash that contains a single header (the content type), and
*   an array containing a single string, which is the body.

**So the method call returns something that represents an HTTP response in Rack!**

##  :loudspeaker: Sobre ENV hash ...

**Rack makes it so that whenever there’s a request coming in (on the computer that is localhost, i.e. your own, local computer, and on the port 9292), it will turn this request into a hash env. It will then hand us this hash by calling our method call. I.e. the hash env that is passed to us as an argument contains the request information.**

Cosas que pueden ir en el env ...

  * WEBrick adds the key **PATH-INFO** with the resource (path), as well as the key **REQUEST-METHOD** with the verb (method) from the HTTP request. These weren’t headers in the request, but obvioulsy part of it. 

  **The most interesting bits in the env hash are the REQUEST-METHOD, and PATH-INFO.**

http://webapps-for-beginners.rubymonstas.org/rack/rack_env.html
http://www.rubydoc.info/github/rack/rack/master/file/SPEC
http://www.rubydoc.info/github/rack/rack/master/Rack/Request

MUY util para el examen, en la parte de middlewares --> http://webapps-for-beginners.rubymonstas.org/rack/method_path.html


3. This gem comes with a little executable (command line program) called `rackup`. This command looks for a file `config.ru` in the current directory, and starts a web server using it, on your local computer.

Make sure you have cded to your rack directory, and then run `rackup`. 

http://webapps-for-beginners.rubymonstas.org/rack/hello_world.html

---

### 3. Sinatra se define como "DSL para crear aplicaciones web". ¿Qué quiere decir esto? ¿Qué es un DSL? 

Domain Specific Languages: Lenguaje de programación enfocado en un dominio de aplicación en particular.

DSL es un lenguaje de programación o especificación dedicado a resolver un problema en particular, representar un problema específico y proveer una técnica para solucionar una situación particular.

**Es como que te digo en esta dsl escribiendo esto pasa esto. Como que cada una define sus comandos, o ponele los mensajes que tenes que mandar y a quien, los cuales se implementan con el lenguaje en cuestion, en este caso ruby.**

### Now, going in details with Sinatra ...

As said before, Sinatra is a Domain Specific Language implemented in Ruby that's used for writing web applications. Created by Blake Mizerany, Sinatra is Rack-based, which means it can fit into any Rack-based application stack, including Rails. It's used by companies such as Apple, BBC, GitHub, LinkedIn, and more.

**Essentially, Sinatra is nothing more than some pre-written methods that we can include in our applications to turn them into Ruby web applications.**

Unlike Ruby on Rails, which is a Full Stack Web Development Framework that provides everything needed from front to back, Sinatra is designed to be lightweight and flexible. Sinatra is designed to provide you with the bare minimum requirements and abstractions for building simple and dynamic Ruby web applications.

In addition to being a great tool for certain projects, Sinatra is a great way to get started in web application development with Ruby and will prepare you for learning other larger frameworks, including Rails.

Sinatra is considered a light weight framework where the responsibility of app structure and communication falls solely on the developer. Sinatra doesn't give you a lot to get started with. There is no way to auto-generate files and directories, no way for the app to make assumptions about routes, or "Sinatra magic".

**You are required to manually set up routes and connect them to other pieces of your application.** Without this manual setup, your application does not automatically know how to communicate with your database or what HTML files to load in the browser.

**The Sinatra DSL**

Any application that requires the sinatra library will get access to methods like: get and post. These methods provide the ability to instantly transform a Ruby application into an application that can respond to HTTP requests.

**Basic Sinatra Applications**

First, make sure Sinatra is installed by running `gem install sinatra` in your terminal.

The simplest Sinatra application would be:

`File: app.rb`

```ruby
require 'sinatra'

class App < Sinatra::Base

  get '/' do
    "Hello, World!"
  end

end
```

You could start this web application by running `rackup app.rb`. You'll see something similar to:

```
$ rackup app.rb
Puma starting in single mode...
* Version 3.10.0 (ruby 2.3.0-p0), codename: Russell's Teapot
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:9292
Use Ctrl-C to stop
```
This is telling us that Sinatra has started a web application running on your computer listening to HTTP requests at port 9292, the Sinatra default. If you start this application and navigate to http://localhost:9292 you'll see "Hello, World!" in your browser. Go back to your terminal running the Sinatra application and stop it by typing CTRL+C. You should see:

```
* Listening on tcp://localhost:9292
Use Ctrl-C to stop
^C- Gracefully stopping, waiting for requests to finish
=== puma shutdown: 2017-11-15 09:41:19 -0500 ===
- Goodbye!
[00:01:11] (wip-lesson) what-is-sinatra
$
```

This is the most basic Sinatra application structure and is actually pretty uncommon. More commonly, Sinatra is used in a modular style encapsulated by Controller Classes and booted via the `config.ru` Rack convention.

https://learn.co/lessons/what-is-sinatra

---

### 4. How to make your first Sinatra app

1. Hacer un Gemfile que tenga `gem 'sinatra'`
2. Parado en el dir padre de ese Gemfile, hacer desde consola `bundle install --system`, para que no se haga la carpeta vendor/bundler en el proyecto, tipo queria tener sinatra global
3. Hacer un archivo yourFavouriteName.rb en ese mismo dir, que requiera 'sinatra' y tenga una clase que hereda de Sinatra::Base
4. Parado en ese dir ya podes hacer `rackup yourFavouriteName.rb` o `ruby yourFavouriteName.rb`

https://www.packtpub.com/books/content/quick-start-your-first-sinatra-application

---

### 6. Middlewares para Sinatra

Estan como en el medio de tu app en server y lo que se muestra. En este caso, modificaria tu respuesta
**NOTAS**
1. Todo middleware debe estar representado por una clase (le dara el nombre al middleware)
2. Esa clase debe tener un metodo initialize que recibe una app y se lo asigna a una var de instancia
3. Debe tener un metodo call que recibe un env como siempre, guarda en 3 vars el resultado de mandarle call(env) a su app (v.i.), modifica la respuesta, y devuelve un nuevo array con la respuesta modificada:

```ruby
def call(env)
      status, headers, response  = @app.call(env)
      new_response = response.map { |c| c.gsub(/\d/,'x') }
      [status, headers, new_response]
end
```
---

### 7. Implementa un middleware que modifique el header y se ejecute antes que el anterior.

**NOTAS**
1. Lo probamos haciendo: `curl -I http://localhost:9292/sum/1/2/8` para ver los headers.
2. El orden de ejecucion de un middleware es segun que use Middleware pongo primero en la app
3. Recordar require_relative 'file-de-middleware.rb' en el arch de la app
4. Se agrega un header haciendo:

```ruby

def call(env)
      status, headers, response  = @app.call(env)
      # los headers son como un arreglo de headers
      # hacer to_s !!! Siempre strings
      headers['X-Xs-Count'] = response.to_s.count('x').to_s
      [status, headers, response]
end

```
---

### 8. App Sinatra, juego del 'ahorcado'

**NOTAS**
1. redirect "" --> redirecciona al path dado. Ej: `"/partida/#{rand(list.size)}"`. Esta bueno para ponerlo en el index y tipo ante un get '/' do redirect 'blabla' end
2. VER COMO SE TOMAN LOS DATOS PASADOS POR URL !!!! ENTRE EL DO Y END DEL METODO (POST GET ETC) PONER |var| QUE REPRESENTAN A LOS PARAMS. EJ:

```ruby
get '/partida/:id' do |id|
  list[id.to_i].summary
end
```
3. Uso de "#{}" para extrapolar codigo

---



