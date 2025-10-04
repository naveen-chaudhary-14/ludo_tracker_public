json.extract! player, :id, :name, :total_win, :points, :created_at, :updated_at
json.url player_url(player, format: :json)
