class ChangeNameOfUsernameColumn < ActiveRecord::Migration
  def change
    remove_column :users, :usename
    add_column :users, :username, :string
  end
end
