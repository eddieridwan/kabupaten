class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :name
      t.text :description_en
      t.text :description_id
      t.integer :area
      t.integer :population

      t.timestamps
    end
  end
end
