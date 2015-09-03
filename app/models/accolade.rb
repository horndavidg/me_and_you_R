class Accolade < ActiveRecord::Base
  belongs_to :user
  belongs_to :kudo
end
