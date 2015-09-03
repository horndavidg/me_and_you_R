class KudosController < ApplicationController
  
  before_action :unmatched_user, except: [:create]
  before_action :set_user, only: [:create]
  before_action :set_match, only: [:create]

 # ---------------------------------------------



  def index
  end

    # ---------------------------------------------

  def edit
  end

    # ---------------------------------------------

  def new
  	@kudo = Kudo.new
  end

    # ---------------------------------------------

  def show
  end

    # ---------------------------------------------

    def create


     @kudo = Kudo.new kudo_params  

     @kudo.creator_id = @user.id 
     @kudo.creator_name = @user.name

     if @kudo.save
     # @user.kudos << @kudo
 		 @match_user.kudos << @kudo
     # binding.pry
     redirect_to user_path(@current_user), flash: {success: "Kudo Created!"}
     
         else
 
         render "kudos/new"

     end	
  
    end


# --------------------------------------------- 















# --------------------------------------------- 


  private

 def set_user
    @user = User.find params[:user_id]
 end

 def set_match
    @user = User.find params[:user_id]
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
