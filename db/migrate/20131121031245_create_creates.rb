class CreateCreates < ActiveRecord::Migration
  def change
    create_table :creates do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
