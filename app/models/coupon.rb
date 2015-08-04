class Coupon < ActiveRecord::Base
	validates :description, :price, presence: true
	has_many :users, through: :connections
	has_many :connections, dependent: :destroy
end
