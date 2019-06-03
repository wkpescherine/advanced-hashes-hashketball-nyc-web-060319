
def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ['Black', 'White'],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 22,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1,
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7,
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15,
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 22,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5,
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1,
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ['Turquoise', 'Purple'],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2,
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10,
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5,
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0,
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12,
        }
      }
    }
  }
end

def team_colors(team)
  new_array = []
  game_hash.each do |keys, values|
    values.each do |data_labels, data|
      if data == team
        new_array << game_hash[keys][:colors]
      end
    end
  end
  new_array.flatten
end

#team_colors("Charlotte Hornets")

def team_names
  new_array = []
  game_hash.each do |keys, values|
    values.each do |data_labels, data|
      if data_labels == :team_name
        new_array << data
      end
    end
  end
  new_array
end
#team_names

def player_numbers(team)
  new_array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  else 
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  end
  new_array
end

#player_numbers("Charlotte Hornets")

def player_stats(name)
  player_stats = nil 
  game_hash.each do |home_away, team_info|
    team_info.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          if player_name == name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end

#player_stats("Brendan Haywood")

def big_shoe_rebounds
  biggest_shoe = nil
  big_shoe_player_rebounds = nil
  game_hash.each do |home_or_away, team_info|
    team_info.each do |data_label, data|
      if data_label == :players
        data.each do |player_name, stats|
          stats.each do |stat_name, value|
            if stat_name == :shoe
              if biggest_shoe == nil
                biggest_shoe = value
                big_shoe_player_rebounds = game_hash[home_or_away][:players][player_name][:rebounds]
              elsif value > biggest_shoe
                biggest_shoe = value
                big_shoe_player_rebounds = game_hash[home_or_away][:players][player_name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  big_shoe_player_rebounds
end

big_shoe_rebounds