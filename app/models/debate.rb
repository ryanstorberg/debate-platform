class Debate < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes, through: :comments
  belongs_to :topic
end
