class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :wiki

      t.timestamps
    end
    add_index :images, :wiki_id
  end
end
