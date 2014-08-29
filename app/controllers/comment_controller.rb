class CommentController < ApplicationController
  def show
    @comments = Comment.all
  end

  def create
  end

  def delete
  end
end
