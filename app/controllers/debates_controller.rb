class DebatesController < ApplicationController

  def index
    @debates = Debate.all
  end

  def show
    @debate = Debate.find(params[:id])
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
    params.require(:debate).permit(:title, :body, )
  end

end
