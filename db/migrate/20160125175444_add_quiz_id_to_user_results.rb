class AddQuizIdToUserResults < ActiveRecord::Migration
  def change
    add_reference :user_results, :quiz, index: true, foreign_key: true
  end
end
