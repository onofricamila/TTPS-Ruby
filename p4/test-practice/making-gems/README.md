## Pasos para usar gemas en tu script
1. Cd un dir vacio y hacer `bundle init` (Te crea un Gemfile)
2. Agregar las gemas que queres al Gemfile
3. Desde consola correr `bundle install`
4. Armar tu app.rb en ese dir, notando debes hacer antes que nada un `require 'bundler'` y `Bundle.require`
5. Ejecutar tu app haciendo `ruby app.rb` o `bundle exec ruby app.rb`