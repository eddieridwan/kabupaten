class CreateSectorTranslations < ActiveRecord::Migration
  def up
    rename_column :sectors, :name_en, :name
    rename_column :sectors, :description_en, :description
    remove_column :sectors, :name_id
    remove_column :sectors, :description_id
    Sector.create_translation_table!({
      name: :string,
      description: :string
    }, {
      migrate_data: true
    })
  end

  def down
    rename_column :sectors, :name, :name_en
    rename_column :sectors, :description, :description_en
    add_column :sectors, :name_id, :string
    add_column :sectors, :description_id, :string
    Sector.drop_translation_table! migrate_data: true
  end
end
