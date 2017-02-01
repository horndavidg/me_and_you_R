class KudosController < ApplicationController
  
  before_action :unmatched_user, except: [:create]
  before_action :set_user, only: [:create, :destroy, :index]
  before_action :set_match, only: [:create, :destroy, :index]

 # ---------------------------------------------

  def index
    @user_created_coupons = @user.coupons.where("creator_id = '#{@user.id.to_s}'")
    @match_created_coupons = @match_user.coupons.where("creator_id = '#{@match_user.id.to_s}'")
  end

    # ---------------------------------------------

  def new
  	@kudo = Kudo.new
  end

    # ---------------------------------------------

    def create


     @kudo = Kudo.new kudo_params  

     @kudo.creator_id = @user.id 
     @kudo.creator_name = @user.name

     # For mailer:
      match = User.find @current_user.match_id
      kudo = @kudo

     if @kudo.save
     # @user.kudos << @kudo
 		 @match_user.kudos << @kudo
     @match_user.score += @kudo.points
     @match_user.save
     # binding.pry
     
     # Uncomment out to send Kudo given emails!
     Give.give_notification(match,kudo).deliver_now

     redirect_to user_path(@current_user), flash: {success: "Kudo Given, Nice!"}
     
         else
 
         render "kudos/new"

     end	
  
    end


# --------------------------------------------- 


def destroy
  

@kudo = Kudo.find params[:id]

if @kudo.destroy
# eventually remove point reduction...
@match_user.score -= @kudo.points
@match_user.save

redirect_to user_path(@current_user), flash: {success: "Kudo Deleted!"}
else
   render "users/show"
end
end



# --------------------------------------------- 


  private

 def set_user
    @user = User.find @current_user.id
 end

 def set_match
    @user = User.find @current_user.id
    @match_user = User.find @user.match_id
 end

 def unmatched_user
      user = User.find_by_id(@current_user.id)
      unless user.match_id
        redirect_to user_path(@current_user.id), alert: "You need a match first"
      end
 end

  def kudo_params
    params.require(:kudo).permit(
      :description,
      :points,
      :picture, 
      :date
    )
  end



end
