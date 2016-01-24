class AddAttachmentImageToPersonalities < ActiveRecord::Migration
  def self.up
    change_table :personalities do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :personalities, :image
  end
end
