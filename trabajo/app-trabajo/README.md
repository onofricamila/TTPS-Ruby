# :pushpin: First of all, how do I run this app?

1. Open the console and change directory to  _app-trabajo_
2. Run `bundle install` to get all the required gems
3. Run `rake db:setup` to fill the sqlite3 db with initial data
4. Run `bin/rails server` to start the web server
5. Go to http://localhost:3000/ and you will be able to log in as _'root@gmail.com'_ using the _'topsecret'_ password
6. Explore the app! :smile:

# :pushpin: Then, how do I run the tests?
1. Open the console and change directory to  _app-trabajo_
2. Run `bin/rails test` to excecute all tests, or specify one by one each model to be tested as an argument, this way:
```sh
bin/rails test test/models/course_test.rb
```
```sh
bin/rails test test/models/exam_test.rb
```
```sh
bin/rails test test/models/result_test.rb
```
```sh
bin/rails test test/models/student_test.rb
```
