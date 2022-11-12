# frozen_string_literal: true

class Board < ApplicationRecord
  belongs_to :game

  def position_valid?(position)
    return true unless position.length > 2 || position[0] < 0 || position[0] > 2 || position[1] < 0 || position[1] > 2
    false
  end

  def position_empty?(position)
    return true if self.grids[position[0]][position[1]] == "_"
    return false
  end

  def place_mark(position, mark)
    if position_valid?(position) && position_empty?(position)
      self.grids[position[0]][position[1]] = mark
    else
      raise "Invalid or not empty position, choose another."
    end
  end

  def print_board
    self.grids.each { |row| puts row.join("  ")}
  end

  def win_row?(mark)
    self.grids.collect.any? { |row| row.all? { |el| el == mark }}
  end

  def win_col?(mark)
    i = 0
    flag = false
    while i < self.grids.length
      flag = true
      self.grids.each do |row|
        flag = false if row[i] != mark
        next
      end
      return flag if flag
      i += 1
    end 
    flag
  end

  def win_diagonal?(mark)
    i = 0
    while i < self.grids.length
      return false if self.grids[i][i] != mark
      i += 1
    end
    true
  end

  def win?(mark)
    return true if win_diagonal?(mark) || win_col?(mark) || win_row?(mark)
    false
  end

  def empty_positions?
    self.grids.each do |row|
      row.each do |space|
        return true if space == "_"
      end
    end
    false 
  end
end
