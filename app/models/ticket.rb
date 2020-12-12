# frozen_string_literal: true

class Ticket < ApplicationRecord
  include Searchable

  belongs_to :backlog

  validates :title, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3 }
  validates :description, presence: true

  settings do
    mapping dynamic: false do
      indexes :title, analyzer: :english
      indexes :description, analyzer: :english
      indexes :backlog_id
    end
  end

  def self.search_tickets(query, backlog_id)
    search(
      {
        query: {
          bool: {
            must: [
              {
                multi_match: {
                  query: query,
                  fields: ['title^2', :description]
                }
              },
              {
                match: {
                  backlog_id: backlog_id
                }
              }
            ]
          }
        }
      }
    )
  end
end
