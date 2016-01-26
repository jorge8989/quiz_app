class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_user!
  
  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new
  end

  def edit
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = @quiz.questions.build(question_params)
      if @question.save
        redirect_to quiz_path(@quiz), notice: 'Question was successfully created.'
      else
        render :new
      end
  end

  def update
      if @question.update(question_params)
        redirect_to quiz_path(@question.quiz.id), notice: 'Question was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @quiz = @question.quiz
    @question.destroy
     redirect_to quiz_path(@quiz), notice: 'Question was successfully destroyed.'
  end

  private

    def set_question
      @question = Question.find(params[:id])
    end

    def question_params
      params.require(:question).permit(:content)
    end
end
