class AddPointsToQuizOptions < ActiveRecord::Migration
  def change
    add_column :quiz_options, :points, :integer
  end
end
