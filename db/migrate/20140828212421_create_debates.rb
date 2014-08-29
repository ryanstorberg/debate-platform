class CreateDebates < ActiveRecord::Migration
  def change
    create_table :debates do |t|
      t.string :title
      t.text :body
      t.belongs_to :topic
      t.belongs_to :user
      t.integer :votes_for
      t.integer :votes_against

      t.timestamps
    end
  end
end
