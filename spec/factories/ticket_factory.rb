# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    title { 'Test title' }
    description { 'Test description' }
  end
end
