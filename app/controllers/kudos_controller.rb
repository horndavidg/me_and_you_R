class KudosController < ApplicationController
  







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

     @kudo.user_id = params[:user_id]

     if @kudo.save

 		redirect_to user_path(@current_user), flash: {success: "Kudo Created!"}
     
         else
 
         render "kudos/new"

     end	
  
    end


# --------------------------------------------- 















# --------------------------------------------- 


  private

 def set_user
    @user = User.find params[:id]
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
