class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|

      t.timestamps
    end
    add_column :roles, :wiki_id, :integer
    add_column :roles, :user_id, :integer
    add_column :roles, :level, :string
  end
end
