class CreateProvinceTranslations < ActiveRecord::Migration
  def up
    rename_column :provinces, :description_en, :description
    remove_column :provinces, :description_id
    Province.create_translation_table!({
      description: :text
    }, {
      migrate_data: true
    })
  end

  def down
    rename_column :provinces, :description, :description_en
    add_column :provinces, :description_id, :text
    Province.drop_translation_table! migrate_data: true
  end
end
