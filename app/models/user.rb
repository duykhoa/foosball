class User < ActiveRecord::Base
  has_and_belongs_to_many :teams

  def to_s
    first_name
  end
end
