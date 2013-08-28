class Student < ActiveRecord::Base


	before_save { |student| student.first_name = student.first_name.capitalize }
	before_save { |student| student.last_name = student.last_name.capitalize }
	before_save { |student| student.email = student.email.downcase }

	validates :first_name, :last_name, presence: true, length: { maximum: 50 }
	validates :business_unit, :gender, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	
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



	def initialize(attributes={})
	  date_hack(attributes, "assessment_date")
	  super(attributes)
	end

	def date_hack(attributes, property)
	  keys, values = [], []
	  attributes.each_key {|k| keys << k if k =~ /#{property}/ }.sort
	  keys.each { |k| values << attributes[k]; attributes.delete(k); }
	  attributes[property] = values.join("-")
	end

end





