task :clear_data => :environment do
	Student.delete_all
	Course.delete_all
	Instructor.delete_all
	Registration.delete_all
end