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
  it "is given two living cells in any position" do
    one_cell_grid = "4 8\n........\n....**..\n........\n........"
    no_cell_grid = "4 8\n........\n........\n........\n........"

    expect(game_of_life(one_cell_grid)).to eq no_cell_grid
  end
end
