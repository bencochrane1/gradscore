class Student < ActiveRecord::Base

	def score
		@student = Student.find(params[:id])
		scores = [@student.score_1, @student.score_2, @student.score_3, @student.score_4]
		score = scores.inject{ |sum, el| sum + el }.to_f / scores.size
	end

end





