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

  def create
     
     @coupon = Coupon.new coupon_params  

     @coupon.creator_id = @user.id 
     @coupon.creator_name = @user.name

     if @coupon.save

      @user.coupons << @coupon
  
     redirect_to user_path(@current_user), flash: {success: "Coupon Created!"}
     
         else
 
         render "coupons/new"

     end

  end


# ---------------------------------------------

def buy

    # binding.pry

    redirect_to user_path(@current_user), flash: {success: "Coupon Bought!"}

end

# --------------------------------------------


def destroy 

@coupon = Coupon.find params[:id]

if @coupon.destroy

@user.save

redirect_to user_path(@current_user), flash: {success: "Coupon Deleted!"}
else
   render "users/show"
end
end


# --------------------------------------------- 


  private

 def set_user
    @user = User.find @current_user.id
 end

  def coupon_params
    params.require(:coupon).permit(
      :description,
      :price,
      :design_id
    )
  end


  
end
