class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @comment = Comment.find(params[:comment_id])
    @user = User.find(params[:vote][:user_id])
    @debate = Debate.find(params[:debate_id])

    @vote = Vote.create(
      has_voted?: true,
      comment_id: @comment.id,
      agree: params[:vote][:agree]
    )

    vote_count = @comment.vote_count + 1
    @comment.update(vote_count: vote_count)

    total_votes = @debate.total_votes + 1
    @debate.update(total_votes: total_votes)

    if @vote.agree
      votes_for = @debate.votes_for + 1
      @debate.update(votes_for: votes_for)
    else
      votes_against = @debate.votes_against + 1
      @debate.update(votes_against: votes_against)
    end
    # respond_to do |format|
    #   format.js { render :updateVote }
    # end

    redirect_to debate_path(@debate)
  end

  private

  # def vote_params
  #   params.require(:vote).permit(:has_voted?, :user_id, :comment_id)
  # end

end
