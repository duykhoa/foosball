FactoryGirl.define do
  factory :match do
    association :team1, factory: :team
    association :team2, factory: :team

    transient do
      create_games true
    end

    after(:create) do |match, evaluator|
      match.games << create(:game) if evaluator.create_games
    end
  end
end
