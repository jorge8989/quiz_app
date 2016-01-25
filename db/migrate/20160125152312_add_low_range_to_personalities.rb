class AddLowRangeToPersonalities < ActiveRecord::Migration
  def change
    add_column :personalities, :low_range, :integer
  end
end
