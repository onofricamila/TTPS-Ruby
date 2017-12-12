json.extract! exam_note, :id, :score, :student_id, :created_at, :updated_at
json.url exam_note_url(exam_note, format: :json)
