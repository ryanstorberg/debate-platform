class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.debate_id = params[:debate_id]

    if @comment.save
      redirect_to debate_path(@comment.debate), notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :agree)
  end
end
