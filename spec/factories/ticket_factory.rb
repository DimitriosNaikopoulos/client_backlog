# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { Faker::Lorem.unique.sentence(word_count: 2) }
    description { Faker::Lorem.unique.sentence(word_count: 8) }
    association :backlog
  end
end
