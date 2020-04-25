require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'unique title' do
    c1 = Card.create title: 'sport card'
    assert c1.valid?

    c2 = Card.create title: 'sport card', slot_1: 'Packers'
    assert_equal 'has already been taken', c2.errors[:title].first
  end
end
