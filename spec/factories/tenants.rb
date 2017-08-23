FactoryGirl.define do
  factory :tenant do
    name { FFaker::HipsterIpsum.word }
  end
end
