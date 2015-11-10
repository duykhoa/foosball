FactoryGirl.define do
  factory :match do
    after(:create) do |match|
      match.games << create(:game)
    end
  end
end
