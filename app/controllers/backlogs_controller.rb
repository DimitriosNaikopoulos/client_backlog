class BacklogsController < ApplicationController
  def index
    @backlogs = Backlog.all
  end

  def new 
    @backlog = Backlog.new
  end
  
  def create
    @backlog = Backlog.new(backlog_params)

    @backlog.save
    redirect_to @backlog
  end

  def show
    @backlog = Backlog.find(params[:id])
  end

  def edit
    @backlog = Backlog.find(params[:id])
  end

  def update
    @backlog = Backlog.find(params[:id])

    if @backlog.update(backlog_params)
      redirect_to @backlog
    else
      render 'edit'
    end
  end

  private

  def backlog_params
    params.require(:backlog).permit(:title, :body)
  end
end
