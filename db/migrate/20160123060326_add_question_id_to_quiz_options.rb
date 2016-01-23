class AddQuestionIdToQuizOptions < ActiveRecord::Migration
  def change
    add_reference :quiz_options, :question, index: true, foreign_key: true
  end
end
