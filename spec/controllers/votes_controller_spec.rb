require 'rails_helper'

describe VotesController do
  let!(:debate){ Debate.create(title: "Fat Tax", body: "A fat body.")}
  let!(:comment) { Comment.create(content: "content content content content content", debate_id: debate.id) }
  let!(:user) { User.create(username: "johnberry", email: "jb@johnberry.com", password: "password") }

  describe "POST #create" do
    context "when a user votes on a comment for the first time" do
      let(:valid_params) {
        { debate_id: comment.debate_id, comment_id: comment.id, vote: { user_id: user.id, comment_id: comment.id, has_voted?: true } }
      }
      it "increases the vote count for the comment by one" do
        expect {
          post :create, valid_params
        }.to change(comment.votes, :count).by(1)
      end
    end

    # context "when a user votes on a comment for the second time" do
    #   let(:vote) {
    #     Vote.create(debate_id: comment.debate_id, comment_id: comment.id, vote: { user_id: user.id, comment_id: comment.id, has_voted?: true })
    #   }
    #   let(:valid_params) {
    #     { debate_id: comment.debate_id, comment_id: comment.id, vote: { user_id: user.id, comment_id: comment.id, has_voted?: true } }
    #   }
    #   it "does not increase the vote count for the comment" do
    #     expect {
    #       post :create, valid_params
    #     }.to change(comment.votes, :count).by(0)
    #   end
    # end
  end
end
