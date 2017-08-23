FactoryGirl.define do
  factory :question do
    title { FFaker::Lorem.sentence }
    user

    factory :private_question do
      private true
    end

    factory :public_question do
      private false
    end
  end
end
