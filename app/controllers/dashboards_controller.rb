class DashboardsController < ApplicationController

  def index
      @quizzes = Quiz.all
  end

end