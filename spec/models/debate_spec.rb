require 'rails_helper'

describe Debate do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:body)}
  it {should belong_to(:user)}
  it {should have_many(:comments)}
  it {should have_many(:votes)}
  it {should belong_to(:topic)}
end
