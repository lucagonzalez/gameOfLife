class GridSizeError < StandardError
end

def game_of_life(string)
  size_of_grid = get_size(string)
  grid_array = get_array(string)
  raise GridSizeError unless grid_array.size == size_of_grid[0]
  raise GridSizeError unless (grid_array.map { |row| row.size == size_of_grid[1] }).all?
  string
end

def get_size(string)
  string.scan(/\d/).map { |array_size| array_size.to_i }
end

def get_array(string)
  (string.split(" ").map { |line_of_grid| line_of_grid.split("") }).drop(2)
end


# print game_of_life("4 8\n...*....\n....*...\n.*......\n...*....")
