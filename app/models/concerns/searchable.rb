# frozen_string_literal: true

module Searchable
  extend ActiveSupport::Concern

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
end
