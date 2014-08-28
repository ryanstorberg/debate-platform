class User < ActiveRecord::Base
  has_many :debates
  has_many :comments
  has_many :votes
end
