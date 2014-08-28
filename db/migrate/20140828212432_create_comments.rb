class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :agree?
      t.text :content
      t.belongs_to :article
      t.belongs_to :user
      t.integer :vote_count

      t.timestamps
    end
  end
end
