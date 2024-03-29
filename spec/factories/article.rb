# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph }
  end
end
