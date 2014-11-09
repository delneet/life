describe Game::Square do
  let(:square) { Game::Square.new(0,0) }
  subject { :square }
  
  it 'has a row' do
    expect(square).to respond_to(:row)
  end
  
  it 'is at row 0' do
    expect(square.row).to eq(0)
  end
  
  it 'has a col' do
    expect(square).to respond_to(:col)
  end
  
  it 'is at col 0' do
    expect(square.col).to eq(0)
  end
  
  it 'has neighbours' do
    expect(square).to respond_to(:neighbours)
  end
  
  context 'when alive' do
    let(:square) { Game::Square.new(0,0,true) }
    subject { :square }
    
    it 'is alive' do
      expect(square).to be_alive
    end
        
    it 'should draw o' do
      square.neighbours = 3
      expect(square.draw).to eq("o")
    end
    
    it 'should die if neighbours < 2' do
      square.neighbours = 1
      square.draw
      expect(square).to_not be_alive
    end
    
    it 'should die if neighbours > 3' do
      square.neighbours = 4
      square.draw
      expect(square).to_not be_alive
    end
    
    it 'should stay alive if neighbours == 2' do
      square.neighbours = 2
      square.draw
      expect(square).to be_alive
    end
    
    it 'should stay alive if neighbours == 3' do
      square.neighbours = 3
      square.draw
      expect(square).to be_alive
    end    
  end
  
  context 'when dead' do
    let(:square) { Game::Square.new(0,0,false) }
    subject { :square }
    
    it 'is not alive' do
      expect(square).to_not be_alive
    end
    
    it 'should draw whitespace' do
      expect(square.draw).to eq(" ")
    end
    
    it 'should come to live if neighbours == 3' do
      square.neighbours = 3
      square.draw
      expect(square).to be_alive
    end
  end
end
