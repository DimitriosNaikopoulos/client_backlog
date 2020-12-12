# frozen_string_literal: true

module BacklogHelper
  def tickets
    return @tickets if @tickets

    @backlog.tickets
  end
end
