require 'matrix'

describe Game::Game do
  let(:game) { Game::Game.new }
  subject { :game }
  
  it 'has a Matrix grid' do
    expect(game.grid).to be_a(Matrix)
  end
  
  it 'can draw' do
    expect(game).to respond_to :draw
  end
  
  it 'can run' do
    expect(game).to respond_to :run
  end
end

