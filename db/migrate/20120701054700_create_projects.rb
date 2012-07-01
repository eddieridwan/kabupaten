class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name_en
      t.text :description_en
      t.string :name_id
      t.text :description_id

      t.timestamps
    end
  end
end
