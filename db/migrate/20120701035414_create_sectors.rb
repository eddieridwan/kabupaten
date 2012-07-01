class CreateSectors < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :name_en
      t.string :description_en
      t.string :name_id
      t.string :description_id

      t.timestamps
    end
  end
end
