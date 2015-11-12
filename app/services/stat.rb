class Stat
  def best_team
    Game.find_by_sql(" \
      SELECT winning_team_id, count(winning_team_id) AS num_wins \
      FROM games \
      GROUP BY winning_team_id \
      ORDER BY num_wins desc \
   ")
  end

  def count_win
    User.find_by_sql("\
      SELECT users.id, users.first_name, count(users.id) as num_wins, teams_users.* \
      FROM users \
        INNER JOIN teams_users ON teams_users.user_id = users.id \
        INNER JOIN games ON games.winning_team_id = teams_users.team_id \
      GROUP BY users.id \
      ORDER BY num_wins DESC
    ")
  end

  def total_game
    User.find_by_sql("\
      SELECT users.id, users.first_name, count(users.id) as total_games, teams_users.* \
      FROM users \
        INNER JOIN teams_users ON teams_users.user_id = users.id \
        INNER JOIN games ON games.team1_id = teams_users.team_id OR games.team2_id = teams_users.team_id \
      GROUP BY users.id \
      ORDER BY total_games DESC
    ")
  end
end
