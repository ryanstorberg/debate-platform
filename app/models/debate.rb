class Debate < ActiveRecord::Base
  belongs_to :author, :class_name => "User", :foreign_key => "user_id"
  has_many :comments
  has_many :votes, through: :comments
  belongs_to :topic
  validates :title, presence: true
  validates :body, presence: true
end
