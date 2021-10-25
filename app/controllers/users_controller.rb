class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create, :show]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to blogs_path 
      # redirect_to new_session_path # OK
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


  
end
