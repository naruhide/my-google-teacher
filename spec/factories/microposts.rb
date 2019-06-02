FactoryBot.define do
  factory :micropost do
    word "海鮮　有名　県"
    comment "日本海側が多いよ"
    association :user
    
    trait :invalid do
      word nil
    end
  end
end
