class AddUserIdToUserResults < ActiveRecord::Migration
  def change
    add_reference :user_results, :user, index: true, foreign_key: true
  end
end
