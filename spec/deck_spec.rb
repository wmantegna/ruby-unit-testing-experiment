require 'deck'

describe 'Deck' do
  describe '.all' do
    it 'contains 32 cards' do
      expect(Deck.all.length).to eq(32)
    end

    it 'has a seven as its lowest card' do
      
      # Not as good because it tests entire cards, as opposed to the property within the card
      # Deck::SUITS.each do |suit|
      #   expect(Deck.all).to include(Card.build(suit, 7))
      #   expect(Deck.all).to include(Card.build(suit, 6))
      # end
      
      # Not as good because it doesn't provide very good error messages
      # Deck.all.each do |card|
      #   expect(card.rank).to be >= 7
      # end

      # Can be written with less complexity
      # expect(Deck.all.map {|card| card.rank}).to all(be >= 7)

      expect(Deck.all).to all(have_attributes(rank: be >= 7))
    end
  end
end