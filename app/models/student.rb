class Student < ActiveRecord::Base


	belongs_to :user


	def average_score
		return unless score_1 && score_2 && score_3 && score_4
  	(score_1 + score_2 + score_3 + score_4).to_f / 4
	end

	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |student|
				csv << student.attributes.values_at(*column_names)
			end
		end
	end

end





