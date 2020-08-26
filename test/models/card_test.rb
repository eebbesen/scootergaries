# frozen_string_literal: true

require 'test_helper'

class CardTest < ActiveSupport::TestCase
  test 'unique title' do
    c1 = Card.create title: 'sport card'
    assert c1.valid?

    c2 = Card.create title: 'sport card', slot_1: 'Packers'
    assert_equal 'has already been taken', c2.errors[:title].first
  end

  test 'fields enumerator' do
    c = cards(:cards_one)

    fs = c.fields
    assert_equal 12, fs.count
    assert_equal 'anthems', fs.first
    assert_equal 'legumes', fs.last
  end
end
