class UsersController < ApplicationController
  
before_action :confirm_logged_in, except: [:create]
before_action :ensure_correct_user, except: [:create, :index, :match]
before_action :set_user, only: [:edit, :update, :destroy, :show]
before_action :unmatched_user, only: [:index]
# before_action :user_match, only: [:show]

# ---------------------------------------------

  def index
    @all_users = User.all
  end

# ---------------------------------------------

  def new
  end

# ---------------------------------------------

  def match 
  # finds the user to request a match from
  @match_user = User.find params[:id]
  @match_user.match_request = @current_user.id
  # finds the user to request a match from db and sets match_pending to true
  @user = User.find_by_id(@current_user.id)
  @user.match_pending = true

   if @match_user.save && @user.save
      # binding.pry
      redirect_to user_path(@current_user), flash: {success: "Match request sent!"}
    else
      render "users/index"
   end

  end

# ---------------------------------------------
  
  def add_match 

  @match_user = User.find_by_id(@current_user.match_request)  
  # Current User in db accepting request
  @user = User.find params[:id]
  @user.match = @match_user.name
  @user.match_id = @match_user.id
  @user.match_request = nil
  @user.match_pending = false

  @match_user.match = @user.name
  @match_user.match_id = @user.id
  @match_user.match_request = nil
  @match_user.match_pending = false

  if @user.save && @match_user.save
      # binding.pry
      redirect_to user_path(@current_user), flash: {success: "Matched with #{@match_user.name}!"}
    else
      render "users/show"
   end

  end

# ---------------------------------------------

  def no_match 
  
  @match_user = User.find_by_id(@current_user.match_request)  
  # Current User in db accepting request
  @user = User.find params[:id]
  @user.match_request = nil
  @user.match_pending = false

  @match_user.match_request = nil
  @match_user.match_pending = false

  if @user.save && @match_user.save
      # binding.pry
      redirect_to user_path(@current_user), flash: {alert: "Match request declined"}
    else
      render "users/show"
   end

  end

# ---------------------------------------------

  def show
      # Finds match info for the user show page
      if @current_user.match_request
      @match_user = User.find_by_id(@current_user.match_request)  
      elsif @current_user.match
      @match_user = User.find_by_id(@current_user.match_id)  
      end

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

  def unmatched_user
      user = User.find_by_id(@current_user.id)
      unless user.match_pending == false && !user.match_id
        redirect_to user_path(@current_user.id), alert: "You are already matched or have a match pending"
      end
  end

 # def user_match
 #      user = User.find_by_id(@current_user.id)
 #      match = User.find_by_id(user.match_id)
 #      binding.pry
 #      unless user.id == params[:id] or user.id == match.match_id 
 #        binding.pry
 #        redirect_to login_path, alert: "Not Authorized"
 #      end
 #  end



end
