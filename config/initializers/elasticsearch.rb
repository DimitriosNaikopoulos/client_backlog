# frozen_string_literal: true

config = {
}

if File.exist?('config/elasticsearch.yml')
  config.merge!(YAML.load_file('config/elasticsearch.yml')[Rails.env].deep_symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
