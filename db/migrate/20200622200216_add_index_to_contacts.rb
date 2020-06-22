class AddIndexToContacts < ActiveRecord::Migration[6.0]
  def change
    add_index :contacts, :email, unique: true
  end
end
