class AddCredentialDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :credential_data, :text
  end
end
