class CreateProjectSectorMappings < ActiveRecord::Migration
  def up
    create_table :project_sector_mappings, :id => false do |t|
      t.integer :project_id
      t.integer :sector_id
      t.string  :sector_type
    end
  end

  def down
    drop_table :project_sector_mappings
  end
end
