class Match < ApplicationRecord
  belongs_to :winner, class_name: :Player
  belongs_to :runner_up,  class_name: :Player
  belongs_to :second_runner_up,  class_name: :Player
  belongs_to :last, class_name: :Player

  before_create :increment_player_points
  before_destroy :decrement_player_points

  private

  def increment_player_points
    winner.increment!(:total_win,1)
    winner.increment!(:points, 4)
    runner_up.increment!(:points, 2)
    second_runner_up.increment!(:points, 1)
    last.increment!(:points, 0)
  end

  def decrement_player_points
    winner.decrement!(:points, 4)
    runner_up.decrement!(:points, 2)
    second_runner_up.decrement!(:points, 1)
    last.decrement!(:points, 0)
  end
end
