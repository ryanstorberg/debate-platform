class Debates < ActiveRecord::Base
  belongs_to :author, :class_name => "User"
  has_many :comments
  has_many :votes, through: :comments
  belongs_to :topic
end
