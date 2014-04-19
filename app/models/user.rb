class User < ActiveRecord::Base
  has_many :restaurants
  has_many :reservations, :through => :restaurants


end
