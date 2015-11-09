FactoryGirl.define do
  factory :game do
    association :team1, factory: :team
    association :team2, factory: :team
    score_team1 10
    score_team2 2
  end
end
