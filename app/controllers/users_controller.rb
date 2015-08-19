class UsersController < ApplicationController
  
before_action :confirm_logged_in, except: [:create]
before_action :ensure_correct_user, except: [:create, :index]
before_action :set_user, only: [:show, :edit, :update, :destroy]

# ---------------------------------------------

  def index
  end

# ---------------------------------------------

  def new
  end

# ---------------------------------------------

  def show
  end

# ---------------------------------------------

  def edit
  end

# ---------------------------------------------

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render "sessions/signup"
    end
  end

# --------------------------------------------- 

  private

 def set_user
    @user = User.find params[:id]
 end

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :picture, 
      :email
    )
  end

  def ensure_correct_user
      user = User.find params[:id]
      unless user.id.to_i == current_user.id
        redirect_to login_path, alert: "Not Authorized"
      end
  end


end
