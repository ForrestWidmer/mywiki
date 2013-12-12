class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations do |t|

      t.timestamps
    end
    add_column :collaborations, :wiki_id, :integer
    add_column :collaborations, :user_id, :integer
  end
end
