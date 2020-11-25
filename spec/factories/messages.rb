FactoryBot.define do
  factory :message do
    description { FFaker::Lorem.word }
    visit { false }
    trait :visited do
      visit { true }
    end
  end
end
