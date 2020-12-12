# frozen_string_literal: true

class TicketsController < ApplicationController
  def create
    @backlog = Backlog.find(params[:backlog_id])
    @ticket = @backlog.tickets.create(ticket_params)

    redirect_to backlog_url(@backlog)
  end

  def destroy
    @backlog = Backlog.find(params[:backlog_id])
    @ticket = @backlog.tickets.find(params[:id])
    @ticket.destroy

    redirect_to backlog_url(@backlog)
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :description)
  end
end
