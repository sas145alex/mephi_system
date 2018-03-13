class AddAttachmentDocToDocuments < ActiveRecord::Migration[5.1]
  def self.up
    change_table :documents do |t|
      t.attachment :doc, null: false
    end
  end

  def self.down
    remove_attachment :documents, :doc
  end
end
