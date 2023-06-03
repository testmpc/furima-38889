class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :situation_id
      t.integer :delivery_charge_id
      t.integer :region_of_origin_id
      t.integer :days_to_ship_id
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end