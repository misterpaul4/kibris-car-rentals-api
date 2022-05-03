class WaitingList < ApplicationRecord
	belongs_to :car
	belongs_to :applicant, class_name: 'User'

	validates_presence_of :car, :applicant
end
