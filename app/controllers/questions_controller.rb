class QuestionsController < ApplicationController
    before_action :authenticate_user!

    def image_question
        employees = current_user.get_coworkers
        @picks = employees.sample(3)
        @answer = @picks.sample(1)

        render json: @picks
    end
end
