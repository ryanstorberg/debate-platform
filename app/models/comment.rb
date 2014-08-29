class Comment < ActiveRecord::Base
  belongs_to :debate
  belongs_to :user
  has_many :votes
end
