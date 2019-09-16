# - The grid is finite, and no life can exist off the edges.

# 1. Any live cell with fewer than two live neighbours dies,
#  as if caused by underpopulation.
# 2. Any live cell with more than three live neighbours dies,
#  as if by overcrowding.
# 3. Any live cell with two or three live neighbours lives
#  on to the next generation.
# 4. Any dead cell with exactly three live neighbours becomes
#  a live cell.

require 'game_of_life'

describe 'Game of Life' do
  it "is given no living cells" do
    no_cell_grid = "4 8\n........\n........\n........\n........"

    expect(game_of_life(no_cell_grid)).to eq no_cell_grid
  end
  it "is given one living cell in any position" do
    one_cell_grid = "4 8\n........\n....*...\n........\n........"
    no_cell_grid = "4 8\n........\n........\n........\n........"

    expect(game_of_life(one_cell_grid)).to eq no_cell_grid
  end
  it "is given one living cell in the edge" do
    one_cell_grid = "4 8\n*.......\n........\n........\n........"
    no_cell_grid = "4 8\n........\n........\n........\n........"

    expect(game_of_life(one_cell_grid)).to eq no_cell_grid
  end
  it "is given two neighbours live cells in the same roll" do
    two_neighbours_cell_grid = "4 8\n........\n..***...\n........\n........"
    two_cell_grid = "4 8\n........\n...*....\n...*....\n........"

    expect(game_of_life(two_neighbours_cell_grid)).to eq two_cell_grid
  end
  it "is given three neighbours live cells in the same column" do
    two_neighbours_cell_grid = "4 8\n...*....\n...*....\n...*....\n........"
    three_cell_grid = "4 8\n........\n..***...\n........\n........"

    expect(game_of_life(two_neighbours_cell_grid)).to eq three_cell_grid
  end
  it "is given two groups of three neighbours live cells in the same roll, on the edge" do
    two_neighbours_cell_grid = "4 8\n..***...\n........\n........\n.***...."
    two_cell_grid = "4 8\n........\n...*....\n..*.....\n........"

    expect(game_of_life(two_neighbours_cell_grid)).to eq two_cell_grid
  end
  it "is given two groups of three neighbours live cells in the same column, on the edge" do
    two_neighbours_cell_grid = "4 8\n*......*\n*......*\n*......*\n........"
    two_cell_grid = "4 8\n........\n.*....*.\n........\n........"

    expect(game_of_life(two_neighbours_cell_grid)).to eq two_cell_grid
  end
  it "is given four neighbours live cells, one beeing on the lower roll" do
    three_neighbours_cell_grid = "4 8\n........\n..***...\n...*....\n........"
    six_cell_grid = "4 8\n........\n..***...\n..***...\n........"

    expect(game_of_life(three_neighbours_cell_grid)).to eq six_cell_grid
  end
  it "is given four neighbours live cells, one beeing on the upper roll" do
    three_neighbours_cell_grid = "4 8\n........\n...*....\n..***...\n........"
    six_cell_grid = "4 8\n........\n..***...\n..***...\n........"

    expect(game_of_life(three_neighbours_cell_grid)).to eq six_cell_grid
  end
end
