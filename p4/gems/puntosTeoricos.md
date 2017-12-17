# Práctica 4

## Puntos teóricos de Gemas Y Bundler

### 1. ¿Qué es una gema? ¿Para qué sirve? ¿Qué estructura tienen? 

Una gema es una librería Ruby. Se utilizan para compartir código entre desarrolladores. Una gema se compone de un nombre, una versión y una plataforma. Dentro de una gema suelen encontrarse tres componentes:

* Codigo (Incluido los tests)
* Documentación
* gemspec (Que especifica la información acerca de la gema, como su nombre, version, descripción, autor, **dependencias**, etc).
    *  Rubygem conventions dictate that you move the dependency declaration on these released gems form the Gemfile into your .gemspec file 
    * Notice dependencies are also declarated in Gemfile and Gemfile.lock


http://guides.rubygems.org/what-is-a-gem/

---

### 2. ¿Cuáles son las principales diferencias entre el comando gem y Bundler? ¿Hacen lo mismo?

Itś said: by default on your local machine, no particular difference but...

**The purpose of bundle install is to** setup everything for the application containing the Gemfile. You can even pass arguments to make needed gems installed in whatever folder you want.

This way in production, you **have clearly separated apps with their own gems.**

On the other side, **gem install gets the gem installed for your whole environment.**

https://stackoverflow.com/questions/6162047/difference-between-bundle-and-gem-install

---

### 3. ¿Dónde instalan las gemas los comandos gem y bundle? Tip: gem which y bundle show. 

Siguiendo con lo anterior ...

Bundler es un manejador de dependencias. Sirve para agregar dependencias externas a un proyecto Ruby, se especifica en el Gemfile las librerías a utilizar, estas a su vez pueden especificar otras como dependencias, bundler se encarga de descargar todo lo necesario. Solo es necesario utilizar el comando bundle. Asegura que la aplicación que lo use tenga las dependencias necesarias para que se ejecute sin errores. `Bundler es una gema 'manejadora de gemas', que la queremos tener en el core para usar siempre... la instalamos en nuestro entorno global haciendo: gem install bundler.`

`Gems es el manejador de gemas por parte del ruby core. No es lo mismo instalar una gema con bundler que con gem. Bundler es externo, mientras que gem instala en el directorio del core de ruby.`

https://stackoverflow.com/questions/6162047/difference-between-bundle-and-gem-install

---

### 4. ¿Para qué sirve el comando gem server? ¿Qué información podés obtener al usarlo?

When you install RubyGems, it adds the gem server command to your system. This is the fastest way to start hosting gems. 

This will serve all your installed gems from your local machine at http://localhost:8808. If you visit this url in your browser, you’ll find that the gem server command provides an HTML documentation index.

**(Al utilizar el comando gem server se mostrará en el localhost (puerto 8808) la lista de gemas instaladas en el ruby core.)**

When you install new gems, they are automatically available through the built-in gem server.

It can also operate as a server for installation of gems on other machines.

http://guides.rubygems.org/run-your-own-gem-server/

---

### 5. Investigá un poco sobre Semantic Versioning (o SemVer). ¿Qué finalidad tiene? ¿Cómo se compone una versión? ¿Ante qué situaciones debería cambiarse cada una de sus partes?

Es una convención de semántica de versionado para código.

Define la composición de un versionado como : MAJOR.MINOR.PATCH
* MAJOR x.0.0: Se cambia cuando se realizan cambios que hacen la API anterior incompatible
* MINOR 0.x.0: Se cambia cuando agrega funcionalidad compatible hacia atrás.
* PATCH  0.0.x : Se cambia cuando se arreglaron bugs.

http://semver.org/

---

### 6. Notas varias:

* Instalamos bundle tipo global haciendo _gem install bundler_

*  Inicializas un nuevo proyeto en ruby haciendo _bundle init_ en un dir vacio. Eso como que ya te crea ahi un Gemfile con lo basico.

*  Para agregar una gema (tipo diciendo que dependes de esa en el proyecto), agregas al Gemfile una linea
del estilo _gem 'colorputs'_; estas usando el comando _gem_. 

*  Cuando creamos un archivo .rb de prueba en el dir de nuestro proyecto, que hace un require de una gema indicada en el Gemfile (particularmente ), al querer ejecutarlo haciendo _ruby prueba.rb_, aparece un error del tipo "in 'require': cannot load such file -- colorputs(LoadError)"

* Al ejecutarlo haciendo _bundle exec ruby prueba.rb_, dice "Could not find gem 'colorputs' in any of the gem sources listed in your Gemfile. Run `bundle install` to install missing gems"
 
*  Utilizamos el comando `bundle install` para instalar las dependencias del proyecto, install the dependencies specified in your Gemfile. When you run bundle install, Bundler will persist the full names and versions of all gems that you used (including dependencies of the gems specified in the Gemfile(5)) into a file called Gemfile.lock.
**COMO UNA VEZ PUSE BUNLDER INSTALL --PATH /VENDOR/BUNDLER ME AGREGA LA CARPETA VENDOR A CADA PROYECTO, PONIENDO LAS GEMAS QUE DEPENDO AHI, EN VENDOR/GEMS ... ESTA BIEN?**
Ver --> https://stackoverflow.com/questions/9452760/rails-bundler-how-to-undo-bundle-package/14433132 

* Al querer ejecutarlo haciendo _ruby prueba.rb_, sigue apareciendo un error del tipo "in 'require': cannot load such file -- colorputs(LoadError)"

* Ahora, al ejecutarlo haciendo _bundle exec ruby prueba.rb_, FUNCIONA!

* Type _bundle list_ to see the gems installed by the bundle

---

### 7. Utilizando el proyecto creado en el punto anterior como referencia, contestá las siguientes preguntas:

#### a. ¿Qué finalidad tiene el archivo Gemfile?

El archivo `Gemfile` es utilizado por Bundler y nos permite definir las dependencias de nuestra aplicación.

http://bundler.io/man/gemfile.5.html

#### b. ¿Para qué sirve la directiva source del Gemfile? ¿Cuántas pueden haber en un mismo archivo?

Sirve para indicar a donde se debe hacer el requerimiento de las gemas. Puede haber más de un source en el Gemfile. 

http://bundler.io/gemfile.html

#### c. Acorde a cómo agregaste la gema colorputs, ¿qué versión se instaló de la misma?  Si mañana se publicara la versión 7.3.2, ¿esta se instalaría en tu proyecto? ¿Por qué? ¿Cómo podrías limitar esto y hacer que sólo se instalen releases de la gema en las que no cambie la versión mayor de la misma?

La versión que se instaló en el sistema es la última disponible de la gema.Puede verse en el archivo Gemfile.lock que se instaló la versión 0.2.3, o utilizando el comando blundle show se listan las gemas y sus respectivas versiones. 

Si se publica una nueva version, esta no sería instalada automaticamente. Tendrias que ejecutar en tu proyecto _bundle update_. __Nota:__ "In general, you should use [bundle-install] to install the same exact gems and versions across machines. You would use bundle update to explicitly update the version of a gem."

Por otra parte, la forma de elegir de alguna manera la version a descargar para que sólo se instalen releases de la gema en las que no cambie la versión mayor de la mismasería por ejemplo de la siguiente manera:

`gem 'colorputs', '~>0.2'` , which is equivalent to '>=0.2.0','<0.3.0'

**~> --> asociado completamente al PATCH number (el ultimo)**

#### d. ¿Qué ocurrió la primera vez que ejecutaste prueba.rb? ¿Por qué?

No encontró el archivo de la gema solicitada.

`cannot load such file -- colorputs (LoadError)`

#### e. ¿Qué cambió al ejecutar bundle install?

`bundle install` instaló la gema en el sistema, previamente especificada en el archivo `Gemfile`
**De todas formas me dice que no la encuentra. Sera porque la instala en esa carpteta vendor del proy?**

#### f. ¿Qué diferencia hay entre bundle install y bundle update?

* **bundle install** : respeta las versiones de las gemas en el archivo Gemfile.lock, si este existe. Sino, funciona igual que `bundle update`.
* **bundle update** : ignora completamente el archivo Gemfile.lock e instala las gemas en su ultima version acorde a las restricciones del Gemfile.

Here are the rules:
* Always use bundle install
* If you need to upgrade a dependency that Bundler is already managing, use bundle update <gem>.
* Don't run bundle update unless you want all of your gems to be upgraded.

*Bundler help*

```
Bundle install

Install the gems specified in your Gemfile(5). If this is the first time you run bun‐
dle install (and a Gemfile.lock does  not  exist),  Bundler  will  fetch  all  remote
sources, resolve dependencies and install all needed gems.

If  a Gemfile.lock does exist, and you have not updated your Gemfile(5), Bundler will
fetch all remote sources, but use the  dependencies  specified  in  the  Gemfile.lock
instead of resolving dependencies.

If  a Gemfile.lock does exist, and you have updated your Gemfile(5), Bundler will use
the dependencies in the Gemfile.lock for all gems that you did not update,  but  will
re-resolve  the  dependencies of gems that you did update. You can find more informa‐
tion about this update process below under CONSERVATIVE UPDATING.
```

```
Bundle update

Update  the gems specified (all gems, if none are specified), ignoring the previously
installed gems specified in the Gemfile.lock. In  general,  you  should  use [bundle-install]  to  install  the  same  exact  gems  and versions across
machines.

You would use bundle update to explicitly update the version of a gem.
```

https://www.viget.com/articles/bundler-best-practices

#### g. ¿Qué ocurrió al ejecutar prueba-dos.rb de las distintas formas enunciadas? ¿Por qué? ¿Cómo modificarías el archivo prueba_dos.rb para que funcione correctamente?

* `ruby prueba_dos.rb`: Error debido a que no encuentra la constante `Bundler`. Dice: "prueba_dos.rb:1:in `<main>': uninitialized constant Bundler (NameError)"

* `bundle exec ruby prueba_dos.rb`: Funciona debido a que `bundle exec` ejecuta el script en el contexto del bundle actual definido por `Gemfile`.

Para que se pueda ejecutar el script de la primer forma, bastaría con agregar la linea:

`require 'bundler/setup'`

---

### 8. Desarrollá una gema (llamada MethodCounter, por ejemplo) que empaquete toda la funcionalidad implementada en el ejercicio 11 de la práctica 2 (el módulo Countable).La forma de usarla sería algo similar a esto:

```ruby
require 'method_counter'

class MiClase
include MethodCounter::Countable

def hola
puts "Hola"
end

def chau
puts "Chau"
end

count_invocations_of :hola, :chau
end
```
**Creando una gema**
* Code for your package is placed within the lib directory. The convention is to have one Ruby file with the same name as your gem, since that gets loaded when require 'hola' is run. That one file is in charge of setting up your gem’s code and API.

The code inside of lib/hola.rb is pretty bare bones. It just makes sure that you can see some output from the gem.

* The gemspec defines what’s in the gem, who made it, and the version of the gem. It’s also your interface to RubyGems.org. All of the information you see on a gem page (like jekyll’s) comes from the gemspec. The gemspec is also Ruby, so you can wrap scripts to generate the file names and bump the version number.

* After you have created a gemspec, you can build a gem from it. Then you can install the generated gem locally to test it out.

```
% cd ~/Documentos/ruby/TTPS-Ruby/p4/gems/e8/method_counter
% gem build method_counter.gemspec
Successfully built RubyGem
Name: method_counter
Version: 0.0.0
File: method_counter-0.0.0.gem

% gem install ./method_counter-0.0.0.gem
Successfully installed method_counter-0.0.0
1 gem installed

```

http://guides.rubygems.org/make-your-own-gem/
https://soffes.blog/how-to-build-a-ruby-gem

---