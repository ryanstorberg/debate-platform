class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.boolean :agree, default: false
      t.text :content
      t.belongs_to :debate
      t.belongs_to :user
      t.integer :vote_count

      t.timestamps
    end
  end
end
