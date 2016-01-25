class CreateUserResults < ActiveRecord::Migration
  def change
    create_table :user_results do |t|
      t.integer :points

      t.timestamps null: false
    end
  end
end
