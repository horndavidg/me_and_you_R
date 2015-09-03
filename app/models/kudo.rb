class Kudo < ActiveRecord::Base
	validates :description, :points, presence: true
	has_many :users, through: :accolades
	has_many :accolades, dependent: :destroy
end
