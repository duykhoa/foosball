json.array!(@game_histories) do |game_history|
  json.extract! game_history, :id
  json.url game_history_url(game_history, format: :json)
end
