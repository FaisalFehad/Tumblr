require 'ffaker'

FactoryGirl.define do
  factory :user do
    email { FFaker::Internet.email }
    password { password = Devise.friendly_token.first(8) }
  end
end
