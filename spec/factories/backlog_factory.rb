# frozen_string_literal: true

FactoryBot.define do
  factory :backlog do
    title { 'Test title' }
    body { 'Test body' }
    association :ticket
  end
end
