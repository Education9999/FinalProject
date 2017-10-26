class AnswerEmailWorker
 	@queue = :new_answer_email
 
 
 	def self.perform answer_id
 
 		puts('******************')
 		puts('inside AnswerEmailWorker')
 		AnswerMailer.answer_email(answer_id).deliver_now
 	end
 
 end 