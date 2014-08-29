require 'rails_helper'

describe Debate do
  it {should belong_to(:user)}
  it {should have_many(:comments)}
  it {should have_many(:votes)}
  it {should belong_to(:topic)}
end
