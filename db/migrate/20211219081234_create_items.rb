class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references  :user, null: false, foreign_key: true
      t.string  :name, null: false
      t.text  :version, null: false
      t.integer  :category_id, null: false
      t.integer  :situation_id, null: false
      t.integer  :delivery_charge_id, null: false
      t.integer  :delivery_area_id, null: false
      t.integer  :delivery_days_id, null: false
      t.integer  :price, null: false
      t.timestamps
    end
  end
end
