class Match < ApplicationRecord
  belongs_to :winner, class_name: :Player
  belongs_to :runner_up,  class_name: :Player
  belongs_to :second_runner_up,  class_name: :Player
  belongs_to :last, class_name: :Player 
end
