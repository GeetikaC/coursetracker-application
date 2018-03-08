json.extract! student, :id, :name, :email, :major, :created_at, :updated_at
json.url student_url(student, format: :json)
