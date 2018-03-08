class Instructor < ApplicationRecord
	has_many :courses
	validates_presence_of :name, :email, :bio
end
