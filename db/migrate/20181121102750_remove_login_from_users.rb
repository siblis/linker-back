class RemoveLoginFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :login, :string
  end
end
