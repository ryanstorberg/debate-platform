class User < ActiveRecord::Base
  has_many :authored_debates, :foreign_key => "author_id", :class_name => "Debate"
  has_many :comments
  has_many :votes
end
