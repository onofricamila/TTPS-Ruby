# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Course.create("year"=>2017)
Course.create("year"=>2016)
Course.create("year"=>2015)
Course.create("year"=>2014)
Course.create("year"=>2013)

Exam.create("course_id"=>1, "title"=>"Test 1", "passing_score"=>40, "date"=>'2017-10-25')
Exam.create("course_id"=>1, "title"=>"Test 2", "passing_score"=>60, "date"=>'2017-11-25')
Exam.create("course_id"=>1, "title"=>"Test 3", "passing_score"=>80, "date"=>'2017-12-25')
Exam.create("course_id"=>2, "title"=>"Test 1", "passing_score"=>40, "date"=>'2016-11-25')
Exam.create("course_id"=>2, "title"=>"Final Project", "passing_score"=>60, "date"=>'2017-12-25')
Exam.create("course_id"=>4, "title"=>"Final Test", "passing_score"=>80, "date"=>'2014-12-31')

Student.create("course_id"=>1, "surname"=>"Onofri", "name"=>"Camila", "number"=>137356, "dni"=>39599149, "email"=>"onofricamila@gmail.com")
Student.create("course_id"=>1, "surname"=>"Onofri", "name"=>"Melisa", "number"=>137357, "dni"=>40123589, "email"=>"onofrimelisa@gmail.com")
Student.create("course_id"=>1, "surname"=>"Monteverde", "name"=>"Yazmin", "number"=>156987, "dni"=>40258963, "email"=>"monteverdey@gmail.com")
Student.create("course_id"=>1, "surname"=>"Liptak", "name"=>"Franco", "number"=>1589658, "dni"=>39789587, "email"=>"liptak@gmail.com")
Student.create("course_id"=>1, "surname"=>"Borrelli", "name"=>"Franco", "number"=>1758965, "dni"=>39687478, "email"=>"franborrelli@gmail.com")
Student.create("course_id"=>2, "surname"=>"Raimondi", "name"=>"Sebastian", "number"=>1569878, "dni"=>39687789, "email"=>"raimondis@gmail.com")
Student.create("course_id"=>2, "surname"=>"Rios", "name"=>"Gaston", "number"=>156987, "dni"=>39687541, "email"=>"riosgaston@gmail.com")
Student.create("course_id"=>2, "surname"=>"Pierobon", "name"=>"Marcos Matias", "number"=>1698785, "dni"=>39587456, "email"=>"mpierobon@gmail.com")
Student.create("course_id"=>2, "surname"=>"Belenda", "name"=>"Lucas", "number"=>58987, "dni"=>43958789, "email"=>"lucasb@gmail.com")
Student.create("course_id"=>2, "surname"=>"Brost", "name"=>"Pedro", "number"=>158789, "dni"=>4395864, "email"=>"brostp@gmail.com")
Student.create("course_id"=>3, "surname"=>"Levine", "name"=>"Adam", "number"=>158790, "dni"=>39586578, "email"=>"adaml@gmail.com")

Result.create("exam_id"=>1, "score"=>50, "student_id"=>5)
Result.create("exam_id"=>1, "score"=>30, "student_id"=>4)
Result.create("exam_id"=>2, "score"=>50, "student_id"=>5)
Result.create("exam_id"=>2, "score"=>80, "student_id"=>1)
Result.create("exam_id"=>3, "score"=>50, "student_id"=>2)
Result.create("exam_id"=>3, "score"=>30, "student_id"=>3)
Result.create("exam_id"=>3, "score"=>90, "student_id"=>5)
Result.create("exam_id"=>1, "score"=>40, "student_id"=>2)
Result.create("exam_id"=>4, "score"=>50, "student_id"=>9)
Result.create("exam_id"=>4, "score"=>80, "student_id"=>6)
Result.create("exam_id"=>4, "score"=>65, "student_id"=>8)
Result.create("exam_id"=>5, "score"=>75, "student_id"=>7)
Result.create("exam_id"=>5, "score"=>45, "student_id"=>9)
Result.create("exam_id"=>4, "score"=>35, "student_id"=>10)
Result.create("exam_id"=>4, "score"=>20, "student_id"=>7)

User.create! :email => 'root@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
