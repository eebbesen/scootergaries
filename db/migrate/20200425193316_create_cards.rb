class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :slot_1
      t.string :slot_2
      t.string :slot_3
      t.string :slot_4
      t.string :slot_5
      t.string :slot_6
      t.string :slot_7
      t.string :slot_8
      t.string :slot_9
      t.string :slot_10
      t.string :slot_11
      t.string :slot_12
      t.string :notes

      t.timestamps
    end
  end
end
