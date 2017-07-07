FactoryGirl.define do
  factory :item do
    text {Faker::Lorem.word}
    done false
  end
end
