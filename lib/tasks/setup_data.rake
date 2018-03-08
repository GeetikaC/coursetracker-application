task :setup_data => :environment do
	10.times do
		sample_name = Faker::Name.first_name
		Instructor.create(name: sample_name, bio: Faker::Lorem.paragraph, email: Faker::Internet.free_email(sample_name))
	end
	Course.create(name: "Ruby on Rails", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Intorduction to programming", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "Intorduction to Javascript", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "JS+AJAX", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	Course.create(name: "MEAN", description: Faker::Lorem.paragraph, instructor_id: Instructor.all.sample.id)
	200.times do
		sample_name = Faker::Name.first_name
		student = Student.create(name: sample_name, email: Faker::Internet.free_email(sample_name), major: ["CS","EC","CV","ME"].sample)
		course_ids = Course.all.pluck(:id).sample(2)
		course_ids.each do |course_id|
			Registration.create(student_id: student.id, course_id: course_id)
		end
	end
end