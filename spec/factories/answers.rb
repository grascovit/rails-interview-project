FactoryGirl.define do
  factory :answer do
    body { FFaker::Lorem.paragraph }
    question
    user
  end
end
