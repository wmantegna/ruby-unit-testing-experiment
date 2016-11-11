class ExpectationTarget
  def initialize(actual)
    @actual = actual
  end

  def to(matcher)
    matcher.call(@actual)
  end
end

class EqMatcher
  def initialize(expected)
    @expected = expected
  end

  def call(actual)
    if actual != @expected
      raise "Expected #{@expected}, got #{actual}"
    end
  end
end

def expect(actual)
  ExpectationTarget.new(actual)
end
def eq(expected)
  EqMatcher.new(expected)
end 

# expect(1).to eq(2)
expect(1).to eq(1)


# describe do
#   it 'is an equality matcher' do
#     expect(1).to(eq(1))

#     # puts expect(1)
#     # puts expect(1).public_methods(false)
#   end
# end