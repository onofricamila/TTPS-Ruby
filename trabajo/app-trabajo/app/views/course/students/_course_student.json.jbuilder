json.extract! course_student, :id, :surname, :name, :number, :dni, :email, :created_at, :updated_at
json.url course_student_url(course_student, format: :json)
