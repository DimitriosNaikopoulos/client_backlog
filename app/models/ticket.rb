class Ticket < ApplicationRecord
  belongs_to :backlog

  validates :title, presence: true, uniqueness: true, length: { minimum: 3}
  validates :description, presence: true
end
