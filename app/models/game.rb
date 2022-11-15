# frozen_string_literal: true

class Game < ApplicationRecord
  has_one :board, dependent: :destroy
  has_many :players, dependent: :destroy

  def current
    self.players[self.current_player]
  end

  def switch_turn
    return self.update_attribute(:current_player, 1) if self.current_player == 0
    return self.update_attribute(:current_player, 0)
  end
end
