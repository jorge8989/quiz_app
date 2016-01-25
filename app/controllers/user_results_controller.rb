class UserResultsController < ApplicationController
  before_action :set_user_result, only: [:destroy]

  def index
    @user_results = UserResult.all.order('quiz_id ASC')
  end
  
  def show
    @user_result = UserResult.find(params[:id])
  end
  
  def new
    @user_result = User.new
  end
  
  def create
    @user_result = UserResult.new(user_result_params)

      if @user_result.save
       redirect_to root_path, notice: 'thaks for taking the test'
      else
        redirect_to root_path, notice: 'your results were not saved' 
      end
  end

  def destroy
    @user_result.destroy
    redirect_to user_results_url, notice: 'User result was successfully destroyed.'
  end


    def set_user_result
      @user_result = UserResult.find(params[:id])
    end

    def user_result_params
      params.require(:user_result).permit(:points, :user_id, :quiz_id)
    end
end
