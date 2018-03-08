class Client < ApplicationRecord
	has_many :projects
	validates_presence_of :name, :email, :company
	validates_uniqueness_of :email
end
