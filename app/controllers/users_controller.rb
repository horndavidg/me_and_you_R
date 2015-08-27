class UsersController < ApplicationController
  
before_action :confirm_logged_in, except: [:create]
before_action :ensure_correct_user, except: [:create, :index, :match]
before_action :set_user, only: [:show, :edit, :update, :destroy]

# ---------------------------------------------

  def index
    @all_users = User.all
  end

# ---------------------------------------------

  def new
  end

# ---------------------------------------------

  def match 
  @match_user = User.find params[:id]
  @match_user.match_request = @current_user.id

   if @match_user.save
      redirect_to user_path(@current_user)
    else
      render "users/index"
   end

    # binding.pry

  end

# ---------------------------------------------
  
  def add_match 

  @match_user = User.find_by_id(@current_user.match_request)  
  @user = User.find params[:id]

  @user.match = @match_user.name
  @user.match_id = @match_user.id
  @user.match_request = nil

  if @user.save
      redirect_to user_path(@current_user), flash: {success: "Matched with #{@match_user.name}!"}
    else
      render "users/show"
   end





     # binding.pry

  end

# ---------------------------------------------

  def no_match 


    binding.pry

  end

# ---------------------------------------------



  def show

      if @current_user.match_request

      @match_user = User.find_by_id(@current_user.match_request)  

      end

          # binding.pry

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
