class AddRoleToCollaboration < ActiveRecord::Migration
  def change
    add_column :collaborations, :role, :string
  end
end
