class UsersController < ApplicationController
    def show
         @tweets = Tweet.where(user_id: current_user.id).order("created_at DESC").page(params[:page]).per(10)
    end
    
  def edit
  end

  def update
      current_user.update(update_params)
  end
  private
  def update_params
    params.permit(:nickname)
  end
end
