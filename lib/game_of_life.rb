def game_of_life(grid)
  final_string = ""
  grid_as_array = grid.split("")
  adjacent_position_grid = grid_as_array[2].to_i + 1
  grid_as_array.each.with_index { |character, index|
    if index > 3 && character != "\n"
      neighbours_count = count_neighbours(grid_as_array, index, adjacent_position_grid)
      if edge?(grid, grid_as_array, index, adjacent_position_grid) || neighbours_count < 2 || neighbours_count >= 4
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

def edge?(grid, grid_as_array, index, adjacent_position_grid)
  if (index - adjacent_position_grid) < 0 || (index + adjacent_position_grid) > grid.size #Verifies cells on the edge first and last rolls
    true
  elsif grid_as_array[index - 1] == "\n" || grid_as_array[index + 1] == "\n" || index + 1 > grid.size #Verifies cells on the edge columns
    true
  else
    false
  end
end

def count_neighbours(grid_as_array, index, adjacent_position_grid)
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
