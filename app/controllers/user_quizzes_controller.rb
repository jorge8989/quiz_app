class UserQuizzesController < ApplicationController
  before_action :authenticate_user!
  def take_quiz
      @quiz = Quiz.find(params[:id])
      @questions = @quiz.questions
  end
end