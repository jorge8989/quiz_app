class AddAttachmentImageToQuizzes < ActiveRecord::Migration
  def self.up
    change_table :quizzes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :quizzes, :image
  end
end
