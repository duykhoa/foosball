class Team < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates_length_of :users, maximum: 2

  def to_s
    name
  end
end
