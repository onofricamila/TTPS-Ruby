# No es el README.md a presentar con el tp. Pongo notas para mi.

* Cuando instale devise salio esto en consola. NO se si voy a usar esa view o no.

    3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

    4. You can copy Devise views (for customization) to your app by running:

       rails g devise:views

* Para generar scaffolds anidados !!! `rails generate nested_scaffold PARENT_NAME/NAME [field:type field:type] ` (notar no se pone lo de references porque lo hace sola la gem)

* AR supported types

    :binary
    :boolean
    :date
    :datetime
    :decimal
    :float
    :integer
    :primary_key
    :string
    :text
    :time
    :timestamp

