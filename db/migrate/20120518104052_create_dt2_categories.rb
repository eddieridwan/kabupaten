class CreateDt2Categories < ActiveRecord::Migration
  def change
    create_table :dt2_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
