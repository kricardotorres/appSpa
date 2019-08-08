class CreateInvestigateds < ActiveRecord::Migration[5.2]
  def change
    create_table :investigateds do |t|
      t.string :name
      t.string :lastname1

      t.timestamps
    end
  end
end
