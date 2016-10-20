class ResetsController < ApplicationController

before_action :landing_page, only: [:new, :edit, :update]


def new
  


end

# ---------------------------------------------

  def create
    user = User.find_by(email: params[:email])
    if user
      user.generate_password_reset_token!
      
      # Destroys any tokens that might already exist
      Reset.password_reset(user).deliver_now
      
      redirect_to login_path, notice: "Email sent"
    else
      # flash.now[:alert] = "Email not found"
      # render :new
      # simply rendering does not call the before action and/or 
      # the controller so the background variable is not passed 
      redirect_to new_reset_path, alert: "Email not found"
    end
  end

# ---------------------------------------------

  def edit

    @user = User.find_by(password_reset_token: params[:id])
    
    if @user
      
    else
      redirect_to login_path, alert: "Invalid reset token"
    end
  end

# ---------------------------------------------

  def update
    @user = User.find_by(password_reset_token: params[:id])

    if user_params[:password] === ""

      flash.now[:notice] = "Your new password can't be blank!"
      render :edit 

    elsif @user && @user.update(user_params)
      @user.update(password_reset_token: nil)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), flash: {success: "Password updated."}
    else
      flash.now[:notice] = "Password reset token not found."
      render :edit
    end
  end

# ---------------------------------------------

  private

  def user_params
    params.require(:user).permit(:password)
  end

  def landing_page
    @landing_page = true
  end

end