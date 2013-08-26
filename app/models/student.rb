class Student < ActiveRecord::Base


	belongs_to :user


	def average_score
		return unless score_1 && score_2 && score_3 && score_4
  	(score_1 + score_2 + score_3 + score_4).to_f / 4
	end

end





