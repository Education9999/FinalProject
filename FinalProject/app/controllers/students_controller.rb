class StudentsController < ApplicationController
	def edit
		@student=current_student
	end

	def editdone
		@student=current_student
		@student.update(student_params)
		@student.save

		redirect_to posts_path
	end

	def deleteprofile
		@student = Student.find(params[:id].to_i)
		@student.profile_pic = nil
		@student.save
	end
	
	def student_params
		params.require(:student).permit(:profile_pic,:email,:name,:age,:gender,:password)
	end

	def student_API
		student = Student.where("email like ?","%"+params[:term]+"%")
		student_list = []
		student.each do |u|
			student_hash = Hash.new
			student_hash[:id]=u.id
			student_hash[:label]=u.email
			student_hash[:value]=u.email
			student_list << student_hash
		end
		return render json: student_list
	end

	def student_profile
		@student=Student.find(params[:id])
	end

end
