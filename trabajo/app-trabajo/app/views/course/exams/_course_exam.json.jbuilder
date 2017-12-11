json.extract! course_exam, :id, :title, :passing_score, :date, :created_at, :updated_at
json.url course_exam_url(course_exam, format: :json)
