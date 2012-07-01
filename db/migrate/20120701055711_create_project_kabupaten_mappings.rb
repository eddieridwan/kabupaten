class CreateProjectKabupatenMappings < ActiveRecord::Migration
  def up
    create_table :project_kabupaten_mappings, :id => false do |t|
      t.integer :project_id
      t.integer :kabupaten_id
      t.string  :location_type
    end
  end

  def down
    drop_table :project_kabupaten_mappings
  end
end
