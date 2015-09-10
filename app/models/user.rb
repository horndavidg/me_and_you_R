class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
	validates :name, presence: true
	has_many :coupons, through: :connections
	has_many :connections, dependent: :destroy
	has_many :kudos, through: :accolades
	has_many :accolades, dependent: :destroy

	has_secure_password
	 

# ---------------------------------------------

  def generate_password_reset_token!
    update(password_reset_token: SecureRandom.urlsafe_base64(48))
  end

# ---------------------------------------------

# Login action for FB Omniauth:

def self.from_omniauth(auth)
    # where(user_params.slice(user_params[:provider], user_params[:uid])).first_or_initialize.tap do |user|
      where(name: auth.info.name).first_or_create do |user|     
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = "Please add email!"
      user.password = auth.uid
      user.picture = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
      # user.provider = user_params.provider
      # user.uid = user_params.uid
      # user.name = user_params.info.name
      # user.oauth_token = user_params.credentials.token
      # user.oauth_expires_at = Time.at(user_params.credentials.expires_at)
      # user.save!
    end
end


# ---------------------------------------------

  private

  def user_params
    params.require(:user).permit(
      :name,
      :password,
      :picture, 
      :email,
      :provider,
      :uid,
      :oauth_token,
      :oauth_expires_at
    )
  end

end
