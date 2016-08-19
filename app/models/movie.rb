class Movie < ActiveRecord::Base
	has_many :reviews

	validates_presence_of :title, :description
	def flop?
    	total_gross.blank? || total_gross < 50000000
  	end
  	
  	

end
