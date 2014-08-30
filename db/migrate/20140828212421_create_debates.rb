class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :title
      t.text :body
      t.belongs_to :topic
      t.belongs_to :user
      t.integer :votes_for, default: 0
      t.integer :votes_against, default: 0

      t.timestamps
    end
  end
end
