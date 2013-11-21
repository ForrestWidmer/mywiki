class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :body
      t.references :create

      t.timestamps
    end
    add_index :discussions, :create_id
  end
end
