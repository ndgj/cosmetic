class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:nick_name, :profile_image)
  end
  
end
