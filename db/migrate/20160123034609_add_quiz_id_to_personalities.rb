class AddQuizIdToPersonalities < ActiveRecord::Migration
  def change
    add_reference :personalities, :quiz, index: true, foreign_key: true
  end
end
