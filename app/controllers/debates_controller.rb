class DebatesController < ApplicationController

  def index
    @recent_debates = Debate.order(created_at: :desc).limit(10)
    @popular_debates = Debate.order(created_at: :desc).limit(10) #Needs to retreivve and sort based on number of comments
  end

  def show
    @debate = Debate.find(params[:id])
    if @debate.comments
      @agree_comments = @debate.comments.where(agree: true).order("vote_count desc")
      @disagree_comments = @debate.comments.where(agree: false).order("vote_count desc")
    end
  end

  def new
    @debates = Debate.new
  end

  def create
    @debate = Debate.new(debate_params)

    if @debate.save
      redirect_to @debate, notice: 'Question was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def debate_params
    params.require(:debate).permit(:title, :body, :user_id)
  end

end
