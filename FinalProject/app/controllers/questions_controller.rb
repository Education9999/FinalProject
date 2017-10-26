class QuestionsController < ApplicationController
	before_action :authenticate_student!, only: [:create, :destroy]
  before_action :set_question, only: [:destroy]
  before_action :authorize_student, only: [:destroy]

  def index
  	@question = Question.new
  	
  	@questions = Question.all.reverse()
    @questionsPaging=Question.all

    @page = params[:page].blank? ? 1 : params[:page].to_i
     @count = params[:count].blank? ? 2 : params[:count].to_i
    
     @max_pages = @questions.length/@count
 
 
     @questionsPaging = @questionsPaging.offset(@count * (@page-1)).limit(@count)
 
     @answer = Answer.new


  end

  def create
  	@question = Question.new(question_params)
    if(!@question.content.empty?)
  	@question.student = current_student
  	@question.save
    end
  	# @answer = Answer.new
  end

  def destroy
    @question_id = @question.id
  	@question.destroy
  	
  end
  def students
    @students=Student.all
  end

  def addfriend
     if(params[:message].to_i==1)
      fr =  Student.find_by(email:params[:friend]+".com")
      @friend =Friendship.find_by(student:fr,friend:current_student)
      @friend.confirmed = true
      @friend.save
  
    else 
    @friend =Friendship.new
    @friend.student = current_student
    @friend.friend = Student.find_by(email:params[:friend]+".com")

    @friend.save
    end
   
  end

  def delfriend
    @friend=Friendship.find_by(id:params[:id].to_i)
    @friend_id = @friend.id
    @friend.destroy
  end

  private

  def question_params
  	params.require(:question).permit(:content)
  end

  def set_question
  	@question = Question.find(params[:id])
  end

  def authorize_student
  	if @question.student != current_student
  		return redirect_to root_path
  	end
  	return true

  end

end

