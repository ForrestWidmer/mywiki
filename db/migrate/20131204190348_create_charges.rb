class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :description
      t.string :plan
      t.string :card

      t.timestamps
    end
  end
end
