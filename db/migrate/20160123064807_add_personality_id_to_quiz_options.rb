class AddPersonalityIdToQuizOptions < ActiveRecord::Migration
  def change
    add_reference :quiz_options, :personality, index: true, foreign_key: true
  end
end
