class StudentsController < ApplicationController

	before_action :find_student, :only => [:edit, :update]

	def index
		@students = Student.all
	end

	def new
		@student = Student.new
	end

	def edit
	end

	def score
		@student = Student.find(params[:id])
		scores = [@student.score_1, @student.score_2, @student.score_3, @student.score_4]
		score = scores.inject{ |sum, el| sum + el }.to_f / scores.size
	end

	def show
		@student = Student.find(params[:id])
	end

	def search
		@students = Student.where("first_name || last_name like ?", "%#{params[:search]}%")
	end

	def create
		@student = Student.new permitted_attributes
		if @student.save
			redirect_to student_path(@student.id)
		else
			render 'new'
		end
	end

	def update
		if @student.update_attributes permitted_attributes
			redirect_to student_path(@student.id)
		else
			render 'edit'
		end
	end

	def destroy
		@student = Student.find(params[:id])
		@student.destroy

		redirect_to students_path
	end

	protected

	def find_student
		@student = Student.find(params[:id])
	end

	def permitted_attributes
		params.require(:student).permit(:first_name, :last_name, :email, :gender, :business_unit, :score_1, :score_2, :score_3, :score_4, :score, :assessment_date, :observation)
	end

end


