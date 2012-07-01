class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :skype_handle
      t.string :twitter_handle

      t.timestamps
    end
  end
end
