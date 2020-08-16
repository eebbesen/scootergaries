# frozen_string_literal: true

json.extract! card, :id, :title, :slot_1, :slot_2, :slot_3, :slot_4, :slot_5, :slot_6, :slot_7, :slot_8, :slot_9, :slot_10, :slot_11, :slot_12, :notes, :created_at, :updated_at
json.url card_url(card, format: :json)
