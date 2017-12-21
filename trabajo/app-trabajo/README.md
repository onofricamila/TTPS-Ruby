# TTPS-Ruby Final Project, by Onofri Camila | 2017

## :pushpin: First of all, how do I run this app?

1. Make sure you have `Ruby` installed in your computer, since this app was made using ruby 2.4.1p111. The gem called `bundler` is also required. You can install it by running `gem install bundler`
2. Now open the console and change directory to  _app-trabajo_
3. Run `bundle install` to get all the required gems
4. Run `rake db:setup` to fill the sqlite3 db with initial data
5. Run `bin/rails server` to start the web server
6. Go to http://localhost:3000/ and you will be able to log in as _'root@gmail.com'_ using the _'topsecret'_ password
7. Explore the app! :smile:

## :pushpin: Then, how do I run the tests?

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

## :pushpin: To be considered when using this app

* When reading the summary, pay attention to the style aplyed to students scores so as to know if a student failed or passed an exam (red with a cross stands for _failed_ whereas green and a tick stands for _passed_)
* Each course created by default has a purpose ...
    * Course 2014 is there to show it can be edited and erased cause it hasn't students nor exams related.
    * Course 2015 is there to show it can only be edited cause it has one student related, and no exams.
    * Course 2016 and 2017 are there to show in a better way the functionalities of this app, due to the fact they are related to a lot of sample data. Neither of them can be edited  or erased.


