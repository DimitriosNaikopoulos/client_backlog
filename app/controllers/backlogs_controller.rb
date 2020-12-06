# frozen_string_literal: true

class BacklogsController < ApplicationController
  def index
    return search_backlogs if params.dig(:backlogs, :query)

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
    search_tickets if params.dig(:backlog, :query)
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

  def search_backlogs
    @backlogs = Backlog.search_backlogs(params[:backlogs][:query])
  end

  def search_tickets
    @tickets = Ticket.search_tickets(params[:backlog][:query], params[:id])
  end
end
