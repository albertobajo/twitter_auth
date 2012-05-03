# encoding: UTF-8

FactoryGirl.define do
  factory :user do
    sequence(:uid)  { |n| n.to_s  }
    token_key     "1234567890"
    token_secret  "12345678901234567890"
    user_info     { TwitterAuth::Hash.
      new OmniAuth.config.mock_auth[:twitter] }
    
    trait :matt do
      uid   "16789004997"
    end
  end
  
end