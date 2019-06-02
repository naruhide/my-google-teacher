FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Aaron#{n}" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    password "dottle-nouveau-pavilion-tights-furze"
  end
end
