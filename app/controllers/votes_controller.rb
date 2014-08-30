class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    p "hello"
    @comment = Comment.find(params[:comment_id])
    @user = User.find(params[:vote][:user_id])
    @debate = Debate.find(params[:debate_id])
    @vote = Vote.create(has_voted?: true, comment_id: @comment.id)
    vote_count = @comment.vote_count.to_i + 1
    @comment.update(vote_count: vote_count)
    redirect_to debate_path(@debate)
    # if @comment.votes.find_by(user_id: @user.id) == nil
    #   @vote.save
    #   redirect_to debate_path(@debate)
    # else
    #     error: "You have already voted"
    # end
  end

  private

  # def vote_params
  #   params.require(:vote).permit(:has_voted?, :user_id, :comment_id)
  # end

end
