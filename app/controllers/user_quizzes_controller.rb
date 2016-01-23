class UserQuizzesController < ApplicationController
  def take_quiz
      @quiz = Quiz.find(params[:id])
      @questions = @quiz.questions
  end
end