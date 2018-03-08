class Project < ApplicationRecord
	belongs_to :client
	validates_presence_of :name, :start_date, :status
end