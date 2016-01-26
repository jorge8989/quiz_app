class AddPersonalityIdToUserResults < ActiveRecord::Migration
  def change
    add_reference :user_results, :personality, index: true, foreign_key: true
  end
end
