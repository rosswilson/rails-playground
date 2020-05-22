class AddEmailConfirmColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_confirmed_at, :timestamp
    add_column :users, :email_confirm_token, :string
  end
end
