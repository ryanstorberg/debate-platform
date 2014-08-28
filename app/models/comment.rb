class Comment < ActiveRecord::Base
  belongs_to :debate
  has_many :votes
end
