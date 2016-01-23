class CreateQuizOptions < ActiveRecord::Migration
  def change
    create_table :quiz_options do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
