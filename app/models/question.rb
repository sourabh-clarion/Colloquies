class Question < ActiveRecord::Base

	belongs_to :user
	has_many :answers, -> { includes(:user) }

	acts_as_taggable

 	searchable do
    	text :title, :description, :tag_list
    	text :user
	    text :answers do
	     answers.map { |ans| ans.feedback }
	    end
	end
  
 	validates_presence_of :description, :title, :tag_list

 	paginates_per 4
end
