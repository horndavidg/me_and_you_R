class SessionsController < ApplicationController
  
before_action :prevent_login_signup, only: [:signup, :login, :landing]
before_action :landing_page, only: [:login, :signup, :landing]

# ---------------------------------------------

  def login
 
  end

# ---------------------------------------------

  def signup

    @user = User.new
  end

# ---------------------------------------------


  def landing
    
  end

# ---------------------------------------------

 def attempt_login
    if params[:email].present? && params[:password].present?
      found_user = User.where(email: params[:email]).first
      if found_user && found_user.authenticate(params[:password])
        session[:user_id] = found_user.id
        redirect_to user_path(current_user)
      else
        flash[:alert] = "email / password combination is invalid"
        redirect_to login_path(@user)
      end
    else
      flash[:alert] = "please enter an email and password"
      redirect_to login_path
    end
 end

  # ---------------------------------------------

  def logout
    session[:user_id] = nil
    flash[:notice] = "Logged out"
    redirect_to login_path
  end

# ---------------------------------------------

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :picture, 
      :email
    )
  end

 def landing_page
    @landing_page = true
 end

end
