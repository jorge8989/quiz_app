class DashboardsController < ApplicationController

  def index
      @quizzes = Quiz.with_questions_count_greater_than(2)
  end

end