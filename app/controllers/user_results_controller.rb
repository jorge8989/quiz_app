class UserResultsController < ApplicationController
  before_action :set_user_result, only: [:destroy]

  def index
    @user_results = UserResult.all
  end

  def destroy
    @user_result.destroy
    redirect_to user_results_url, notice: 'User result was successfully destroyed.'
  end

  private

    def set_user_result
      @user_result = UserResult.find(params[:id])
    end

    def user_result_params
      params.require(:user_result).permit(:points, :user_id)
    end
end
