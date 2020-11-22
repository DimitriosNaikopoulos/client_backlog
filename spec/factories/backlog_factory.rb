# frozen_string_literal: true

FactoryBot.define do
  factory :backlog do
    title { Faker::Lorem.unique.sentence(word_count: 2) }
    body { Faker::Lorem.unique.sentence(word_count: 5) }
  end
end
