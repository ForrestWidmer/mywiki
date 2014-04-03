class CreateDiscussions < ActiveRecord::Migration
  def change
    create_table :discussions do |t|
      t.text :body
      t.references :wiki

      t.timestamps
    end
    add_index :discussions, :wiki_id
  end
end
