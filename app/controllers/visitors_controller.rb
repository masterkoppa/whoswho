class VisitorsController < ApplicationController
  def index
    @employee = current_user.employee if signed_in?
  end
end
