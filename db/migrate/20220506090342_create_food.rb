class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :measurment_unit
      t.integer :price
      t.references :user, null: false, foreign_key: { to_table: 'users' }, index: true
      
      t.timestamps
    end
  end
end
