class CouponsController < ApplicationController
  
before_action :set_user, only: [:create, :destroy, :index]

  def index

      @user_created_coupons = @user.coupons.where("creator_id = '#{@user.id.to_s}'")
      # finds all the coupons associated with the user that have the user's id as its
      # creator_id....

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

    # assigns the coupon being bought to a variable
    coupon = Coupon.find params[:id]
    # @coupon = Coupon.find params[:id]

       # creates a duplicate of the Active Record Object and assigns it to an 
       # instance variable.
       @coupon = coupon.dup

    # assigns the new object (coupon) to the match
    @current_user.coupons << @coupon
    @current_user.score -= @coupon.price
    @current_user.save

    redirect_to user_path(@current_user), flash: {success: "Coupon Bought!"}

end

# --------------------------------------------

def redeem 

@coupon = Coupon.find params[:id]

# For mailer:
match = User.find @current_user.match_id
coupon = @coupon

# Need to destroy coupon and send email to match_user

if @coupon.destroy

@current_user.save

# Uncomment out to send Coupon Redeemed Emails!
# Redeem.redeem_notification(match,coupon).deliver_now

redirect_to user_path(@current_user), flash: {success: "Coupon Used!"}
else

   render "users/show"
end

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
