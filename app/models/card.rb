# frozen_string_literal: true

class Card < ApplicationRecord
  validates :title, uniqueness: { case_sensitive: false }
end
