class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @debate = Debate.find(params[:debate_id])
    @comment = Comment.find(params[:comment_id])
    current_user = User.find(session[:user_id]) if session[:user_id]

    comment_votes = Vote.where(comment: @comment)
    has_voted = comment_votes.find_by(user: session[:user_id])

    if current_user && !has_voted
      @vote = Vote.create(
        has_voted?: true,
        comment_id: @comment.id,
        agree: params[:vote][:agree],
        user_id: session[:user_id]
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
    else
      flash[:notice] = "Must be logged in to write a comment"
    end
    # respond_to do |format|
    #   format.js { render :updateVote }
    # end

    redirect_to debate_path(@debate)
  end

  private

  # def vote_params
  #   params.require(:vote).permit(:debate_id, :comment_id, )
  # end

end
