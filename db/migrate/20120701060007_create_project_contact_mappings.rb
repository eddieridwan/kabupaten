class CreateProjectContactMappings < ActiveRecord::Migration
  def up
    create_table :project_contact_mappings do |t|
      t.integer :project_id
      t.integer :contact_id
      t.string  :contact_type
    end
  end

  def down
    drop_table :project_contact_mappings
  end
end
