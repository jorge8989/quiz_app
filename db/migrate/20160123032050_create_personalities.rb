class CreatePersonalities < ActiveRecord::Migration
  def change
    create_table :personalities do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
