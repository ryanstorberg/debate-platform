class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :has_voted?
      t.boolean :agree, default: false
      t.belongs_to :user
      t.belongs_to :comment

      t.timestamps
    end
  end
end
