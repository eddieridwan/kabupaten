class CreateProjectTranslations < ActiveRecord::Migration
  def up
    rename_column :projects, :name_en, :name
    rename_column :projects, :description_en, :description
    remove_column :projects, :name_id
    remove_column :projects, :description_id
    Project.create_translation_table!({
      name: :string,
      description: :string
    }, {
      migrate_data: true
    })
  end

  def down
    rename_column :projects, :name, :name_en
    rename_column :projects, :description, :description_en
    add_column :projects, :name_id, :string
    add_column :projects, :description_id, :text
    Project.drop_translation_table! migrate_data: true
  end
end
