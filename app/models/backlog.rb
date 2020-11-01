class Backlog < ApplicationRecord
  has_many :tickets, dependent: :destroy

  validates :title, presence: true, uniqueness: true, length: { minimum: 3}
  validates :body, presence: true, length: { minimum: 10, maximum: 80}
end
