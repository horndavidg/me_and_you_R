class CouponsController < ApplicationController
  
before_action :set_user, only: [:create, :destroy, :index]

  def index
  end

  # ---------------------------------------------

  def edit
  end

  # ---------------------------------------------

  def new
      @coupon = Coupon.new
  end

  # ---------------------------------------------

  def show
  end

  # ---------------------------------------------




# --------------------------------------------- 


  private

 def set_user
    @user = User.find @current_user.id
 end

  def coupon_params
    params.require(:kudo).permit(
      :description,
      :price,
      :design
    )
  end


  
end
