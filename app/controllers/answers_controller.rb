class AnswersController < ApplicationController
    before_action :authenticate_user!

    def submit_answer
      answer = answer_params
      answer[:user] = current_user
      answer[:target] = Employee.find_by(id: answer[:target])

      success = Answer.create(answer)
      status = success ? 200 : 400

      respond_to do |format|
        format.all { render :nothing => true, :status => status }
      end
    end

    private
    def answer_params
      params.require(:answer).permit(:target, :correct)
    end
end
