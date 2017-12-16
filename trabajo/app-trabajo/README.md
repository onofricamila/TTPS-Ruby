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

* form select -->

<div class="field">
    <%= f.label :student %><br />
    <%= f.collection_select :student_id, @note.exam.course.students, :id, :name, {:prompt => "Select a Student"}, {:class=>""} %>
  </div>  

* For associations to reference one another by name, you can use the fixture name instead of specifying the id: attribute on the associated fixtures. Rails will auto assign a primary key to be consistent between runs. 

* ERB allows you to embed Ruby code within templates. The YAML fixture format is pre-processed with ERB when Rails loads fixtures. This allows you to use Ruby to help you generate some sample data. For example, the following code generates a thousand users:
```ruby
<% 1000.times do |n| %>
user_<%= n %>:
  username: <%= "user#{n}" %>
  email: <%= "user#{n}@example.com" %>
<% end %>
```

* Fixtures are instances of Active Record. As mentioned in point #3 above, you can access the object directly because it is automatically available as a method whose scope is local of the test case. For example:
```ruby
# this will return the User object for the fixture named david
users(:david)
 
# this will return the property for david called id
users(:david).id
 
# one can also access methods available on the User class
david = users(:david)
david.call(david.partner)
```

* seeds:
```ruby
Book.create(title: 'Julius Shulman: The Last Decade').authors.create([
  {first_name: 'Thomas', last_name: 'Schirmbock'},
  {first_name: 'Julius', last_name: 'Shulman'},
  {first_name: 'Jürgen', last_name: 'Nogai'}
  ])
```

To get multiple fixtures at once, you can pass in a list of fixture names. For example:
```ruby
# this will return an array containing the fixtures david and steve
users(:david, :steve)
```

* By default, running bin/rails test won't run your system tests. Make sure to run bin/rails test:system to actually run them.