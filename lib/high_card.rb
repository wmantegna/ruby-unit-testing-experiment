require 'card'
require 'fileutils'

module HighCard
  def self.beats?(hand, opposing)
    # hand.first.rank > opposing.first.rank
    hand.map(&:rank).sort.last > opposing.map(&:rank).sort.last
  end
end