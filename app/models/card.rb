# frozen_string_literal: true

class Card < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }

  def fields
    ('1'..'12').map { |n| send("slot_#{n}".to_sym) }
  end
end
