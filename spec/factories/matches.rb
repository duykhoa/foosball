FactoryGirl.define do
  factory :match do
    association :team1, factory: :team
    association :team2, factory: :team

    after(:create) do |match|
      match.games << create(:game)
    end
  end
end
