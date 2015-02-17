class Answer < ActiveRecord::Base
  	belongs_to :question
	belongs_to :user
	has_many :vote_counters

	paginates_per 3

	searchable do
    	text :feedback
	end
end
