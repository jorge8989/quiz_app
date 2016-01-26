class DashboardsController < ApplicationController
  before_action :authenticate_user!, only: [:admin]
  before_action :admin_user!, only: [:admin]

  def index
      @quizzes = Quiz.with_questions_count_greater_than(2)
  end
  
  def admin
  end

end