class Kudo < ActiveRecord::Base
	validates :description, :points, presence: true
	validates :points, numericality: { greater_than_or_equal_to: 1 }
	has_many :users, through: :accolades
	has_many :accolades, dependent: :destroy

# --------------------------------------------------

 def self.recent_kudos(current_user)
  	@recent_kudos_given = []
    @recent_kudos_given = current_user.kudos.order("created_at DESC").take(6)
 end

# --------------------------------------------------



# --------------------------------------------------

end
