class Student < ActiveRecord::Base


	belongs_to :user


	def average_score
  [score_1, score_2, score_3, score_4].inject{ |sum, el| sum + el }.to_f / [score_1, score_2, score_3, score_4].size
	end

end





