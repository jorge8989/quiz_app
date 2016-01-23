class PersonalitiesController < ApplicationController
  before_action :set_personality, only: [:show, :edit, :update, :destroy]



  def show
  end

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @personality = Personality.new
  end


  def edit
  end


  def create
    @quiz = Quiz.find(params[:quiz_id])
    @personality = @quiz.personalities.build(personality_params)
      if @personality.save
        redirect_to quiz_path(@quiz)
      else
        render :new 
      end
  end


  def update
      if @personality.update(personality_params)
        redirect_to quiz_path(@personality.quiz.id), notice: 'Personality was successfully updated.'
      else
        render :edit
      end
  end


  def destroy
    @quiz = @personality.quiz
    @personality.destroy
      redirect_to quiz_path(@quiz.id), notice: 'Personality was successfully destroyed.'
  end

  private

    def set_personality
      @personality = Personality.find(params[:id])
    end


    def personality_params
      params.require(:personality).permit(:name, :description)
    end
end
