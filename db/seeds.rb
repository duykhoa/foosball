# Create a list of users
user1 = FactoryGirl.create(:user)
user2 = FactoryGirl.create(:user)
user3 = FactoryGirl.create(:user)
user4 = FactoryGirl.create(:user)
user5 = FactoryGirl.create(:user)

# Create team
team1 = FactoryGirl.create(:team, users: [user1, user2])
team2 = FactoryGirl.create(:team, users: [user3, user4])
team3 = FactoryGirl.create(:team, users: [user5])

# Create game
4.times do
  game1 =  FactoryGirl.create(:game, team1: team1, team2: team2, score_team1: 10, score_team2: 8)
end

3.times do
  game2 =  FactoryGirl.create(:game, team1: team2, team2: team1, score_team1: 10, score_team2: 8)
end

3.times do
  game2 =  FactoryGirl.create(:game, team1: team2, team2: team3, score_team1: 10, score_team2: 8)
end

games = FactoryGirl.create_list(:game, 2, team1: team1, team2: team3, score_team1: 10, score_team2: 9)

match = FactoryGirl.create(:match, games: games, team1: team1, team2: team2, create_games: false)
