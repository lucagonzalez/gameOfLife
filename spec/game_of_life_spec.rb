require 'game_of_life'

describe 'Game of Life' do
  it 'returns the grid inserted by the user' do
    initial_grid = "4 8\n...*....\n....*...\n.*......\n...*...."
    expect(game_of_life(initial_grid)).to eq initial_grid
  end
  it "raises an exception if the grid inserted by the user has a different number of rows" do
    initial_grid = "4 8\n....*...\n.....*..\n.*......"

    expect{
      (game_of_life(initial_grid))
    }.to raise_error(GridSizeError)
  end
  it "raises an exception if the grid inserted by the user has a different number of columns in any row" do
    initial_grid = "4 8\n....*...\n.....*..\n.*.....\n......"

    expect{
      (game_of_life(initial_grid))
    }.to raise_error(GridSizeError)
  end
  it "no life can live off the edge of the grid" do
    initial_grid = "4 8\n..***...\n........\n........\n...**..."
    expected_grid = "4 8\n........\n........\n........\n........"

    expect(game_of_life(initial_grid)).to eq expected_grid
  end
end
