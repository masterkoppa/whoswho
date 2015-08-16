class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def image_question
        employees = current_user.get_coworkers
        choices = employees.sample(3)
        answer = choices.sample(1)
        question = {
          question: {
            answer: answer,
            choices: choices
          }
        }
        render json: question
    end
end
