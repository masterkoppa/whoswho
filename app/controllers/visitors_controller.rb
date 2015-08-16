class VisitorsController < ApplicationController
  def index
    @employee = current_user.employee
  end
end
