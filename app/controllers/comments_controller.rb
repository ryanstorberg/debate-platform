class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    current_user = User.find(session[:user_id]) if session[:user_id]

    if @comment.save && current_user
      @comment.debate_id = params[:debate_id]
      redirect_to debate_path(@comment.debate), notice: 'Question was successfully created.'
    else
      @debate = Debate.find(params[:debate_id])
      flash[:notice] = "Must be logged in to write a comment"
      redirect_to debate_path(@debate)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :agree)
  end
end
