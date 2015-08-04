class Kudo < ActiveRecord::Base
	validates :description, :points, presence: true
	belongs_to :user
end
