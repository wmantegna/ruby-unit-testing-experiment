require 'deck'

# COULDNT GET THIS TO WORK
# ----------------------------
# module ArrayMatchers
#   extend RSpec::Matchers::DSL
#   matcher :be_contiguous_by_attribute do
#     match do |array|
#       !first_non_contiguous_pair(array)
#     end

#     failure_message do |array|
#       "%s and %s were not contiguous" % first_non_contiguous_pair(array)
#     end

#     def first_non_contiguous_pair(array)
#       array
#         .sort_by {block_arg}
#         .each_cons(2)
#         .all?{|x,y| block_arg.call(x) + 1 != block_arg.call(y)}
#     end
#   end
# end
# ----------------------------

describe 'Deck' do
  # include ArrayMatchers

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

    
    # COULDNT GET THIS TO WORK
    # ----------------------------
    # it 'has contiguous ranks by suit' do
    #   Deck.all.group_by {|card| card.suit }.each do |suit, cards|
    #     # contiguous = cards
    #     #   .map{|card| card.rank}
    #     #   .sort
    #     #   .each_cons(2)
    #     #   .all?{|x,y| x + 1 == y}

    #     # expect(contiguous).to eq(true)
    #     expect(cards).to be_contiguous_by_attribute(:rank)
    #   end
    # end
    # ----------------------------
  end
end