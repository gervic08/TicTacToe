# frozen_string_literal: true

class Game < ApplicationRecord
  has_one :board, dependent: :destroy
  has_many :players, dependent: :destroy
end
