class UsersController < ApplicationController
  
before_action :confirm_logged_in, except: [:create]
before_action :ensure_correct_user, except: [:create, :index, :match, :destroy]
before_action :set_user, only: [:edit, :update, :destroy, :show, :remove_match]
before_action :unmatched_user, only: [:index]
before_action :find_match, only: [:add_match, :no_match, :destroy, :remove_match, :show]

# ---------------------------------------------

  def index
    @all_users = User.all
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

  # @match_user = User.find_by_id(@current_user.match_request)  
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
  
  # @match_user = User.find_by_id(@current_user.match_request)  
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

  def remove_match

          @match_user.kudos = []
          @match_user.match_request = nil
          @match_user.match_pending = false
          @match_user.match = nil
          @match_user.match_id = nil
          @match_user.score = 0
          
          @user.kudos = []
          @user.match_request = nil
          @user.match_pending = false
          @user.match = nil
          @user.match_id = nil
          @user.score = 0
         if @user.save && @match_user.save

          redirect_to user_path(@current_user), flash: {alert: "Match removed!"}
         else
       
         render :edit

         end

    

  end

# ---------------------------------------------

  def show

      @all_users = User.all
      @recent_kudos = Kudo.recent_kudos(@current_user)
      # Finds match info for the user show page
      @match_bought_coupons = @match_user.coupons.where("creator_id != '#{@match_user.id.to_s}'")
      @user_bought_coupons = @user.coupons.where("creator_id != '#{@user.id.to_s}'")
      # finds all the coupons associated with the user that do not have the user's 
      # id as its creator_id....


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

 def update

   @user.update user_params

   if @user.save
      redirect_to user_path(@current_user), flash: {success: "Information updated!"}
    else
      render :edit
   end
 end

# ---------------------------------------------



  def destroy

    # @user = User.find params[:id]
    
    if @user.id === @current_user.id
       
       if @user.destroy
          session[:user_id] = nil
          @match_user.kudos = []
          @match_user.match_request = nil
          @match_user.match_pending = false
          @match_user.match = nil
          @match_user.match_id = nil
          @match_user.score = 0
          @match_user.save

          redirect_to root_path, flash: {alert: "User Account Deleted!"}
       else
          render "users/show"
       end

    else
       if @user.destroy
          redirect_to user_path(@current_user), flash: {alert: "User Deleted!"}
       else
          render "users/show"
       end
    end
  end

# ---------------------------------------------

  def create
    @user = User.create user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @landing_page = true
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

 def find_match
      if @current_user.match_id === nil
      @match_user = User.find_by_id(@current_user.match_request)  
      else
      @match_user = User.find_by_id(@current_user.match_id)  
      end
 end

end
