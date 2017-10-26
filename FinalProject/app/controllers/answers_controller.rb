class AnswersController < ApplicationController

	 before_action :authenticate_student!, only: [:create, :destroy]
  before_action :set_answer, only: [:destroy]
  before_action :authorize_student, only: [:destroy]


  def create

  	@answer = Answer.new(answer_params)
  	@answer.student = current_student
  	@answer.save
    # AnswerMailer.answer_email(@answer).deliver
    Resque.enqueue(AnswerEmailWorker, @answer.id)

  	# return redirect_to questions_path

  end

  def destroy
  	@question = @answer.question

  	@answer.destroy
  	# return redirect_to questions_path
  end

  private

  def answer_params
  	params.require(:answer).permit(:question_id, :content)
  end

  def set_answer
  	@answer = Answer.find(params[:id])
  end

  def authorize_student
  	if @answer.student != current_student
  		return redirect_to root_path
  	end
  	return true

  end

end
