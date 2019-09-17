#Refactorizar acordandose de usar objetos
#REFACTORIZAR TODAS LAS KATAS USANDO OBJETOS


def game_of_life(grid)
  board = Board.new(grid)
  columns = board.columns
  final_string = ""
  grid_as_array = grid.split("")
  adjacent_position_grid = columns + 1
  grid_as_array.each.with_index { |character, index|
    if index > 3 && character != "\n"
      neighbours_count = board.count_neighbours(index)
      if board.edge?(index) || neighbours_count < 2 || neighbours_count >= 4
        final_string += "."
      elsif neighbours_count == 3
        final_string += "*"
      else
        final_string += character
      end
    else
      final_string += character
    end}
  final_string
end

class Board
  def initialize(grid)
    @grid = grid
  end
  def columns
    grid_as_array[2].to_i
  end
  def count_neighbours(index)
    adjacent_position_grid = columns + 1
    vecino = 0
    vecino += 1 if grid_as_array[index + 1] == "*"
    vecino += 1 if grid_as_array[index - 1] == "*"
    vecino += 1 if grid_as_array[index - adjacent_position_grid] == "*"
    vecino += 1 if grid_as_array[index + adjacent_position_grid] == "*"
    vecino += 1 if grid_as_array[index + adjacent_position_grid + 1] == "*"
    vecino += 1 if grid_as_array[index + adjacent_position_grid - 1] == "*"
    vecino += 1 if grid_as_array[index - adjacent_position_grid + 1] == "*"
    vecino += 1 if grid_as_array[index - adjacent_position_grid - 1] == "*"
    vecino
  end
  def edge?(index)
    adjacent_position_grid = columns + 1

    if (index - adjacent_position_grid) < 0 || (index + adjacent_position_grid) > @grid.size #Verifies cells on the edge first and last rolls
      true
    elsif grid_as_array[index - 1] == "\n" || grid_as_array[index + 1] == "\n" || index + 1 > @grid.size #Verifies cells on the edge columns
      true
    else
      false
    end
  end
  private
  def grid_as_array
    @grid.split("")
  end
end
