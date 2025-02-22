# frozen_string_literal: true

class Backlog < ApplicationRecord
  include Searchable

  has_many :tickets, dependent: :destroy

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 5 }
  validates :body, presence: true, length: { minimum: 10, maximum: 80 }

  settings do
    mapping dynamic: false do
      indexes :title, analyzer: :english
      indexes :body, analyzer: :english
    end
  end

  def self.search_backlogs(query)
    search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^2', :body]
          }
        }
      }
    )
  end
end
