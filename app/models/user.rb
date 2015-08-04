class User < ActiveRecord::Base
    validates :email, presence: true, uniqueness: true
	validates :password, :name, presence: true
	has_many :coupons, through: :connections
	has_many :connections, dependent: :destroy
	has_many :kudos, dependent: :destroy

	has_secure_password
	 

  def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
  end



end
