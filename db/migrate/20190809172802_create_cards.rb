class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.date :display_from
      t.date :display_finish

      t.timestamps
    end
  end
end
