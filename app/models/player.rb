# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :game
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :mark, uniqueness: true
  
  def mark_selected(mark)
    self.update!(mark: mark.to_s)  
  end

  def get_position
    puts "Enter a position indicating 'POSITION ONE in number' (blank space) 'POSITION TWO in number'"
    numbers = (0..9).to_a.map(&:to_s)
    position_choosed = gets.chomp.to_s
    if position_choosed.length == 3 && numbers.include?(position_choosed[0]) && numbers.include?(position_choosed[2]) && position_choosed[1] == " "
      position = position_choosed.split(" ")
      return position.map(&:to_i)
    else
      puts "Invalid format or character. Try again indicating 'POSITION ONE in number' (blank space) 'POSITION TWO in number'"
      get_position
    end
  end
end
