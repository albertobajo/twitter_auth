# encoding: UTF-8

FactoryGirl.define do
  factory :user do
    sequence(:uid)
    token_key     "1234567890"
    token_secret  "12345678901234567890"
    
    trait :matt do
      uid   "16789004997"
    end
  end
  
end