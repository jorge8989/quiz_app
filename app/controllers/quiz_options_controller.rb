class QuizOptionsController < ApplicationController
  before_action :set_quiz_option, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin_user!


  def index
    @quiz_options = QuizOption.all
  end

  def show
  end


  def new
    @question = Question.find(params[:question_id])
    @quiz = @question.quiz
    @quiz_option = QuizOption.new
  end


  def edit
    @quiz = @quiz_option.question.quiz
  end


  def create
    @question = Question.find(params[:question_id])
    @quiz = @question.quiz
    @quiz_option = @question.quiz_options.build(quiz_option_params)

      if @quiz_option.save
        redirect_to question_path(@question), notice: 'Quiz option was successfully created.'
      else
        render :new
      end
  end

  def update
      if @quiz_option.update(quiz_option_params)
        redirect_to question_path(@quiz_option.question.id), notice: 'Quiz option was successfully updated.'
      else
        render :edit
      end
  end

  def destroy
    @question = @quiz_option.question
    @quiz_option.destroy
      redirect_to question_path(@question.id), notice: 'Quiz option was successfully destroyed.'
  end

  private

    def set_quiz_option
      @quiz_option = QuizOption.find(params[:id])
    end

    def quiz_option_params
      params.require(:quiz_option).permit(:content, :points)
    end
end
