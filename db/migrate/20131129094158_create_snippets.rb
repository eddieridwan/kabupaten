class CreateSnippets < ActiveRecord::Migration
  def up
    create_table :snippets do |t|
      t.string  :key
      t.text    :description
      t.text    :body

      t.timestamps
    end

    add_index :snippets, :key

    Snippet.create_translation_table!({
      body: :text
    }, {
      migrate_data: false
    })

  end

  def down
    Snippet.drop_translation_table! migrate_data: false
    drop_table :snippets
  end

end
