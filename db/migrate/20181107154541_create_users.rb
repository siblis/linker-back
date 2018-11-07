class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :users, :login, unique: true
    add_index :users, :password, unique: true
    add_index :users, :email, unique: true
  end
end
