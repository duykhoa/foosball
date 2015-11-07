class Team < ActiveRecord::Base
  has_many :users
  validates_length_of :users, maximum: 2
end
