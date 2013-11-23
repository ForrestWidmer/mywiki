class AddCategoryToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :category_id, :integer
    add_index :wikis, :category_id
  end
end
