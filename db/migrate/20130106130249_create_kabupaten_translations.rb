class CreateKabupatenTranslations < ActiveRecord::Migration
  def up
    rename_column :kabupatens, :description_en, :description
    remove_column :kabupatens, :description_id
    Kabupaten.create_translation_table!({
      description: :string
    }, {
      migrate_data: true
    })
  end

  def down
    rename_column :kabupatens, :description, :description_en
    add_column :kabupatens, :description_id, :text
    Kabupaten.drop_translation_table! migrate_data: true
  end
end
