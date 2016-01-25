class AddHighRangeToPersonalities < ActiveRecord::Migration
  def change
    add_column :personalities, :high_range, :integer
  end
end
