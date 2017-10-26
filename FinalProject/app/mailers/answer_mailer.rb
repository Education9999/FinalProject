class AnswerMailer < ApplicationMailer

	def answer_email(answer_id)
    @answer = Answer.find(answer_id)
    mail(to: @answer.question.student.email, subject: 'Sample Email')
  end
end
