class Card
	def self.build(suit, rank)
		new(suit: suit, rank: rank)
	end
	private_class_method :new

	def initialize(suit:, rank:)
		@suit = suit
		@rank = case rank
				when :jack then 11
				when :queen then 12
				when :king then 13
				when :ace then 14
				else rank
			end
	end

	def suit
		@suit
	end

	def rank
		@rank
	end

	# Comparison
	def ==(other)
		rank == other.rank && suit == other.suit
	end

	def hash
		[rank, suit].hash
	end

	# Hash Comparison
	def eql?(other)
		self == other
	end

	def self.from_string(value)
		# Get final character in string
		short_suit = value[-1]

		# Map it to a suit
		suit = {
			"H" => :hearts,
			"D" => :diamonds,
			"S" => :spades,
			"C" => :clubs
		}.fetch(short_suit)

		# Map remainder to a face card, or fallback to numeric
		rank = {
			'A' => :ace,
			'K' => :king,
			'Q' => :queen,
			'J' => :jack
		}.fetch(value[0]) { value[0..-2].to_i }

		Card.build(suit, rank)
	end
end